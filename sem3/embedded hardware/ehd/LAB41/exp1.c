#include<avr/io.h>
#include<util/interrupts.h>
#include "lcd.h"
#include<inttypes.h>
#define BAUD 57600
#define FOSC 1843200
#define myubbr FOSC/16/BAUD-1
void USART_init(unsigned int ubrr)
{ 
  UBRRH = ubrr >>8;
  UBRRl = ubrr;
  UCSRB | = 1<<TXEN;
  UCSRC  = 1<<URSE | 1<<USBS | 3<<UCSZ0;
}
void adc_init(void)
{
   ADMUX = 0b01100000;
   ADCSRA = 0b10000001;
   
}
int main(void)
{
  unsigned int result = 0;
  lcd_init();
  DDRB = 0xFF;
  adc_init(void);
  while(1)
  {
    ADCSRA | = 1<<ADSC;
	while(ADCSRA && 1<<ADSC)
	{};
	result = adc;
	LCD_Print(result,1,1);
	USART_init(myubbr);
	
  }
  return 0;
}

