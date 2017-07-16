#include<avr/io.h>
#include<avr/interrupt.h>
#include<util/delay.h>
#include<string.h>
#include "lcd.h"

int main(void)
{
	char ch[100]="DaddI is KiNg";
	char ch2[100]="Fingla ki jawani";
	int x=0;
	while(1)
	{
		DDRD=0x03;
		PORTD=0xFF;
		_delay_ms(10);
		PORTD=0x00;
		LCD_init();
		LCD_Send_String(ch);
		x=strlen(ch);
		LCD_init();
		LCD_Send_String(ch2);
	}
	return 0;
}	