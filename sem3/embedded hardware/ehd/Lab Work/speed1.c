#include<avr/io.h>
#include<avr/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

int count=0;

ISR(INT1_vect)
{
	cli();
	count++;
	sei();
}

void pwm(void)
{
	TCCR2=0x07;
}
void dispwm(void)
{
	TCCR2=0x00;
}
	
int main(void)
{
		DDRD=0x11;
		PORTD=0x00;
		LCD_init();
		MCUCR= (1<<ISC10);
		GICR= (1<<INT1);
		while(1)
		{
			sei();
			while(TCNT2>255)
			{
				;
			}
			TCNT2=0;
			cli();
			dispwm();
			LCD_Print(count,1,1);
			_delay_ms(300);
		}
		return 0;
}	
		
		
	