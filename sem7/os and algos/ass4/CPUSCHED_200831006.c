#include<stdio.h>
#include<stdlib.h>

#define MAX_LEN 1000
int n;
int waitTime[MAX_LEN];

void swap(int *a,int *b);
float Average_Waiting(int waitTime[n], int n);

void FCFS(int process[n],int bTime[n],int n);
void NPSJF(int process[n],int aTime[n],int bTime[n],int n);
void NPP(int process[n], int aTime[n],int bTime[n],int priority[n],int n);

void swap(int *a,int *b){
	int temp;
	temp=*a;
	*a=*b;
	*b=temp;
}

float Average_Waiting(int waitTime[n], int n)
{
	int i,sum=0;
	float avg;
	for(i=1;i<=n;i++){
		sum+=waitTime[i];
	}
	avg = (sum*1.0)/(n*1.0);
	return avg;
}

void FCFS(int process[n],int bTime[n],int n)
{
	int i;
	int time=0;
	int waitTime[n];
	int chart[n];
	for(i=1;i<=n;i++)
	{
		waitTime[i]=time;
		chart[i]=process[i];
		time+=bTime[i];
	}
	printf("\nProcess:   "); 
	printf("Wait Time ");
	for(i=1;i<=n;i++){
		printf("%d ",chart[i]);
		printf("%d\n",waitTime[i]);
	}
	float avg = Average_Waiting(waitTime,n);
	printf("Avg. waiting time:\t%f",avg);
}

void NPSJF(int process[n],int aTime[n],int bTime[n],int n)
{
	int i,j,k;
	int chart[n];
	int waitTime[n];
	int done[n];
	for(i=1;i<=n;i++){
	done[i] = 0;
	}
	waitTime[1] = 0;
	done[1] = 1;
	chart[1] = 1;
	int bTimeb = bTime[1],waitb = waitTime[1],aTimeb = aTime[1];
	for(k=2;k<=n;k++){ 	// from process 2
		int tmp = bTime[k-1]+aTime[k-1];
		for(i=k;i<=n;i++){ // from 1 to n
			for(j=i+1;j<=n;j++){
				if(bTime[i]>bTime[j] && aTime[i]<=tmp && aTime[j]<=tmp){
					swap(&aTime[i],&aTime[j]);
					swap(&process[i],&process[j]);
					swap(&bTime[i],&bTime[j]);
					swap(&done[i],&done[j]);
				}
			}
		}
		if(done[k] == 0){		
			chart[k]= process[k];
			waitTime[k] = aTimeb + waitb + bTimeb- aTime[k];
			done[k] = 1;
			aTimeb= aTime[k];
			waitb = waitTime[k];
			bTimeb = bTime[k];
		}
	}
	
	printf("\nProcess:   "); 
	printf("Wait Time ");
	for(i=1;i<=n;i++){
		printf("%d ",chart[i]);
		printf("%d\n",waitTime[i]);
	}
	float avg = Average_Waiting(waitTime,n);
	printf("Avg. waiting time:\t%f\n",avg);
		
}
void NPP(int process[n], int aTime[n],int bTime[n],int priority[n],int n){
	int i,j;
	for(i=1;i<=n;i++){
		for(j=i+1;j<=n;j++){
			if(priority[i]>priority[j]){
				swap(&process[i],&process[j]);
				swap(&aTime[i],&aTime[j]);
				swap(&bTime[i],&bTime[j]);
				swap(&priority[i],&priority[j]);
			}
		}
	}
	int waitTime[n];
	int chart[n];
	int time=0;
	for(i=1;i<=n;i++)
	{
		waitTime[i]=time;
		chart[i]=process[i];
		time+=bTime[i];
	}
	printf("\nProcess:   "); 
	printf("Wait Time ");
	for(i=1;i<=n;i++){
		printf("%d ",chart[i]);
		printf("%d \n",waitTime[i]);
	}
	float avg = Average_Waiting(waitTime,n);
	printf("Avg. waiting time:\t%f",avg);
}
void main(){

	int i,j,k,n;
	int process[n],aTime[n],bTime[n],priority[n],choice;
	while(1)
	{
		printf("Enter the no. of processes\n");
		scanf("%d",&n);
		printf("Now enter the process no., its arrival time, brust time, priority respectively\n");
		for(i=1;i<=n;i++){
			scanf("%d%d%d%d",&process[i],&aTime[i],&bTime[i],&priority[i]);
		}
		printf("Press 0 to Exit\nPress 1 for FCFS\nPress 2 for Non-preemptive SJF\nPress 3 for Preemptive SJF\nPress 4 for Non-preemptive priority\nPress 5 for Preemptive priority\nPress 6 for Round Robin\nPress 7 for Performance Comparison\n\n\t Enter your Choice:");
		scanf("%d",&choice);
		switch(choice)
		{
			case 1:
				FCFS(process,bTime,n);
				break;
			case 2:
				NPSJF(process,aTime,bTime,n);
				break;
			case 3:
				break;
			case 4:
				NPP(process,aTime,bTime,priority,n);
				break;
			case 5:
				break;
			case 6:
				break;
			case 7:
				break;
			case 0:
				exit(0);
			default:
				printf("Error input\n");
				break;
		}
	}
}
