#include <stdio.h>
#include <stdlib.h>
#include <time.h>

main()
{
 int noints, i, sum, loop;

 	srand( time(NULL) );

	char *arr;
	arr = malloc(1<<30);
	if (arr == NULL){
		printf("Unable to allocate memory\n");
		exit(0);
	}

	noints = 1 << 28;
	arr = arr + 2;
	for(i = 0; i < noints; ++i)
		sum = sum + (int *) arr[rand() % (noints-1)];

	printf(" Garbage sum: %d \n", sum);
}

