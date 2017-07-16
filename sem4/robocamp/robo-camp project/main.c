#include<util/delay.h>
#include<avr/io.h>
#include "lcd.h"
void PWM_init(void);
void pwm_init2(void);
void pwm_init2(void)
{
  // initial settings 
	
	//WGM1=1110 
	TCCR1A=(1<<COM1A1)|(1<<WGM11)|(1<<COM1B1); 
	// Clock =12M/1024
	TCCR1B=(1<<WGM13)|(1<<WGM12)|(1<<CS11)|(1<<CS10);	
	
	ICR1=0; //Top.. decides Time Period 
	OCR1A=0;
	OCR1B=0;//Compare.. decides ON Time.. Cannot be more than ICR1 value..
}
int main()
{
	DDRD =(1<<PD5)|(1<<PD4); // Pin 5 of PORTD / OC1A pin = output
//    DDRD = 0xff;
	DDRA |= 0x00;
	//PIND3=PORTD5;
	int i;
	while(1){
	PWM_init();
/*	while(1)
	{
	  PWM_init();
	 }*/
	   ADMUX=0x40;
	   ADCSRA|=0b11000110;
	   while(ADCSRA&0b01000000==0b01000000);
	//_delay_ms(500);
	   LCD_init();
	   int x;
	   x=ADC;
	   LCD_Print(x,1,1);
	   _delay_ms(1000);
	   if(x<10)
	   {
	      LCD_init();
	      LCD_Send_String("obstr detected");
		  pwm_init2();
		  _delay_ms(1000);
		  _delay_ms(1000);
		   _delay_ms(1000);
		  _delay_ms(1000);
	   /*
	   /*   for(i=0;i<10;i++)
		  {
		    _delay_ms(1000);
		  } */
		  PWM_init();
	   } 
	   else
	   {
	     PWM_init();
		 for(i=0;i<1000;i++);
	   }
			
		//PWM_init();//Take value from sensor and change Duty Cycle (OCR1A) accordingly.
	}
}

void PWM_init(void)
{
	// initial settings 
	
	//WGM1=1110 
	TCCR1A=(1<<COM1A1)|(1<<WGM11)|(1<<COM1B1); 
	// Clock =12M/1024
	TCCR1B=(1<<WGM13)|(1<<WGM12)|(1<<CS11)|(1<<CS10);	
	
	ICR1=256; //Top.. decides Time Period 
	OCR1A=128	;
	OCR1B=128;//Compare.. decides ON Time.. Cannot be more than ICR1 value..
}