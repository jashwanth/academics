#include<avr/io.h>
#include<avr/string.h>
#include<util/delay.h>
#include "lcd.h"
int main()
{
 //LCD_init();
 //_delay_ms(100);
 DDRD = 0xFF;
 PORTD = 0xAB;
 char str[8] ;
 str[8]='\0';
 int value,i,mul=1;
 while(1)
 {
    value = PIND ;
	mul = 1;
	for(i=7;i>=0;i--)
	{
	  if(value % 2 == 0)
	  {
	    str[i] = '0';
	  }
	  else if(value % 2 ==1)
	  {
	    str[i] = '1';
	  }
	  value = value/2;
	} 
	str[8] = '\0';
//	value = strlen(str);
	LCD_init();
//	LCD_Print(value,1,1);
   //LCD_init();
    /*  str[0] = value%1 + 48;
	  str[1] = value%2 + 48;
	  str[2] = value%4 + 48;
	  str[3] = value%8 + 48;
	  str[4] = value%16 + 48;
	  str[5] = value%32 + 48;
	  str[6] = value%64 + 48;
	  str[7] = value%128 + 48;*/
/*   for(i=0;i<256;i++)
   {
   //  int a = PIND & 0xFF; // 4 to 7 bits read
        PORTD = i;
	/*	mul = 1;
		 _delay_ms(10);
        LCD_Print(i,1,1);
		for(j=0;j<8;j++)
		{
		  str[j] = i/mul;
		  mul = mul * 2;
		} */
	//	PORTD = i;
    // itoa(i,str,8);
 //  LCD_Print(a,1,1);
 //  LCD_Send_String("rakesh,jashwanth");
 //    value = value%
     LCD_Send_String(str);
     _delay_ms(1000);
 }
 return 0;
}