#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>
int main(void){
	unsigned int x;
	unsigned char u,l;
	LCD_init();
	x=0b0000001100000101;
	while(1){
		u=(unsigned char)(x>>5);
		LCD_Send(0x01,0);
		LCD_Print(u,1,1);
		_delay_ms(400);
	}
}
	