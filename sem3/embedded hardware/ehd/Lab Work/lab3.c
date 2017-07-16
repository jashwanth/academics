#include<avr/io.h>
#include<avr/delay.h>
int main(void)
{
	DDRA=0b11111011; //Used to assign PA2 as i/o rest as o/p
	int i=0;
	unsigned int serial2parallel=0;
	for(i=0,i<3;i++)
	{
		PORTA=i; 
		serial2parallel = PINA.2<<1;
	}
    int output=0;
	output=~serial2parallel;
	PORTA=output<<3;
}	
	