#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>

void USART_TransmitByte(unsigned char data);
void USART_init(unsigned int ubrr);
char received_value;
int main(void)
{
	DDRD=0x02;
	PORTD=0x00;
	SREG|=0x80;
	USART_init(77);
	LCD_init();
	sei();
	received_value=0;
	while(1)
	{
		USART_TransmitByte(0b00011100);
		_delay_ms(1);  
		LCD_init();
		LCD_Print(received_value,1,1);
		_delay_ms(500);
	}
	
}

void USART_init( unsigned int ubrr)
{
	UBRRH=(unsigned char)(ubrr>>8);
	UBRRL=(unsigned char)ubrr;
	UCSRB=(1<<TXEN)|(1<<RXEN)|(1<<RXCIE);
	UCSRC=0x80;
}


void USART_TransmitByte(unsigned char data)
{
	while (!( UCSRA&(1<<UDRE)));
	UDR=data;
}

ISR(USART_RXC_vect)
{
	received_value=UDR;
}