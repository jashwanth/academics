#include<stdio.h>
#include<unistd.h>
int main(){
	int ret=chdir("..");
	if (ret==0) printf("fine\n");
	else printf("NO\n");
	char *cmd[]={"pwd",NULL};
	execvp(*cmd,cmd);
	return 0;
}
