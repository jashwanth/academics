#include<avr/io.h>
#include<avr/delay.h>
#include<string.h>
#include<math.h>
#define PORTC PORT

void reset_RW(void)
{
	PORT&=0xEF;
	_delay_ms(1);
}
void reset_RS(void)
{
	PORT&=0xDF;
	_delay_ms(1);
}
void set_RW(void)
{
	PORT|=0x10;
	_delay_ms(1);
}	
void set_RS(void)
{
	PORT|=0x20;
	_delay_ms(1);
}	
void LCD_send_string(char *s)
{
	int i,n=strlen(s);
	char c;
	//char DC;
	if(PORT&=0x20)
	{
		for(i=2;i<n;i++)
		{
			LCD_send(s[i],1);
			_delay_ms(2);
		}	
	}
		else
		{
			for(i=2;i<n;i++)
			{
				LCD_send(s[i],0);
				_delay_ms(2);
			}	
		}	
}
void LCD_send(char c,char DC)
{
	char upnibble,lownibble;
	upnibble=c&0xF0;
	lownibble=c&0x0F;
	if(DC==0)
	{
		PORT|=upnibble;
		reset_RS();
		reset_RW();
		//toggle
		_delay_ms(1);
		PORT|=lownibble;
		reset_RS();
		reset_RW();
		//toggle
		_delay_ms(1);
	}
	else
	{
		PORT|=upnibble;
		set_RS();
		reset_RW();
		//toggle
		_delay_ms(1);
		PORT|=lownibble;
		set_RS();
		reset_RW();
		//toggle
		_delay_ms(1);
	}
}
void LCD_init(void)
{
	reset_RS();
	reset_RW();
	LCD_send_string(0x01);
	LCD_send_string(0x0F);
	LCD_send_string(0x28);
	_delay_ms(1);
}
int main(void)
{
	while(1)
	{
		LCD_init();
		_delay_ms(100);
		LCD_send_string(0x28);
	}	
}