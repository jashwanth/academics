#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>
int main()
{
 DDRA=0x00;
 ADCSRA=0xC6;
 ADMUX=0xC0;
 DDRB = 0xff;
 int i;
 while(1)
 {
 for(i=25;i<=47;i++)
 {
    PORTB = i;
	_delay_ms(1000);
	LCD_init();
	int x=PINB;
	LCD_Print(x,1,1);
	_delay_ms(1000);   
  ADCSRA |= 1<<ADSC;
  while (ADCSRA & (1 << ADSC)){;}
  int y=ADC;
  LCD_init();
//  LCD_Print(y,1,1);
  _delay_ms(1000);
   _delay_ms(1000);
    _delay_ms(1000);
	 _delay_ms(1000);
//	  _delay_ms(1000);
//	   _delay_ms(1000);
//	    _delay_ms(1000);
  }
 } 
}