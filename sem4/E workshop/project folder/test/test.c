#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>
int main(void)
{
  while(1)
  {
     	LCD_init();
		LCD_Send_String("hello world");
		_delay_ms(1000);
  }
}