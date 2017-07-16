#include<avr/io.h>
#include<avr/delay.h>

int main(void)
{
	unsigned int i;
	while(1)
	{
	DDRA=0b11111011;
	PORTA=0x00;
	for(i=0;i<4;i++)
	{
		PORTA|=i;
		PORTA|=PINA2<<(3+i);
		
		//y=y<<(i+1);
	//	x=x|y;
//		y=0x00;
	}
	}
	//x=~x;	
}	