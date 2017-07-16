#include<avr/io.h>
int main(void)
{
  DDRD=0xF0;
  PORTD=0x00;
  unsigned int x;
  while(1)
  {
    x = PIND&0xF0;
	if(x>0)
	PORTD=0x0F;
	else
	PORTD=0x00;
   }
 }