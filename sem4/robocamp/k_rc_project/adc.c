#include<avr/io.h>
#include<util/delay.h>
#include "lcd.h"

int main(void)
{
	int ADC_value,ADC_value2,ADC_value3;
	ADCSRA=(1<<ADEN)|(1<<ADPS2)|(1<<ADPS1);
	ADMUX=(1<<REFS0);
	while(1)
	{
		ADMUX=(1<<REFS0);
		ADCSRA|=(1<<ADSC);
		while((ADCSRA&(1<<ADSC))!=0);
		ADC_value=ADC;
		
		ADMUX=(1<<REFS0)|(1<<MUX0);
		ADCSRA|=(1<<ADSC);
		while((ADCSRA&(1<<ADSC))!=0);
		ADC_value2=ADC;
		ADMUX=(1<<REFS0)|(1<<MUX1);
		ADCSRA|=(1<<ADSC);
		while((ADCSRA&(1<<ADSC))!=0);
		ADC_value3=ADC;

		LCD_init();
		LCD_Print(ADC_value,1,1);
		LCD_Print(ADC_value2,1,2);
		LCD_Print(ADC_value3,7,1);
		_delay_ms(1500);	
	}
	return 0;
	
}
