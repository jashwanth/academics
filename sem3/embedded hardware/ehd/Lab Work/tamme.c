#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include<stdlib.h>
#include "lcd.h"

int main(void)
{
	LCD_init();
	LCD_Print(1,1,1);
}	