#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<string.h>
#include<unistd.h>
#include<signal.h>
#include<sys/wait.h>
#include<errno.h>

char **history;
char **pid_all;
int *pid_ids;
int *flag;
int hist = 0, pid_end = 0;
int waits= 0;
char *pwd=NULL;
int ps1 = 1;

/* Did Not store !histn command in history to avoid further discrepencies */
// hist, histn and !histn have the same process name "hist" and have pid same as their parent
// pid, pid all and pid current have the same process name "pid" and have pid same as their parent
// cd is not a seperate process

/*void execute(char *, char *);
void pipe_red(char ** , int **, int , int ,char *);
char *getpwd(char *);
void child(int );
void print(char *, int );
char *Process_Input(char *);
int Format_String(char *, char **, char , char ){
void My_System(char *);
void Print_History(char **, int , int ){
void History(char **, char *, int , char *){
*/

char *getpwd(char *home_dir){
	size_t size = 1000;
	char *cwd = getcwd(NULL,size);
	int len1 = strlen(home_dir);
	int len2 = strlen(cwd);
	if(len2 < len1) return cwd;
	else if(len2 > len1) {
		if (strncmp(home_dir, cwd, len1) != 0) return cwd;
		else {
			char *s = (char *)malloc(1000*sizeof(char));
			s[0]='~'; int j=1,i;
			for(i=len1;i<len2;i++) s[j++] = cwd[i]; s[j]=0;
			return s;
		}
	}
	else return "~";
}

void child(int sig){
	pid_t pid;
	int status;
	pid = waitpid(WAIT_ANY,&status,WNOHANG);
	if(waits && pid == -1) waits--;
	if(pid == -1) return ;
	int i;
	char *home;
	char s[1000];
	if(pid+1) home = getlogin(), gethostname(s,1000);
	if(pid+1) 
		for(i=0;i<pid_end;i++) 
			if(pid_ids[i] == pid) { 
				flag[i] = 0;  
				printf("\n%s %d exited normally\n",pid_all[i],pid); 
				if(ps1) printf("<%s@%s:%s>",home,s,pwd); 
				fflush(stdout); 
				break ;
			}
}

void print(char *command, int id){
	printf("command name: %s process id: %d\n",command,id);
}

char *Process_Input(char input[]){
	int i=0,j=0,len = strlen(input);
	char *Processed_Input = (char *)malloc(1000*sizeof(char));
	while(i < len){
		while(input[i] == ' ' && i < len) i++;
		while(input[i] != ' ' && i < len) Processed_Input[j] = input[i], i++, j++; 
		if(i < len) Processed_Input[j] = ' ', j++;
	}
	if(Processed_Input[j-1] == ' ') Processed_Input[j-1] = 0;
	else Processed_Input[j] = 0;
	return Processed_Input;
}

int Format_String(char *input, char **array, char c, char d){
	int i = 0, j = 0, k=0;
	int len = strlen(input);
	array[0] = (char *)malloc(100*sizeof(char));
	for(k=0;k<len;k++){
		if(input[k] == c || input[k] == d) {
			array[i][j] = 0;
			array[i] = Process_Input(array[i]);
			if(k!=len-1) i++;
			j=0;
			if(k!=len-1) array[i] = (char*)malloc(100*sizeof(char));
		}
		else array[i][j++] = input[k];
	}
	array[i][j]=0;
	array[i] = Process_Input(array[i]);
	return i+1;
}

void My_System(char *input){
	int i = 0;
	int len = strlen(input);
	int flags = (input[len-1] == '&' ? 1 : 0);
	if (flags) input[len-1] = 0;
	char **arg1 = (char **)malloc(1000*sizeof(char*));
	arg1[0] = strtok(input," ");
	while(arg1[i] != NULL) i++, arg1[i] = strtok(NULL," ");
	pid_all[pid_end] = (char *)malloc(1000 * sizeof(char));
	int pid = fork();
	ps1 = 0;
	if(pid == 0) execvp(arg1[0],arg1), puts("Command Not Found"), exit(1);
	else if(pid!=0 && flags==0) waitpid(pid,&flags,0);
	ps1 = 1;

	strcpy(pid_all[pid_end], arg1[0]), pid_ids[pid_end] = pid, flag[pid_end] = flags, pid_end++;
	free(arg1);
}

