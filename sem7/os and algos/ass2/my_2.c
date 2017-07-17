#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<time.h>
#include<signal.h>

#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/shm.h>

int segment_id,n;
pid_t parent_pid;
void bubblesort(int a[])
{
  int i,j,temp,index;
  for(j=n-1;j>=0;j--)
  {
    for(i=0;i<j;i++)
    {
      if(i+1<=j && a[i]>a[i+1])
      {
	temp = a[i];
	a[i] = a[i+1];
	a[i+1]=temp;
      }
    }
  }
}
void msort(int l,int r)
{
  if(l<r)
  {
    pid_t pid1,pid2;
    int center = l + (r-l)/2,size_arr = r-l+1;
    pid1=fork();
    if(pid1==0) // child
    {
     msort(l,center);
//     kill(0,SIGTERM);
//	exit(1);
    }
    else // parent
    {
      pid2 = fork();
      if(pid2==0){
        msort(center+1,r) ;
//	kill(0,SIGTERM);
//	exit(1);
      }
      else
      {   // parent 
//	int status;
//        waitpid(-1,&status,0);
	waitpid(pid2,NULL,0);
	waitpid(pid1,NULL,0);
        int lpos = l,lstrt = l,lend = center ,rstrt = center+1,rend = r,i=0,size_arr=r-l+1;
        int *tmp = (int *)malloc(size_arr*sizeof(int));
        int *p = (int *)shmat(segment_id,0,0);
         while(lstrt <= lend && rstrt <= rend)
         {
	   if(p[lstrt] <= p[rstrt])
	     tmp[i++] = p[lstrt++];
	   else if(p[rstrt] < p[lstrt])
	     tmp[i++] = p[rstrt++];
         }
         while(lstrt <= lend)
        	tmp[i++] = p[lstrt++];
         while(rstrt <= rend)
	        tmp[i++] = p[rstrt++];
         for(i=0;i<size_arr;i++,lpos++)
           p[lpos] = tmp[i];
          free(tmp);
          shmdt(p);
	  if(parent_pid!=getpid())
	    exit(1);
//	  kill(pid1,SIGKILL);
//	  kill(pid2,SIGKILL);
        }
     }
   }
}
int main ()
{
   int i,j,a[1000];
//   int *a;
    while(1){
    scanf("%d",&n);
//   {
//     a = (int*)malloc((n+10)*sizeof(int));
     for(i=0;i<n;i++)
       scanf("%d",&a[i]);
 //    printf("HELLO");
     parent_pid = getpid();
  /*   if(n<20)
     {
       bubblesort(a);
       for(i=0;i<n;i++)
        printf("%d%c",a[i],i==n-1?'\n':' ');
      // continue;
     }*/
//     else{
     int *shared_mem;
     segment_id = (shmget(IPC_PRIVATE,n,0777|IPC_CREAT));
      if(segment_id==-1){
        fprintf(stderr,"shmget failed\n");
	exit(1);
      }
 //     printf("seg id is %d\n",segment_id);
      shared_mem = (int *)shmat(segment_id,0,0);
      for(i=0;i<n;i++)
	shared_mem[i]=a[i];
      msort(0,n-1);
      if(parent_pid==getpid()){
       for(i=0;i<n;i++)
        printf("%d%c",shared_mem[i],i==n-1?'\n':' ');
       shmdt(shared_mem);
       shmctl(segment_id,IPC_RMID,NULL);
      }
//     }
//      free(a);
   }
  return 0;
}
