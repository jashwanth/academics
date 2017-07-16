#include <stdio.h>
main(int argc, char *argv[])
{
  register unsigned int num1 asm("r4"), num2 asm("r5"), sum asm("r11"); 
  register int nflag asm("r6"), zflag asm("r7"), cflag asm("r8"), vflag asm("r9"); 
  unsigned int tnum1, tnum2;

  nflag = 0;
  zflag = 0;
  cflag = 0;
  vflag = 0;

  sscanf(argv[1], "%x", &tnum1 );
  sscanf(argv[2], "%x", &tnum2);
  num1 = tnum1 << 28;
  num2 = tnum2 << 28;

//  asm("mov r6, #0x80000000");
//  asm("mov r7, #0x80000000");

  asm("adds r11, r4, r5"); 
  asm("movmi r6, #1");
  asm("moveq r7, #1");
  asm("movcs r8, #1");
  asm("movvs r9, #1");

  printf("num1 = %d num2 = %d sum = %d\n", num1, num2, sum);
  printf("num1 = %u num2 = %u sum = %u\n", num1, num2, sum);
  printf("num1 = %#x num2 = %#x sum = %#x\n", num1, num2, sum);
  printf("N = %d  Z = %d C = %d V = %d\n", nflag, zflag, cflag, vflag);
  fflush(stdout);
   exit(0);
}
