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
  int num_of_points;
  vector<point_info> v_point;
};
map<int,image_info>  a_m;
float A[20000][12];

Mat build_matrix(int loop,int ci,int random)
{
  int i,i1,c = 0;
  srand(time(NULL));
  for(i = 0;i<loop;i++)
  {
    i1 = i;
    if(random==1)
    {
      i1 = rand()% a_m[ci].v_point.size();
    }
    A[c][0]   = a_m[ci].v_point[i1].three_d.x;
    A[c][1]   = a_m[ci].v_point[i1].three_d.y;
    A[c][2]   = a_m[ci].v_point[i1].three_d.z;
    A[c][3]   = 1;
    A[c][4]   = 0;
    A[c][5]   = 0;
    A[c][6]   = 0;
    A[c][7]   = 0;
    A[c][8]   = -float(a_m[ci].v_point[i1].two_d.x*a_m[ci].v_point[i1].three_d.x);
    A[c][9]   = -float(a_m[ci].v_point[i1].two_d.x*a_m[ci].v_point[i1].three_d.y);
    A[c][10]  = -float(a_m[ci].v_point[i1].two_d.x*a_m[ci].v_point[i1].three_d.z);
    A[c][11]  = -a_m[ci].v_point[i1].two_d.x;
    c++;
    A[c][0]   = 0;
    A[c][1]   = 0;
    A[c][2]   = 0;
    A[c][3]   = 0;
    A[c][4]   = a_m[ci].v_point[i1].three_d.x;
    A[c][5]   = a_m[ci].v_point[i1].three_d.y;
    A[c][6]   = a_m[ci].v_point[i1].three_d.z;
    A[c][7]   = 1;
    A[c][8]   = -float(a_m[ci].v_point[i1].two_d.y*a_m[ci].v_point[i1].three_d.x);
    A[c][9]   = -float(a_m[ci].v_point[i1].two_d.y*a_m[ci].v_point[i1].three_d.y);
    A[c][10]  = -float(a_m[ci].v_point[i1].two_d.y*a_m[ci].v_point[i1].three_d.z);
    A[c][11]  = -a_m[ci].v_point[i1].two_d.y;
    c++;
  }
  Mat Ap = Mat(2*loop,12,CV_32FC1,A);
  Mat x = Mat_<float>(12,1);
  SVD::solveZ(Ap,x);
  Mat Pcam = x.reshape(0,3);
  return Pcam;
}

