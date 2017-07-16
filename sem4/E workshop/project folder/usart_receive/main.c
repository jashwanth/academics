#define FOSC 12000000
#define baud 9600
#define myubrr FOSC/16/baud-1
#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include"lcd.h"

void usart_init(unsigned int);
//void transmit_byte(unsigned char);
unsigned char usart_receive(void);

int main(){
    DDRD = 0x02;
    usart_init(myubrr);
	LCD_init();
  while(1){
  char ch = usart_receive();
   LCD_init();
   LCD_Send(ch,1);
   _delay_ms(100);
  }
}

void usart_init(unsigned int ubrr){
 /* Set baud rate */
UBRRH = (unsigned char)(ubrr>>8);
UBRRL = (unsigned char)ubrr;
/* Enable receiver and transmitter */
UCSRB = (1<<RXEN)|(1<<TXEN);
/* Set frame format: 8data, 2stop bit */
UCSRC = (1<<URSEL)|(1<<USBS)|(3<<UCSZ0);
}

/*void transmit_byte(unsigned char adc){
  char lower = (char) adc & 0x001f;//select lower five bits
  char upper = (char) ((adc & 0x03e0) >> 5);//select upper five bits
  upper |= 0x80;//add 100 to the start of the bits
  while(!(UCSRA & (1 << UDRE)));
  UDR = lower;//guess this will transmit
  while((UCSRA & (1<<UDRE)) == 0);
  UDR = upper;
	
}*/

unsigned char usart_receive(void)
{
/* Wait for data to be received */
while ( !(UCSRA & (1<<RXC)) )
;
/* Get and return received data from buffer */
return UDR;
}