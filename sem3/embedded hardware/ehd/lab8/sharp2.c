#include<avr/io.h>
#include<util/delay.h>
#include<avr/delay.h>
#include "lcd.h"

void usart_init(unsigned int a)
{
	UCSRB&=0x7F;
	UBRRH=(a>>8);
	UBRRL=a;
	UCSRB|=0x08;
	UCSRC|=0x88;
}	

void usart_send(unsigned char data)
	{
	while(!(UCSRA & (1<<UDRE)))
		;
	UDR=data;
}
int main(void)
{
	DDRD=0x00;
	PORTD=0x00;
	LCD_init();
	unsigned char x=0;
	
	while(1)
	{
		ADMUX=0x00;
		ADCSRA=0xC7;
		_delay_ms(100);
		x=ADC;
		x&=0x1F;
		usart_send(x);
		_delay_ms(100);
		x=(ADC>>5);
		x&=0x1F;
		x|=0x80;
		_delay_ms(100);
		usart_send(x);
		_delay_ms(100);
	}
	return 0;
}	
		
		