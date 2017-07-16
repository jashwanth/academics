#include<avr/io.h>
#include<util/delay.h>
#include "lcd.h"
#include<stdlib.h>

int adc(unsigned char);
int timer()
{
	TCCR1A|=0x82;
	TCCR1B|=0x12;
	ICR1=255;
	OCR1A=127;
}	

int main(void)
{
	timer();
	DDRA=0x00;
	DDRD=0x20;
	PORTA=0x00;
	PORTD=0x00;
	ADCSRA=0xC7;
	LCD_init();
	//LCD_init();
	x=adc(0);
	LCD_Print(x,1,1);
	_delay_ms(1500);
	y=adc(1);
	LCD_init();
	LCD_Print(y,7,1);
	_delay_ms(1500);
	LCD_init();
	z=abs((x-y));
	LCD_Print(z,13,1);
	_delay_ms(1500);	
	return 0;
}
\
int adc(unsigned char a)
{
		ADCSRA|=0x40;
		ADMUX=0xD0;
		ADMUX|=a&0x1F;
		int y;
		y=ADC;
		return y;
	
}