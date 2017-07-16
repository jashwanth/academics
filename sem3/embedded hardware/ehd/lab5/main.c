#include<avr/io.h>
#include "lcd.c"
#include <avr/delay.h>

void timer_int(void);
void adjust_pwm(int value);

int main(void){
	int value;
	DDRD=0x20;
	DDRA=0x00;
	
	LCD_init();
	timer_int();
	
	ADMUX=0xC0;
	ADCSRA=0xC7;
	
	int i;
	
	
	while(1){
		ADCSRA |= 0x40;
		value=ADC;
		LCD_init();
		LCD_Print(value,0,0);
		//adjust_pwm(value);
		_delay_ms(100);
	}
}

void adjust_pwm(int value){
	if(value>0){
		OCR1A=OCR1A-10;
	}
	else if(value<0){
		OCR1A=OCR1A+10;
	}
}

void timer_int(){
	TCCR1A=0x82;
	TCCR1B=0x12;
	ICR1=255;
	OCR1A=127;
}
	