#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>

void timer_int(void);
void adjust_pwm(int value);

int main(void){
	int value0;
	int value1;
	DDRD=0x20;
	DDRA=0x00;
	
	LCD_init();
	timer_int();
	
	ADCSRA=0xC6;
	
	while(1){
		
		ADMUX=0xC0;
		_delay_ms(1);
		ADCSRA |= 0x40;
		_delay_ms(1);
		value0=ADC;
		
		_delay_ms(1);
		
		ADMUX=0xC1;
		_delay_ms(1);
		ADCSRA |= 0x40;
		_delay_ms(1);
		value1=ADC;
		
		
		LCD_init();
		LCD_Print(value0,0,0);
		_delay_ms(250);
		LCD_Print(value1,0,2);
		_delay_ms(250);
		//adjust_pwm(value0-value1);
		_delay_ms(250);
	}
}

void adjust_pwm(int value){
	char error[6]="ERROR";
	
	int x;
	x=value/4;
	x=OCR1A+x;
	
	if(x>250){
		OCR1A=250;
		LCD_init();
		LCD_Send_String(error);
		_delay_ms(500);
	}
	
	else if(x<5){
		OCR1A=5;
		LCD_init();
		LCD_Send_String(error);
		_delay_ms(500);
	}
	else{
		OCR1A=x;
	}
}

void timer_int(){
	TCCR1A=0x82;
	TCCR1B=0x12;
	ICR1=255;
	OCR1A=127;
}
	