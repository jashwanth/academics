/***************************************************
 Problem: Creating a seperate process using the UNIX
          fork() system call 
Create three child processes say P1, P2 and P3. P1 makes a
file (file1.txt) with 5 integers in between 50 and 100,
and P2 makes a file (file2.txt) with 10 integers in 
between 150 and 200. P3 will list these two files.
****************************************************/

#include<sys/types.h>
#include<sys/ipc.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<time.h>

int main ( )
{
pid_t pid1, pid2, pid3;
int i, x;
FILE * fp;
   
   /* fork a child process */
   pid1 = fork();

   if (pid1 < 0 ) { /* error occured */
    fprintf(stderr, "Fork Failed");
    return 1;
   }
   else if (pid1 == 0) { /* First child process: P1 */
     fp = fopen("file1.txt", "w+");
     if (fp == NULL) {
      fprintf(stderr, "File opened failed at child process: P1");
      exit(0);
     }
     for (i = 0; i < 5; i++) {
       srand( (unsigned int) time (NULL) + rand() % 1000);
       x = rand() % 50 + 50;
       fprintf(fp, "%d\n", x);
     }
     fclose(fp);
   }
  else if (pid1 > 0){ /* parent process */
      /* fork a second child process */
   pid2 = fork(); 
   if (pid2 < 0 ) { /* error occured */
    fprintf(stderr, "Fork Failed");
    return 1;
   }
   else if (pid2 == 0) { /* Second child process: P2 */
     fp = fopen("file2.txt", "w+");
     if (fp == NULL) {
      fprintf(stderr, "File opened failed at child process: P2");
      exit(0);
     }
     for (i = 0; i < 10; i++) {
       srand( (unsigned int) time (NULL) + rand() % 1000);
       x = rand() % 50 + 150;
       fprintf(fp, "%d\n", x);
     }
     fclose(fp);
   }
   else {   
    /* fork a third child process */
   pid3 = fork(); 
   if (pid3 < 0 ) { /* error occured */
    fprintf(stderr, "Fork Failed");
    return 1;
   }
   else if (pid3 == 0) { /* Third child process: P3 */
   execl("/bin/ls", "ls -l", NULL);  
   }
   else { /* parent process */
   /* parent will wait for the child processes to complete */
   waitpid (pid1, NULL, 0);
   waitpid (pid2, NULL, 0);
   waitpid (pid3, NULL, 0);
   printf("Childs Completed\n");
   }
  }
 }
  return 0;
}
