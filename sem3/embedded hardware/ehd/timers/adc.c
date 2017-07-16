#include<avr/io.h>
#include<avr/interrupt.h>
#include<util/delay.h>
#include<stdlib.h>
#include "lcd.h"
#include<inttypes.h>
ISR(ADC_vect)
{
  LCD_GotoXY(2,4);
  LCD_Send_String("adc interrupt");
} 
void adc_init(void)
{
  ADMUX = 0b01100000;//ADC0 as the input
  ADCSRA= 0b10011111; // last three bits prescale by 128
  // no sfior is needed coz no autotriggering
} 
int main(void)
{
  DDRA = 0x00;
  adc_init();
  unsigned int x;
  while(1)
  {
    sei();
    LCD_init();
    ADCSRA |= 1<<ADSC;
	while(ADCSRA && 1<<ADSC)
	{};
	x = ADC;
	LCD_GotoXY(1,1);
	LCD_Print(x,1,1);
	cli();
  }
  return 0;
}