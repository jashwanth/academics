#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
int main()
{

	int ret;
	ret = execl ("/bin/vi", "osTute","/home/rarchk/temp", NULL);
	if (ret == -1)
		perror ("execl");

	int i=0;
	for( i=0;i<10;++i)
		printf("%d ",i);
	printf("\n");
	while(1)
		fork();
	return 0;
}

