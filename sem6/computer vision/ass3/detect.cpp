#include<cstdio>
#include<iostream>
#include<cv.h>
#include<vector>
#include<string>
#include<opencv2/nonfree/nonfree.hpp>
#include<highgui.h>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/features2d/features2d.hpp>
#include<opencv2/flann/flann.hpp>
int thresh = 200;
int max_thresh = 255;
using namespace std;
using namespace cv;
Mat img1,img2;
string source_window("Source image");
string corners_window("Corners detected");
int main()
{
  img1=imread("et001.jpg",0);
  img2=imread("et002.jpg",0);
  vector<KeyPoint> k1,k2;
  SiftFeatureDetector sif(400);
  SiftDescriptorExtractor sif_ex;
  sif.detect(img1,k1);
  sif.detect(img2,k2);
  Mat sif_out1,sif_out2;
  Mat out_img1,out_img2;
  sif_ex.compute(img1,k1,sif_out1);
  sif_ex.compute(img2,k2,sif_out2);
//  drawKeypoints(sif_out1,k1,sif);
//  drawKeypoints(out_img2,k2,sif_out2);
/*  imwrite("result_sif.jpg",sif_out);
  imwrite("result_sur.jpg",sur_out); 
  imshow("keypoints 1",sif_out1);
  imshow("keypoints 2",sif_out2);  */

  // harris corner detect 

/*  namedWindow( source_window, CV_WINDOW_AUTOSIZE );
  createTrackbar( "Threshold: ", source_window, &thresh, max_thresh, cornerHarris_demo );
  imshow( source_window, img1 );
  cornerHarris_demo(0,0);  
  waitKey(0);  */
  FlannBasedMatcher matcher;
  vector< DMatch > matches;
  matcher.match( sif_out1, sif_out2, matches );
  double max_dist = 0; double min_dist = 100;
  //-- Quick calculation of max and min distances between keypoints
  for( int i = 0; i < sif_out1.rows; i++ )
  { double dist = matches[i].distance;
    if( dist < min_dist ) min_dist = dist;
    if( dist > max_dist ) max_dist = dist;
  }
  printf("-- Max dist : %f \n", max_dist );
  printf("-- Min dist : %f \n", min_dist );
  //-- Draw only "good" matches (i.e. whose distance is less than 2*min_dist )
  //-- PS.- radiusMatch can also be used here.
  vector< DMatch > good_matches;
  for( int i = 0; i < sif_out1.rows; i++ )
  { if( matches[i].distance < 4*min_dist )
    { good_matches.push_back( matches[i]); }
  }
  printf("HI\n");
  //-- Draw only "good" matches
  Mat img_matches;
//  int flags = DrawMatchesFlags::DEFAULT;
  int flags = 2;
  drawMatches( img1, k1, img2, k2,good_matches, img_matches,Scalar::all(-1),Scalar::all(-1), vector<char>() , flags);
  //-- Show detected matches
//  imshow( "Good Matches", img_matches );
//  waitKey(0);
  vector<Point2f> points1,points2;
  for (int i=0;i<(int)good_matches.size();i++){
    int x=good_matches[i].queryIdx;
    int y=good_matches[i].trainIdx;
    points1.push_back(k1[x].pt);
    points2.push_back(k2[y].pt);
  }
  Mat fund=findFundamentalMat(Mat(points1),Mat(points2),CV_FM_RANSAC,2,0.99);
  vector<Point2f> rand_pts;
  for (int i=0;i<10;i++){
    int x=rand()%(int)points1.size();
    rand_pts.push_back(points1[x]);
  }
  Mat lines=Mat_<float>(10,3);
  computeCorrespondEpilines(rand_pts,1,fund,lines);
  cout<<lines.rows<<endl;
  Mat img3=imread("et001.jpg",-1);
  Mat img4=imread("et002.jpg",-1);
  for (int i=0;i<(int)lines.rows;i++){
    Point2f first,second;
    double a,b,c;
    a=lines.at<float>(i,0);
    b=lines.at<float>(i,1);
    c=lines.at<float>(i,2);
    first.x=0;
    first.y=((-c)/b);
    second.x=img3.cols;
    second.y=(-c-(a*second.x))/b;
    circle(img3,Point2f(rand_pts[i].x,rand_pts[i].y),10,CV_RGB(10*i,15*i,20*i),1,8,0);
    line(img4,first,second,CV_RGB(10*i,15*i,20*i),1,8,0);
  }
  imshow("et001.jpg",img3);
  imshow("et002.jpg",img4);
  waitKey(0);
  return 0;
}
