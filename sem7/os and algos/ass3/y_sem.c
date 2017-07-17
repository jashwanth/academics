#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<time.h>
#include<signal.h>
#include<string.h>
#include<semaphore.h>
#include<pthread.h>
#include<fcntl.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<sys/ipc.h>
#include<sys/shm.h>
#include<sys/sem.h>
typedef struct student
{
  char str[21];
  int id;
  float cgpa;
}student;
int segment_id;
char sem_name[]={"my_sem"};
int main (int argc,char* argv[])
{
  sem_t *mutex;
  key_t key = 500;
  mutex = sem_open(sem_name,O_CREAT,0644,1);
  if(mutex == SEM_FAILED)
  {
    printf("unable to execute	 semaphore\n");
    sem_close(mutex);
    exit(1);
  }
  int i=0,j=0;
  student *shared_mem,*dummy;
  segment_id = (shmget(key,100*sizeof(student),0666));
  if(segment_id==-1)
  {
    fprintf(stderr,"shmget failed\n");
    exit(1);
  }
  //     printf("seg id is %d\n",segment_id);
  shared_mem = (student *)shmat(segment_id,0,0);
  int ser_num;
  for(i=0;i<10;i++)
  {
    printf("enter the serial number of student whose cgpa needs to be changed(range is 0-99)\n");
    scanf("%d",&ser_num);
    dummy = shared_mem + ser_num;
    sem_wait(mutex);
    dummy->cgpa = dummy->cgpa+1;
    sem_post(mutex);
  }
/*  shared_mem = (student *)shmat(segment_id,0,0);
  for(i=0;i<100;i++)
  {
    printf("%s %d %f\n",shared_mem->str,shared_mem->id,shared_mem->cgpa);
    shared_mem++;
  }*/

  sem_close(mutex);
  sem_unlink(sem_name);
  shmdt(shared_mem);
  shmctl(segment_id,IPC_RMID,NULL); 
  return 0;
}
