#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
#define PORT PORTC
#define DDR DDRC
void SET_RS(void)
{
	PORT |=0x80;
}
void CLEAR_RS(void)
{
	PORT &=0x7F;
}
void SET_RW(void)
{
	PORT |=0x40;
}
void CLEAR_RW(void)
{
	PORT &=0xBF;
}
void ENABLE(void)
{
	PORT |=0x20;
	_delay_ms(5);
	PORT &=0xDF;
}

void LCD_SEND(char c,int DC)
{
	char upper,lower;
	
	upper= c >> 4;
	upper= upper & 0x0F;
	lower= c & 0x0F;
	if(DC==0)
	{	
		PORT = upper;
		CLEAR_RS();
		CLEAR_RW();
		ENABLE();
		PORT = lower;
		CLEAR_RS();
		CLEAR_RW();
		ENABLE();
	}
	else if(DC==1)
	{
		PORT = upper;
		SET_RS();
		CLEAR_RW();
		ENABLE();
		PORT = lower;
		SET_RS();
		CLEAR_RW();
		ENABLE();
	}
}
void LCD_INIT(void)
{
	DDRC= 0xFF;
	CLEAR_RS();
	CLEAR_RW();
	LCD_SEND(0x01,0);
	LCD_SEND(0x0F,0);
	LCD_SEND(0x28,0);
}
void LCD_SEND_STRING(char *s)
{
		
	while(*s!='\0')
	{
		LCD_SEND(*s,1);
		s++;
	}
}
void LCD_GOTOXY(unsigned int x,unsigned int y)
{
	x=x-1;
	y=y-1;
	if(y==0)
	{
		LCD_SEND(128+x,0);	
	}
	else
	{
		LCD_SEND(192+x,0);	
	}
	
}
void LCD_PRINT(int data,unsigned int x,unsigned int y)
{	char s[100];
	LCD_GOTOXY(x,y);
	LCD_SEND_STRING(itoa(data,s,10));
	
}
void PWM(void)
{
	TCCR1A |=(1<< WGM11);
	TCCR1A &=~(1<<WGM10);
	TCCR1B |=(1<<WGM13);
	TCCR1B &=~(1<<WGM12);
	TCCR1A |=(1<<COM1A1);
	TCCR1A &=~(1<<COM1A0);
	TCCR1B &=~(1<<CS12);
	TCCR1B |=(1<<CS11);
	TCCR1B &=~(1<<CS10);
	/*TCCR1A |=0x02;
	TCCR1B |=0x10;
	TCCR1A |=0x80;
	TCCR1B  |=0x02;*/
	ICR1 = 0x00FF;
	//OCR1A=0x00FF;
}
void ADC_INTIALISE(void)
{
	ADCSRA |=0x87;

}
int main(void)
{	
	DDRD =0xFF;
	PORTD =0x00;
	//int I=20;
	DDRA&=0xFC;
	PORTA&=0xFC;
	OCR1A=0;
	float kp=0.05;
	while(1)
	{
	PWM();
	ADC_INTIALISE();
	LCD_INIT();
	/*while(1)
	{
		OCR1A+=10;
		_delay_ms(10);
		if(OCR1A>200)
			OCR1A=0;
	}*/
	ADCSRA |=0x40;
	ADMUX =0x00;
	while(ADCSRA & 0x40)
	{
	}
	int x;
	x=ADC;
	LCD_PRINT(x,1,1);
	ADMUX =0x01;	
	while(ADCSRA & 0x40)
	{
	}
	int y;
	y=ADC;
	LCD_PRINT(y,1,2);
	int z;
	z=x-y;
	LCD_PRINT(z,5,2);
	if(z>10)
	{
		OCR1A-=(kp*z);
		if(OCR1A<25)
		{
			OCR1A=25;
		}
	}
	else if(z<-10)
	{
		OCR1A-=(kp*z);
		if(OCR1A>230)
		{
			OCR1A=230;
		}
	}
	}	
	
}
	
	
	
