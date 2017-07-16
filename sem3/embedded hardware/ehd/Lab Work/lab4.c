#include<avr/io.h>
#include<avr/delay.h>

int main(void)
{
	int i;
	char x,y;
	y=0x00;
	x=0x00;
	DDRA=0b01111011;
	for(i=0;i<4;i++)
	{
		PORTA=(i&0xFF);
		y=PINA&0x04;
		y=y<<(i+1);
		x=x|y;
		y=0x00;
	}
	//x=~x;
	PORTA=x;	
}	