#include<avr/io.h>
#include<avr/interrupt.h>
#include<util/delay.h>

int main(void)
{
	DDRD|=0x01;
	DDRD&=0xFD;
	PORTD=0x00;
	SFIOR=(1<<PUD);
	while(1)
	{
		if(PIND & 0x02)
		{
			PORTD|=0x00;
		}
		else
		{
			PORTD|=0x01;
		}
	}
	return 0;
}	
	
	