#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>

void USART_TransmitByte(unsigned char data);
void USART_init(unsigned int ubrr);
char rx;
int main(void)
{
	DDRD=0x02;
	DDRA=0x00;
	DDRC=0xFF;
	SREG|=0x80;
	ADCSRA=0xC6;
	ADMUX=0xC0;
	USART_init(77);
	ADCSRA|=0x40;
	unsigned char unib,lnib;
	LCD_init();
	sei();
	rx=0;
	while(1)
	{
		unib=(unsigned char)(ADC>>5);
		unib|=0x80;
		lnib=(unsigned char)ADC;
		lnib&=0x1F;
		USART_TransmitByte(unib);
		USART_TransmitByte(lnib);
		ADCSRA|=0x40;
		if(rx!=0){
			PORTC=0xFF;
		}
		else{
			PORTC=0x00;
		}
		_delay_ms(40);
	}
	
}

void USART_init( unsigned int ubrr)
{
	UBRRH=(unsigned char)(ubrr>>8);
	UBRRL=(unsigned char)ubrr;
	UCSRB=(1<<TXEN)|(1<<RXEN)|(1<<RXCIE);
	UCSRC = 0x86;
}


void USART_TransmitByte(unsigned char data)
{
	while (!( UCSRA&(1<<UDRE)));
	UDR=data;
}

ISR(USART_RXC_vect)
{
	rx=UDR;
}



