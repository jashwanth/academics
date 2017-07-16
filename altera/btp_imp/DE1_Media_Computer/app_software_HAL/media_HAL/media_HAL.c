#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_ps2.h"
#include "altera_up_avalon_parallel_port.h"
#include "sys/alt_stdio.h"

/* globals */
#define BUF_SIZE 500000			// about 10 seconds of buffer (@ 48K samples/sec)
#define BUF_THRESHOLD 96		// 75% of 128 word buffer

/* function prototypes */
void VGA_box (int, int, int, int, short);
void HEX_PS2(char, char);
void check_KEYs( int *, int *, int *, alt_up_parallel_port_dev *, alt_up_audio_dev * );

/********************************************************************************
 * This program demonstrates use of the media ports in the DE1 Media Computer
 *
 * It performs the following: 
 *  	1. records audio for about 10 seconds when KEY[1] is pressed. LEDG[0] is
 *  	   lit while recording
 * 	2. plays the recorded audio when KEY[2] is pressed. LEDG[1] is lit while 
 * 	   playing
 * 	3. Draws a blue box on the VGA display, and places a text string inside
 * 	   the box
 * 	4. Displays the last two bytes of data received from the PS/2 port 
 * 	   on the HEX displays on the DE1 board
********************************************************************************/
int main(void)
{
	/* Declare volatile pointers to I/O registers (volatile means that IO load
	   and store instructions will be used to access these pointer locations, 
	   instead of regular memory loads and stores) */
	alt_up_parallel_port_dev *green_LEDs_dev;
	alt_up_parallel_port_dev *KEY_dev;
	alt_up_ps2_dev * PS2_dev;
	alt_up_audio_dev * audio_dev;
	alt_up_char_buffer_dev * char_buffer_dev;

	/* used for audio record/playback */
	int record = 0, play = 0, buffer_index = 0;
	unsigned int l_buf[BUF_SIZE];
	unsigned int r_buf[BUF_SIZE];

	/* used for PS/2 port data */
	unsigned char PS2_data;
	char byte1 = 0, byte2 = 0;

	/* create a message to be displayed on the VGA display */
	char text_top_row[40] = "Altera DE1\0";
	char text_bottom_row[40] = "Media Computer\0";

	/* output text message in the middle of the VGA monitor */
	char_buffer_dev = alt_up_char_buffer_open_dev ("/dev/VGA_Char_Buffer");
	if ( char_buffer_dev == NULL)
	{
		alt_printf ("Error: could not open character buffer device\n");
		return -1;
	}
	else
		alt_printf ("Opened character buffer device\n");
	alt_up_char_buffer_string (char_buffer_dev, text_top_row, 35, 29);
	alt_up_char_buffer_string (char_buffer_dev, text_bottom_row, 35, 30);
	VGA_box (34*4, 28*4, 50*4, 32*4, 0x187F);

	// open the PS2 port
	PS2_dev = alt_up_ps2_open_dev ("/dev/PS2_Port");
	if ( PS2_dev == NULL)
	{
		alt_printf ("Error: could not open PS2 device\n");
		return -1;
	}
	else
		alt_printf ("Opened PS2 device\n");

	audio_dev = alt_up_audio_open_dev ("/dev/Audio");
	if ( audio_dev == NULL)
	{
		alt_printf ("Error: could not open audio device\n");
		return -1;
	}
	else
		alt_printf ("Opened audio device\n");
	int num_read; int num_written;

	/* read and echo audio data */
	record = 0;
	play = 0;
	// open the pushbutton KEY parallel port
	KEY_dev = alt_up_parallel_port_open_dev ("/dev/Pushbuttons");
	if ( KEY_dev == NULL)
	{
		alt_printf ("Error: could not open pushbutton KEY device\n");
		return -1;
	}
	else
		alt_printf ("Opened pushbutton KEY device\n");

	// open the green LEDs parallel port
	green_LEDs_dev = alt_up_parallel_port_open_dev ("/dev/Green_LEDs");
	if (green_LEDs_dev == NULL)
	{
		alt_printf ("Error: could not open green LEDs device\n");
		return -1;
	}
	else
		alt_printf ("Opened green LEDs device\n");

	(void) alt_up_ps2_write_data_byte (PS2_dev, 0xFF);		// reset
	while(1)
	{
		check_KEYs ( &record, &play, &buffer_index, KEY_dev, audio_dev );
		if (record)
		{
			alt_up_parallel_port_write_data(green_LEDs_dev, 0x1); // set LEDG[0] on

			// record data until the buffer is full
			if (buffer_index < BUF_SIZE)
			{
				num_read = alt_up_audio_record_r (audio_dev, &(r_buf[buffer_index]), 
					BUF_SIZE - buffer_index);
				/* assume we can read same # words from the left and right */
				(void) alt_up_audio_record_l (audio_dev, &(l_buf[buffer_index]), 
					num_read);
				buffer_index += num_read;

				if (buffer_index == BUF_SIZE)
				{
					// done recording
					record = 0;
					alt_up_parallel_port_write_data(green_LEDs_dev, 0x0); // set LEDG off
				}
			}
		}
		else if (play)
		{
			alt_up_parallel_port_write_data(green_LEDs_dev, 0x2); // set LEDG[1] on

			// output data until the buffer is empty 
			if (buffer_index < BUF_SIZE)
			{
				num_written = alt_up_audio_play_r (audio_dev, &(r_buf[buffer_index]), 
				 	BUF_SIZE - buffer_index);
				/* assume that we can write the same # words to the left and right */
				(void) alt_up_audio_play_l (audio_dev, &(l_buf[buffer_index]), 
					num_written);
				buffer_index += num_written;

				if (buffer_index == BUF_SIZE)
				{
					// done playback
					play = 0;
					alt_up_parallel_port_write_data(green_LEDs_dev, 0x0); // set LEDG off
				}
			}
		}
		/* check for PS/2 data--display on HEX displays */
		if (alt_up_ps2_read_data_byte (PS2_dev, &PS2_data) == 0)
		{
			/* shift the next data byte into the display */
			byte1 = byte2;
			byte2 = PS2_data;
			HEX_PS2 (byte1, byte2);

			if ( (byte1 == (char) 0xAA) && (byte2 == (char) 0x00) )
				// mouse inserted; initialize sending of data
				(void) alt_up_ps2_write_data_byte (PS2_dev, 0xF4);
		}
	}
}

