/*
 * motor.c
 *
 * Created: 27-09-2011 16:09:31
 *  Author: Arushi
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

#include "lcd.h"

void pwm_maker(){
	TCCR1A |= 0x82;
	//TCCR1A &= 0xBE;
	TCCR1B |= 0x13;
	//TCCR1B &= 0XF7;
	ICR1 = 500;
}

void set_duty_cycle(int dc){
	if(dc > 500)
		OCR1A = 500;
	if(dc < 25)
		OCR1A = 25;
	if(dc >= 25 && dc <= 500)
	OCR1A = dc;
}

int count;
ISR(INT1_vect){
//	cli();
	count++;
//	sei();
}


int main()
{

	int set_count = 6;
	int th = 2;
	int a = 100;
	
	LCD_init();
	DDRD = 0x21;
	PORTD &= 0xFE;
	
	while(1){
	count = 0;
	TCNT2=0;

		
	
		TCCR2 &=0xB7;
		TCCR2 |=0x07;
		PORTD |= 0x01;
		
		set_duty_cycle(a);
		pwm_maker();

		//enable timer/counter
		TCCR2 |= 0x07;
		
		//initialising interrupts
		GICR |= 1<<INT1;
		MCUCR |= 0x08;
		MCUCR &= 0xFB;
		
		SREG = 0x80;
		sei();
		while(TCNT2 < 254);
		cli();
		
		//disable timer counter
		TCCR2 &= 0xF8;
		//PORTD &= 0xFE;
	
		LCD_Print(count, 1, 1);
		LCD_Print(TCNT2, 5, 1);
		LCD_Print(set_count, 1, 2);
		LCD_Print(OCR1A, 5, 2);
		//LCD_Print(count-set_count, 10, 1);

				
		//checking diff & changing duty cycle
		if(set_count > count)
		{
			if(set_count - count > th){
				//a++;
				set_duty_cycle(a++);
			}	
			//LCD_Print(set_count-count, 10, 2);
		}
		
		if(count > set_count)
		{
			if(count - set_count > th){
				//a--;
				set_duty_cycle(a--);
			}
			//LCD_Print(count-set_count, 10, 1);
		}

		
		_delay_ms(300);
		LCD_init();

		
		//LCD_init();

	}
}