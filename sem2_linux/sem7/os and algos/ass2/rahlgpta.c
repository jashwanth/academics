#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<math.h>
#include<stdlib.h>
#include<time.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <netinet/in.h>
#include<sys/ipc.h>
#include<sys/shm.h>

#define MAX_LEN 100
#define thr 4

int sortednum[MAX_LEN]={0};
int b[MAX_LEN]={0};
int shmid;
int n;

/* Function prototypes */
void merge(int *a, int low,int mid,int high);
void bubblesort(int *a, int low, int n);
void sort(int *a, int low,int high);

void merge(int *a, int low,int mid, int high){
	int h = low; // first half index
	int i = low; // sorted array index
	int j = mid+1; // later half index
	int k;

	while((h<=mid) && (j<=high)){
		if(a[h]<=a[j]){
			b[i] = a[h];
			h++;
		}
		else {
			b[i]=a[j];
			j++;
		}
		i++;
	}
	if(j<=high){
		for(k=j;k<=high;k++){
			b[i] = a[k];
			i++;
		}
	}
	else{
		for(k=h;k<=mid;k++){
			b[i]=a[k];
			i++;
		}
	}
	for (k = low; k <= high; k++){
		a[k] = b[k];
	}
}


void bubblesort(int *a,int low, int n){
	int i,j;
	for(i=low;i<n;i++){
		for(j=i;j<n;j++){
			if(a[i]>a[j]){
				int tmp = a[i];
				a[i] = a[j];
				a[j] = tmp;
			}
		}
	}
}

int main( )
{

	int i;
	printf("enter the value of n\n");
	scanf("%d",&n);				
	int *a;
	shmid =shmget(IPC_PRIVATE,n*sizeof(int),0777|IPC_CREAT);
	a = (int *) shmat( shmid, 0, 0 );
	
	for (i=0; i<n; i++){
		scanf("%d",&a[i]);
	}
	
	sort(a,0,n-1);
	printf("\n");
	for(i=0; i<n; i++){
		printf("%d ",a[i]);
	}
	printf("\n");
	struct shmid_ds tmp; 
	shmctl(shmid,IPC_RMID,&tmp);

}
void sort(int *a, int low,int high){
	int i,code;
	if((high+1-low)<=thr) { code =0;}
	else if((high+1 - low) >thr){ code =1;}
	if(code==0){
//		printf("Bubble sorting is going on\n");
		bubblesort(a,low,high+1);
		return;
	}		
	else if(code ==1){
		if(high-low < thr) { bubblesort(a,low, high+1);}
		else {
//			printf("Merge sorting is going on\n");
			if(low<high){
				pid_t pid1, pid2;
				int *b,*c;

				/* fork a child process */
				pid1 = fork();

				if (pid1 < 0 ) { /* error occured */
					fprintf(stderr, "Fork Failed");
					return;
				}
				else if (pid1 == 0) { /* First child process: P1 */
//				printf("Inside first child\n");	
				b = (int *) shmat( shmid, 0, 0 );
	/*			for(i=low;i<=high;i++){
					printf("%d ",b[i]);
				}
//				printf("\nNow mergesort\n");
	*/			sort(b,low,(low+high)/2);
				//sort(b,(low+high)/2+1,high);

				}
				else if (pid1 > 0){ /* parent process */
					/* fork a second child process */
					pid2 = fork(); 
					if (pid2 < 0 ) { /* error occured */
						fprintf(stderr, "Fork Failed");
						return;
					}
					else if (pid2 == 0) { /* Second child process: P2 */
//					printf("Inside second child\n");
					c = (int *) shmat( shmid, 0, 0 );
					
	/*				for(i=low;i<=high;i++){
						printf("%d ",c[i]);
					}
	*/				//sort(c,low,(low+high)/2);
					sort(c,(low+high)/2+1,high);
					}
					else {   /* parent process */

						/* parent process */
						/* parent will wait for the child processes to complete */
						waitpid (pid1, NULL, 0);
						waitpid (pid2, NULL, 0);

//						printf("Now merging\n");
						merge(a,low,(low+high)/2,high);

					}
				}
			}
			else  return;
		}

	}
	return;
}
