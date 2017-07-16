#include<avr/io.h>
int main(void)
{
  unsigned int i=0;
  while(1)
  {
    DDRA = 0b11111011;
	PORTA= 0b00000000;
	for(i=0;i<4;i++)
	{
	  PORTA|=i;
	  PORTA|=PINA2<<(3+i);
	}
   }
}
