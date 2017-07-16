#define FOSC 12000000
#define baud 9600
#define myubrr FOSC/16/baud-1
#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include"lcd.h"

void usart_init(unsigned int);
void transmit_byte(int);

int main(){
  DDRD = 0x02;
  DDRA = 0x00;
  DDRB = 0xff;
  PORTB = 0xff;
  ADMUX = 0xc0;
  ADCSRA |= (1<<ADEN);//enable adc
   usart_init(myubrr);
  while(1){
   
    ADCSRA |=  (1<<ADSC);//start conversion
	while((ADCSRA & (1<< ADIF)) == 0);//wait till conversion completes
	int adc_value = ADC;
	int distance = (1023-adc_value)/60;

	transmit_byte(distance);
	
  }
}

void usart_init(unsigned int ubrr){
 /*asynchronous mode five bits of data send*/
 UBRRH= (unsigned char)(ubrr >> 8);
 UBRRL = (unsigned char)(ubrr);//12--set baud rate(12000000/16x57600 - 1)
 UCSRB |= (1 << RXEN) | (1 << TXEN );
 UCSRC = (1<<URSEL)|(1<<USBS)|(3<<UCSZ0);
}

void transmit_byte(int adc){
  char lower = (char) adc & 0x001f;//select lower five bits
  char upper = (char) ((adc & 0x03e0) >> 5);//select upper five bits
  upper |= 0x80;//add 100 to the start of the bits
  while(!(UCSRA & (1 << UDRE)));
  UDR = lower;//guess this will transmit
  while((UCSRA & (1<<UDRE)) == 0);
  UDR = upper;
	
}