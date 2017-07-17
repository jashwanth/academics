#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <signal.h>
#include <wait.h>


void sig_handler(int signum){
	if(signum == 2 || signum == 20){
		printf("\nEnter \"quit\" to terminate the program\n");
	}
	signal(SIGINT, sig_handler);
	signal(SIGTSTP, sig_handler);
	return;
}

void child_handler(int signum){
	int pid;
	pid = waitpid(WAIT_ANY, NULL, WNOHANG);
	if(pid != -1){
		printf("child Dead\n");
	}
	signal(SIGCHLD, child_handler);
	return;
}

int main(){
	signal(SIGINT,  sig_handler);
	signal(SIGTSTP, sig_handler);
	signal(SIGCHLD, child_handler);

	char in[50];

	if(fork() == 0){
		printf("child printing\n");
	}
	else{

		while(1){
			scanf("%[^\n]", in);
			getchar();

			if(!strcmp(in, "quit")){
				exit(0);
			}
		}

	}

	return 0;
}
