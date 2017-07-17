#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>
#include<sys/stat.h>
#include<dirent.h>
#include<fcntl.h>
#include<signal.h>
#include<sys/wait.h>
#include<sys/ptrace.h>
#include<string.h>
int args,hist_count,process_count,process[1000],working[1000],original_pid,back_ground,inc;
char **hist_cmd;
char *home;
char store[1000][150],process_cmd[1000][50];
void history(char **arg);
void pid(char **arg);
void cd(char **arg);
void sigchild_handler(int sig);
void parse(char **arg,char *cmd);
void execute(char **arg);
void history(char **arg){
	int i;
	if ((strcmp(arg[0],"hist")==0)){
		process[process_count]=getpid();
		strcpy(process_cmd[process_count],arg[0]);
		process_count++;
		if (args==1){
			for (i=0;i<hist_count-1;i++) printf(" %d. %s\n",i+1,hist_cmd[i]);
		}else{
			fprintf(stderr,"hist requires no arguments\n");
		}
	}else if ((arg[0][0]=='h')){
		int num;
		process[process_count]=getpid();
		strcpy(process_cmd[process_count],arg[0]);
		process_count++;
		if (sscanf(arg[0],"hist%d",&num)==0){
			fprintf(stderr,"command not found\n");
			return;
		}
		if (num>hist_count-1){
			for (i=0;i<hist_count-1;i++) printf("%d. %s\n",i+1,hist_cmd[i]);
			return;
		}
		if (args==1){
			for (i=0;i<num;i++) printf(" %d. %s\n",i+1,hist_cmd[hist_count-num-1+i]);
		}else{
			fprintf(stderr,"hist requires no arguments\n");
		}
	}else if ((arg[0][0]=='!')){
		int num;
		process[process_count]=getpid();
		strcpy(process_cmd[process_count],arg[0]);
		process_count++;
		if (sscanf(arg[0],"!hist%d",&num)==0){
			fprintf(stderr,"command not found\n");
			return;
		}
		if (num>hist_count-1){
			fprintf(stderr,"history has only %d commands\n",hist_count-1);
			return;
		}
		if (args==1){
			char *arg[20];
			parse(arg,store[num-1]);
			execute(arg);
		}else{
			fprintf(stderr,"hist requires no arguments\n");
			return;
		}
	}else{
		pid_t pid=fork();
		if (pid<0){
			fprintf(stderr,"some error occurred\n");
		}else if (pid==0){
			int re=execvp(arg[0],arg);
			if (re<0){
				fprintf(stderr,"command not found\n");
			}
		}else{
			process[process_count]=pid;
			strcpy(process_cmd[process_count],arg[0]);
			process_count++;
			waitpid(pid,&i,0);
			sleep(0.5);
		}
	}
}
void pid(char **arg){
	int i;
	process[process_count]=getpid();
	strcpy(process_cmd[process_count],arg[0]);
	process_count++;
	if (args==1){
		printf("command name: ./a.out process id: %d\n",getpid());
		return;
	}else if (args==2 && strcmp(arg[1],"current")==0){
		printf("List of currently executing processes spawned from this shell:\n");
		for (i=0;i<process_count-1;i++){
			if (working[i]==1) printf("command name: %s process id: %d\n",process_cmd[i],process[i]);
		}
		return;
	}else if (args==2 && strcmp(arg[1],"all")==0){
		printf("List of all processes spawned from this shell:\n");
		for (i=0;i<process_count-1;i++){
			printf("command name: %s process id: %d\n",process_cmd[i],process[i]);
		}
		return;
	}else{
		fprintf(stderr,"pid takes exactly 1 or no argument or the argument is invalid\n");
		return;
	}
}
void cd(char **arg){
	process[process_count]=getpid();
	strcpy(process_cmd[process_count],arg[0]);
	process_count++;
	if (args==1){
		chdir(home);
	}else if (args==2){
		int ret=chdir(arg[1]);
		if (ret!=0) printf("No such file or directory %s\n",arg[1]);
	}else{
		printf("cd takes 2 arguments, %d arguments given\n",args-1);
	}
}
void sigchild_handler(int sig){
	pid_t pid;
	int status;
	pid=waitpid(WAIT_ANY,&status,WNOHANG);
	if (pid!=-1){
		int i;
		for (i=0;i<process_count;i++){
			if (process[i]==pid){
				working[i]=0;
				printf("\n%s %d exited normally\n",process_cmd[i],process[i]);
			}
		}
	}
}
void parse(char **arg,char *cmd){
	int i=0,j,k;
	char *pch;
	pch=strtok(cmd," \t");
	char prev[100]="",*temp,*loc;
	while (pch!=NULL){
		strcat(prev,pch);
		j=strlen(prev);
		int p=1;
		loc=strchr(prev,'\\');
		k=0;
		while (loc!=NULL){
			j=strlen(prev);
			if (loc-prev+1==j){
				prev[j-1]=' ';
				prev[j]='\0';
				p=0;
				break;
			}else{
				temp=loc+1;
				k=prev-loc+1;
				prev[loc-prev]='\0';
				strcat(prev,temp);
			}
			loc=strchr(prev+k,'\\');
		}
		if (p==1){
			if (strlen(prev)>0){
				arg[i]=(char*)malloc((strlen(prev)+1)*sizeof(char));
				if (prev[strlen(prev)-1]=='&' && strlen(prev)>1){
					prev[strlen(prev)-1]='\0';
					back_ground=1;
				}
				if (strcmp(prev,"~")==0){
					strcpy(prev,home);
					arg[i]=(char*)realloc(arg[i],(strlen(home)+1)*sizeof(char));
				}
				strcpy(arg[i],prev);
				i++;
				prev[0]='\0';
			}
		}
		pch=strtok(NULL," \t");
	}
	if (strlen(prev)!=0){
		if (prev[strlen(prev)-1]=='&' && strlen(prev)>1){
			prev[strlen(prev)-1]='\0';
			back_ground=1;
		}
		arg[i]=(char*)malloc((strlen(prev)+1)*sizeof(char));
		if (strcmp(prev,"~")==0){
			strcpy(prev,home);
			arg[i]=(char*)realloc(arg[i],strlen(home)*sizeof(char));
		}
		strcpy(arg[i],prev);
		strcpy(prev,"");
		i++;
	}
	arg[i]=NULL;
	if (strcmp(arg[i-1],"&")==0) back_ground=1,arg[i-1]=NULL,i--;
	args=i;
}
void execute(char **arg){
	int status;
	if (strstr(arg[0],"hist")!=NULL){
		history(arg);
		return;
	}
	if (strcmp(arg[0],"pid")==0){
		pid(arg);
		return;
	}
	if (strcmp(arg[0],"cd")==0){
		cd(arg);
		return;
	}
	pid_t pid1=fork();
	if (pid1<0){
		fprintf(stderr,"some error occurred\n");
	}
	else if (pid1==0){
		int re=execvp(arg[0],arg);
		if (re<0){
			fprintf(stderr,"command not found\n");
			_exit(1);
		}
	}else{
		if (back_ground!=1){
			process[process_count]=pid1;
			strcpy(process_cmd[process_count],arg[0]);
			process_count++;
			waitpid(pid1,&status,0);
			sleep(0.5);
		}else{
			process[process_count]=pid1;
			strcpy(process_cmd[process_count],arg[0]);
			working[process_count]=1;
			process_count++;
			printf("command %s pid:%d\n",arg[0],pid1);
			sleep(0);
		}
	}
}
int main(){
	char cmd[1000],*pch;
	char *user=getenv("USER");
	char *pwd;
	home=getenv("PWD");
	char host[1000];
	gethostname(host,1000);
	memset(working,0,sizeof(working));
	original_pid=getpid();
	signal(SIGINT,SIG_IGN);
	signal(SIGQUIT,SIG_IGN);
	signal(SIGABRT,SIG_IGN);
	signal(SIGTSTP,SIG_IGN);
	signal(SIGCHLD,sigchild_handler);
	inc=0;
	while (1){
		pwd=getcwd(NULL,1000);
		pch=strstr(pwd,home);
		if (pch!=NULL){
			pwd[strlen(home)-1]='~';
			pwd=pwd+strlen(home)-1;
		}
		printf("<%s@%s:%s>",user,host,pwd);
		cmd[0]='\0';
		scanf("%[^\n]",cmd);
		getchar();
		if (strlen(cmd)==0) continue;
		strcpy(store[inc],cmd);
		inc++;
		args=0;
		char *arg[20];
		back_ground=0;
		parse(arg,cmd);
		hist_cmd=(char**)realloc(hist_cmd,(hist_count+1)*sizeof(char*));
		hist_cmd[hist_count]=(char*)malloc(strlen(arg[0])*sizeof(char));
		strcpy(hist_cmd[hist_count],arg[0]);
		hist_count++;
		if (args==1 && strcmp(arg[0],"quit")==0) break;
		execute(arg);
	}
	return 0;
}
