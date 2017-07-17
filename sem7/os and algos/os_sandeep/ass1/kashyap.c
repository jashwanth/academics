//Garapati Prasanth
//   201002145

#include<stdio.h>
#include<unistd.h>
#include<string.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<sys/wait.h>
#include<fcntl.h>
#include<signal.h>

int args=0,child=0,count=0,here=0,pipeman=0,process[1000],flags[500],echeck=0;
char home[100],*pidall[500];
int ct=0;

void execute(char *inps[100], char store[500][100]); //to execute general commands
void redirect(char *inps[100], int p,char store[500][100]);// for redirection of input, output
void piped(char *inps[100],int p,char store[500][100]); //pipe management
void siggu(int sig);//managing signals
int divide(char *inp,char *inps[100]);//divide input string and send them to diff funcs for correct execution
void cd(char *inps[100],char store[500][100]); // cd 
void history(char *inps[100],char store[500][100]); //history management
void replace(char *in[100]); //replacing '~' with home directory

void siggu(int sig)
{
	int i;
	pid_t pid=waitpid(WAIT_ANY,&i,WNOHANG);
	if(pid != -1)
	{
		for(i=0;i<ct;i++)
		{
			if(process[i]==pid)
			{
		flags[i]=0;
				printf("\nprocess %d exited normally \n",pid);
			}
		}
	}

}
int divide(char *inp,char *inps[100])
{
	args=0,child=0,pipeman=0;
	inps[0]=strtok(inp," \t");
	int i=0;
	int flag=0;
	while(inps[i]!=NULL)
	{
		if (strcmp(inps[i],"&")==0)
		{
			strcpy(inps[i],"");
			child++;
			flag=0;
		}
		else if ( (strcmp(inps[i],">")==0 || strcmp(inps[i],"<")==0) && flag!=2 && flag!=1)
		{
			here=i;
			flag=2;
		}
		else if ( strcmp(inps[i],"|")==0  )
		{
			pipeman++;
			flag=1;
		}
		i++;
		inps[i]=strtok(NULL," \t");
	}
	args=i;
	return flag;

}

void cd(char *inps[100],char store[500][100])
{
	if ( args==1 || strcmp(inps[1],"~")==0)
	{	
		process[ct]=getpid();
		pidall[ct]=store[count-1];
		ct++;
		chdir(home);
		return;
	}
	if (chdir(inps[1])==0)
	{
		process[ct]=getpid();
		pidall[ct]=store[count-1];

		ct++;
	}
	else
	{
		fprintf(stderr,"bash: cd: %s: No such file or directory\n",inps[1]);

	}
}

