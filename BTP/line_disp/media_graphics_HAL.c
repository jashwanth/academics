#include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "sys/alt_stdio.h"

void draw_big_A(alt_up_pixel_buffer_dma_dev *);

/********************************************************************************
 * This program demonstrates use of the character and pixel buffer HAL code for
 * the DE1 Media computer. It:
 * 	-- places a blue box on the VGA display, and places a text string inside the box.
 *		-- draws a big A on the screen, for ALTERA
 *		-- "bounces" a colored box around the screen 
********************************************************************************/
int main(void)
{
	alt_up_pixel_buffer_dma_dev *pixel_buffer_dev;
	alt_up_char_buffer_dev *char_buffer_dev;

	/* used for drawing coordinates */
	int x1, y1, x2, y2, deltax_1, deltax_2, deltay_1, deltay_2, delay = 0;

	/* create a message to be displayed on the VGA display */
	char text_top_row[40] = "Altera DE1\0";
	char text_bottom_row[40] = "Media Computer\0";

	/* initialize the pixel buffer HAL */
	pixel_buffer_dev = alt_up_pixel_buffer_dma_open_dev ("/dev/VGA_Pixel_Buffer");
	if ( pixel_buffer_dev == NULL)
		alt_printf ("Error: could not open VGA pixel buffer device\n");
	else
		alt_printf ("Opened character VGA pixel buffer device\n");
	/* clear the graphics screen */
	alt_up_pixel_buffer_dma_clear_screen(pixel_buffer_dev, 0);

	/* output text message in the middle of the VGA monitor */
	char_buffer_dev = alt_up_char_buffer_open_dev ("/dev/VGA_Char_Buffer");
	if (char_buffer_dev == NULL)
	{
		alt_printf ("Error: could not open character buffer device\n");
		return -1;
	}
	else
		alt_printf ("Opened character buffer device\n");
//	alt_up_char_buffer_string (char_buffer_dev, text_top_row, 35, 29);
//	alt_up_char_buffer_string (char_buffer_dev, text_bottom_row, 35, 30);
    volatile short * pixel_buffer = (short *) 0x08000000;
	/* now draw a background box for the text */
//	alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 34*4, 28*4, 50*4, 32*4, 0x187F, 0);

	/* now draw a big A for ALTERA */
//	draw_big_A (pixel_buffer_dev);

	/* now draw a red rectangle with diagonal green lines */
/*	x1 = 20; y1 = 20;
	x2 = 50; y2 = 50;
	alt_up_pixel_buffer_dma_draw_rectangle(pixel_buffer_dev, x1, y1, x2, y2, 0xF800, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y1, x2, y2, 0x07e0, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y2, x2, y1, 0x07e0, 0);
	alt_up_pixel_buffer_dma_swap_buffers(pixel_buffer_dev);*/

	/* set the direction in which the box will move */
//	deltax_1 = deltax_2 = deltay_1 = deltay_2 = 1;
     
    int row = 0, col = 0 , offset;	 
	while(1)
	{
	//	if (alt_up_pixel_buffer_dma_check_swap_buffers_status(pixel_buffer_dev) == 0)
	//	{
		  for(row=0;row<320;row++)
		  {
		    for(col=0;col<240;col++)
			{
			  offset = (row << 9) + col;
			  *(pixel_buffer+offset) = 0x18F7;
		    }
		  }	
	//  	}	
	}
}

/* draws a big letter A on the screen */
void draw_big_A(alt_up_pixel_buffer_dma_dev *pixel_buffer_dev )
{
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 10, 88, 44, 10, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 44, 10, 72, 10, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 72, 10, 106, 88, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 106, 88, 81, 88, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 81, 88, 75, 77, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 75, 77, 41, 77, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 41, 77, 35, 88, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 35, 88, 10, 88, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 47, 60, 58, 32, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 58, 32, 69, 60, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 69, 60, 47, 60, 0xffff, 0);
}
