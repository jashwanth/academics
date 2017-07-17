#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>
#include<dirent.h>
#include<sys/stat.h>
#include<fcntl.h>
int main(int argc, char **argv){
	int i,j,status;
	pid_t pid=fork();
	if (pid==0){
		DIR *dir=opendir(argv[1]);
		if (dir==NULL) printf("Directory does not exist\n");
		else{
			struct dirent *entry;
			while ((entry=readdir(dir))!=NULL){
				int fd=open(entry->d_name,O_RDONLY);
				struct stat fs;
				fstat(fd,&fs);
				printf("%s\t%u\t",entry->d_name,fs.st_size);
				printf( (S_ISDIR(fs.st_mode)) ? "d" : "-");
				printf( (fs.st_mode & S_IRUSR) ? "r" : "-");
				printf( (fs.st_mode & S_IWUSR) ? "w" : "-");
				printf( (fs.st_mode & S_IXUSR) ? "x" : "-");
				printf( (fs.st_mode & S_IRGRP) ? "r" : "-");
				printf( (fs.st_mode & S_IWGRP) ? "w" : "-");
				printf( (fs.st_mode & S_IXGRP) ? "x" : "-");
				printf( (fs.st_mode & S_IROTH) ? "r" : "-");
				printf( (fs.st_mode & S_IWOTH) ? "w" : "-");
				printf( (fs.st_mode & S_IXOTH) ? "x" : "-");
				printf("\n");

			}
		}
	}else{
		printf("Parent");
		wait(&status);
	}
	return 0;
}