/****************************************************************************************
 * Draw a filled rectangle on the VGA monitor 
****************************************************************************************/
void VGA_box(int x1, int y1, int x2, int y2, short pixel_color)
{
	int offset, row, col;
  	volatile short * pixel_buffer = (short *) 0x08000000;	// VGA pixel buffer

	/* assume that the box coordinates are valid */
	for (row = y1; row <= y2; row++)
	{
		col = x1;
		while (col <= x2)
		{
			offset = (row << 9) + col;
			*(pixel_buffer + offset) = pixel_color;	// compute halfword address, set pixel
			++col;
		}
	}
}

/****************************************************************************************
 * Subroutine to show a string of HEX data on the HEX displays
****************************************************************************************/
void HEX_PS2(char b1, char b2)
{
	volatile int * HEX3_HEX0_ptr = (int *) 0x10000020;

	/* SEVEN_SEGMENT_DECODE_TABLE gives the on/off settings for all segments in 
	 * a single 7-seg display in the DE1 Media Computer, for the hex digits 0 - F */
	char	seven_seg_decode_table[] = {	0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7C, 0x07, 
		  										0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71 };
	char	hex_segs[] = { 0, 0, 0, 0};
	int shift_buffer, nibble;
	char code;
	int i;

	shift_buffer = ((b1 & 0xFF) << 8) | (b2 & (0xFF));
	for ( i = 0; i < 4; ++i )
	{
		nibble = shift_buffer & 0x0000000F;		// character is in rightmost nibble
		code = seven_seg_decode_table[nibble];
		hex_segs[i] = code;
		shift_buffer = shift_buffer >> 4;
	}
	/* drive the hex displays */
	*(HEX3_HEX0_ptr) = *(int *) (hex_segs);
}

/****************************************************************************************
 * Subroutine to read KEYs
****************************************************************************************/
void check_KEYs(int *KEY1, int *KEY2, int *counter, alt_up_parallel_port_dev *KEY_dev,
	alt_up_audio_dev *audio_dev)
{
	int KEY_value;

	KEY_value = alt_up_parallel_port_read_data (KEY_dev);
	
	while ( alt_up_parallel_port_read_data (KEY_dev) );	// wait for pushbutton KEY release

	if (KEY_value == 0x2)					// check KEY1
	{
		// reset counter to start recording
		*counter = 0;
		// reset audio port
		alt_up_audio_reset_audio_core (audio_dev);

		*KEY1 = 1;
	}
	else if (KEY_value == 0x4)				// check KEY2
	{
		// reset counter to start playback
		*counter = 0;
		// reset audio port
		alt_up_audio_reset_audio_core (audio_dev);

		*KEY2 = 1;
	}
}
