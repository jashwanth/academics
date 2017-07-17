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
int args,hist_count,process_count,process[1000],working[1000],original_pid,back_ground,inc,pipes,pipe_mark[20],indirec,outdirec;
int global;
int **array,in_yes,out_yes,prev_read,curr_write;
char **hist_cmd;
char *home;
char indirec_file[100],outdirec_file[100];
char store[1000][150],process_cmd[1000][50];
void history(char **arg,int start);
void pid(char **arg,int start);
void cd(char **arg,int start);
void sigchild_handler(int sig);
void parse(char **arg,char *cmd);
void execute(char **arg,int start);
void history(char **arg,int start){
	int i;
	int number=args,end;
	for (i=start;i<=args;i++){
		if (arg[i]==NULL){
			end=i;
			break;
		}
	}
	number=end-start;
	if ((strcmp(arg[start],"hist")==0)){
		process[process_count]=getpid();
		strcpy(process_cmd[process_count],arg[start]);
		process_count++;
		if (number==1){
			for (i=0;i<hist_count-1;i++) printf(" %d. %s\n",i+1,hist_cmd[i]);
		}else{
			fprintf(stderr,"hist requires no arguments\n");
		}
	}else if ((arg[start][0]=='h')){
		int num;
		process[process_count]=getpid();
		strcpy(process_cmd[process_count],arg[start]);
		process_count++;
		if (sscanf(arg[start],"hist%d",&num)==0){
			fprintf(stderr,"command not found\n");
			return;
		}
		if (num>hist_count-1){
			for (i=0;i<hist_count-1;i++) printf("%d. %s\n",i+1,hist_cmd[i]);
			return;
		}
		if (number==1){
			for (i=0;i<num;i++) printf(" %d. %s\n",i+1,hist_cmd[hist_count-num-1+i]);
		}else{
			fprintf(stderr,"hist requires no arguments\n");
		}
	}else if ((arg[start][0]=='!')){
		int num;
		process[process_count]=getpid();
		strcpy(process_cmd[process_count],arg[start]);
		process_count++;
		if (sscanf(arg[start],"!hist%d",&num)==0){
			fprintf(stderr,"command not found\n");
			return;
		}
		if (num>hist_count-1){
			fprintf(stderr,"history has only %d commands\n",hist_count-1);
			return;
		}
		if (number==1){
			char *arg[20];
			parse(arg,store[num-1]);
			execute(arg,start);
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
			strcpy(process_cmd[process_count],arg[start]);
			process_count++;
			waitpid(pid,&i,0);
			sleep(0.5);
		}
	}
}
void pid(char **arg,int start){
	int i;
	int number=args,end;
	for (i=start;i<=args;i++){
		if (arg[i]==NULL){
			end=i;
			break;
		}
	}
	number=end-start;
	process[process_count]=getpid();
	strcpy(process_cmd[process_count],arg[start]);
	process_count++;
	if (number==1){
		printf("command name: ./a.out process id: %d\n",getpid());
		return;
	}else if (number==2 && strcmp(arg[start+1],"current")==0){
		printf("List of currently executing processes spawned from this shell:\n");
		for (i=0;i<process_count-1;i++){
			if (working[i]==1) printf("command name: %s process id: %d\n",process_cmd[i],process[i]);
		}
		return;
	}else if (number==2 && strcmp(arg[start+1],"all")==0){
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
void cd(char **arg,int start){
	process[process_count]=getpid();
	strcpy(process_cmd[process_count],arg[start]);
	process_count++;
	int number=args,end,i;
	for (i=start;i<=args;i++){
		if (arg[i]==NULL){
			end=i;
			break;
		}
	}
	number=end-start;
//	printf("%d\n",number);
	if (number==1){
		chdir(home);
	}else if (number==2){
		int ret=chdir(arg[1]);
		if (ret!=0) printf("No such file or directory %s\n",arg[1]);
	}else{
		printf("cd takes 2 arguments, %d arguments given\n",number-1);
	}
//	exit(1);
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
	char dummy[50][100],*ind,*outd,*pip,*sta,try[200];
	for (j=0,k=0;j<i;j++){
		strcpy(try,arg[j]);
		sta=try;
		while (strlen(sta)>0){
			ind=outd=pip=NULL;
			ind=strchr(sta,'<');
			outd=strchr(sta,'>');
			pip=strchr(sta,'|');
			int a=100,b=100,c=100;
			if (ind!=NULL) a=ind-sta;
			if (outd!=NULL)	b=outd-sta;
			if (pip!=NULL) c=pip-sta;
			if (ind==NULL && outd==NULL && pip==NULL){
				strcpy(dummy[k],sta);
				k++;
				break;
			}
			if (a<b && a<c){
				dummy[k][0]='\0';
				strncpy(dummy[k],sta,a);
				dummy[k][a]='\0';
				if (strlen(dummy[k])>0) k++;
				indirec=k;
				sta=sta+a+1;
			}else if (b<c && b<a){
				dummy[k][0]='\0';
				strncpy(dummy[k],sta,b);
				dummy[k][b]='\0';
				if (strlen(dummy[k])>0) k++;
				outdirec=k;
				sta=sta+b+1;
			}else if (c<a && c<b){
				dummy[k][0]='\0';
				strncpy(dummy[k],sta,c);
				dummy[k][c]='\0';
				if (strlen(dummy[k])>0){
					k++;
				}
				pipe_mark[pipes]=k;
				pipes++;
				sta=sta+c+1;
			}
		}
	}
	int l=0,cur=0;
	for (j=0;j<k;j++){
		if (j==indirec && indirec>=0){
			indirec=l;
			strcpy(indirec_file,dummy[j]);
		}
		else if (j==outdirec && outdirec>=0){
			outdirec=l;
			strcpy(outdirec_file,dummy[j]);
		}
		else if (pipes>0 && pipe_mark[cur]==j){
			arg[l]=NULL;
			pipe_mark[cur]=l;
			l++;
			if (l>=i) arg[l]=(char*)malloc((strlen(dummy[j])+1)*sizeof(char));
			strcpy(arg[l],dummy[j]);
			l++;
			cur++;
		}
		else{
			if (l>i) arg[l]=(char*)malloc((strlen(dummy[j])+1)*sizeof(char));
			strcpy(arg[l],dummy[j]);
			l++;
		}
	}
	arg[l]=NULL;
	args=l;
}
void execute(char **arg,int start){
	int status;
	int f1=1,f2=0;
	if (outdirec>=0 && out_yes){
		f1=open(outdirec_file, O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR | S_IRGRP | S_IWGRP | S_IWUSR);
//		printf("lop_yes %d\n",start);
	}
//	printf("HELLO\n");
	if (indirec>=0 && in_yes){
		f2=open(indirec_file,O_RDONLY);
//		printf("guy_yes\n");
	}
	if (strstr(arg[start],"hist")!=NULL){
		history(arg,start);
		return;
	}
	if (strcmp(arg[start],"pid")==0){
		pid(arg,start);
		return;
	}
	if (strcmp(arg[start],"cd")==0){
		cd(arg,start);
		return;
	}
	pid_t pid1=fork();
	if (pid1<0){
		fprintf(stderr,"some error occurred\n");
	}
	else if (pid1==0){
		if (f2!=0) dup2(f2,0);
		if (f1!=1) dup2(f1,1);
		int re=execvp(arg[start],&arg[start]);
		if (re<0) fprintf(stderr,"command not found\n");
		exit(1);
	}else{
		if (back_ground!=1){
			process[process_count]=pid1;
			strcpy(process_cmd[process_count],arg[start]);
			process_count++;
			waitpid(pid1,&status,0);
			sleep(0.5);
		}else{
			process[process_count]=pid1;
			strcpy(process_cmd[process_count],arg[start]);
			working[process_count]=1;
			process_count++;
			printf("command %s pid:%d\n",arg[start],pid1);
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
		indirec=outdirec=-1;
		pipes=0;
		memset(pipe_mark,0,sizeof(pipe_mark));
		indirec_file[0]='\0';
		outdirec_file[0]='\0';
		in_yes=1;
		out_yes=1;
		parse(arg,cmd);
		hist_cmd=(char**)realloc(hist_cmd,(hist_count+1)*sizeof(char*));
		hist_cmd[hist_count]=(char*)malloc(strlen(arg[0])*sizeof(char));
		strcpy(hist_cmd[hist_count],arg[0]);
		hist_count++;
		if (args==1 && strcmp(arg[0],"quit")==0) break;
		if (pipes==0){
			execute(arg,0);
//			exit(1);
		}
		else{
			in_yes=0;
			out_yes=0;
			array=(int**)malloc((pipes)*sizeof(int*));
			int j;
			for (j=0;j<pipes;j++) array[j]=(int*)malloc(2*sizeof(int));
			for (j=0;j<pipes;j++) pipe(array[j]);
			int ch=fork();
			if (ch==0){
				dup2(array[0][1],1);
				for (j=0;j<pipes;j++) close(array[j][0]),close(array[j][1]);
				if (indirec<=pipe_mark[0]) in_yes=1;
				if (outdirec<=pipe_mark[0]) out_yes=1;
				execute(arg,0);
				exit(1);
			}
			for (j=0;j<pipes;j++){
				in_yes=0;
				out_yes=0;
				if (fork()==0){
					dup2(array[j][0],0);
					if (j!=pipes-1){
						dup2(array[j+1][1],1);
						if (indirec<=pipe_mark[j+1] && indirec!=-1) in_yes=1;
						if (outdirec<=pipe_mark[j+1] && outdirec!=-1){
							out_yes=1;
						}
					}else{
						if (indirec<=args && indirec!=1) in_yes=1;
						if (outdirec<=args && outdirec!=-1){
							out_yes=1;
						}
					}
					int k;
					for (k=0;k<pipes;k++) close(array[k][0]),close(array[k][1]);
					execute(arg,pipe_mark[j]+1);
					exit(1);
				}
			}
			for (j=0;j<pipes;j++) close(array[j][0]),close(array[j][1]);
			int sigo;
			for (j=0;j<2*pipes;j++) wait(&sigo);
			for (j=0;j<pipes;j++) free(array[j]);
			free(array);
		}
	}
	return 0;
}
