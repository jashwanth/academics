#include<stdio.h> 
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<errno.h>
#include <dirent.h>

int main(int argc, char* argv[])
{
	DIR* a = opendir(argv[1]);                          // Opens a directory stream
	struct dirent *b;

	while((b = readdir(a))){                            // Returns the structure beloging to the next file in the list
		printf("%s ", b->d_name);
	}
	printf("\n");

	closedir(a);                                        // Closes the directory stream 
	return 0;
}

