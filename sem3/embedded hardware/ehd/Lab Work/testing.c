#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"

int main(void)
{
	int x=54;
	while(1)
	{
		LCD_init();
		LCD_Send_String("Mama is Gr8");
		_delay_ms(10000);
	}	
	return 0;
}	