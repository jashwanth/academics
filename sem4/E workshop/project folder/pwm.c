#include<avr/io.h>
#include "lcd.h"
#include <util/delay.h>
#include<avr/interrupt.h>
#include<math.h>
void timer_init(void);
void timer_init()
{
  // com1a =11;
  ICR1 = 1000;
  OCR1A = 500;
//  1010 phase pwm mode
  TCCR1A = 0x11000010;
  TCCR1B = 0x00010011; // colck prescaler 64 
} 
int main()
{
   DDRD = 0xff;
   timer_init();
   int req_pos = 500;
   while(1)
   {
     LCD_init();
	 LCD_print(OCR1A,1,1);
   }
}
   
