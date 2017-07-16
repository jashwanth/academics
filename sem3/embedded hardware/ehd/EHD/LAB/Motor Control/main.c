#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>

void timer_int(void);
void adjust_pwm(int value);
void interrupt(void);
unsigned int count;
float frequency; 

int main(void){

	DDRD=0xF0;
	PORTD=0x00;
	GICR|=0x40;
	MCUCR|=0x02;
	timer_int();
	sei();
	unsigned int i=0;
	while(1){
		if(i==0){
			LCD_init();
			LCD_Print((int)frequency,1,1);
			LCD_Send_String(" Hz");
			//adjust_pwm(6-frequency);
			_delay_ms(100);
		}
		i++;
	}
}

void adjust_pwm(int value){
	char error[6]="ERROR";
	
	int x;
	x=value*5;
	x=OCR1A+x;
	
	if(x>512){
		OCR1A=510;
		LCD_init();
		LCD_Send_String(error);
	}
	
	else if(x<5){
		OCR1A=5;
		LCD_init();
		LCD_Send_String(error);
	}
	else{
		OCR1A=x;
	}
}

void timer_int(){
	TCCR0=0x05;
	TIMSK=0x01;
	TCCR1A=0x92;
	TCCR1B=0x12;
	ICR1=512;
	OCR1A=256;
}

ISR(INT0_vect){
	count++;
}

ISR(TIMER0_OVF_vect){
	frequency=(46.875*count)/1.024;
	//frequency=count;
	count=0;
	TCNT0=0;
}
