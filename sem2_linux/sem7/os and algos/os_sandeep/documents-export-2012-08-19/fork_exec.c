#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>
int main(void)
{
        pid_t pid;
	int status;
	char* cmd[] = {"cd",NULL};

        pid=fork();
		
	if(pid == 0){

		execvp(*cmd, cmd);                        // Replaces the address space of this program with the specified program

	}
	else{

		printf("Parent is still working :)\n");
		wait(&status);

	}
        return 0;
}
