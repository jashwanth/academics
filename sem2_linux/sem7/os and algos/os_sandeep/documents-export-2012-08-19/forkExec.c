// Author -- Tas, ICS231
// about mischevious thing,some of you did on C assignment portal
#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>

int main(void)
{
	pid_t pid;
	pid=fork(); // created child process 
	if(pid>0) // parent process 
		exit(1);
	int i =0;
	while(i<100)
	{	printf("%ld %ld\n",(long)getpid(),(long)getppid());i++;}
	exit(1);
	return 0;
}

