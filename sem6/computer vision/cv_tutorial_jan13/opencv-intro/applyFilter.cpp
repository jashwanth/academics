#include<iostream>
#include<highgui.h>
#include<cv.h>
#include<math.h>

using namespace std;

int main()
{
  IplImage *img, *out;

  img = cvLoadImage("yoda.jpg"); //load the image

  out = cvCreateImage( cvGetSize(img), IPL_DEPTH_8U, 3); //create output image

  cvSmooth(img,out,CV_GAUSSIAN,7,7); //apply a 7X7 Gaussian mask

  //windowing stuff
  cvNamedWindow("Title",CV_WINDOW_AUTOSIZE);
  cvMoveWindow("Title",100,100);
  cvShowImage("Title",out);
  cvWaitKey(0);
  
  //clean up
  cvReleaseImage(&img);
  cvReleaseImage(&out);
  
}
