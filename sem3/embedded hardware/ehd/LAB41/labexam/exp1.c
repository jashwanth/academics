#include<avr/io.h>
#include<avr/interrupt.h>
#include<util/delay.h>
#include "lcd.h"
unsigned int x=0;
ISR(INT1_vect)
{
  int y;
  LCD_init();
  ADCSRA= 0xA6;
  ADMUX = 0x60;
  _delay_ms(100);
  x = ADC;
  y = PINA3;
  LCD_Print(x,1,1);
  LCD_Print(y,5,2);
  _delay_ms(100);
 // LCD_Send_String("hello");
}
int main(void)
{
	DDRD=0x00;
	PORTD=0x00;
	DDRA=0x00;
	PORTA=0x00;
	LCD_init();
	SREG |= 0x80;
	sei();
	GICR = 1<<INT1;
	MCUCR = 0x0C;
	SFIOR = 0x40;
//	ADCSRA= 0xA6;
//	ADMUX = 0x60;
	while(1);
}