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
int main (int argc,char* argv[])
{
  if(argc != 2)
  {
    printf("Usage: ./a.out filename\n");
    exit(1);
  }
  FILE *fp;
  fp = fopen(argv[1],"r+");
  if(fp==NULL)
  {
    printf("cannot find file %s\n",argv[1]);
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
  student *shared_mem;
  segment_id = (shmget(IPC_PRIVATE,100*sizeof(student),0777|IPC_CREAT));
  if(segment_id==-1)
  {
    fprintf(stderr,"shmget failed\n");
    exit(1);
  }
  //     printf("seg id is %d\n",segment_id);
  shared_mem = (student *)shmat(segment_id,0,0);
  for(i=0;i<100;i++)
  {
    strcpy(shared_mem->str,s1[i].str);
    shared_mem->id  = s1[i].id;
    shared_mem->cgpa = s1[i].cgpa;
    shared_mem++;
  }
  shared_mem = (student *)shmat(segment_id,0,0);
  for(i=0;i<100;i++)
  {
    printf("%s %d %f\n",shared_mem->str,shared_mem->id,shared_mem->cgpa);
    shared_mem++;
  }
  shmdt(shared_mem);
  shmctl(segment_id,IPC_RMID,NULL); 
  return 0;
}
