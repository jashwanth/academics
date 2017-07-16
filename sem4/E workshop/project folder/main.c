#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int b[10],i,des_pos;
char str[10];
void conv_func(int x)
{
  for(i=9;i>=0;i--)
  {
    b[i] = x%2;
	if(b[i]==0)
	{
	  str[i] = '0';
	}
	else if(b[i]==1)
	{
	  str[i] = '1';
	}
	x = x/2;
  }
}
//void timer_init(void);
//void adjust_pwm(int );
//unsigned int req_pos=700,cur_pos=0,pre_pos=0;
int main(void)
{
    DDRA=0x0F;
	ADMUX=0xC0;
	ADCSRA=0x86;
	DDRD=0xff;
	PORTD =  0x00;
//	char str[20];
	for(i=0;i<10;i++)
	{
	  b[i] = 0;
	  str[i] = '\0';
	}
 // timer_init();
  while(1)
  {
    ADCSRA |= 0x40;
	_delay_ms(5);
//	pre_pos = cur_pos;
//	cur_pos = ADC;
	LCD_init();
	_delay_ms(20);
	int x=ADC;
	conv_func(x);
//	LCD_Send_String(str);
//	LCD_Print(x,1,2);
//	_delay_ms(1000);
//	adjust_pwm((int)(req_pos-cur_pos));
  	 _delay_ms(100);
  }
}  
/* void timer_init()
{
//  TCCR1A=0x82;
//  TCCR1B=0x13;
  ICR1=1024;
  OCR1A=512;
  
}
void adjust_pwm(int x)
{
    if(x<20)
	 OCR1A = 20;
	else if(x>1020)
	 OCR1A = 1020;
	if(x>0)
	{
	  OCR1A += 3;
	}
	else if(x<0)
	{
	  OCR1A -= 3;
	}
}*/