#include<stdio.h>
#include<stdlib.h>
#include<time.h>
int main()
{
	time_t tic;
	tic=time(NULL);
	struct tm* toc=localtime(&tic);
	printf("%s%ju secs since the Epoch\n", asctime(toc), (long)tic); 

}
