#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

volatile int count;

ISR(INT1_vect)
{
	count++;
}

void pwmdriver(void)
{
	TCCR2=0x07;
}

void timer1(void)
{
	TCCR1A=0x82;
	TCCR1B=0x11;
	OCR1A=512;
	ICR1=1024;
}

void timer1_dis(void)
{
	TCCR1A=0x00;
	TCCR1B=0x00; 
}

int main(void)
{
	int setcount;
	int diff;
	DDRD=0x21;
	PORTD=0x01;
	SREG=0x80;
	LCD_init();
	GICR= (1<<INT1);
	MCUCR= (1<<ISC10);
        // actually 1<<ISC11;
	count=0;
	timer1();
	pwmdriver();
	while(1)
	{
		setcount=11;
		while(TCNT2<250);
		cli();
		LCD_Print(count,1,1);
		diff=count-setcount;
		LCD_Print(diff,10,1);
		if(diff>0)
		{
			OCR1A=OCR1A-(diff-5);
		}
		else if(diff<0)
		{
			OCR1A=OCR1A+(diff-5);
		}
		LCD_Print(OCR1A,1,2);
		_delay_ms(300);
		TCNT2=0;
		count=0;
		sei();
	
	}	
}