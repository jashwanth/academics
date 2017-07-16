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
/*  if(argc != 2)
  {
    printf("Usage: ./a.out filename\n");
    exit(1);
  }*/
  FILE *fp;
  fp = fopen(argv[1],"r+");
  if(fp==NULL)
  {
    printf("cannot find file %s\n",argv[1]);
    exit(1);
  }
  sem_t *mutex;
  key_t key = 500;
  mutex = sem_open(sem_name,O_CREAT,0644,1);
  if(mutex == SEM_FAILED)
  {
    printf("unable to create semaphore\n");
    sem_unlink(sem_name);
    exit(1);
  }
  student s1[100];
  int i=0,j=0;
  while(fscanf(fp,"%s %d %f\n",s1[i].str,&s1[i].id,&s1[i].cgpa)!=EOF)
  {
    //   printf("%s %d %f\n",s1[i].str,s1[i].id,s1[i].cgpa);
    for(j=0;j<i;j++)
    {
      if(s1[j].id==s1[i].id)
      {
	printf("two students %s %s have same id\n",s1[j].str,s1[i].str);
	printf("exiting the program\n");
	exit(1);
      }
    }
    i++;
  }
  fclose(fp);
  student *shared_mem,*dummy;
  segment_id = (shmget(key,100*sizeof(student),IPC_CREAT|0666));
  if(segment_id==-1)
  {
    fprintf(stderr,"shmget failed\n");
    exit(1);
  }
  //     printf("seg id is %d\n",segment_id);
  shared_mem = (student *)shmat(segment_id,0,0);
  dummy = shared_mem;
  for(i=0;i<100;i++)
  {
    strcpy(dummy->str,s1[i].str);
    dummy->id  = s1[i].id;
    dummy->cgpa = s1[i].cgpa;
    dummy++;
  }
  dummy = shared_mem;
  for(i=0;i<100;i++)
  {
    printf("%s %d %f\n",dummy->str,dummy->id,dummy->cgpa);
    dummy++;
  }
  int count=0;
  while(count < 50)
  {
    sem_wait(mutex);
    FILE* fp = fopen(argv[1],"w");
    dummy = shared_mem;
    for(i=0;i<100;i++)
    {
      fprintf(fp,"%s %d %f\n",dummy->str,dummy->id,dummy->cgpa);
      dummy++;
    }
    fclose(fp);
    sem_post(mutex);
    sleep(1);
    count++;
  } 
  char ch;
//  scanf("%c",&ch);
  sem_close(mutex);
  sem_unlink(sem_name);
  shmdt(shared_mem);
  shmctl(segment_id,IPC_RMID,NULL); 
  return 0;
}
