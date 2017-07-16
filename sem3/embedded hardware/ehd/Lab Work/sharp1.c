#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

int main(void)
{
	DDRD=0x02;
	PORTD=0x00;
	DDRA=0x00;
	unsigned int x=0;
	LCD_init();
	while(1)
	{
		ADMUX=0xC0;
		ADCSRA=0xC7;
		ADCSRA|=0x40;
		x=ADC;
		LCD_Print(x,1,1);
		_delay_ms(500);
	}
	return 0;
}