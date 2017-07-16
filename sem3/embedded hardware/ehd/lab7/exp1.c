#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h> 
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#define PORT PORTC
#define DDR DDRC

void Toggle_Enable(void)            //data on data lines is taken in and processed at falling clock edge
{
	PORT |=0x20;
	_delay_ms(1);
	PORT &=0xDF;
}

void Set_RW(void)                   //read
{
	PORT |=0x40;
}

void Clear_RW(void)                 //write
{      
    PORT &=0xCF;
}

void Set_RS(void)                   //data
{      
    PORT |= 0x80;
}

void Clear_RS(void)                 //command
{      
    PORT &=0x7F;
}

void LCD_Send(char c,int DC)
{
	char l_nib,u_nib;
	u_nib=c >> 4;
	u_nib &= 0x0F;                  //upper nibble
	l_nib=c & 0x0F;                 //lower nibble
	if(DC == 1 )       // DATA MODE
	{
		PORT = u_nib;
		Set_RS();
		Clear_RW();
		Toggle_Enable();
		_delay_ms(1);
		
		PORT = l_nib;
		Set_RS();
		Clear_RW();
		Toggle_Enable();
		_delay_ms(1);
	}
	else               // COMMAND MODE
	{
		PORT = u_nib;
		Clear_RS();
		Clear_RW();
		Toggle_Enable();
		_delay_ms(1);
		
		PORT = l_nib;
		Clear_RS();
		Clear_RW();
		Toggle_Enable();
		_delay_ms(1);
	}
}
	
void LCD_Init(void)
{
	DDR=0xFF;
	Clear_RS();
	Clear_RW();

	LCD_Send(0x01,0);
	LCD_Send(0x0F,0);
	LCD_Send(0x28,0);
}

void LCD_Send_String(char *s)
{
	char c;
	int i,n=strlen(s);
	for(i=0;i<n;i++)
	{	
		c=s[i];
		LCD_Send(c,1);
		_delay_ms(100);
	}
}

void LCD_GotoXY(unsigned int X,unsigned int Y)
{
	X--;
	Y--;
	if(Y==0)
	{
		LCD_Send((X+128),0);
	}
	else
	{
		LCD_Send((X+192),0);
		
	}
}

void LCD_Print(int a,unsigned int X,unsigned int Y)
{
	LCD_GotoXY(X,Y);
	char c[100];
	

	LCD_Send_String(itoa(a,c,10));
	_delay_ms(300);
}

void ENABLE(void)
{	
	SREG |=0x80;			//enable global interrupt
	GICR = ( 1<< INT1);	// External INT1 is enabled
	MCUCR= ( 1<<ISC11);    //falling edge
}

int count=0,diff=0,set_count=0;

ISR(INT1_vect)
{
        cli();
	count++;
        sei();        
}

void pwm()
{
	TCCR1A|=0x02;
	TCCR1A&=0xFE;
	TCCR1B|=0x10;
	TCCR1B&=0xF7;
	TCCR1A|=0x80;
	TCCR1A&=0xBF;
	TCCR1B|=0x02;
	TCCR1B&=0xFA;
}

int main(void)
{
	LCD_Init();
	DDRD=(1<<PD0 | 1<<PD4);
	DDRD &= 0xF7;
	ICR1=1000;
	OCR1B=50;
	
	while(1)
	{
	 	pwm();
		set_count=15;
		TCCR2 |=0x07;
		TCCR2 &=0xB7;
		ENABLE();
		while(TCNT2<255)
		{;}
		TCNT2=0;
		cli();
		TCCR2 &=0xF8;
		TCCR1B=0x00;
		LCD_Print(count,1,1);
		_delay_ms(300);
		diff=count-set_count;
		if(diff>0)
		{
			OCR1B=OCR1B-(diff-3);
		}
		if(diff<0)
		{
			OCR1B=OCR1B+(diff-3);
		}
		LCD_Print(OCR1B,5,1);
		_delay_ms(300);
		LCD_Print(set_count,1,2);
		_delay_ms(300);
		set_count=0;
		count=0;
	}
}