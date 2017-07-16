#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>


int main(void){
	DDRD=0x07;
	unsigned int x;
	unsigned char sip;
	while(1){
		sip=0;
		for(x=7;x>0;x--){
			PORTD=x;
			DDRD=0x07;
			if(PIND&0x08){
				sip+=1;
			}
			sip=sip<<1;
		}
		PORTD=x;
		DDRD=0x07;
		if(PIND&0x08){
			sip+=1;
		}
		LCD_init();
		LCD_Bit(sip);
		_delay_ms(500);
	}
}
	