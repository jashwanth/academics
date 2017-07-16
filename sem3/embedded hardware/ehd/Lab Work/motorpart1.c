#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

void pwm(void);
void npwm(void);
int count=0;
int main(void)
{
	MCUCR=0x08;
	GICR=0x80;
	DDRD=0x11;
	PORTD=0x00;
	LCD_init();
	//pd3 attached to photodiode and other end of photodiode to ground. so when light comes on photodiode, e- will start to flow and PD3 decreases to ground.
	//how to determine time interval for which timer works
	//pd3 will produce external interrupt
	while(1)
	{
		
		pwm();
		sei();
		while(TCNT2<255)
		{
			;
		}
		TCNT2=0;
		
		cli();
		npwm();
		
		LCD_Print(count,1,1);
		_delay_ms(100);
	}
	//LCD_Print(i,1,2);
}

void pwm(void)
{
	TCCR2=0x07;
}

void npwm(void)
{
	TCCR2=0x00;
}

ISR(INT1_vect)
{
	cli();
	count++;
	sei();
}	