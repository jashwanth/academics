/* getenv example: getting path */
#include <stdio.h>
#include <stdlib.h>

int main ()
{
	char * pPath;
	pPath = getenv ("PATH");
	if (pPath!=NULL)
		printf ("The current path is: %s\n\n",pPath);

	pPath = getenv ("PWD");
	if (pPath!=NULL)
		printf ("The current working directory is: %s\n",pPath);
	return 0;
}
