#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include<ctime>
#include<vector>
#include<string>
#include<iomanip>
#include<fstream>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/calib3d/calib3d.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
using namespace std;
using namespace cv;
struct point_info
{
  Point2f two_d;
  Point3f three_d;
};
struct image_info
{
  int img_num;
  int num_of_points;
  vector<point_info> v_point;
};
int main(int argc,char* argv[])
{
  vector< vector<image_info> > all_image;
  int counter=0,num_of_images=0,i,j,k;
  float A[20000][12];
  FILE* fp = fopen( "ImageDetails.txt" , "r" );
  while (1)
  {
    image_info image_scan;
    vector<image_info> v_image_scan;
    point_info point_scan;
    fscanf(fp,"%d%d",&image_scan.img_num,&image_scan.num_of_points);
    if(feof(fp))
      break;
//    printf("%d %d\n",img_num,num_of_points);
    num_of_images++;
    for(i=0;i<image_scan.num_of_points;i++)
    {
	fscanf(fp,"%f%f%f%f%f",&point_scan.two_d.x,&point_scan.two_d.y,&point_scan.three_d.x,&point_scan.three_d.y,&point_scan.three_d.z);
        image_scan.v_point.push_back(point_scan);
    }
    v_image_scan.push_back(image_scan);
    all_image.push_back(v_image_scan);
    v_image_scan.clear();
    image_scan.v_point.clear();
  }
  fclose(fp);
  //  checked and vimdiff of imagedetails and out worked fine :)
/*  cout << "total images " << num_of_images << endl;
  vector<image_info> v_print;
  vector<image_info>::iterator it_v_print;
  for(i=0;i<num_of_images;i++)
  {
    v_print = all_image[i];
    it_v_print = v_print.begin();
    cout << it_v_print->img_num << ' ' << it_v_print->num_of_points << endl;
    vector<point_info>::iterator it_point = it_v_print->v_point.begin();
    for(it_point;it_point!=it_v_print->v_point.end();it_point++)
      cout << it_point->two_d.x << ' ' << it_point->two_d.y << ' ' << it_point->three_d.x << ' ' << it_point->three_d.y << ' '<< it_point->three_d.z << endl;
  }   */ 

 // DLT 
  int ci=0; //choose img_no
  vector<image_info>::iterator i_p = all_image[ci].begin();
  int img_num_of_points = i_p->v_point.size();
//  cout << img_num_of_points << endl;
  srand(time(NULL));
  for(i=0;i<6;i++)
  {
    int r_num = rand()%img_num_of_points;
    A[counter][0]= it_pr
    A[counter][1]=three_d[i][1];
    A[counter][2]=three_d[i][2];
    A[counter][3]=1;
    A[counter][4]=0;
    A[counter][5]=0;
    A[counter][6]=0;
    A[counter][7]=0;
    A[counter][8]=  -double(two_d[i][0]*three_d[i][0]);
    A[counter][9]=  -double(two_d[i][0]*three_d[i][1]);
    A[counter][10]= -double(two_d[i][0]*three_d[i][2]);
    A[counter][11]= -two_d[i][0];
    counter++;
    A[counter][0]=0;
    A[counter][1]=0;
    A[counter][2]=0,
    A[counter][3]=0;
    A[counter][4]= three_d[i][0];
    A[counter][5]= three_d[i][1];
    A[counter][6]= three_d[i][2];
    A[counter][7]=1;
    A[counter][8]=  -double(two_d[i][1]*three_d[i][0]);
    A[counter][9]=  -double(two_d[i][1]*three_d[i][1]);
    A[counter][10]= -double(two_d[i][1]*three_d[i][2]),A[counter][11]=-two_d[i][1];
    counter++;


  return 0;
}
