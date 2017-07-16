



#include<avr/io.h>
#include<stdio.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>


int main(void)
{
  double arr[10] = {12.57, 8.99, 15.44, 9.66, 13.77, 10.22, 14.88, 9.22, 12.88, 8.33};
  double des_pos;
  int j ;
  DDRA = 0x00;
  ADCSRA=0xC6;
  ADMUX=0xC0;
  int s=2;
  while(1)
  {
  
    for(j = 0;j<=9;j++)
    {
  
       des_pos = arr[j];
  
  
  
  
  
  
  
  
  
 
    DDRB = 0xff;
	int i;
	if(des_pos>=8 && des_pos<8.5)
	{
	   PORTB = 28;
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);  
	} 
	if(des_pos>=8.5 && des_pos<9)
	{
	   PORTB = 29;
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);   
	} 
	if(des_pos>=9 && des_pos<10)
	{
	  PORTB = 30;
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000); 
	}
	if(des_pos>=10 && des_pos<11)
	{
	  PORTB = 0b00100000;
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000); 
	} 
	if(des_pos>=11 && des_pos<12)
	{
	  PORTB = 37;
      _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000); 
	}
	  
	if(des_pos>=12 && des_pos<13)
	{
	  PORTB = 41;
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	} 
	if(des_pos>=13 && des_pos<14)
	{
	  PORTB = 44;
      _delay_ms(1000);
	  _delay_ms(1000);
      _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);  
	  	} 
	if(des_pos>=14 && des_pos<15)
	{
	  PORTB = 46;
      _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000); 
	}
	if(des_pos >= 15 && des_pos < 16)
	{
	    PORTB = 50;
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);
	  _delay_ms(1000);   
								
	}
	    ADCSRA |= 1<<ADSC;
		while (ADCSRA & (1 << ADSC)){;}
		int y=ADC;
        LCD_init();
		if(s==3)
		{
		  if (y > des_pos)
		  {
		    if(PORTD < 255)
		    PORTD++;
		  }
		  if(y < des_pos)
		  {
		    if(PORTD > 0)
		    PORTD--;
		  }
		}
   //     LCD_Print(y,1,1);
	}
/*	for(i=25;i<=47;i++)
	{
	  PORTB = i;
	  _delay_ms(1000);
	  LCD_init();
	  int x=PINB;
	  LCD_Print(x,1,1);
	  _delay_ms(1000);
	} */  
/*	PORTB = 54;
	int x=PINB;
	LCD_init();
	LCD_Print(x,1,1);
	
   _delay_ms(1000); */
  
  }
}