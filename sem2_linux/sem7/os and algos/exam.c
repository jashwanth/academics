#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
int val = 5;
int main()
{
  pid_t pid;
  pid = fork();
  if(pid<0)
  {
//    fprintf("stderr,Fork failed");
    return 1;
  }
  else if(pid==0)
  {
    val+=15;
    printf("child val= %d\n",val);
    return 0;
  }
  else if(pid>0)
  {
 //   waitpid(pid,NULL,0);
    wait (NULL);
    printf("parent val= %d\n",val);
    return 0;
  }
}


