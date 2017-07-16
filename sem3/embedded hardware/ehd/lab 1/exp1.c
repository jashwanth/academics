#include<avr/io.h>
#include<avr/delay.h>
#define PORT PORTD
#define DDR DDRD
int main(void)
{
  DDR = 0xFF;
  PORT = 0x00;
  while(1)
  {
    for( int i =0 ; i<8 ; i++)
      PORT = (1<<i),_delay_ms(80);
    for( int i = 7 ; i>=0 ; i--)
      PORT = (1<<i), _delay_ms(80);
  }
}