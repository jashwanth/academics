#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_ps2.h"
#include "altera_up_ps2_keyboard.h"
#include "altera_up_ps2_mouse.h"
#include "altera_up_avalon_parallel_port.h"
#include "sys/alt_stdio.h"
#include "altera_up_avalon_video_pixel_buffer_dma.h"
//#include "alt_up_vga.h"
/* globals */
#define BUF_SIZE 500000			// about 10 seconds of buffer (@ 48K samples/sec)
#define BUF_THRESHOLD 96		// 75% of 128 word buffer

/* function prototypes */
void VGA_box (int, int, int, int, short);
void VGA_line(int ,int , short);
void HEX_PS2(char, char);
void check_KEYs( int *, int *, int *, alt_up_parallel_port_dev *, alt_up_audio_dev * );

/********************************************************************************
 * This program demonstrates use of the media ports in the DE1 Media Computer
 *
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
	unsigned char PS2_data, byte1 = 0, byte2 = 0 , byte3 = 0;
    KB_CODE_TYPE decode_mode;
	alt_u8 buf;
	/* create a message to be displayed on the VGA display */
	char text_top_row[40] = "Altera DE1\0";
	char text_bottom_row[40] = "Media Computer\0";
	char display_vga[40][80];
	int count = 0,i = 0,init=0;
	for(init=0;init<40;init++)
	 display_vga[init][0] = '\0';
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
//	alt_up_ps2_init(PS2_dev);
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
//	(void) alt_up_ps2_write_data_byte (PS2_dev, 0xF4);     // enable mouse
//    (void) alt_up_ps2_write_data_byte (PS2_dev, 0xF6);
//    alt_up_ps2_clear_fifo(PS2_dev); 
    int start_x = 320,start_y = 240;
	VGA_line(start_x,start_y,0x187F);
	while(1)
	{    
	//	   (void) alt_up_parallel_port_write_data (green_LEDs_dev, byte1);
	
            if(alt_up_ps2_read_data_byte(PS2_dev,&PS2_data) == 0)
			{
			  count++;
			  byte3 = byte2;
			  byte2 = byte1;
		      byte1 = PS2_data;
			  if(count==3)
			  {
			    HEX_PS2 (byte2, byte1);
			    (void) alt_up_parallel_port_write_data (green_LEDs_dev, byte3);
				if(byte3 && 0x10==1)
				{
				  start_x -=  (int)byte2;
				}
				else
				  start_x +=  (int)byte2;
				if(byte3 && 0x20 == 1)
                 start_y -=  (int)byte1;
                else
                 start_y += (int)byte1;     
	//		 shift the next data byte into the display 
			
//		    alt_up_char_buffer_string(char_buffer_dev,display_vga, 0, 0); 

			   if ( (byte2 == (unsigned char) 0xaa) && (byte3 == (unsigned char) 0xfa) )
			     {
				// mouse inserted; initialize sending of data
				     alt_printf("mouse reset\n");
				     (void) alt_up_ps2_write_data_byte (PS2_dev, 0xF4);	
				     alt_up_ps2_clear_fifo(PS2_dev);
			      }
			    count = 0;
			//	alt_printf("byte 1 is %x\n",byte1);
			//    alt_printf("byte 2 is %x\n",byte2);
			//    alt_printf("byte 3 is %x\n",byte3);
			//	alt_printf("start_x is %d\n",start_x);
			//	alt_printf("start_y is %d\n",start_y);
//				VGA_box (34*4, 28*4, 50*4, 32*4, 0x187F);
				VGA_line(start_x,start_y,0x187F);
				//VGA_box(start_x,start_y-1,start_x,start_y+1,0x187F);
              }
            }                	   
	}
}

void VGA_line(int col_no, int row_no ,short pixel_color)
{
	int offset, row = 0, col = 0;
  	volatile short * pixel_buffer = (short *) 0x08000000;	// VGA pixel buffer

	/* assume that the box coordinates are valid */
	 while(row < 480)
	 {
	   offset = (row << 9 ) + col_no;
	   *(pixel_buffer + offset) = pixel_color;
	   row++;
	 }
     while(col<640)
     {
	 /*   if(row < 480)
		{
		 offset = (row << 9) + col_no;
	     *(pixel_buffer + offset) = pixel_color;	// compute halfword address, set pixel
	      while(row == row_no && col < 640)
	      { */
	        offset = (row_no << 9)+ col;
	        *(pixel_buffer + offset) = pixel_color;	// compute halfword address, set pixel
		    col++ ;
		/*  }
		  row++;
	    } */
//		else
//		 break;
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