void Print_History(char **history, int i, int n){
	int j=0;
	for(i = i;i < n;i++) j++, printf("%d. %s\n",j,history[i]);
}

void execute(char *input, char *home_dir);

void History(char **history, char *input, int n, char *home_dir){
	pid_all[pid_end] = "hist", pid_ids[pid_end] = getpid(), flag[pid_end] = 0, pid_end++;
	char s[1000],d[1000];
	int j=0;
	input = Process_Input(input);
	int len = strlen(input);
	d[0]=0;
	s[0]=0;
	sscanf(input,"%[a-zA-Z!]%d%[^\n]",s,&j,d);
	//fprintf(stderr,s);
	//fprintf(stderr,d);
	int len2 = strlen(d);
	if(len2 == 0){
		if(len==4) Print_History(history,0,n);
		else{
			int k = (input[0] == '!' ? 5 : 4);
			if (k == 4) {
				if(j>=n) Print_History(history,0,n);
				else Print_History(history,n-j,n);
			}
			else { 
				if(j-1 < n && j > 0) printf("%s\n",history[j-1]); 
				if(j-1 < n && j > 0) execute(history[j-1], home_dir), hist--; 
			}
		}
	}
	else fprintf(stderr,"Command Not Found\n");
	d[0]=0;
	s[0]=0;
	j=0;
	len2=0;
	len=0;
}

void cd(char *input, char *home_dir){
	int len = strlen(input),i;
	char *cd = strtok(input," ");
	if(strlen(cd) == 2){
		cd = strtok(NULL," ");
		if(len == 2) chdir(home_dir); 
		else {
			if(strlen(cd) == 1 && cd[0] == '~') chdir(home_dir);
			else if(cd[0] == '~') {
				len = strlen(cd);
				for(i=0;i<len;i++) cd[i] = cd[i+1];
				char tmp[1000];
				strcpy(tmp,home_dir);
				strcat(tmp,cd);
				chdir(tmp);
			}
			else { int a = chdir(cd); if(a==-1) fprintf(stderr,"Directory Not Found\n"); }
		}
		pwd = getpwd(home_dir);
	}
	else fprintf(stderr,"Command Not Found\n");
}

void PID(char *input){
	pid_all[pid_end] = "pid", pid_ids[pid_end] = getpid(), flag[pid_end] = 0, pid_end++;
	char *temp = (char *)malloc(1000*sizeof(char));
	if(strcmp(input,"pid") == 0) sprintf(temp,"/%s/%d/%s","proc",getpid(),"comm"), fscanf(fopen(temp,"r"),"%[^\n]",temp), print(temp,getpid());
	else if(strcmp(input,"pid current") == 0){
		flag[pid_end - 1] = 1;
		//sprintf(temp,"ps --ppid %d",getpid());
		int i;
		for(i=0;i<pid_end;i++) if(flag[i] == 1) printf("command name: %s process id: %d\n",pid_all[i],pid_ids[i]);
		flag[pid_end - 1] = 0;
	}
	else if (strcmp(input,"pid all") == 0){
		int i;
		for(i=0;i<pid_end;i++) printf("command name: %s process id: %d\n",pid_all[i],pid_ids[i]);
	}
	else fprintf(stderr,"Command Not Found\n");
}

void pipe_red(char **arg, int **array, int i, int n, char *home_dir);

