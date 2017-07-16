#include<avr/io.h>
#include<avr/delay.h>

int main(void)
{
	unsigned int i;
	DDRD=0xFF;
	PORTD=0x00;
	while(1)
	{
		for(i=0;i<8;i++)
		{
			PORTD=(1<<i);
			_delay_ms(50);
		}
		for(i=7;i>=0;i--)
		{
			PORTD=(1<<i);
			_delay_ms(50);
		}
	}
	return 0;
}	
		
	