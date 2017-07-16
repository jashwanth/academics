#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>
int main(void)
{
	pid_t pid;
	pid=fork();
	if(pid==-1)
	{
		fprintf(stderr,"Error in creating Fork %d\n",errno);
		exit(-1);
	}
	if (pid==0)
	{
		int j;
		for (j = 0; j < 10; j++)
		{
			printf("child: %d\n", j);
			sleep(1);
		}
		_exit(0);  /* Note that we do not use exit() */
	}
	else
	{ 

		int i;
		for (i = 0; i < 100; i++)
		{
			printf("parent: %d\n", i);
			sleep(20);
		}
		exit(0);
	}
	return 0;
}

