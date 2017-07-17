#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<string.h>
int main(){
	char** cmd;
	char str[10][100];
	int i=0,j;
	while (scanf("%s",str[i])!=EOF){
		i++;
	}
	cmd=(char**)malloc((i+1)*sizeof(char*));
	for (j=0;j<i;j++){
		cmd[j]=(char*)malloc(strlen(str[j])*sizeof(char));
		strcpy(cmd[j],str[j]);
	}
	cmd[i]=NULL;
	for (j=0;j<i;j++) printf("%s\n",cmd[j]);
	int status;
	pid_t pid=fork();
	if (pid==0){
		execvp(*cmd,cmd);
		printf("command does not exist\n");
	}else{
		printf("parent process\n");
		wait(&status);
	}
	return 0;
}
