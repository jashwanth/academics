#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include<vector>
#include<string>
#include<iomanip>
#include<fstream>
using namespace std;
int main(int argc,char* argv[])
{
  FILE* fp = fopen( "ImageDetails.txt" , "r" );
  int img_num ;
  int num_of_points;
  while (1)
  {
      fscanf(fp,"%d%d",&img_num,&num_of_points);
      if(feof(fp))
	break;
      printf("%d %d\n",img_num,num_of_points);
      for(int i=0;i<num_of_points;i++)
      {
	double two_d[2],three_d[3];
	for(int j=0;j<2;j++)
	  fscanf(fp,"%lf",&two_d[j]);
	for(int j=0;j<3;j++)
	  fscanf(fp,"%lf",&three_d[j]);
//	printf("%lf\n",two_d[0]);
//	if (feof(fp)) mark=1;
      }
    }
  return 0;
}