float proj_error(Mat Pcam,int ci)
{
  int i,j,n_o_i;
  n_o_i = a_m[ci].v_point.size();
  float error = 0;
  for(i=0;i<n_o_i;i++)
  {
    Mat x = (Mat_<float>(4,1) << a_m[ci].v_point[i].three_d.x,a_m[ci].v_point[i].three_d.y,a_m[ci].v_point[i].three_d.z,1);
    Mat proj_mat = Pcam*x;
    float twoarr[2];
    Mat given_img = (Mat_<float>(2,1) << a_m[ci].v_point[i].two_d.x,a_m[ci].v_point[i].two_d.y);
    twoarr[0] = (float)(proj_mat.at<float>(0,0) / proj_mat.at<float>(2,0));
    twoarr[1] = (float)(proj_mat.at<float>(1,0) / proj_mat.at<float>(2,0));
    Mat cal_img   = (Mat_<float>(2,1) << twoarr[0],twoarr[1]);
    error += (float)(norm(cal_img-given_img));
  }
  error = (float)error/n_o_i;
  return error;
}
int main(int argc,char* argv[])
{
  int counter=0,i,j,k,img_num;
  FILE* fp = fopen( "ImageDetails.txt" , "r" );
  while (1)
  {
    image_info image_scan;
    point_info point_scan;
    fscanf(fp,"%d%d",&img_num,&image_scan.num_of_points);
    if(feof(fp))
      break;
//    printf("%d %d\n",img_num,num_of_points);
    for(i=0;i<image_scan.num_of_points;i++)
    {
	fscanf(fp,"%f%f%f%f%f",&point_scan.two_d.x,&point_scan.two_d.y,&point_scan.three_d.x,&point_scan.three_d.y,&point_scan.three_d.z);
        image_scan.v_point.push_back(point_scan);
    }
    a_m[img_num] = image_scan;
    image_scan.v_point.clear();
  }
  fclose(fp);
  //  checked and vimdiff of imagedetails and out worked fine :)
/*  cout << "total images " << n_o_i << endl;
  for(i=0;i<n_o_i;i++)
  {
    cout << i << ' ' << a_m[i].num_of_points << endl;
    vector<point_info>::iterator it_point = a_m[i].v_point.begin();
    for(it_point;it_point!=a_m[i].v_point.end();it_point++)
      cout << it_point->two_d.x << ' ' << it_point->two_d.y << ' ' << it_point->three_d.x << ' ' << it_point->three_d.y << ' '<< it_point->three_d.z << endl;
  }    */

  int ci = 8,i_n_o,loop;
 // DLT 
  
  int img_num_of_points = a_m[ci].v_point.size();
  cout << img_num_of_points << endl;
  loop = 6;
  Mat Pcam_1 = build_matrix(loop,ci,1);
  Mat K1,R1,T1;
  decomposeProjectionMatrix(Pcam_1,K1,R1,T1);
  cout << "Pcam for DLT is :" << endl << Pcam_1 << endl;
  cout << " k1 is : " << endl << K1 << endl;
  cout << " r1 is : " << endl << R1 << endl;
  cout << " t1 is : " << endl << T1 << endl;
  float proj_error_1 = proj_error(Pcam_1,ci);
  cout << "reproj_error :" << proj_error_1 << endl;
  
  
  // 2.SVD
  i_n_o = a_m[ci].v_point.size();
  Mat Pcam_2 = build_matrix(i_n_o,ci,0);
  Mat K2,R2,T2;
  decomposeProjectionMatrix(Pcam_2,K2,R2,T2);
  cout << "Pcam for DLT is :" << endl << Pcam_2 << endl;
  cout << " k2 is : " << endl << K2 << endl;
  cout << " r2 is : " << endl << R2 << endl;
  cout << " t2 is : " << endl << T2 << endl;   
  float proj_error_2 = proj_error(Pcam_2,ci);
  cout << "reproj_error :" << proj_error_2 << endl;
 


  // 3.RANSAC

   counter = 0;
   int max_inlers=0;
   float cumulative_error=0;
   Mat best_Pcam = Mat_<float>(12,1);
   i_n_o = a_m[ci].v_point.size();
   int threshold_inliners = i_n_o * 0.7;
   int n_o_i = 5000; // no of iterations;
   vector<point_info> matched_inlers;
   srand(time(NULL));
   for(k=0;k<n_o_i;k++)
   {
     vector<point_info> store_point;
     for(i=0;i<6;i++)
     {
       int r_n = rand()%i_n_o;
       store_point.push_back(a_m[ci].v_point[r_n]);
 //      cout << " r_n is : " << r_n << " and " << " A[counter][0] is : " << a_m[ci].v_point[r_n].three_d.x << endl;
       A[counter][0] = a_m[ci].v_point[r_n].three_d.x;
       A[counter][1] = a_m[ci].v_point[r_n].three_d.y;
       A[counter][2] = a_m[ci].v_point[r_n].three_d.z;
       A[counter][3] = 1;
       A[counter][4] = 0;
       A[counter][5] = 0;
       A[counter][6] = 0;
       A[counter][7] = 0;
       A[counter][8] =   -float(a_m[ci].v_point[r_n].two_d.x*a_m[ci].v_point[r_n].three_d.x);
       A[counter][9] =   -float(a_m[ci].v_point[r_n].two_d.x*a_m[ci].v_point[r_n].three_d.y);
       A[counter][10]=  -float(a_m[ci].v_point[r_n].two_d.x*a_m[ci].v_point[r_n].three_d.z);
       A[counter][11]=  -a_m[ci].v_point[r_n].two_d.x;
       counter++;
       A[counter][0]=0;
       A[counter][1]=0;
       A[counter][2]=0,
       A[counter][3]=0;
       A[counter][4]= a_m[ci].v_point[r_n].three_d.x;
       A[counter][5]= a_m[ci].v_point[r_n].three_d.y;
       A[counter][6]= a_m[ci].v_point[r_n].three_d.z;
       A[counter][7]=1;
       A[counter][8]=   -float(a_m[ci].v_point[r_n].two_d.y*a_m[ci].v_point[r_n].three_d.x);
       A[counter][9]=   -float(a_m[ci].v_point[r_n].two_d.y*a_m[ci].v_point[r_n].three_d.y);
       A[counter][10]=  -float(a_m[ci].v_point[r_n].two_d.y*a_m[ci].v_point[r_n].three_d.z);
       A[counter][11]=  -a_m[ci].v_point[r_n].two_d.y;
       counter++;
     }
     counter = 0;
     Mat x = (Mat_<float>(12,1) << 0,0,0,0,0,0,0,0,0,0,0,0);
     Mat Ap3 = Mat(12,12,CV_32FC1,A);
 //    cout << Ap3 << endl;
     SVD::solveZ(Ap3,x);
//     cout << x << endl;
     Mat Pcam = x.reshape(0,3);
     loop = 6;
     int random=1;
//     cout << "found Pcam from 6 rand points " << endl;
//     cout << "Pcam :" << endl << Pcam << endl;
    // now finding errors
    float lower_limit = 0.5;
    float error[i_n_o];
    float total_error=0;
    int total_inliners=0;
    for(i=0;i<i_n_o;i++)
    {
      Point3f thr_d = a_m[ci].v_point[i].three_d;
      Point2f t_d   = a_m[ci].v_point[i].two_d;
      Mat X1  = (Mat_<float>(4,1) << thr_d.x,thr_d.y,thr_d.z,1);
      Mat proj_point = Pcam*X1;
//      cout << "proj_point " << proj_point << endl;
      Mat img_point = (Mat_<float>(2,1) << proj_point.at<float>(0,0)/proj_point.at<float>(2,0) ,proj_point.at<float>(1,0)/proj_point.at<float>(2,0));
      Mat act_point = (Mat_<float>(2,1) << a_m[ci].v_point[i].two_d.x,a_m[ci].v_point[i].two_d.y);
      error[i] = (float)norm(img_point-act_point);
      total_error += error[i];
      if(error[i] < lower_limit)
      {
	store_point.push_back(a_m[ci].v_point[i]);
	total_inliners++;
      }
    }
//    cout << "total inlers is " << total_inliners << endl;
    if(total_inliners > threshold_inliners)
    {
      cout << "finally found " << endl;
      max_inlers = total_inliners;
      cumulative_error = total_error;
      best_Pcam = Pcam;
      matched_inlers = store_point;
    //  store_point.clear();
      break;
    }
    else
    {
//      cout << "sorry " << endl;
      if(total_inliners > max_inlers)
      {
	max_inlers = total_inliners;
	cumulative_error = total_error;
	best_Pcam = Pcam;
	matched_inlers = store_point;
//	store_point.clear();
      }
    }
   }
   cout << "total iterations is: " << k << endl;
   cout << "total inlers is: " << max_inlers << endl;
   cout << "reprojection error is: " << (float)(cumulative_error/i_n_o) << endl;
   cout << "best_pcam from RANSAC is : " << endl << best_Pcam << endl;

   // finding Pcam from matched_inlers;
   counter = 0;
   i_n_o = matched_inlers.size();
   for(i=0;i<i_n_o;i++)
   {
       A[counter][0]= matched_inlers[i].three_d.x;
       A[counter][1]= matched_inlers[i].three_d.y;
       A[counter][2]= matched_inlers[i].three_d.z;
       A[counter][3]=1;
       A[counter][4]=0;
       A[counter][5]=0;
       A[counter][6]=0;
       A[counter][7]=0;
       A[counter][8]=   -float(matched_inlers[i].two_d.x*matched_inlers[i].three_d.x);
       A[counter][9]=   -float(matched_inlers[i].two_d.x*matched_inlers[i].three_d.y);
       A[counter][10]=  -float(matched_inlers[i].two_d.x*matched_inlers[i].three_d.z);
       A[counter][11]=  -matched_inlers[i].two_d.x;
       counter++;
       A[counter][0]=0;
       A[counter][1]=0;
       A[counter][2]=0,
       A[counter][3]=0;
       A[counter][4]= matched_inlers[i].three_d.x;
       A[counter][5]= matched_inlers[i].three_d.y;
       A[counter][6]= matched_inlers[i].three_d.z;
       A[counter][7]=1;
       A[counter][8]=   -float(matched_inlers[i].two_d.y*matched_inlers[i].three_d.x);
       A[counter][9]=   -float(matched_inlers[i].two_d.y*matched_inlers[i].three_d.y);
       A[counter][10]=  -float(matched_inlers[i].two_d.y*matched_inlers[i].three_d.z);
       A[counter][11]=  -matched_inlers[i].two_d.y;
       counter++;
   }
   Mat Ap4 = Mat(2*i_n_o,12,CV_32FC1,A);
   Mat x;
   SVD::solveZ(Ap4,x);
   Mat Pcam = x.reshape(0,3);
   cout << "Pcam from matched_classifiers is : " << endl << Pcam << endl;  

  
   // camera matrix

   ci = 0;
   Mat Pcam_4,K4,T4,R4;
   i_n_o = a_m[ci].v_point.size();
   vector<Point3f> cam_threed;
   vector<Point2f> cam_twod;
   Mat dist_coeffs=Mat::zeros(8,1,CV_64F);
   for(i=0;i<i_n_o;i++)
   {
     cam_threed.push_back(Point3f(a_m[ci].v_point[i].three_d.x,a_m[ci].v_point[i].three_d.y,a_m[ci].v_point[i].three_d.z));
     cam_twod.push_back(Point2f(a_m[ci].v_point[i].two_d.x,a_m[ci].v_point[i].two_d.y));
   }
   vector< vector<Point3f> > v_cam3d;
   vector< vector<Point2f> > v_cam2d;
   v_cam3d.push_back(cam_threed);
   v_cam2d.push_back(cam_twod);

   K4 = initCameraMatrix2D(v_cam3d,v_cam2d,Size(640,480),0);
   solvePnP(cam_threed,cam_twod,K4,dist_coeffs,R4,T4,false,CV_ITERATIVE);
   cout << " k4 is : " << endl << K4 << endl;
   cout << " r4 is : " << endl << R4 << endl;
   cout << " t4 is : " << endl << T4 << endl; 
   cout << " k4.cols : " << K4.cols << " r4.rows : " << R4.rows << endl;
   
   return 0;
}
