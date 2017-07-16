#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

/*void usart_init(unsigned int a)
{
	UCSRB&=0x7F;
	UBRRH=(a>>8);
	UBRRL=a;
	UCSRB|=0x08;
	UCSRC|=0x8E;
}*/	
void USART_Init( unsigned int ubrr)
{
/* Set baud rate */
UBRRH = (unsigned char)(ubrr>>8);
UBRRL = (unsigned char)ubrr;
/* Enable receiver and transmitter */
UCSRB =(1<<TXEN);
/* Set frame format: 8data, 2stop bit */
UCSRC = (1<<URSEL)|(1<<USBS)|(3<<UCSZ0);
}

void ADC_Single(void)
{
	DDRA=0x00;
	PORTA=0x00;
	ADCSRA=0xC6;
	ADMUX=0xC0;
	ADCSRA|=0x40;
	while(ADCSRA&(1<<ADSC));
}	
void usart_send(unsigned char data)
{
	while(!(UCSRA & (1<<UDRE)));
		UDR=data;
}
int main(void)
{
	unsigned int x=0;
	unsigned char ub=0,lb=0;
	DDRA=0x00;
	DDRD=0x02;
	PORTD=0x00;
	LCD_init();
	ADCSRA=0xC6;
	ADMUX=0xC0;
	USART_Init(12);
	ADCSRA|=0x40;
	while(1)
	{
		ADCSRA|=0x40;
		while(ADCSRA&(1<<ADSC));
		x=100;
		LCD_Print(x,1,1);
		lb&=(unsigned char)(x&0x1F);
		ub=(unsigned char)(x>>5);
		ub|=0x80;
		lb=x;
		usart_send(lb);
	//	usart_send(ub);
		//ADCSRA|=0x40;
	}
}