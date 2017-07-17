#include<iostream>
#include<stdio.h>
#include<stdlib.h>
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
int main(int argc,char* argv[])
{
  int counter=0;
  double A[20000][12];
  double three_d[1000][3];
  double two_d[1000][2];
  vector<Point2f> xy_init;
  vector<Point3f> xyz_init;
  Point2f temp1(0,0);
  Point3f temp2(0,0,0);
  xy_init.push_back(temp1);
  xyz_init.push_back(temp2);
//  vector<Point3f> xyz_init;
//  xyz_init.x=0,xyz_init.y=0,xyz_init.z=0;
  vector< vector<Point2f> > v_twod;
  vector< vector<Point3f> > v_threed;
  FILE* fp = fopen( "ImageDetails.txt" , "r" );
  int img_num ;
  int num_of_points;
  int mark=0;
  while (1)
  {
    fscanf(fp,"%d%d",&img_num,&num_of_points);
    if(feof(fp))
      break;
//    printf("%d %d\n",img_num,num_of_points);
    for(int i=0;i<num_of_points;i++)
    {
      for(int j=0;j<2;j++)
	fscanf(fp,"%lf",&two_d[i][j]);
      temp1.x = two_d[i][0];
      temp1.y = two_d[i][1];
      xy_init.clear();
      xyz_init.clear();
      xy_init.push_back(temp1);
      for(int j=0;j<3;j++)
	fscanf(fp,"%lf",&three_d[i][j]);
      temp2.x = three_d[i][0];
      temp2.y = three_d[i][1];
      temp2.z = three_d[i][2];
      xyz_init.push_back(temp2);
      v_twod.push_back(xy_init);
      v_threed.push_back(xyz_init);
      //	printf("%lf\n",two_d[0]);
      //	if (feof(fp)) mark=1;
      A[counter][0] = three_d[i][0],A[counter][1]=three_d[i][1],A[counter][2]=three_d[i][2],A[counter][3]=1;
      A[counter][4] = 0,A[counter][5]=0,A[counter][6]=0,A[counter][7]=0;
      A[counter][8] = -double(two_d[i][0]*three_d[i][0]),A[counter][9]=-double(two_d[i][0]*three_d[i][1]),A[counter][10]=-double(two_d[i][0]*three_d[i][2]),A[counter][11]=-two_d[i][0];
      counter++;
      A[counter][0] = 0,A[counter][1]=0,A[counter][2]=0,A[counter][3]=0;
      A[counter][4] = three_d[i][0],A[counter][5]=three_d[i][1],A[counter][6]=three_d[i][2],A[counter][7]=1;
      A[counter][8] = -double(two_d[i][1]*three_d[i][0]),A[counter][9]=-double(two_d[i][1]*three_d[i][1]),A[counter][10]=-double(two_d[i][1]*three_d[i][2]),A[counter][11]=-two_d[i][1];
      counter++;
     }
     cout << "obj.size " << v_threed.size() << endl;
     cout << "obj[i].size " << v_threed[10].size() << endl;
     cout << "img.size " << v_twod.size() << endl;
     cout << "img[i].size " << v_twod[10].size() << endl;

    /* for(int i=0;i<counter;i++)
       {
       for(int j=0;j<12;j++)
       {
       cout << A[i][j] << ' ';
       }
       cout << endl;
       } */
    Mat m(2*num_of_points,12,CV_64F,A);
    Mat sol;
    //  cout << m << endl;
    SVD::solveZ(m,sol);
    cout << sol << endl;
    counter = 0;
//    Mat m_threed(
 /*   vector<Mat> rvecs,tvecs;
    vector<float> reprojerrs;
    Mat distCoeffs = Mat::zeros(8, 1, CV_64F);
    Mat cameraMatrix = Mat::eye(3, 3, CV_64F);
    Mat image = imread("et000.jpg", CV_LOAD_IMAGE_COLOR);
    double rms = calibrateCamera(v_threed,v_twod,image.size(),cameraMatrix,distCoeffs,rvecs,tvecs,0);*/
  /*  for(int k=0;k<num_of_points;k++)
    {
      vector<Point3f> new_xyz = v_threed[k];
      vector<Point2f> new_xy  = v_twod[k];
      vector<Point2f>::iterator item1=new_xy.begin();
      vector<Point3f>::iterator item2=new_xyz.begin();
      for(item1,item2;item2!=new_xyz.end();item1++,item2++)
	cout << *item1 << ' '<< *item2 << endl;
    } */
    v_threed.clear();
    v_twod.clear();
    cout << rms << endl;
  }
  return 0;
}
