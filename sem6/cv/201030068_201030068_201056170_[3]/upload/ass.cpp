#include<cstdio>
#include<iostream>
#include<cv.h>
#include<vector>
#include<string>
#include<opencv2/nonfree/nonfree.hpp>
#include<highgui.h>
#include<opencv2/imgproc/imgproc.hpp>
int thresh = 200;
int max_thresh = 255;
using namespace std;
using namespace cv;
Mat img1;
string source_window("Source image");
string corners_window("Corners detected");
void cornerHarris_demo(int,void*)
{
  Mat dst, dst_norm, dst_norm_scaled;
  dst = Mat::zeros( img1.size(), CV_32FC1 );
  /// Detector parameters
  int blockSize = 2;
  int apertureSize = 3;
  double k = 0.04;
  /// Detecting corners
  cornerHarris( img1, dst, blockSize, apertureSize, k, BORDER_DEFAULT );

  /// Normalizing
  normalize( dst, dst_norm, 0, 255, NORM_MINMAX, CV_32FC1, Mat() );
  convertScaleAbs( dst_norm, dst_norm_scaled );

  /// Drawing a circle around corners
  for( int j = 0; j < dst_norm.rows ; j++ )
  { for( int i = 0; i < dst_norm.cols; i++ )
    {
      if( (int) dst_norm.at<float>(j,i) > thresh )
      {
	circle( dst_norm_scaled, Point( i, j ), 5,  Scalar(0), 2, 8, 0 );
      }
    }
  }
  /// Showing the result
  namedWindow( corners_window, CV_WINDOW_AUTOSIZE );
  imshow( corners_window, dst_norm_scaled );
}
int main()
{
  img1=imread("lena.jpg",0);
  vector<KeyPoint> k1,k2;
  SiftFeatureDetector sif;
  SurfFeatureDetector sur;
  SiftDescriptorExtractor sif_ex;
  SurfDescriptorExtractor sur_ex;
  sif.detect(img1,k1);
  sur.detect(img1,k2);
  Mat sif_out,sur_out;
  sif_ex.compute(img1,k1,sif_out);
  sur_ex.compute(img1,k2,sur_out);
  drawKeypoints(img1,k1,sif_out);
  drawKeypoints(img1,k2,sur_out);
  imwrite("result_sif.jpg",sif_out);
  imwrite("result_sur.jpg",sur_out);

// harris corner detect 

/*  namedWindow( source_window, CV_WINDOW_AUTOSIZE );
  createTrackbar( "Threshold: ", source_window, &thresh, max_thresh, cornerHarris_demo );
  imshow( source_window, img1 );
  cornerHarris_demo(0,0);
  waitKey(0);  */
  return 0;
}
