#include <stdio.h>
#include <sys/ipc.h>
int main( )
{
  int i;
  if (fork( ) == 0) { /* Child */
    while (1) {
      for (i=0; i<100000; i++) ;
       sleep(4);
      printf("\t\t\t Child executing\n ");
    }
  }
  else {
    /* Parent */
    while (1) {
      for (i=0; i<100000; i++) ;
       sleep(7);
      printf("Parent executing\n"); }
  }
}

