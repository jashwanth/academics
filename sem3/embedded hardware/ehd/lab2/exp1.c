#include<avr/io.h>
#define DDR DDRA
#define PORT PORTA
int main(void)
{
  DDR = 0b11101111;
  PORT = 0b00010000;
  unsigned int x;
  while(1)
  {
    x = PINA&0b00010000;
    if(x!=0)
	{
	   PORT|=0b00000001;
	}
	else
	{
	  PORT&=0b11111110;
	}
  }
}