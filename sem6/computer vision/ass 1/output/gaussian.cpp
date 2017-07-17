#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include<string>
#include<iomanip>
#include<sstream>
#include<opencv2/opencv.hpp>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/objdetect/objdetect.hpp>
#include<vector>
using namespace std;
using namespace cv;
Mat src,src_gray,dst,detected_edges;
int kernel_size = 3;
string window_name = "filter demo";
int main(int argc,char* argv[])
{
/*  const string sourceReference = argv[1];
  VideoCapture captundRef(sourceReference);*/
//  cout << "frame rate is " << captundRef.get(CV_CAP_PROP_FPS) << endl;
//  cout << "no. of frames is " << captundRef.get(CV_CAP_PROP_FRAME_COUNT) << endl;
  int count = 0;
  src = imread("lena.jpg",1);
 //   captundRef.read(src);
/*    namedWindow("display frames",CV_WINDOW_AUTOSIZE);
    imshow("display frames",src);
    cvWaitKey(100); */
    // canny detection
/*    dst.create(src.size(),src.type());
    cvtColor( src, src_gray, CV_BGR2GRAY );
    createTrackbar( "Min Threshold:", window_name, &lowThreshold, max_lowThreshold, CannyThreshold );
    CannyThreshold(0,0);
    cvWaitKey(100);  */
    // gaussian blur 
  vector<int> compression_params;
//  compression_params.push_back(CV_IMWRITE_JPEG_QUALITY);
  compression_params.push_back(9);
    for(int i=1;i<31;i+=2)
    {
      dst = Mat::zeros(src.size(),src.type());
  //    putText(dst,"gaussian blur",Point(src.cols/4,src.rows/2),CV_FONT_HERSHEY_COMPLEX, 1, Scalar(255, 255, 0));
  //    waitKey(100);
      GaussianBlur(src,dst,Size(i,i),0,0); 
      window_name = "filter demo ";
 //     string window_name = "filter size " + " " + std::to_string(i);
   /*   stringstream ss;
      ss << i;
      string app = ss.str();
      window_name.append(app);*/
  /*    namedWindow(window_name,CV_WINDOW_AUTOSIZE);
      imshow(window_name,dst); */
      string c = "gaussian";
      stringstream ss;
      ss << i;
      string num = ss.str();
      c = c+ num  + ".jpg";
      imwrite(c,dst,compression_params);     
      cvWaitKey(100);
    } 
    // bilateral filter
/*    for ( int i = 1; i < 31 ; i = i + 2 )
    { 
      dst = src.clone();
      bilateralFilter ( src, dst, i, i*2, i/2 );
      namedWindow("bilateral filter demo",CV_WINDOW_AUTOSIZE);
      imshow("bilateral filter demo",dst);
 //     cvWaitKey(100);
      delay+=100;
    } */
  return 0;
}
