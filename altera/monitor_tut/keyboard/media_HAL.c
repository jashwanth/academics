#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_ps2.h"
#include "altera_up_ps2_keyboard.h"
#include "altera_up_avalon_parallel_port.h"
#include "sys/alt_stdio.h"
#include "altera_up_avalon_video_pixel_buffer_dma.h"
//#include "alt_up_vga.h"
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
	alt_up_char_buffer_dev * char_buffer_dev;
    alt_up_pixel_buffer_dma_dev *pixel_buffer_dev;
	pixel_buffer_dev = alt_up_pixel_buffer_dma_open_dev ("/dev/VGA_Pixel_Buffer");
	if ( pixel_buffer_dev == NULL)
		alt_printf ("Error: could not open VGA pixel buffer device\n");
	else
		alt_printf ("Opened character VGA pixel buffer device\n");
	/* clear the graphics screen */
	alt_up_pixel_buffer_dma_clear_screen(pixel_buffer_dev, 0);

	/* used for PS/2 port data */
	unsigned char PS2_data;
	unsigned char  byte1 = 0, byte2 = 0;
    KB_CODE_TYPE decode_mode;
	alt_u8 buf;
	/* create a message to be displayed on the VGA display */
	char text_top_row[40] = "Altera DE1\0";
	char text_bottom_row[40] = "Media Computer\0";
	char display_vga[40][80];
	int count = 0,i = 0,init=0;
	for(init=0;init<40;init++)
	 display_vga[init][0] = '\0';
    char key;
	char key2;
	int flag=0;
	/* output text message in the middle of the VGA monitor */
	char_buffer_dev = alt_up_char_buffer_open_dev ("/dev/VGA_Char_Buffer");
	if ( char_buffer_dev == NULL)
	{
		alt_printf ("Error: could not open character buffer device\n");
		return -1;
	}
	else
		alt_printf ("Opened character buffer device\n");
	
