#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>

typedef struct {
  int x;
  int y;
} item ;

int main()
{
   int shmid, i;
   int pid;
   item *a, *b;

   /* Acquire a shared item of 2 integers */
   shmid = shmget( IPC_PRIVATE,
                   sizeof(item), 0777|IPC_CREAT);
   if ((pid = fork()) == 0) {       /* Child */
         b = (item *) shmat( shmid, 0, 0 ); /* Attach to child */
         for( i=0; i< 10; i++) {
                  sleep(1);
                  printf("\t\t\t Child reads: %d,%d\n", b->x, b->y);
   }     }
   else {                  /* Parent */
         a = (item *) shmat( shmid, 0, 0 ); /* Attach to parent */
         a->x = 0; a->y = 1;
         for( i=0; i< 10; i++) {
                  sleep(1); 
                  a->x = a->x + a->y; 
                  a->y = a->x + a->y;
                  printf("Parent writes: %d,%d\n", a->x, a->y);
         }
         waitpid( pid );
  }
  return 0;
}
