#include<avr/io.h>

int main(void)
{
	DDRD=(1<<PD5); //OC1A pin (PORT Pin 5) is made as output.
	PWM_init();
	while(1)
	{
		//doing nothing
	}
}

void PWM_init(void)
{
	TCCR1A=(1<<COM1A1)|(1<<WGM11); //WGM=1110
	TCCR1B=(1<<WGM13)|(1<<WGM12)|(1<<CS12)|(1<<CS10); //clock Source (CS)=101
	ICR1=0x2EE0; //12000 in decimal
	OCR1A=0x1770; //6000 in decimal
}