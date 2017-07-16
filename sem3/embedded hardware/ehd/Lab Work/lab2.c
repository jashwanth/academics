#include<avr/io.h>
#include<avr/delay.h>
int main(void)
{
	DDRD=0b11111101;
	PORTD|=0b11111111;
	SFIOR&=0b11111011;
	while(1)
	{
		if(PIND & 0b00000010)
			PORTD=0b00000001;
		else
			PORTD=0X00;
		_delay_ms(500);
	}
}	