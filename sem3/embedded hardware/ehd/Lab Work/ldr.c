#include<avr/io.h>
#include<util/delay.h>
#include<stdlib.h>
#include "lcd.h"

void bright(void);
int adc(int a);

int main(void)
{
	DDRA=0x00;
	DDRD=0x20;
	//DDRC=0xFF;
	//PORTC=0x00;
	PORTA=0x00;
	PORTD=0x00;
	bright();
	int x=0,z=0,y=0,a,b;
	LCD_init();
//	LCD_Print(5,1,1);
	//_delay_ms(100);
	while(1)
	{
		//LCD_Print(5,1,1);
		if(abs(x-y)>0){
			b=abs(x-y)/20;
			OCR1A+=b;
			if(OCR1A>240)
				OCR1A=245;
		}
		//else if({
			//b=abs(x-y)/20;
			//OCR1A-=b;
			//if(OCR1A<0)
				//OCR1A=30;
		//}
		x=adc(0);
		LCD_Print(x,1,1);
		y=adc(1);
		LCD_Print(y,6,1);
		a=abs((x-y));
		LCD_Print(a,10,1);
		LCD_Print(OCR1A,1,2);
		_delay_ms(1000);
		z=x-y;
		
	}
}

void bright(void)
{
	TCCR1A|=0x82;
	//TCCR1A&=0xBE;
	TCCR1B|=0x12;
//	TCCR1B&=0xF2;
	ICR1=255;
	OCR1A=127;
}

int adc(int a)
{
int x,y;
	if(a==0){
	ADMUX=0x00;
	ADCSRA=0xC7;
	_delay_ms(10);
//	ADCH&=0x03;
	x=ADC;
	return x;
	}
	//x=x<<8;
//	x=x+ADCL;
	else if(a==1){
	ADMUX=0x01;
	ADCSRA=0xC7;
	_delay_ms(10);
	y=ADC;
	return y;
	}
//	y=y<<8;
//	y=y+ADCL;
return 0;
}
	