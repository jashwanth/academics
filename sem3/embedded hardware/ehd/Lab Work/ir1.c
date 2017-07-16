#include<avr/io.h>
#include<util/delay.h>
#include<avr/interrupt.h>
#include "lcd.h"
#include<stdlib.h>

void ADC_init(void)
{
	ADMUX|=0x40;
	ADCSRA|=0xC3;
	
}

int main(void)
{
	ADC_init();