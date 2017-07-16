#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

int count=0;

ISR(INT1_vect)
{
	cli();
	count++;
	LCD_Print(count,1,1);
	sei();
}

int main(void)
{
	DDRD=0x81;
	PORTD=0x00;
	LCD_init();
	LCD_Print(6,1,2);
	GICR= (1<<INT1);
	MCUCR= (1<<ISC10);
	while(1)
	{
		sei();
		//LCD_Print(count,1,1);
		_delay_ms(300);
	}
	return 0;
}	
	