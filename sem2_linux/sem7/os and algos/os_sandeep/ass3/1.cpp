#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>
#include<vector>
#include<stdlib.h>
#include<cstring>
#include<algorithm>
using namespace std;

int n,m,avai_art[100],reject[100][100];
vector<int> ans[100],list;
sem_t list_lock,available;

void *publish(void *arg){
	int i,editor=((int)arg);
	//editor number is given as arg
	while (true){
		int art_no;
		sem_wait(&list_lock);//not used articles list is locked
		if (list.size()==0){//if the size of list is zero
			int count=0;//check if there are no available articles at all i.e. all are published or rejected
			sem_wait(&available);
			for (i=1;i<=m;i++){
				if (avai_art[i] or reject[editor][i]) count++;
			}
			sem_post(&available);
			sem_post(&list_lock);
			if (count==m) break;//if it is so then break
			else continue;
		}
		int x=rand()%list.size();
		art_no=list[x];//take a random article from the available list
		if (reject[editor][art_no]){//if it is rejected then check again and break if it so
			int count=0;
			sem_wait(&available);
			for (i=1;i<=m;i++){
				if (avai_art[i] or reject[editor][i]) count++;
			}
			sem_post(&available);
			sem_post(&list_lock);
			if (count==m){
				break;
			}else continue;
		}
		list.erase(list.begin()+x);//if it is being used remove it from the list
		sem_post(&list_lock);
		sleep(1);
		int accept=rand()%2;
		if (accept){
			ans[editor].push_back(art_no);
			avai_art[art_no]=1;
		}else{
			reject[editor][art_no]=1;
			sem_wait(&list_lock);
			list.push_back(art_no);
			sem_post(&list_lock);
		}
		int count=0;
		sem_wait(&available);
		for (i=1;i<=m;i++){
			if (avai_art[i] || reject[editor][i]) count++;
		}
		sem_post(&available);
		if (count==m) break;
	}
}

int main(int argc,char **argv){
	n=atoi(argv[1]);
	m=atoi(argv[2]);
	pthread_t reader[n+1];
	int i,j;
	memset(reject,0,sizeof(reject));//rejected articles by each reader or editor
	memset(avai_art,0,sizeof(avai_art));//available articles(articles that are not published and not being used by anyone)available artciles are marked by zero
	for (i=1;i<=m;i++) list.push_back(i);//list of not used articles
	sem_init(&list_lock,0,1);//semaphore for accessing the list of available articles
	sem_init(&available,0,1);//semaphore for altering the available articles
	for (i=1;i<=n;i++) pthread_create(&reader[i],NULL,publish,(void *)i);//separate thread for each reader or editor
	for (i=1;i<=n;i++) pthread_join(reader[i],NULL);
/*	printf("articles not used:\n");
	for (i=1;i<=m;i++) if (avai_art[i]==0) printf("%d ",i);
	printf("\n");
	printf("\narticles published by editors\n");
	for (i=1;i<=n;i++){
		printf("%d : ",i);
		sort(ans[i].begin(),ans[i].end());
		for (j=0;j<(int)ans[i].size();j++){
			printf("%d ",ans[i][j]);
		}
		printf("\n");
	}
	printf("\narticles rejected by editors\n");
	for (i=1;i<=n;i++){
		printf("%d : ",i);
		for (j=1;j<=m;j++) if (reject[i][j]==1) printf("%d ",j);
		printf("\n");
	}
	printf("\n");*/
	for (i=1;i<=m;i++){
		for (j=0;j<(int)ans[i].size();j++) printf("%d ",ans[i][j]);
		printf("\n");
	}
	return 0;
}