//	alt_up_char_buffer_string (char_buffer_dev, text_top_row, 35, 29);
//	alt_up_char_buffer_string (char_buffer_dev, text_bottom_row, 35, 30);
//	VGA_box (34*4, 28*4, 50*4, 32*4, 0x187F);
    
	// open the PS2 port
	PS2_dev = alt_up_ps2_open_dev ("/dev/PS2_Port");
	if ( PS2_dev == NULL)
	{
		alt_printf ("Error: could not open PS2 device\n");
		return -1;
	}
	else
		alt_printf ("Opened PS2 device\n");

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
	key2='0';
	while(1)
	{
	 //      int success =  decode_scancode(PS2_dev,&decode_mode,&buf,&key);       
	//	   if(success==0)
	//	   {
			/* check for PS/2 data--display on HEX displays */
  		if (alt_up_ps2_read_data_byte (PS2_dev, &PS2_data) == 0)
		{
		   
	//		 shift the next data byte into the display 
			byte1 = byte2;
			byte2 = PS2_data;
			HEX_PS2 (byte1, byte2);
			if(byte1==240 || byte1==byte2)
			{ 
			   if(key2=='0')
			   {
			    flag = 1;
			  switch(byte2)
			  {
			   case 28:
			    key = 'A';
				break;
			   case 50:
			    key = 'B';
				break;
			   case 33:
			    key = 'C';
				break;
			   case 35:
			    key = 'D';
				break;
			   case 36:
			    key = 'E';
				break;
			   case 43:
			    key = 'F';
				break;
			   case 52:
			    key = 'G';
				break;
			   case 51:
			    key = 'H';
				break;
			   case 67:
			    key = 'I';
				break;
			   case 59:
			    key = 'J';
				break;
			   case 66:
			    key = 'K';
				break;
			   case 75:
			    key = 'L';
				break;
			   case 58:
			    key = 'M';
				 break;
               case 49:
                key = 'N';
                break;
			   case 68:
			    key = 'O';
				break;
               case 77:
                key = 'P';
                break;
               case 21:
                key = 'Q';
                break;
               case 45:
                key = 'R';
                break;
               case 27:
                key = 'S';
                break;
               case 44:
                key = 'T';
                break;
               case 60:
                key = 'U';
                break;
               case 42:
                key = 'V';
                break;
               case 29:
                key = 'W';
                break;
               case 34:
                key = 'X';
				break;
               case 53:
                key = 'Y';
			    break;
			   case 26:
			    key = 'Z';
				break;
			   case 41:
			    key = ' ';
				break;
			   case 69:
			    key = '0';
				break;
			   case 22:
			    key = '1';
				break;
			   case 30:
			    key = '2';
				break;
			   case 38:
			    key = '3';
				break;
			   case 37:
			    key = '4';
				break;
			   case 46:
			    key = '5';
				break;
			   case 54:
			    key = '6';
				break;
			   case 61:
			    key = '7';
				break;
			   case 62:
			    key = '8';
				break;
			   case 70:
			    key = '9';
				break;
				case 88:
				key2='1';
				key='\a';
				break;
			   default:
			    key = '*';
			 } }
			   if(key2=='1' )
			   {
			     switch(byte2)
			    {
			     case 28:
			     key = 'a';
				 break;
			   case 50:
			    key = 'b';
				break;
			   case 33:
			    key = 'c';
				break;
			   case 35:
			    key = 'd';
				break;
			   case 36:
			    key = 'e';
				break;
			   case 43:
			    key = 'f';
				break;
			   case 52:
			    key = 'g';
				break;
			   case 51:
			    key = 'h';
				break;
			   case 67:
			    key = 'i';
				break;
			   case 59:
			    key = 'j';
				break;
			   case 66:
			    key = 'k';
				break;
			   case 75:
			    key = 'l';
				break;
			   case 58:
			    key = 'm';
				 break;
               case 49:
                key = 'n';
                break;
			   case 68:
			    key = 'o';
				break;
               case 77:
                key = 'p';
                break;
               case 21:
                key = 'q';
                break;
               case 45:
                key = 'r';
                break;
               case 27:
                key = 's';
                break;
               case 44:
                key = 't';
                break;
               case 60:
                key = 'u';
                break;
               case 42:
                key = 'v';
                break;
               case 29:
                key = 'w';
                break;
               case 34:
                key = 'x';
				break;
               case 53:
                key = 'y';
			    break;
			   case 26:
			    key = 'z';
				break;
			   case 41:
			    key = ' ';
				break;
			   case 69:
			    key = '0';
				break;
			   case 22:
			    key = '1';
				break;
			   case 30:
			    key = '2';
				break;
			   case 38:
			    key = '3';
				break;
			   case 37:
			    key = '4';
				break;
			   case 46:
			    key = '5';
				break;
			   case 54:
			    key = '6';
				break;
			   case 61:
			    key = '7';
				break;
			   case 62:
			    key = '8';
				break;
			   case 70:
			    key = '9';
				break;
				case 88:
				if(flag==0)
				 key2 = '0';
				 break;
			   default:
			    key = '*';
			 }
			 flag = 0;
			}
			 
		     display_vga[i][count]   = key;
		     display_vga[i][count+1] = '\0';
//		    alt_up_char_buffer_string(char_buffer_dev,display_vga, 0, 0); 
             count = count+1;
			 if(count > 70)
			 {
			  count = 0;
			  i++;
			 } 
		//	alt_up_char_buffer_string(char_buffer_dev,display_vga, 0, 0);
		  /*  if(i>=0) */ alt_up_char_buffer_string (char_buffer_dev,display_vga[0], 8, 8);
          /*  if(i>=1) */ alt_up_char_buffer_string (char_buffer_dev,display_vga[1], 4, 10);
          /*  if(i>=2)*/  alt_up_char_buffer_string (char_buffer_dev,display_vga[2], 4, 12);
          /*  if(i>=3) */ alt_up_char_buffer_string (char_buffer_dev,display_vga[3], 4, 14);
          /*  if(i>=4) */ alt_up_char_buffer_string (char_buffer_dev,display_vga[4], 4, 16);
                          alt_up_char_buffer_string (char_buffer_dev,display_vga[5], 4, 18);
						  alt_up_char_buffer_string (char_buffer_dev,display_vga[6], 4, 20);
						  alt_up_char_buffer_string (char_buffer_dev,display_vga[7], 4, 22);
						  alt_up_char_buffer_string (char_buffer_dev,display_vga[8], 4, 24);
						  alt_up_char_buffer_string (char_buffer_dev,display_vga[9], 4, 26);
			if ( (byte1 == (char) 0xAA) && (byte2 == (char) 0x00) )
				// mouse inserted; initialize sending of data
				(void) alt_up_ps2_write_data_byte (PS2_dev, 0xF4); 
		}  
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

	// SEVEN_SEGMENT_DECODE_TABLE gives the on/off settings for all segments in 
	// a single 7-seg display in the DE1 Media Computer, for the hex digits 0 - F */
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

/*******************************************************************************/