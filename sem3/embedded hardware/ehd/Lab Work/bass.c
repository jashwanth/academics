#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

void timer1(int a)
{
	TCCR1A|=0x82;
	TCCR1B|=0x13;
	OCR1A=a;
	ICR1=400;
}

int main(void)
{
	DDRD=0x30;
	timer1(250);
	return 0;
}