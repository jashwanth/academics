#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<limits.h>
int rand_num()
{
  return rand()%INT_MAX;
}
float rand_cgpa()
{
  return ((float)(rand_num()/(float)RAND_MAX));
}
void gen_ran_str(char *dest,int len)
{
  int i=0;
  char charset[] = { "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" };
  int size = sizeof(charset)-1;
  while(len--)
  {
//    int index = (r <= prime / 2) ? residue : prime - residue;
     int index = rand_num()%size;
    dest[i] = charset[index];
    i++;
  }
  dest[i]='\0';
}
int main()
{
  char str[21];
  int i,j;
  time_t t;
  srand((unsigned)time(&t));
  for(i=0;i<100;i++)
  {
    int str_len = rand()%20;
    if(str_len==0)str_len++;
     gen_ran_str(str,str_len);
     printf("%s %d %f\n",str,rand_num(),10.0*rand_cgpa());
//   for(j=0;j<len;j++)
//     str[j]='\0';
  }  
  return 0;
}
