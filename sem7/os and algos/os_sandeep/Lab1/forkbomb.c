#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>
int main(void)
{
	pid_t pid;
	while(1)
		fork();
	return 0;
}

