#include<avr/io.h>
#include "lcd.c"
int main(void)
{
// LCD_init();
 while(1)
 {
   LCD_Send_String("god");
 }
}