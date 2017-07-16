#include<avr/io.h>
#include<avr/delay.h>
#include<string.h>
#include<stdlib.h>
void set_RS(void);
void clear_RS(void);
void set_RW(void);
void clear_RW(void);
void toggle_enable(void);
void LCD_send(char ,unsigned char );
void LCD_send_string(char *);
void LCD_init(void);
void print(int ,unsigned int ,unsigned int );
void LCD_GOTO(unsigned int ,unsigned int );
/* RS R/W E * DB4 DB5 DB6 DB7 = PC7 PC6 PC5 PC4 PC3 PC2 PC1 PC0;
   0x80 - 0x8F 1st line
   0xC0 - 0xCF 2nd line
*/
void set_RS(void)
{
  PORTC|=0x80;
}
void set_RW(void)
{
  PORTC|=0x40;
}
void clear_RS(void)
{
  PORTC&=0x7F;
}
void clear_RW(void)
{
  PORTC&=0xCF;
} 
  
void toggle_enable(void)
{
  PORTC|=0x20;
  _delay_ms(2);
  PORTC&=0xDF;
}  
void LCD_send(char c,unsigned char DC)
{
  // dc is data(i.e,character if dc=1)|command
  char up_nib,low_nib;
  low_nib = c&0x0F;
  up_nib  = c>>4;
  if(DC==0)
  { 
    PORTC = up_nib;
	clear_RS();
	clear_RW();
	toggle_enable();
	PORTC = low_nib;
	clear_RS();
	clear_RW();
	toggle_enable();
  }
  else if(DC==1)
  {
    PORTC = up_nib;
	set_RS();
	clear_RW();
	toggle_enable();
	PORTC = low_nib;
	clear_RS();
	clear_RW();
	toggle_enable();
  }
}
void LCD_send_string(char *s)
{
  unsigned int i=strlen(s),j=0;
  for(j=0;j<i;j++)
  {
    LCD_send(s[j],1);
  }
}
void LCD_GOTOXY(unsigned int x,unsigned int y)
{
  if(y==1)
  {
    LCD_send(128+x-1,0);
  }
  else if(y==2)
  {
    LCD_send(192+x-1,0);
  }
}
void LCD_init(void)
{
  _delay_ms(30);
  clear_RS();
  clear_RW();
  LCD_send(0x01,0);
  LCD_send(0x0F,0);
  LCD_send(0x28,0);
}
void LCD_print(int data,unsigned int x,unsigned int y)
{
  char str[50];
  LCD_GOTOXY(x,y);
  LCD_send_string(itoa(data,str,10));
}
int main(void)
{
   DDRC = 0xFF;
   LCD_init();
   int count=0;
   while(1)
   {
     LCD_print(count,1,1);
	 count+=2;
	 _delay_ms(1000);
   }
   return 0;
}