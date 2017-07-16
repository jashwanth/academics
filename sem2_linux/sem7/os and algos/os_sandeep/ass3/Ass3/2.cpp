#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>
#include<vector>
#include<stdlib.h>
#include<cstring>
#include<algorithm>
#include<queue>
using namespace std;

int n,m;
queue<int> q;
sem_t students,scrotch[101];
int stu_time[101],scrotch_time[101];

void *washing(void *arg){
	int tap=((int)arg);//tap number is taken as argument
	while (true){
		int student;
		//waiting for students queue to be accessed
		sem_wait(&students);
		//if students queue is empty the loop needs to break
		if (q.empty()){
			sem_post(&students);
			break;
		}
		student=q.front();
		q.pop();
		sem_post(&students);//unlocking the students queue
		//first the plate and spoon are together washed with scrotch
		while (1){
			if (tap==1){//if the tap is the first one only one scrotch i.e. scrotch number 1 could be used
				sem_wait(&scrotch[1]);//waiting for scrotch one
				stu_time[student]=scrotch_time[1]=max(stu_time[student],scrotch_time[1]);//time for student and scrotch becomes the maximum of two
				sleep(6);//time for washing the plate and spoon with scrotch
				stu_time[student]+=6;
				scrotch_time[1]+=6;
				sem_post(&scrotch[1]);//unlocking the semaphore of scrotch
				break;//the washing of both the utensils with scrotch is done
			}else if (tap==n){//if the tap is last only the scrotch before it could be used
				sem_wait(&scrotch[n-1]);//waiting for the last scrotch
				stu_time[student]=scrotch_time[n-1]=max(stu_time[student],scrotch_time[n-1]);//time for student and scrotch becomes max of the two
				sleep(6);//time for washing the plate and spoon with scrotch
				stu_time[student]+=6;
				scrotch_time[n-1]+=6;
				sem_post(&scrotch[n-1]);//unlocking the semaphore
				break;//the washing of both the utensils with scrotch is done
			}else{
				int try1,try2;
				try1=try2=1;
				try1=sem_trywait(&scrotch[tap-1]);//trying if scrotch before the tap is free
				if (try1<0) try2=sem_trywait(&scrotch[tap]);///if the scrotch before it is not free try the next one
				if (try1<0 and try2<0) continue;//if both are not free loop again
				if (try1==0){//if the previous scrotch is free
					stu_time[student]=scrotch_time[tap-1]=max(stu_time[student],scrotch_time[tap-1]);//time is set accordingly
					sleep(6);//time for washing both the utensild with scrotch
					stu_time[student]+=6;
					scrotch_time[tap-1]+=6;
					sem_post(&scrotch[tap-1]);//unlocking the scrotch
					break;
				}else if (try2==0){//same as above but with next scrotch
					stu_time[student]=scrotch_time[tap]=max(stu_time[student],scrotch_time[tap]);
					sleep(6);
					stu_time[student]+=6;
					scrotch_time[tap]+=6;
					sem_post(&scrotch[tap]);
					break;
				}
			}
		}
		sleep(6);//time for washing plate and spoon with water
		stu_time[student]+=6;//students time is set accordingly
		//the mechanism for washing glass
		//mechanism is same as above but washing time with both scrotch and water takes 3 seconds
		while (1){
			if (tap==1){
				sem_wait(&scrotch[1]);
				stu_time[student]=scrotch_time[1]=max(stu_time[student],scrotch_time[1]);
				sleep(3);
				stu_time[student]+=3;
				scrotch_time[1]+=3;
				sem_post(&scrotch[1]);
				break;
			}else if (tap==n){
				sem_wait(&scrotch[n-1]);
				stu_time[student]=scrotch_time[n-1]=max(stu_time[student],scrotch_time[n-1]);
				sleep(3);
				stu_time[student]+=3;
				scrotch_time[n-1]+=3;
				sem_post(&scrotch[n-1]);
				break;
			}else{
				int try1,try2;
				try1=try2=1;
				try1=sem_trywait(&scrotch[tap-1]);
				if (try1<0) try2=sem_trywait(&scrotch[tap]);
				if (try1<0 and try2<0) continue;
				if (try1==0){
					stu_time[student]=scrotch_time[tap-1]=max(stu_time[student],scrotch_time[tap-1]);
					sleep(3);
					stu_time[student]+=3;
					scrotch_time[tap-1]+=3;
					sem_post(&scrotch[tap-1]);
					break;
				}else if (try2==0){
					stu_time[student]=scrotch_time[tap]=max(stu_time[student],scrotch_time[tap]);
					sleep(3);
					stu_time[student]+=3;
					scrotch_time[tap]+=3;
					sem_post(&scrotch[tap]);
					break;
				}
			}
		}
		sleep(3);
		stu_time[student]+=3;
	}
}
int main(int argc,char **argv){
	n=atoi(argv[1]);
	m=atoi(argv[2]);
	pthread_t taps[n+1];
	int i;
	for (i=1;i<=m;i++) q.push(i),stu_time[i]=0;
	sem_init(&students,0,1);//semaphore for locking students queue
	for (i=1;i<n;i++) sem_init(&scrotch[i],0,1);//semaphore for each scrotch
	for (i=1;i<=n;i++) scrotch_time[i]=0;
	for (i=1;i<=n;i++) pthread_create(&taps[i],NULL,washing,(void *)i);//separate thread for each of the taps
	for (i=1;i<=n;i++) pthread_join(taps[i],NULL);
	for (i=1;i<=m;i++) printf("%d\n",stu_time[i]);
	return 0;
}
