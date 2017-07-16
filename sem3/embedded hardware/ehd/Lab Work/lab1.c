#include<avr/io.h>
#include<avr/delay.h>
int main(void)
{
    DDRD=0b00000001;
    SFIOR=(1>>PUD);
	while(1)
	{
		if(PIND & 0b00000010)
			PORTD=0X01;
		else
			PORTD=0X00;
	}
}	
		
		
