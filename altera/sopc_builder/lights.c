#include<stdio.h>
#define Switches (volatile char *) 0x0001800
#define LEDs (char *) 0x0001810
void main()
{ while (1)
*LEDs = *Switches;
}
