#include"lcd.h"
#include<avr/io.h>
#include<util/delay.h>
void ADC_SINGLE_CONVERSION(void)
{
	DDRA=0x00;
	PORTA=0x00;
	ADCSRA|=0xC7; 
	ADMUX =0X00;
	while(ADCSRA & 0x40)
	{
	}
	
}
void PWM_STOP(void)
{
	
	TCCR1B &=~(1<<CS12);
	TCCR1B &=~(1<<CS11);
	TCCR1B &=~(1<<CS10);
	
}
void PWM(void)
{
	TCCR1A |=(1<< WGM11);
	TCCR1A &=~(1<<WGM10);
	TCCR1B |=(1<<WGM13);
	TCCR1B &=~(1<<WGM12);
	TCCR1A |=(1<<COM1A1);
	TCCR1A &=~(1<<COM1A0);
	TCCR1B &=~(1<<CS12);
	TCCR1B |=(1<<CS11);
	TCCR1B &=~(1<<CS10);
	/*TCCR1A |=0x02;
	TCCR1B |=0x10;
	TCCR1A |=0x80;
	TCCR1B  |=0x02;*/
	ICR1 = 0x00FF;
	OCR1A=0x0F;
}
void PWM1(void)
{
	TCCR2=0b01100010;
	OCR2=0x0F;
}
void PWM1_STOP(void)
{
	TCCR2=0b01100010;
}
main()
{
	//DDRD = 0b01111000;
	PORTD=0x00;
	DDRD=0b10111000;
	//
	LCD_INIT();
	int i,j,k,l;
	while(1)
	{
	//LCD_PRINT(i,6,1);
	if(PIND&0x01){
	i=1;
	//LCD_PRINT(i,1,1);
	}
	else{
	i=0;
	//LCD_Print(i,1,1);
	}
	
	LCD_PRINT(i,6,1);
	if(PIND&0x02){
	j=1;
	//LCD_Print(j,1,1);
	}
	else{
	j=0;
	//LCD_Print(j,1,1);
	}
	LCD_PRINT(j,8,1);
	
	if(PIND&0x04){
	k=1;
	//LCD_Print(k,1,1);
	}
	else{
	k=0;
	//LCD_Print(k,1,1);
	}
	LCD_PRINT(k,10,1);
	
	/*LCD_SEND_STRING("QAZ");
	i=(~(PIND&0x01));
	LCD_PRINT(i,6,1);
	j= (~ (PIND & 0b00000100));
	LCD_PRINT(j,10,1); 
	k=~(PIND & 0b00000010);
	LCD_PRINT(k,6,2);
	l=i&j&k;
	LCD_PRINT(l,10,2);
	//LCD_PRINT(i,6,1);*/
	if(i==0 && j==0 && k==0)
		{
		//forward
		PWM();
		PWM1();
		PORTD &= 0b11100111;
		LCD_GOTOXY(1,2);
		LCD_SEND_STRING("FORWARD");
		//	PORTD |= 0b00101000;
		//	PORTD &= 0b10101111;
		}
		else if((i==0 && j==0 && k==0) || (i==1 && j==1 && k==1) ||(i==0 && j==1 && k==1)||(i==0 && j==1 && k==0))
		{
		//left
		PWM_STOP();
		PWM1();
		PORTD |=0b00001000;
		PORTD &=0b11101111;
		
		LCD_GOTOXY(1,2);
		LCD_SEND_STRING("left");
		//PORTD |=0b00110000;
		//	PORTD &=0b10110111;
		}
		else if ((i==1 && j==0 && k==0) || (i==1 && j==0 && k==1) ||(i==1 && j==1 && k==0))
		{
		//right
		PWM();
		PWM1_STOP();
		PORTD |=0b00010000;
		PORTD &=0b11101111;
		LCD_GOTOXY(1,2);
		LCD_SEND_STRING("RIGHT");
	
		//	PORTD |=0b01001000;
			//PORTD &=0b11001111;
			
		}
		else
		{
		//backward
		//PORTD |=0b01010000;
		//PORTD &=0b11010111;
		//	_delay_ms(1000)
		//left
		//PWM_STOP();
		//PWM1();
		//PORTD |=0b00001000;
		//PORTD &=0b11101111;
			PORTD |=0b00110000;
			PORTD &=0b10110111;
		}
	
	}
}