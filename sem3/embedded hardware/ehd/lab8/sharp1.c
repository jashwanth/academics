#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"
/*void adc_init(void)
{
 ADMUX = 0b00000000; 
 ADCSRA= 0b11000111;
} */
int main(void)
{
//	DDRA=0x00;
//	unsigned int x;
	LCD_init();
	LCD_Send_String("God");
   // adc_init();
/*	while(1)
	{
	    
		//ADCSRA |= 1<ADSC;
		ADCSRA|=0x40;
		_delay_ms(5);
			x=ADC;
		LCD_Print(x,1,1);
	}*/
}

