#include<iostream>
#include<highgui.h>
#include<cv.h>
#include<math.h>

using namespace std;

void mousehandler(int event,int x,int y,int flags,void *params)
{

  switch(event){
      case CV_EVENT_LBUTTONDOWN:
        if(flags & CV_EVENT_FLAG_CTRLKEY) 
          printf("Left button down with CTRL pressed\n");
        break;

      case CV_EVENT_LBUTTONUP:
        printf("Left button pressed at (%d %d)\n",x,y);
        break;
    }
}

int main()
{
  IplImage *img, *out;

  img = cvLoadImage("yoda.jpg"); //load the image

  out = cvCreateImage( cvGetSize(img), IPL_DEPTH_8U, 3); //create output image

  cvSmooth(img,out,CV_GAUSSIAN,7,7); //apply a 7X7 Gaussian mask

  //windowing stuff
  cvNamedWindow("Title",CV_WINDOW_AUTOSIZE);
  cvSetMouseCallback("Title",mousehandler,(void*)img);
  cvMoveWindow("Title",100,100);
  cvShowImage("Title",out);
  cvWaitKey(0);
  
  //clean up
  cvReleaseImage(&img);
  cvReleaseImage(&out);
  
}
