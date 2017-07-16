#include <stdio.h>
#include <stdlib.h>
main()
{
	int noints, i, sum, loop;
	char *arr;
	arr = malloc(1<<31);
	if (arr == NULL){
		printf("Unable to allocate memory\n");
		exit(0);
	}
	noints = 1 << 28;
	for(loop = 0; loop <= 20; ++loop)
		for(i = 0; i < noints; ++i)
			sum = sum + (int *) arr[i];
	printf(" Garbage sum: %d \n", sum);
}