void replace(char *in[100])
{
	int i;
	for(i=0;i<args;i++)
	{
		if(in[i][0]=='~')
		{
			char c,ab[100];
			sscanf(in[i],"%c%s",&c,ab);
			sprintf(in[i],"%s%s",home,ab);
		}
	}

}
void history(char *inps[100],char store[500][100])
{
	int j;
	if ( (args==1 || here!=0) && strcmp(inps[0],"hist")==0)
	{
		process[ct]=getpid();
		pidall[ct]=store[count-1];
		ct++;
		for(j=0;j<count;j++)
		{
			printf(" %d. %s\n",j+1,store[j]);
		}
		return;
	}
	else if( args==1 && inps[0][0]=='h') 
	{
		int num;	
		process[ct]=getpid();
		pidall[ct]=store[count-1];

		ct++;
		if(sscanf(inps[0],"hist%d",&num)==0)
		{
			fprintf(stderr,"Invalid command\n");
			return;
		}
		if(num > count)
		{
			fprintf(stderr,"History has only %d commands\n",count);
			return;
		}
		for (j=0;j<num;j++)
		{
			printf(" %d. %s\n",j+1,store[count-num+j]);
		}
	}
	else if(args==1 && inps[0][0]=='!')
	{
		int n;
		sscanf(inps[0],"!hist%d",&n);
		char m[1000];
		if (n>count)
		{
			fprintf(stderr,"Not enough history\n");

		}
		else
		{
			static int jk=-5;
			if(jk==n)
			{
				fprintf(stderr,"Invalid command: will go on in infinite recurrsion\n");
				return;
			}
			jk=n;
			strcpy(m,store[n-1]);
			char *new[100];
			pipeman=0;
			args=0;
			int s=divide(m,new);
			replace(new);
			if(s==0 )
			{
				execute(new,store);
			}
			else if(s==1)
			{
				piped(new,pipeman,store);
			}
			else if(s==2)
			{
				redirect(new,args,store);
			}
		}

	}
}
int main()
{
	char store[500][100];
	char m[1000]="~";
	signal(SIGINT,SIG_IGN);
	signal(SIGCHLD,siggu);
	getcwd(home,1000);
	while(1)
	{
		char inp[1000]="";
		char *user,host[1000];
		int i=0,j=0,k=0;
		here=0,pipeman=0;
		echeck=0;
		user=getenv("USER");
		gethostname(host,1000);
		getcwd(m,1000);
		if(strstr(m,home)!=NULL)
		{
			int l1=strlen(home);
			int l2=strlen(m);
			char change[1000];
			change[0]='~';
			for(i=1;i<=l2-l1;i++)
			{
				change[i]=m[l1+i-1];
			}
			strcpy(m,change);
		}
		printf("<%s@%s:%s>",user,host,m);
		scanf("%[^\n]",inp);
		if((strcmp(inp,"")!=0))
			strcpy(store[count],inp);
		count++;
		getchar();
		char *inps[100];
		char *arg;
		int check=divide(inp,inps);
		replace(inps);
		if(check==0 )
		{
			execute(inps,store);	
		}
		if(check==1)
		{
			piped(inps,pipeman,store);
		}
		else if(check==2)
		{
			redirect(inps,args,store);
		}
	}		

}

void execute(char *inps[100],char store[500][100])
{
	int i,j,k;
	if(args==1 && strcmp(inps[0],"quit")==0)
	{
		exit(1);
	}
	else if(args==0)
	{
		k=0;
	}
	else if(strcmp(inps[0],"cd")==0)  //use tilda(~)
	{
		cd(inps,store);

	}
	else if(strcmp(inps[0],"pid")==0)
	{
		if (args==1)
		{
			process[ct]=getpid();
			pidall[ct]=store[count-1];
			ct++;
			printf("command name: ./a.out process id:%d\n",getpid());
		}
		else if(args==2 && strcmp(inps[1],"all")==0)
		{
			process[ct]=getpid();
			pidall[ct]=store[count-1];
			ct++;
			for(j=0;j<ct;j++)
			{
				printf("command name: %s process id: %d\n",pidall[j],process[j]);
			}
		}
		else if(args==2 && strcmp(inps[1],"current")==0)
		{
			int okok=0;
			for(j=0;j<ct;j++)
			{
				if(flags[j]==1)
				{
					okok=1;
					printf("command name: %s process id: %d\n",pidall[j],process[j]);
				}
			}
			printf("command name: pid current process id: %d\n",getpid());
		}
	}
	else if (strstr(inps[0],"hist")!=NULL)
	{
		history(inps,store);
	}
	else if (child==0)
	{
		int chi=fork();
		if(chi==0)
		{
			if (execvp(inps[0],inps)!=0)
			{
				fprintf(stderr,"%s: command not found\n",inps[0]);
				exit(1);
			}
		}
		waitpid(chi,&j,0);
		process[ct]=chi;
		pidall[ct]=store[count-1];
		ct++;
	}
	else if(child>0)
	{
		int ch2=fork();
		if(ch2==0)
		{
			if (execvp(inps[0],inps)!=0) 
			{
				fprintf(stderr,"%s: command not found\n",inps[0]);
				exit(1);
			}
			exit(1);
		}
		process[ct]=ch2;
		pidall[ct]=store[count-1];
		flags[ct]=1;
		ct++;
		printf("command %s pid:%d\n",inps[0],ch2);

	}

}

