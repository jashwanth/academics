#include<stdio.h>
#include<avr/io.h>
#include<util/delay.h>
#include<inttypes.h>
#include<avr/interrupt.h>
#include<string.h>
#include "lcd.h"
volatile int count=0,set_count=11,diff=0;
ISR(INT1_vect)
{ 
  count++;
}
void timer2_init(void)
{
  TCCR2 = 0x07;
}

void PWM(void)
{
	TCCR1A=0x82;
	TCCR1B=0x11;
}
int main(void)
{
  DDRD = 0x21;
  ICR1 = 900;
  OCR1A= 500;
  SREG|=0x80;
  PORTD|=1<<PORTD0;
  GICR = (1<<INT1);
  MCUCR = (1<<ISC10);
  PWM();
  LCD_init();
  timer2_init();
  while(1)
  {
	while(TCNT2<250);
    cli();
	diff = set_count-count;
	LCD_Print(count,1,1);
	LCD_Print(diff,10,1);
	LCD_Print(OCR1A,1,2);
	if(diff>0)
	{
		OCR1A+=(diff-5);
	}
	if(diff<0)
	{
	  OCR1A -= (diff-5);
	}
	_delay_ms(300);
	sei();
    count = 0;
	TCNT2 =0x00;
  }
}