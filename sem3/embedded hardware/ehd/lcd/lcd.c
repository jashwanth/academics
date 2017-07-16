#include<avr/io.h>
#include<util/delay.h>
#include<string.h>
#include<stdlib.h>
void toggle(void)
{
	PORTC|=0x20;
	_delay_ms(10);
	PORTC&=0xDF;
}

void set_rs(void)
{
	PORTC|=0x80;
}

void clear_rs(void)
{
	PORTC&=0x7F;
}

void clear_rw(void)
{
	PORTC&=0xBF;
}

void set_rw(void)
{
	PORTC|=0x40;
}



void LCD_Send(char c,int DC)
{
	char unib, lnib;
	unib=c&0xF0;
	unib=unib>>4;
	lnib=c&0x0F;
	if(DC==0){
		PORTC=(PORTC & 0xF0)|unib;
		clear_rs();
		clear_rw();
		toggle();
		PORTC=(PORTC & 0xF0)|lnib;
		clear_rs();
		clear_rw();
		toggle();
	}
	else if(DC==1)
	{
		PORTC=(PORTC & 0xF0)|unib;
		set_rs();
		clear_rw();
		toggle();
		PORTC=(PORTC & 0xF0)|lnib;
		set_rs();
		clear_rw();
		toggle();
	}
}

void LCD_init(void)
{
	DDRC=0xFF;
	clear_rs();
	clear_rw();
	LCD_Send(0x01,0);
	LCD_Send(0x0F,0);
	LCD_Send(0x28,0);
}

void LCD_Send_String(char *s)
{	
	int a,i;
	a=strlen(s);
	for(i=0;i<a;i++)
	{
		LCD_Send(s[i],1);
	}
}

void LCD_GotoXY(unsigned int x,unsigned int y)
{
	if(y==1)
	{
		LCD_Send(127+x,0);
	}
	else if(y==2)
	{
		LCD_Send(191+x,0);
	}
}

void LCD_Print(int data,unsigned int x,unsigned y)
{
	LCD_GotoXY(x,y);
	char t[100];
	LCD_Send_String(itoa(data,t,10));
}	


int main(void)
{
   DDRC = 0xFF;
   LCD_init();
   unsigned int count=0;
   while(1)
   {
     LCD_Print(count,1,1);
	 count+=2;
	 _delay_ms(1000);
   }
   return 0;
}