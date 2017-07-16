#include<avr/io.h>
#include<avr/interrupt.h>
#include<util/delay.h>
#include "lcd.h"

int main(void)
{
	DDRD|=0xFB;
	PORTD=0x00;
	unsigned int i=0;
	char j=0,dummy=0;
	for(i=0;i<=3;i++)
	{
		PORTD|=(i&0xFF);
		j=PIND;	
		j=j<<(i+1);
		dummy|=j;
	}
	PORTD|=dummy;
	return 0;
}