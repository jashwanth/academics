#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <sys/types.h>
#include <stdio.h>

int main(){
	pid_t pid1, pid2;
	pid1 = fork();
	pid2 = fork();
	if(pid1 > pid2){
		printf("%d %d\n", pid1, pid2);
		printf("Paradox Successful\n");
	}
	exit(0);
}
