#include<stdio.h>
int main()
{
  FILE* in;
  in= fopen("1.txt","r");
  while(1)
  {
    int a,b,c,d,e;
    fscanf(in,"%d %d %d %d %d",&a,&b,&c,&d,&e);
    printf("%d %d %d %d %d\n",a,b,c,d,e);
    if(feof(in))
    {
      printf("EOF character reached\n");
	break;
    } 
  }
  return 0;
}
