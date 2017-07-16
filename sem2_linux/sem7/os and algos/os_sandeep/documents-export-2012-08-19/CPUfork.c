// Author -- Tas, ICS231
// Interaction between child process and parent process, and how CPU sees process 
#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>
int main(void)
{
	pid_t pid[3];
	int i;
	for (i=0;i<3;++i)
	{
		if((pid[i]=fork())<0)
		{
			fprintf(stderr,"Error in creating Fork %d\n",errno);
			exit(-1);
		}
		else if (pid[i] == 0)
		{
			printf("Child: %d | ",i);
			printf("pid-- %ld | ",(long)getpid());
			int k;
			for(k=0;k<3;++k)
			{	printf("%d ",i*3+k);
			}
			sleep(1);
			printf("\n");
			exit(0);
		}
	}

	int status; 
	pid_t pidu; 
	while(i)
	{
		pidu=wait(&status);
		printf("My child %ld,has started his first counting, Oh! yea I'm proud father :D \n",(long)pidu);
		i--;
	}

	return 0;
}

