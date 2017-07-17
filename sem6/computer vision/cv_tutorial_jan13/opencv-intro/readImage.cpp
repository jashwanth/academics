#include<iostream>
#include<highgui.h>
#include<math.h>

using namespace std;

int main()
{
  IplImage *img;

  img = cvLoadImage("yoda.jpg"); //load the image

  //windowing stuff
  cvNamedWindow("Title",CV_WINDOW_AUTOSIZE);
  cvMoveWindow("Title",100,100);
  cvShowImage("Title",img);
  cvWaitKey(0);
  cvReleaseImage(&img);
  cvDestroyWindow("Title");
  
}
