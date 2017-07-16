#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "lcd.h"

void pwm_maker(void)
{
	TCCR1A |= 0x82;
	TCCR1B |= 0x13;
	ICR1 = 500;
}

void set_duty_cycle(int dc)
{
	if(dc > 500)
		OCR1A = 500;
	if(dc < 25)
		OCR1A = 25;
	if(dc >= 25 && dc <= 500)
	OCR1A = dc;
}

volatile int count=0;
ISR(INT1_vect)
{
	count++;
}


int main(void)
{

	int set_count = 6;
	int th = 2;
	int a = 100;
	
	LCD_init();
	DDRD = 0x21;
	PORTD &= 0xFE;
	
	while(1)
	{
		count = 0;
		TCNT2=0;
		TCCR2 &=0xB7;
		TCCR2 |=0x07;
		PORTD |= 0x01;
		set_duty_cycle(a);
		pwm_maker();
		TCCR2 |= 0x07;
		GICR |= 1<<INT1;
		MCUCR |= 0x08;
		MCUCR &= 0xFB;
		SREG = 0x80;
		sei();
		while(TCNT2 < 254);
		cli();
		TCCR2 &= 0xF8;
		LCD_Print(count, 1, 1);
		LCD_Print(TCNT2, 5, 1);
		LCD_Print(set_count, 1, 2);
		LCD_Print(OCR1A, 5, 2);
		if(set_count > count)
		{
			if(set_count - count > th)
				set_duty_cycle(a++);
		}
		
		if(count > set_count)
		{
			if(count - set_count > th)
				set_duty_cycle(a--);
		}
		_delay_ms(300);
	}
}