void execute(char *input, char *home_dir){
	if(strstr(input,"<") != NULL || strstr(input,">") != NULL || strstr(input,"|") != NULL){
		if(strstr(input,"|") != NULL){
			char **arg = (char **)malloc(1000 * sizeof(char *));
			int num = Format_String(input,arg,'|','|'),i=0;
			if(num >= 2){
				int pipes = num - 1;
				int **array = (int **)malloc(pipes * sizeof(int*));
				for(i=0;i<pipes;i++) array[i] = (int *)malloc(2*sizeof(int));
				pipe_red(arg,array,0,num-1,home_dir);
			}
			free(arg);
		}
		else{
			char **arg = (char **)malloc(1000 * sizeof(char *));
			input = Process_Input(input);
			int num = Format_String(input,arg,'<','>');
			if(strstr(input,"<") != NULL && strstr(input,">") == NULL){
				if(num != 2) { 
					fprintf(stderr,"syntax error near unexpected token `newline'\n"); 
					return; 
				}
				int pid = fork();
				if (pid == 0) { 
					FILE *f = freopen(arg[1],"r",stdin); 
					if(f == NULL) perror("Error"), exit(1); 
					execute(arg[0],home_dir); 
					exit(1);
				}
				else waitpid(pid,&pid,0);
			}
			else if(strstr(input,">") != NULL && strstr(input,"<")==NULL){
				if(num != 2) { 
					fprintf(stderr,"syntax error near unexpected token `newline'\n"); 
					return; 
				}
				int pid = fork();
				if (pid == 0) { 
					FILE *f = freopen(arg[1],"w",stdout); 
					if(f == NULL) perror("Error"), exit(1); 
					execute(arg[0],home_dir); 
					exit(1);
				}
				else waitpid(pid,&pid,0);
			}
			else{
				if(num != 3) { fprintf(stderr,"syntax error near unexpected token `newline'\n"); return; }
				int pid = fork();
				if (pid == 0) { 
					FILE *f1 = freopen(arg[1],"r",stdin); if(f1 == NULL) perror("Error"), exit(1); 
					FILE *f2 = freopen(arg[2],"w",stdout); if(f2 == NULL) perror("Error"), exit(1);
					My_System(arg[0]); exit(1);
				}
				else waitpid(pid,&pid,0);
				free(arg);
			}
		}
	}
	else if(input[0] == 'c' && input[1] == 'd') cd(input,home_dir);
	else if(strncmp(input,"pid",3) == 0) PID(input);
	else if(strncmp(input,"hist",4) == 0 || strncmp(input,"!hist",5) == 0) History(history,input,hist-1,home_dir);
	else My_System(input);
}

void pipe_red(char **arg, int **array, int i, int n, char *home_dir){
	for(i=0;i<n;i+=1) pipe(array[i]);
	int pid;
	waits = n ;
	for(i = 0;i <= n;i += 1){
		int a[2];
		pipe(a);
		ps1 = 0;
		if((pid = fork())==0){
			if(i < n) close(array[i][0]);
			if(i) close(array[i-1][1]);
			if(i && strstr(arg[i],"<") == NULL) dup2(array[i - 1][0],0);
			if(i < n && strstr(arg[i],">") == NULL) dup2(array[i][1],1);
			if(i < n && strstr(arg[i+1],"<") != NULL) close(arg[i][1]);
			else execute(arg[i],home_dir);
			if(i < n) close(array[i][1]);
			close(a[0]);
			write(a[1],&waits,sizeof(int)+4);
			close(a[1]);
			exit(1);
		}
		else{
			if(i == 0) close(array[i][1]);
			else if (i != n){
				close(array[i - 1][0]);
				close(array[i][1]);
			}
			else if (i == n) close(array[i - 1][0]);
			close(a[1]);
			read(a[0],&waits,sizeof(int)+4);
			close(a[0]);
		}
	}
	while(waits) pause(); ps1 = 1;
	fflush(stdout);
}

int main(){
	//signal(SIGINT,SIG_IGN);
	signal(SIGTERM,SIG_IGN);
	signal(SIGQUIT,SIG_IGN);
	signal(SIGCHLD,child);
	char *user = getenv("USER");;
	char *home_dir = getenv("PWD");
	pid_all = (char **)malloc(1000*sizeof(char*));
	pid_ids = (int *)malloc(1000*sizeof(int));
	flag = (int *)malloc(1000*sizeof(int));
	history = (char**)malloc(1000*sizeof(char*));
	pwd = getpwd(home_dir);
	char hostname[1000];
	gethostname(hostname,1000);
	printf("<%s@%s:%s>",user,hostname,pwd);
	char *input = (char *)malloc(1000 * sizeof(char));
	scanf("%[^\n]",input);
	getchar();
	input = Process_Input(input);
	while(strcmp(input,"quit") != 0){
		if(input[0]){
			int len = strlen(input);
			int i;
			for(i=0;i<len;i++) if (input[i] == '\t') input[i] =' ';
			history[hist] = (char *)malloc(strlen(input)*sizeof(char));
			input = Process_Input(input);
			if(strncmp(input,"!hist",5) != 0) strcpy(history[hist++],input);
			execute(input, home_dir);
		}
		input[0] = 0;
		printf("<%s@%s:%s>",user,hostname,pwd); 
		scanf("%[^\n]",input);
		getchar();
		input = Process_Input(input);
	}
	return 0;
}
