#include<avr/io.h>
#include<avr/delay.h>
#include "lcd.h"

USART_init(unsigned int ubrr)
{
	char upper,lower;
	upper=ubrr>>8;
	lower=(unsigned char)(ubrr);
	UBRRH=upper;
	UBRRL=lower;
	
	UCSRB=(1<<TXEN)|(1<<RXEN);
	