void redirect(char *inps[100],int n,char store[500][100])
{
	int j;
	int f1=1,f2=0;
	int p1=0,p2=0;
	int hflag=0;
	for(j=0;j<n;j++)
	{
		if (strcmp(inps[j],">")==0)
		{
			hflag=1;
			p1=1;
			f1=open(inps[j+1], O_WRONLY | O_TRUNC | O_CREAT, S_IRUSR | S_IRGRP | S_IWGRP | S_IWUSR);
		}
		else if(strcmp(inps[j],"<")==0)
		{
			hflag=1;
			p1=1;
			f2=open(inps[j+1],O_RDONLY);
		}
		if(p1==0)
			p2++;
	}
	char *simple[p2];
	for(j=0;j<p2;j++)
	{
		simple[j]=inps[j];
	}
	simple[j]=NULL;
	if(hflag==0)
	{
		/*process[ct]=getpid();
		strcpy(pidall[ct],simple[0]);
		ct++;*/
		if(strcmp(simple[0],"pid")==0)
		{
			args=p2;
			execute(simple,store);
		}
		else if(strcmp(simple[0],"hist")==0)
		{
			args=p2;
			execute(simple,store);
		}
		else if(execvp(simple[0],simple)!=0)
			fprintf(stderr,"Command not found\n");	
		return;
	}
	int i=0;
	int chiir=fork();
	if(chiir==0)
	{
		dup2(f2,0);
		dup2(f1,1);
		int n;
		if(strcmp(simple[0],"pid")==0)
		{
			args=p2;
			execute(simple,store);
		}
		else if(strcmp(simple[0],"hist")==0)
		{
			args=p2;
			execute(simple,store);
		}
		else if(execvp(simple[0],simple))
		{
			fprintf(stderr,"Command not found\n");//hist > t ???
		}
		exit(1);

	}
	/*process[ct]=chiir;
	strcpy(pidall[ct],simple[0]);
	ct++;*/
	waitpid(chiir,&chiir,0);
	int k=8;
}

void piped(char *inps[100],int n,char store[500][100])
{
	int i,j=0,k=0,l;
	int pre=0;

	char *ar[pipeman+1][6];
	for(i=0;i<pipeman+1;i++)
	{
		for(j=0;j<6;j++)
		{
			ar[i][j]=NULL;
		}
	}
	j=0;
	int note[100];
	for(i=0;i<args;i++)
	{
		if( ( strcmp(inps[i],"|")==0) || i==args-1 )
		{
			pre=i-k;
			note[j]=pre;
			if(i==args-1)
			{
				pre=args-k;
				note[j]=pre;
			}
			for(l=0;l<pre;l++)
			{
				ar[j][l]=inps[l+k];
			}
			j++;
			k=i+1;
		}
	}
	int num=j-1;
	int pipefd[2*num];
	int gh=k;
	for(i=0;i<=num;i++)
	{
		pipe(pipefd+2*i);
	}
	int ch1=fork();
	if(ch1==0)
	{
		printf("adfg %d\n",num);
		dup2(pipefd[1],1);
		for(j=0;j<2*num;j++)
		{
			close(pipefd[j]);
		}
		redirect(ar[0],note[0],store);
		exit(1);
	}
	int a[num+6];

	for(j=0;j<num;j++)
	{
		a[j]=fork();
		if(a[j]==0)
		{
			printf("lpoiuy\n");

			dup2(pipefd[2*j+0],0);
			if ( j!=num-1)
				dup2(pipefd[2*j+3],1);
			for(l=0;l<2*num;l++)
			{
				close(pipefd[l]);
			}
			redirect(ar[j+1],note[j+1],store);
			exit(1);
		}
	}
	for(j=0;j<2*num;j++)
	{
		close(pipefd[j]);
	}

	int sigo;
	for (i= 0; i < 2*num+1 ; i++)
		wait(&sigo);
}
