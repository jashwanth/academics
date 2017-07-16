#include<avr/io.h>
#include<util/delay.h>
#include<string.h>
#include<stdlib.h>


void toggle(void)
{
	PORTC|=0x20;
	_delay_ms(5);
	PORTC&=0xDF;
}

void LCD_Send(char c,int DC)
{
	char unib, lnib;
	unib=c>>4;
	lnib=c&0x0F;
	if(DC==0){
		PORTC=unib;
		toggle();
		PORTC=lnib;
		toggle();
	}
	else
	{
		PORTC=unib|0x80;
		toggle();
		PORTC=lnib|0x80;
		toggle();
	}
}

void LCD_init(void)
{
	DDRC=0xFF;
	PORTC=0x00;
	LCD_Send(0x01,0);
	LCD_Send(0x0C,0);
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
	else
	{
		LCD_Send(191+x,0);
	}
}

void LCD_Print(int data,unsigned int x,unsigned y)
{
	LCD_GotoXY(x,y);
	char t[100];
	if(data<0){
		LCD_Send('-',1);
		data*=-1;
	}
	LCD_Send_String(itoa(data,t,10));
}

void LCD_Bit(char ip){
    int x=1<<7;
    while(x!=0){
        if(x&ip){
            LCD_Send('1',1);
        }
        else{
            LCD_Send('0',1);
        }
        x=x>>1;
    }
}















