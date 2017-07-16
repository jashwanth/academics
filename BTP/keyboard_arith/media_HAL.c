#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_ps2.h"
#include "altera_up_ps2_keyboard.h"
#include "altera_up_avalon_parallel_port.h"
#include "sys/alt_stdio.h"
#include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "stdio.h"
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
	unsigned char  byte1 = 0, byte2 = 0 , byte3 = 0, byte4 = 0;
	long long int op1 = 0 , op2 = 0 , ans = 0,flag1 = 0,eval_flag = 0,def_flag=0 ;
    KB_CODE_TYPE decode_mode;
	alt_u8 buf;
	/* create a message to be displayed on the VGA display */
	char text_top_row[40] = "Altera DE1\0";
	char text_bottom_row[40] = "Media Computer\0";
	char str[100] = "press y to continue\0";
	char display_vga[40][80];
	int count = 0,i = 0,j = 0,init=0;
	for(init=0;init<40;init++)
	 display_vga[init][0] = '\0';
    char key,key2,arith;
	/* output text message in the middle of the VGA monitor */
	char_buffer_dev = alt_up_char_buffer_open_dev ("/dev/VGA_Char_Buffer");
	if ( char_buffer_dev == NULL)
	{
		alt_printf ("Error: could not open character buffer device\n");
		return -1;
	}
	else
		alt_printf ("Opened character buffer device\n");
	
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
	while(1)
	{
	    
  		if (alt_up_ps2_read_data_byte (PS2_dev, &PS2_data) == 0)
		{
		   
	//		 shift the next data byte into the display 
			byte1 = byte2;
			byte2 = byte3;
			byte3 = PS2_data;
		//	alt_printf("byte1 is %x byte2 is %x byte3 is %x\n",byte1,byte2,byte3);
            if(byte2==240 && byte1==byte3)
            {
			   switch(byte1)
			   {
			    case 41:
				printf("space entered\n");
                 key = ' ';      // space 
				 flag1 = 1;
				 break;
				case 90:
				 printf("enter pressed\n");
                 eval_flag = 1;  // enter
                 break;
				case 53:
				 op1 =0 , op2 = 0;
				 for(i=0;i<40;i++)
				  for(j=0;j<80;j++)
				   display_vga[i][j]='\0';
				  key = '\0'; 
				 alt_up_char_buffer_clear(char_buffer_dev);  
                 break; 
				case 121:
                 key = '+';
                 arith = '+';
				 printf("arith is %c\n",arith);
                 break; 
                case 123:
				 key = '-';
                 arith = '-';
				 printf("arith is %c\n",arith);
                 break; 
				case 124:
                 key = '*';
                 arith = '*';
				 printf("arith is %c\n",arith);
                 break;
				case 74:
			     key = '/';
                 arith = '/';
				 printf("arith is %c\n",arith);
                 break;
			    case 69:
				  key = '0';
				  if(flag1==0)
				    op1 = op1*10;
				  else 
				    op2 = op2*10;
				   break;	
			    case 22:
				  key = '1';
                  if(flag1==0)
				    op1 = op1*10 + 1;
				  else 
				    op2 = op2*10 + 1;
				  break;	
				case 30:
				  key = '2';
				   if(flag1==0)
				    op1 = op1*10 + 2;
				   else 
				    op2 = op2*10 + 2;
				 break;
				case 38:
				  key = '3';
				  if(flag1==0)
				    op1 = op1*10 + 3;
				   else 
				    op2 = op2*10 + 3;
                 break;
                case 37:
				  key = '4';
				  if(flag1==0)
				    op1 = op1*10 + 4;
				   else 
				    op2 = op2*10 + 4;
                 break;
                case 46:
				  key = '5';
				  if(flag1==0)
				    op1 = op1*10 + 5;
				   else 
				    op2 = op2*10 + 5;
                 break;
                case 54:
				  key = '6';
				  if(flag1==0)
				    op1 = op1*10 + 6;
				   else 
				    op2 = op2*10 + 6;
                 break;
				case 61:
				  key = '7';
				  if(flag1==0)
				    op1 = op1*10 + 7;
				   else 
				    op2 = op2*10 + 7;
                 break;
				case 62:
				  key = '8';
				  if(flag1==0)
				    op1 = op1*10 + 8;
				   else 
				    op2 = op2*10 + 8;
                 break;
				case 70:
				  key = '9';
				  if(flag1==0)
				    op1 = op1*10 + 9;
				   else 
				    op2 = op2*10 + 9;
                 break;
				 default:
				   def_flag=1;
				  break;
			   }
			   printf("op1 is %lld op2 is %lld\n",op1,op2);
            if(eval_flag==1 && flag1==1 && def_flag==0)
            {
			  long long int quoit;
              if(arith=='+')
               ans = op1+op2;
              if(arith=='-')
               ans = op1-op2;
              if(arith=='*')
               ans = op1*op2;
              if(arith=='/')
			  {
               ans = op1/op2;
			   quoit = op1%op2;
			  } 
			 // printf("ans is %lld\n",ans);
			  
			  
			  for(i;i<80;i++)
			   display_vga[0][i]='\0';
			  if(arith!='/')
			  {
			   sprintf(display_vga[0],"%lld %c %lld = %lld",op1,arith,op2,ans);
			   sprintf(display_vga[1],"%s",str);
			  }
              else
              {
			    sprintf(display_vga[0],"%lld %c %lld = %lld %lld mod %lld=%lld",op1,arith,op2,ans,op1,op2,quoit);
			    sprintf(display_vga[1],"%s",str);
              }  
			  i = 0;
			  op1 = 0;
			  op2 = 0; 
              eval_flag=0;
              flag1 = 0;
			   alt_up_char_buffer_clear(char_buffer_dev);
			   i = 0;
		//	   alt_up_char_buffer_string (char_buffer_dev,display_vga[0], 8, 8);
		//	   alt_up_char_buffer_string (char_buffer_dev,display_vga[1], 8, 10);
			}
            else if(def_flag==0)
            {
			     display_vga[0][i] = key;
			     i++;
			     display_vga[0][i] = '\0';
			   if(i>65)
			   {
			    for(i;i>=0;i--)
			    display_vga[0][i]='\0';
			   }
               display_vga[1][0]='\0'; 	
            }
             def_flag = 0;         			
		//	alt_up_char_buffer_string(char_buffer_dev,display_vga, 0, 0);
		  /*  if(i>=0) */     alt_up_char_buffer_string (char_buffer_dev,display_vga[0], 8, 8);
          /*  if(i>=1) */     alt_up_char_buffer_string (char_buffer_dev,display_vga[1], 8, 10);
          /*  if(i>=2)*/   // alt_up_char_buffer_string (char_buffer_dev,display_vga[2], 4, 12);
          /*  if(i>=3) */  // alt_up_char_buffer_string (char_buffer_dev,display_vga[3], 4, 14);
          /*  if(i>=4) */  // alt_up_char_buffer_string (char_buffer_dev,display_vga[4], 4, 16);
                           // alt_up_char_buffer_string (char_buffer_dev,display_vga[5], 4, 18);
						   // alt_up_char_buffer_string (char_buffer_dev,display_vga[6], 4, 20);
						   // alt_up_char_buffer_string (char_buffer_dev,display_vga[7], 4, 22);
						   // alt_up_char_buffer_string (char_buffer_dev,display_vga[8], 4, 24);
						   // alt_up_char_buffer_string (char_buffer_dev,display_vga[9], 4, 26);
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