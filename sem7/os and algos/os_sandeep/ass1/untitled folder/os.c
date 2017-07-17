/* Name: Shanka Sai Sudheer Kumar
   Rollno: 201001149
assumptions: I have implemented the userdefined commands in the program itself(without forking)
hist,pidalll and their variants also print the unknown commands which are given as input*/
#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<fcntl.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<sys/wait.h>
#include<signal.h>

char *hwd;
char *input;
char *parsing_output[20];
int total_parsing_output;
int queue_length=1000;
char histqueue[1000][100];
int histpid[1000];
int marking[1000];
int start;
int end;
int back_ground;
int present_pid;

void execute(char *command);

void addqueue(char *command,int process_pid,int flag)
{
  if(start%queue_length != (end+1)%queue_length || end==-1)
  {
    strcpy(histqueue[(end+1)%queue_length],command);
    histpid[(end+1)%queue_length] = process_pid;
    marking[(end+1)%queue_length] = flag;
    end = (end+1)%queue_length;
  }
  else
  {
    strcpy(histqueue[(end+1)%queue_length],command);
    histpid[(end+1)%queue_length] = process_pid;
    marking[(end+1)%queue_length] = flag;
    end = (end+1)%queue_length;
    start = (start+1)%queue_length;
  }
  return ; 
}

int check_pid(int process_pid)
{
  int i;
  for(i=start ; i==start || i%queue_length!=(end+1)%queue_length ; i++)
    if(histpid[i%queue_length] == process_pid)
      return i%queue_length;
  return -1;
}

int execute_pidall(char *command)
{
  int i;
  if(end==-1)
    return 0;
  for(i=start ; i==start || i%queue_length!=(end+1)%queue_length ; i++)
    if(strlen(histqueue[i%queue_length])!=0)
      printf("command name:%s process id: %d\n",histqueue[i%queue_length],histpid[i%queue_length]);
  return 0;
}


int execute_pidcurrent(char *command)
{
  int i;
  if(end==-1)
    return 0;
  for(i=start ; i==start || i%queue_length!=(end+1)%queue_length ; i++)
    if(strlen(histqueue[i%queue_length])!=0 && marking[i%queue_length]!=0)
      printf("command name:%s process id: %d\n",histqueue[i%queue_length],histpid[i%queue_length]);
  return 0;
}

void parse(char *command)
{
  char *delimiters = " \t)(";
  char *temp;
  int i;
  char *req_command = (char*)malloc(50*sizeof(char));
  strcpy(req_command,command);
  temp = strtok(req_command,delimiters);
  i = 0;
  while(temp!=NULL)
  {
    parsing_output[i] = (char*)malloc(50*sizeof(char));
    strcpy(parsing_output[i], temp);
    i++;
    temp = strtok(NULL, delimiters);
  }
  parsing_output[i] = NULL;
  total_parsing_output = i-1;
}

char *working_directory()
{
  char *cwd = (char*)malloc(50*sizeof(char));
  char *formatted_directory_name = (char*)malloc(50*sizeof(char));
  getcwd(cwd,50);
  if(strncmp(cwd,hwd,strlen(hwd)) == 0)
  {
    formatted_directory_name[0] = '~';
    strcpy(formatted_directory_name+1, cwd+strlen(hwd));
  }
  else
    strcpy(formatted_directory_name, cwd);
  return formatted_directory_name;
}


char *actual_path(char *dirname)
{
  char *temp = (char*)malloc(50*sizeof(char));
  char *starting_of_thelda = (char*)malloc(50*sizeof(char));
  if(strstr(dirname,"~")!=NULL)
  {
    starting_of_thelda = strstr(dirname,"~");
    strcpy(temp,starting_of_thelda+1);
    strcpy(starting_of_thelda,hwd);
    strcpy(starting_of_thelda + strlen(hwd), temp);
  }
  return dirname;
}

