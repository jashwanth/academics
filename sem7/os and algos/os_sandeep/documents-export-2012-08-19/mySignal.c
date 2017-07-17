// Author -- Ics231 Tas 
// About -- Signal interrupts, a way to handle 

// general libs to invoke sys calls 
#include<stdio.h> 
#include<unistd.h>
#include<sys/types.h>
#include<sys/ptrace.h>
#include<sys/stat.h> 
#include<signal.h>
void sig_handler(int signo)
{
	  if (signo == SIGINT)
		      printf("received SIGINT\n");
}

int main(void)
{
	  if (signal(SIGINT, sig_handler) == SIG_ERR)
		    printf("\ncan't catch SIGINT\n");
	    // A long long wait so that we can easily issue a signal to this process
	       while(1) 
	           sleep(1);
	             return 0;
	             }
