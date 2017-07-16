/*******************************************************************
This code does Prefix sum in parallel by Up-sweep Down-sweep method
N is the number of elements in the input array
NUM_THREADS is the number of threads that execute in parallel

Intermiate results after Up-sweep and Down-sweep can be printed by uncommenting the print_array calls

*******************************************************************/


#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<omp.h>

#define N 1048576		// 2 to the power 20
#define NUM_THREADS 3

int ** arr;
struct timeval T;
long long int start, end;


// This function prints the 2D array uptil height H
void print_array(int ** arr, int H)
{
	int n=N;
	int i,j;

	for(i=0; i<H; i++)
	{
		for(j=0; j<n/pow(2,i); j++)
		{
			printf("%d ",arr[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}


int main()
{
	int n = N;
	int H = (int)(log(n)/log(2)) + 2;

	int i,j,h;

	omp_set_num_threads(NUM_THREADS);	// number of threads that will execute in parallel


	//Memory Allocation
	arr = (int **)calloc(H, sizeof(int*));
	for(i=0; i<H; i++)
		arr[i] = (int*)calloc(n, sizeof(int));
	

	//Random Initialisation
	for(j=0; j<n; j++)
		arr[0][j] = rand() % 100;

	//after initialising....
	//print_array(arr, 1);
	

	// START TIMER
	gettimeofday(&T, 0);
	start = T.tv_sec * pow(10,6) + T.tv_usec;
	
	int limit;


	// UP_SWEEP
	for(h=1; h<H; h++)
	{
	limit = n/pow(2,h);
#pragma omp parallel for firstprivate(arr, h) private(j)
		for(j=0; j<limit; j++)
			arr[h][j] = arr[h-1][2*j+1] + arr[h-1][2*j];
	
	}
		
	//After Up-sweep....
	//print_array(arr, H);


	//DOWN-SWEEP
	for(h=H-1; h>=0; h--)
	{
	limit = n/pow(2,h);
#pragma omp parallel for firstprivate(arr, h) private(j)
		for(j=0; j<limit; j++)
		{
			if(j==0)
				arr[h][j] = arr[h][j];			

			else if(j%2 != 0)
				arr[h][j] = arr[h+1][j/2];		

			else
				arr[h][j] = arr[h+1][j/2 - 1] + arr[h][j];
		}
	}
	
	//END TIMER
	gettimeofday(&T, 0);
	end = T.tv_sec * pow(10,6) + T.tv_usec;

	//Final RESULT....
	//print_array(arr, 1);
	
	printf("Time taken by the program = %lld micro-sec\n", end- start);
	
	return 0;
}
