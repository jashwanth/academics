#include <sys/types.h>
#include <dirent.h>
#include<stdio.h>
#include<stdlib.h>
#include<errno.h>


/*
 * * find_file_in_dir - searches the directory 'path' for a
 * * file named 'file'.
 * *
 * * Returns 0 if 'file' exists in 'path' and a nonzero
 * * value otherwise.
 * */
int find_file_in_dir (const char *path, const char *file)
{
	struct dirent *entry;
	int ret = 1;
	DIR *dir;
	dir = opendir (path);
	errno = 0;
	while ((entry = readdir (dir)) != NULL) {
		if (!strcmp(entry->d_name, file)) {
			ret = 0;
			break;
		}
	}
	if (errno && !entry)
		perror ("readdir");
	closedir (dir);
	return ret;
}
int main(int argc, char** argv)
{
	char *path=argv[1];
	char *file=argv[2];
	int ret= find_file_in_dir(path,file);
	printf("%d\n",ret);

	return 0;
}