int execute_outdirection(char *command)
{
  char  *filename;
  int fd,pid;
  command = strtok(command,">");
  if(command == NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  filename = strtok(NULL, " \t>");
  if(filename==NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  filename = actual_path(filename);
  parse(command);
  fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU | S_IRGRP | S_IROTH);
  if(fd<0)
  {
    perror("error occurred");
    return -1;
  }
  pid = fork();
  if(pid<0)
  {
    perror("error occurred");
    return -1;
  }
  else if(pid == 0)
  {
    if(dup2(fd,1)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    }
    if(close(fd)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    }
   /* if(execvp(parsing_output[0],parsing_output)<0)
    {
      fprintf(stderr,"command not found\n");
      exit(EXIT_FAILURE);
    }*/
    execute(command);
    exit(EXIT_SUCCESS);
  }
  else
  {
    if(back_ground!=1)
    { 
      addqueue(command,pid,0);
      if(wait(NULL)<0)
      {
	fprintf(stderr,"some error occurred\n");
	int temp = check_pid(pid);
	if(temp!=-1)
	  parsing_output[temp][0]='\0';
	return -1;
      }
      else
      {
	int temp = check_pid(pid);
	if(temp!=-1)
	  marking[temp]=0;
      }
    }
    else
    {
      printf("command %s pid %d\n",command,pid);
      addqueue(command,pid,1);
    }
  }
  return 0;
}

int execute_indirection(char* command)
{
  char  *filename;
  int fd,pid;
  command = strtok(command,"<");
  if(command == NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  filename = strtok(NULL, " \t<");
  if(filename == NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  filename = actual_path(filename);
  parse(command);
  fd = open(filename, O_RDWR);
  if(fd<0)
  {
    perror("error occurred");
    return -1;
  }
  pid = fork();
  if(pid<0)
  {
    perror("error occurred");
    return -1;
  }
  else if(pid == 0)
  {
    if(dup2(fd,0)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    }
    if(close(fd)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    }
    execute(command);
    exit(EXIT_SUCCESS);
   /* if(execvp(parsing_output[0], parsing_output)<0)
    {
      fprintf(stderr,"command not found\n");
      exit(EXIT_FAILURE);
    }*/
  }
  else
  {
    if(back_ground!=1)
    {
      addqueue(command,pid,1);
      if(wait(NULL)<0)
      {
	fprintf(stderr,"some error occurred\n");
	int temp=check_pid(pid);
	if(temp!=-1)
	  parsing_output[temp][0]='\0';
	return -1;
      }
      else
      {
	int temp=check_pid(pid);
	if(temp!=-1)
	  marking[temp]=0;
      }
    }
    else
    {
      printf("command %s pid %d\n",command,pid);
      addqueue(command,pid,1);
    }
  }
  return 0;
}

int execute_in_outdirection(char *command)
{
  char *filenames, *temp, *infilename, *outfilename;
  int infd,outfd,pid;
  temp = (char*)malloc(50*sizeof(char));
  if(temp==NULL)
  {
    fprintf(stderr,"some error occurred\n");
    return -1;
  }
  infilename = (char*)malloc(50*sizeof(char));
  outfilename = (char*)malloc(50*sizeof(char));
  command = strtok(command,"<>");
  if(command==NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  filenames = strtok(NULL, "");
  if(filenames==NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  strcpy(temp,filenames);
  temp = strtok(temp, "<");
  if(temp==NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  while(temp!=NULL)
  {
    strcpy(infilename,temp);
    temp = strtok(NULL, "<");
  }
  infilename = strtok(infilename, " \t>");
  if(infilename==NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }

  temp = (char*)malloc(50*sizeof(char));
  strcpy(temp,filenames);
  temp = strtok(temp, ">");
  if(temp==NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  while(temp!=NULL)
  {
    strcpy(outfilename, temp);
    temp = strtok(NULL, ">");
  }
  outfilename = strtok(outfilename, " \t<");
  if(outfilename==NULL)
  {
    fprintf(stderr,"command not found\n");
    return -1;
  }
  infilename = actual_path(infilename);
  outfilename = actual_path(outfilename);
  parse(command);
  infd = open(infilename, O_RDWR);
  if(infd<0)
  {
    perror("error occurred");
    return -1;
  }
  outfd = open(outfilename, O_RDWR | O_CREAT , S_IRWXU);
  if(outfd<0)
  {
    perror("error occurred");
    return -1;
  }
  pid = fork();
  if(pid<0)
  {
    perror("error occurred");
    return -1;
  }
  else if(pid == 0)
  {
    if(dup2(infd,0)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    }
    if(dup2(outfd,1)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    }
    if(close(infd)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    }
    if(close(outfd)<0)
    {
      perror("error occurred");
      exit(EXIT_FAILURE);
    } 
    execute(command);
    exit(EXIT_SUCCESS);
  /*  if(execvp(parsing_output[0],parsing_output)<0)
    {
      fprintf(stderr,"command not found\n");
      exit(EXIT_FAILURE);
    }*/
  }
  else
  {
    if(back_ground!=1)
    {
      addqueue(command,pid,1);
      if(wait(NULL)<0)
      {
	fprintf(stderr,"some error occurred\n");
	int temp = check_pid(pid);
	if(temp!=-1)
	  parsing_output[temp][0]='\0';
	return -1;
      } 
      else
      {
	int temp = check_pid(pid);
	if(temp!=-1)
	  marking[temp]=0;
      }
    }
    else
    {
      printf("command %s pid %d\n",command,pid);
      addqueue(command,pid,1);
    }
  }
  return 0;
}
int check_background(char *command)
{
  back_ground=0;
  parse(command);
  int i;
  for(i=0;i<=total_parsing_output;i++)
  {
    if(strcmp(parsing_output[i],"&")==0)
    {
      if(i!=total_parsing_output)
	return -1;
      back_ground = 1, parsing_output[i]=NULL;
      return 0;
    }
    else if(parsing_output[i][strlen(parsing_output[i])-1]=='&')
    {
      if(i!=total_parsing_output)
	return -1;
      parsing_output[i][strlen(parsing_output[i])-1]='\0';
      parsing_output[i+1]=NULL;
      back_ground = 1;
      return 0;
    }
  }
  return 0;
}

int execute_all(char *command)
{
  parse(command);
  int pid;
  pid = fork();
  if(pid<0)
  {
    fprintf(stderr,"some error occurred\n");
    return -1;
  }
  else if(pid == 0)
  {
    if(execvp(parsing_output[0], parsing_output)<0)
    {
      fprintf(stderr,"command not found\n");
      exit(EXIT_FAILURE);
    }
  }
  else 
  { 
    addqueue(command,pid,1);
    if(back_ground != 1)
    {
      int process_pid = wait(NULL);
      if(process_pid<0)
      {
	fprintf(stderr,"some error occurred\n");
	int temp = check_pid(process_pid);
	if(temp!=-1)
	  parsing_output[temp][0]='\0';
	return -1;
      }
      else
      {
	int temp = check_pid(process_pid);
	if(temp!=-1)
	  marking[temp]=0;
      }
    }
    else
      printf("command %s pid %d\n",command,pid);
  }
  return 0;
}

void sigchld_handler(int sig)
{
  int pid;
  pid = wait(NULL);
  if(pid!=-1 && present_pid==getpid())
  {
    int i = check_pid(pid);
    if(i!=-1)
      marking[i]=0;
    printf(" process %d exited normally\n",pid);
  }
  return ;
}

void signal_handler(int sig)
{
  printf("some error occured\n");
  return ;
}

int execute_hist(char *command)
{
  int i;
  if(end==-1)
    return 0;
  int count=1;
  for(i=start ; i==start || i%queue_length!=(end+1)%queue_length ; i++)
    if(strlen(histqueue[i%queue_length])!=0)
    {
      printf("%d.%s\n",count,histqueue[i%queue_length]);
      count++;
    }
  return 0;
}

int execute_histn(char *command)
{
  if(end==-1)
    return 0;
  char* req_command = strtok(command," \t()");
  int number = atoi(req_command+4);
  if(number==0)
    return -1;
  int i;
  int count=1;
  int total=0;
  for(i=start ; i==start || i%queue_length!=(end+1)%queue_length ;i++)
    total++;
  for(i=(start+total-number)%queue_length; i%queue_length!=(end+1)%queue_length ; i++)
    if(strlen(histqueue[i%queue_length])!=0)
    {
      printf("%d.%s\n",count,histqueue[i%queue_length]);
      count++;
    }
  return 0;
}

int execute_histlast(char *command)
{
  char* req_command = strtok(command," \t");
  int number = atoi(req_command+5);
  if(number==0)
    return -1;
  int i;
  int flag=1;
  for(i=start ; i==start || i%queue_length!=(end+1)%queue_length ;i++)
    if(i%queue_length==number)
    {
      flag=0;
      break;
    }
  if(flag==0)
  {
    if(strlen(histqueue[(start+number-1)%queue_length])!=0)
      execute(histqueue[(start+number-1)%queue_length]);
  }
  else
    return -1;
  //addqueue(command);
  return 0;
}

int execute_pid(char *command)
{
  char filename[40];
  char process_name[50];
  sprintf(filename,"/proc/%d/comm",present_pid);
  FILE *fp;
  fp = fopen(filename,"r");
  if(fp==NULL)
  {
    perror("error occurred");
    return -1;
  }
  fscanf(fp,"%s",process_name);
  printf("command name: %s  process id: %d\n",process_name,present_pid);
  return 0;
}

int main()
{
  present_pid = getpid(); 
  start=0;
  end=-1;
  int i;
  for(i=0;i<queue_length;i++)
    histqueue[i][0]='\0';
  signal(SIGCHLD, sigchld_handler);
  signal(SIGINT, SIG_IGN); // controlling ctrl+c
  signal(SIGTSTP, SIG_IGN); //controlling ctrl+z
  signal(SIGQUIT, SIG_IGN);  /* controlling ctrl+\ */
  signal(SIGSEGV, signal_handler);
  signal(SIGABRT, SIG_IGN);
  signal(SIGPIPE,signal_handler);//broken pipes
  char host_name[50];
  char *user_name;
  if(gethostname(host_name,50) == -1)
    strcpy(host_name,"system");
  user_name = getenv ("USER");
  //user_name = getlogin();
  if(user_name==NULL)
    user_name = "user";
  hwd = (char*)malloc(50*sizeof(char));
  getcwd(hwd,50);
  input = (char*)malloc(100*sizeof(char));
  while(1)
  {
    printf("<%s@%s:%s>",user_name,host_name,working_directory());
    scanf("%[^\n]",input);
    getchar();
    //  gets(input);
    execute(input);
    input[0]='\0';
  }
  return 0;
}

void execute_pipe(char *command)
{
  //signal(SIGCHLD,SIG_IGN);
  char *req_command;
  req_command = (char*)malloc(100*sizeof(char));
  strcpy(req_command,command);
  char *all_commands[50];
  int i;
  for(i=0;i<50;i++)
    all_commands[i]=(char*)malloc(100*sizeof(char));
  char *temp;
  temp = strtok(req_command,"|");
  if(temp==NULL)
  {
    fprintf(stderr,"command not found\n");
    return ;
  }
  i=0;
  while(temp!=NULL)
  {
    strcpy(all_commands[i],temp);
    i++;
    temp = strtok(NULL,"|");
  }
  if(i<2)
  {
    fprintf(stderr,"command not found\n");
    return ;
  }
  all_commands[i]=NULL;
  int *fds;
  fds = (int*)calloc(2*i-2,sizeof(int));
  int j,pid;
  for(j=0;j<i-1;j++)
  {
    if(pipe(fds+j*2)<0)
    {
      perror("error occurred");
      return ;
    }
  }
  for(j=0;j<i;j++)
  {
    pid = fork();
    if(pid<0)
    {
      fprintf(stderr,"some error occurred\n");
      return ;
    }
    else if(pid==0)
    {
      if(j==0)
      {
	if(dup2(fds[1],1)<0)
	{
	  perror("error occurred");
	  exit(EXIT_FAILURE);
	}
	int k;
	for(k=0;k<2*(i-1);k++)
	  if(k!=1)
	  {
	    if(close(fds[k])<0)
	    {
	      perror("error occurred");
	      exit(EXIT_FAILURE);
	    }
	  }
      }
      else if(j==i-1)
      {
	if(dup2(fds[2*i-4],0)<0)
	{
	  perror("error occurred");
	  exit(EXIT_FAILURE);
	}
	int k;
	for(k=0;k<2*(i-1);k++)
	  if(k!=2*i-4)
	  {
	    if(close(fds[k])<0)
	    {  
	      perror("error occurred");
	      exit(EXIT_FAILURE);
	    }
	  }
      }
      else
      {
	if(dup2(fds[j-1],0)<0)
	{  
	  perror("error occurred");
	  exit(EXIT_FAILURE);
	}
	if(dup2(fds[j+2],1)<0)
	{  
	  perror("error occurred");
	  exit(EXIT_FAILURE);
	}
	int k;
	for(k=0;k<2*(i-1);k++)
	{
	  if(k!=j-1 && k!=j+2)
	  {
	    if(close(fds[k])<0)
	    {  
	      perror("error occurred");
	      exit(EXIT_FAILURE);
	    }
	  }
	}
      }
      //   printf("fdsf=%s %d\n",all_commands[j],i);
      //    fprintf(stderr,"er=%s \n",all_commands[j]);
      execute(all_commands[j]);
      exit(1);
    }
  }
  for(j=0;j<2*(i-1);j++)
    close(fds[j]);
  for(j=0;j<i;j++)
    wait(NULL);
  //  signal(SIGCHLD,sigchld_handler);
}

char* parsing_command(char *command)
{
  char *clean_command = (char*)malloc(100*sizeof(char));
  char *temp;
  temp = strtok(command," \t");
  int i=0;
  while(temp!=NULL)
  {
    sprintf(clean_command+i,"%s",temp);
    i+=strlen(temp);
    sprintf(clean_command+i,"%c",' ');
    i++;
    temp = strtok(NULL," \t");
  }
  clean_command[i-1]='\0';
  return clean_command;
}

void execute(char *command)
{
  while(*command == ' ' || *command == '\t')
    command++;
  if(check_background(command)==0)
  {
    int len = strlen(command);
    int i;
    for(i=len-1;i>=0;i--)
      if(command[i]=='&')
	command[i]='\0';
  }
  else
  {
    printf("command not found\n");
    return ;
  }
  if(strlen(command)==0)
    return;
  else if(strchr(command,'|')!=NULL)
  {
    if(back_ground!=1)
      addqueue(command,getpid(),0);
    else
      addqueue(command,getpid(),1);
    pid_t pid = fork();
    if(pid<0)
    {
      fprintf(stderr,"some error occurred\n");
      return ;
    }
    else if(pid == 0 )
    {
      execute_pipe(command);
      exit(1);
    }
    else
    {
      int status;
      addqueue(command,pid,1);
      if(back_ground!=1)
      {
        int temp;
	temp=wait(&status);
	if(temp<0)
	{
	  int index = check_pid(pid);
	  if(index!=-1)
	    parsing_output[index][0]='\0';
	}
	else
	{
	  int index = check_pid(pid);
	  if(index!=-1)
	    marking[index]=0;
	}
      }
      else
	printf("command %s pid %d\n",command,pid);
    }     
  }
  else if(strchr(command,'>')!=NULL && strchr(command,'<')!=NULL )
  {
    int flag = execute_in_outdirection(command);
  }
  else if(strchr(command,'>')!=NULL )
  {
    int flag = execute_outdirection(command); 
  }
  else if(strchr(command,'<')!=NULL)
  {
    int flag = execute_indirection(command);
  }
  /*else if(strcmp(command,"hist")==0)
    {
    int flag = execute_hist(command);
    if(flag!=0)
    printf("command unsuccessful\n");
    }*/
    else if(strncmp(command,"hist",4)==0 && strcmp(command,"history")!=0)
    {
      int flag;
      if(command[4]<='9' && command[4]>='1') 
      {
	flag = execute_histn(command);
	if(flag!=0)
	  printf("command unsuccessful\n");
	else
	  addqueue(command,getpid(),0);
      }
      else
      {
	flag = execute_hist(command);
	if(flag!=0)
	  printf("command unsuccessful\n");
	else
	  addqueue(command,getpid(),0);
      }
    }
    else if(strstr(command,"!hist")!=NULL && strcmp(command,"history")!=0)
    {
      int falg = execute_histlast(command);
      if(falg!=0)
	printf("command unsuccessful\n");
      else
      {
	addqueue(command,getpid(),0);
      }
    }
    else if(strcmp(command,"quit")==0)
    {
      exit(0);
    }
    else if(strncmp(command,"pid",3)==0)
    {
      char *req_command = (char*)malloc(100*sizeof(char));
      char *temp;
      char *temp_command = (char*)malloc(100*sizeof(char));
      strcpy(temp_command,command);
      temp = strtok(command," \t");
      int i=0;
      while(temp!=NULL)
      {
	sprintf(req_command+i,"%s",temp);
	i+=strlen(temp);
	sprintf(req_command+i,"%c",' ');
	i++;
	temp = strtok(NULL," \t");
      }
      //sprintf(req_command+i,"\0");
      req_command[i]='\0';
      if(strcmp(req_command,"pid ")==0)
      {
	int flag = execute_pid(req_command);
	if(flag!=0)
	  printf("command unsuccessful\n");
	else
	  addqueue(temp_command,getpid(),0);
      }
      else if(strcmp(req_command,"pid all ")==0)
      {
	int flag = execute_pidall(req_command);
	if(flag!=0)
	  printf("command unsuccessful\n");
	else
	  addqueue(temp_command,getpid(),0);
      }
      else if(strcmp(req_command,"pid current ")==0)
      {
	int flag = execute_pidcurrent(req_command);
	if(flag!=0)
	  printf("command unsuccessful\n");
	else
	  addqueue(temp_command,getpid(),0);
      }
      else
      {
	printf("command not found\n");
      }
    }
    else if(strstr(command,"cd")!=NULL)
    {
      char *dirname = (char*)malloc(50*sizeof(char));
      int i;
      if(command[2]!='\0')
	strcpy(dirname,command+2);
      else
      { 	
	strcpy(dirname,"~");
	if(chdir(actual_path(dirname))<0)
	{
	  perror("error occurred");
	  return ;
	}
	else
	{
	  addqueue(command,getpid(),0);
	  return ;
	}
      }
      for(i=0;i<strlen(dirname);i++)
	if(dirname[i]!=' ' && dirname[i]!='\t')
	  break;
      if(i==strlen(dirname))
      {
	if(chdir(actual_path("~"))<0)
	{
	  perror("error occurred");
	  return ;
	}
	else
	{
	  addqueue(command,getpid(),0);
	  return ;
	}
      }
      else
      {
	dirname = dirname+i;
      }
      //  while(*dirname==' ' || *dirname=='\t')
      //   dirname++;
      for(i=strlen(dirname)-1;i>=0;i--)
	if(dirname[i]!=' ' && dirname[i]!='\t')
	  break;
      dirname[i+1]='\0';
      if(chdir(actual_path(dirname))<0)
      {
	perror("error occurred");
	return ;
      }
      else
	addqueue(command,getpid(),0);
    }
    else if(strchr(command,'>')==NULL && strchr(command,'<')==NULL && strchr(command,'|')==NULL)
    {
      execute_all(command);
    }
    else
    {
      printf("command not found\n");
    }
}
