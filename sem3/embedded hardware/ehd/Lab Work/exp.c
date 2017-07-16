#include<avr/io.h>
#include<avr/delay.h>
int main(void)
{
  while(1)
  {
  DDRA = 0b11111011;
  unsigned int stp=0,i=0,output=0,p1=0,p2=2;
  for(i=0;i<=3;i++)
  {
    PORTA = i;
    stp|=PINA2<<i;
  }
  for(i=0;i<=3;i++)
  {
    if(3-p1 >= 1)
	{
	  output|=(stp&(1<<i))<<(3-p1);
	  p1+=2;
	}
	else if(3-p1<1)
	{
	  output|=(stp&(1<<i))>>(3-p1+p2);
	  p2-=2;
	}
  }
  PORTA|=output<<3;
  }
  
}

