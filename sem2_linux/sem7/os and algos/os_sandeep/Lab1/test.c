#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>

int main(void)
{
	pid_t pid;
	int status;
	pid=fork(); // created child process 
	if(pid>0)
	{
		// parent process 
//		wait(&status);
		_exit(1);
	}
	int i =0;
	while(i<100)
	{       printf("%ld %ld %d %d\n",(long)getpid(),(long)getppid(),i,status);
		i++;
	}
	printf("hello\n");
	exit(1);
	return 0;
}
