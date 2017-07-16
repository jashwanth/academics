// Target : ATMega16
// desired baud rate: 9600
#define ubrr  (12000000/16/baud rate -1) 

//#include <iom16v.h>
//#include <macros.h>
#include <avr/io.h>
#include<util/delay.h>

//UART0 initialize
void uart0_init(void)
{
 	 /*all these declaration just check on datasheet :) */	 
	 //set frame format : 8 data, 1 stop bit, none parity, asynchronous
 //	 UCSRC = BIT(URSEL) | 0x06;
     UCSRC = (1<<URSEL) | (3<<UCSZ0);
 	 UBRRL = 0x2F; //set baud rate lo
 	 UBRRH = 0x00; //set baud rate hi
 	 UCSRB = 0x18; //enable receiver and transmitter
}

//Uart transmit
void uart_transmit(unsigned char data)
{
 	 //wait for empty transmit buffer
	 while(!(UCSRA & (1<<UDRE)));
	 
	 //put data into buffer, send the data
	 UDR = data;
}

//there is function to show teks 'abcde' on terminal 
void show_terminal(void)
{
 	 unsigned int i;
	 unsigned char arr[] = {'a','b','c','d','e'};
	 
	 uart0_init();
	 
	 for(i=0; i<6; i++)
	 {
	  	  uart_transmit(arr[i]);
	 }
}

int main(void)
{
 	  show_terminal();
}