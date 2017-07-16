#include<stdio.h>
#include<avr/io.h>
#include<util/delay.h>
#include<inttypes.h>
#include<avr/interrupt.h>
#include<string.h>
#include "lcd.h"
volatile int count=0,set_count=0;
ISR(INT1_vect)
{
  cli();
 // LCD_GotoXY(1,2);
 // LCD_Send_String("in");  
  count++;
  sei();
}
void timer2_init(void)
{
  TCCR2 = 0b00000111;
 // TIMSK = 0b00000000;
 // TIFR  = 0b00000000;
}
/*void timer1_init(void)
{
  TCCR1A = 0b10000010;
  TCCR1B = 0b00010001;
  ICR1A  = 40000;
  OCR1A  = 2000;
}*/
void PWM(void)
{
  TCCR1B = 0b00010001;
  TCCR1A = 0b10000010;
}
int main(void)
{
  DDRD = 0b00010001;
  ICR1 = 6000;
  OCR1A= 300;
  int set_count=***;
  PORTD|=1<<PORTD0;
  GICR = 1<<INT1;
  MCUCR = 0b00001000;
  while(1)
  {
    PWM();
    LCD_init();
	TCNT2 =0x00;
	sei();
    timer2_init();
	while(TCNT2<250){};
    cli();
 //   LCD_Print(TCNT2,5,1);
//    LCD_GotoXY(7,1);
//    LCD_Send_String("out");
    LCD_Print(count,1,1);
	int diff = set_count-count;
	if(diff>0)
	{
	  OCR1A = OCR1A+5;
	}
	if(diff<0)
	{
	  OCR1A -= 5;
	}
	count = 0;
	_delay_ms(300);
//	timer1_init();
	
  }
  return 0;
}