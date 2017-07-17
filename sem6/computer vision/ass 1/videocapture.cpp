#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include<string>
#include<iomanip>
#include<sstream>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/objdetect/objdetect.hpp>
using namespace std;
using namespace cv;
Mat src,src_gray,dst,detected_edges;
int lowThreshold;
int const max_lowThreshold=100;
int ratio = 3;
int kernel_size = 3;
string window_name = "Edge map";
String face_cascade_name      = "haarcascade_frontalface_alt.xml";
String eyes_cascade_name      = "haarcascade_eye_tree_eyeglasses.xml";
string upperbody_cascade_name = "haarcascade_upperbody.xml";
string lowerbody_cascade_name = "haarcascade_lowerbody.xml";
CascadeClassifier face_cascade;
CascadeClassifier eyes_cascade;
CascadeClassifier upperbody_cascade;
CascadeClassifier lowerbody_cascade;
HOGDescriptor obj_detect;
void CannyThreshold(int, void*)
{
  /// Reduce noise with a kernel 3x3
  blur( src_gray, detected_edges, Size(3,3) );
  /// Canny detector
  Canny( detected_edges, detected_edges, lowThreshold, lowThreshold*ratio, kernel_size );
  /// Using Canny’s output as a mask, we display our result
  dst = Scalar::all(0);
  src.copyTo( dst, detected_edges);
  imshow( window_name, dst );
}
void detectAndDisplay( Mat frame )
{
  std::vector<Rect> faces;
  std::vector<Rect> up_bodies;
  std::vector<Rect> low_bodies;
  Mat frame_gray;
  cvtColor( frame, frame_gray, CV_BGR2GRAY );
  equalizeHist( frame_gray, frame_gray );
  //-- Detect faces
  face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
/*  for(int i=0;i<faces.size();i++)
  {
    Point center( faces[i].x + faces[i].width*0.5, faces[i].y + faces[i].height*0.5 );
    ellipse( frame, center, Size( faces[i].width*0.5, faces[i].height*0.5), 0, 0, 360, Scalar( 255, 0, 255 ), 4, 8, 0);
  }  */
  upperbody_cascade.detectMultiScale(frame_gray,up_bodies,1.1,2,0|CV_HAAR_SCALE_IMAGE,Size(30,30) );
  lowerbody_cascade.detectMultiScale(frame_gray,low_bodies,1.1,2,0|CV_HAAR_SCALE_IMAGE,Size(30,30) );
  for(int i=0;i< up_bodies.size();i++)
  {
    Point pt1( up_bodies[i].x , up_bodies[i].y );
    Point pt2( up_bodies[i].x + up_bodies[i].width, up_bodies[i].y + up_bodies[i].height);
    rectangle(frame,pt1,pt2,Scalar(0,255,255),0,8); 
 /*   Point center( up_bodies[i].x + up_bodies[i].width*0.5, up_bodies[i].y + up_bodies[i].height*0.5 );
    ellipse( frame, center, Size( up_bodies[i].width*0.5, up_bodies[i].height*0.5), 0, 0, 360, Scalar( 0, 0, 255 ), 4, 8, 0); */
  }
  for(int i=0;i< low_bodies.size();i++)
  {
    Point pt1( low_bodies[i].x , low_bodies[i].y );
    Point pt2( low_bodies[i].x + low_bodies[i].width, low_bodies[i].y + low_bodies[i].height);
    rectangle(frame,pt1,pt2,Scalar(255,255,0),0,8); 
  }
  for( int i = 0; i < faces.size(); i++ )
  {
    Point center( faces[i].x + faces[i].width*0.5, faces[i].y + faces[i].height*0.5 );
    ellipse( frame, center, Size( faces[i].width*0.5, faces[i].height*0.5), 0, 0, 360, Scalar( 255, 0, 255 ), 4, 8, 0);
//    rectangle(frame,cvPoint(faces[i].x,faces[i].y),cvPoint(faces[i].x+faces[i].width,faces[i].y+faces[i].height),Scalar(255,0,255),0,8);
	Mat faceROI = frame_gray( faces[i] );
	std::vector<Rect> eyes;
	//-- In each face, detect eyes
	eyes_cascade.detectMultiScale( faceROI, eyes, 1.1, 2, 0 |CV_HAAR_SCALE_IMAGE, Size(30, 30) );
	for( int j = 0; j < eyes.size(); j++ )
	{
	Point center( faces[i].x + eyes[j].x + eyes[j].width*0.5, faces[i].y + eyes[j].y + eyes[j].height*0.5 );
	int radius = cvRound( (eyes[j].width + eyes[j].height)*0.25 );
	circle( frame, center, radius, Scalar( 255, 0, 0 ), 4, 8, 0 );
	}
   }
	//-- Show what you got
	imshow( "Capture -face detection" , frame );
	cvWaitKey(100);
}
int main(int argc,char* argv[])
{
  if(argc !=2 )
  {
    cout << "not enough parameters" << endl;
    exit(0);
  }
  if( !face_cascade.load( face_cascade_name ) ){ printf("--(!)Error loading first\n"); return -1; };
  if( !eyes_cascade.load( eyes_cascade_name ) ){ printf("--(!)Error loading second\n"); return -1; };
  if( !upperbody_cascade.load(upperbody_cascade_name) ){printf("--(!)Error loading third\n");return -1;}
  if( !lowerbody_cascade.load(lowerbody_cascade_name) ){printf("--(!)Error loading third\n");return -1;}  
  const string sourceReference = argv[1];
  VideoCapture captundRef(sourceReference);
  VideoWriter outputVideo;
  if(!captundRef.isOpened())
  {
    cout << "could not open reference file" << endl;
    exit(0);
  }
  string::size_type pAt = sourceReference.find_last_of('.');
  const string NAME = sourceReference.substr(0,pAt) + "output" + ".avi";
  int ex = static_cast<int>(captundRef.get(CV_CAP_PROP_FOURCC));
  char EXT[] = {ex & 0XFF , (ex & 0XFF00) >> 8,(ex & 0XFF0000) >> 16,(ex & 0XFF000000) >> 24, 0};
  Size S = Size((int) captundRef.get(CV_CAP_PROP_FRAME_WIDTH),
      (int) captundRef.get(CV_CAP_PROP_FRAME_HEIGHT));  
/*  if(askOutputType)
    outputVideo.open(NAME , ex=-1, captundRef.get(CV_CAP_PROP_FPS),S, true);
  else */
/*  outputVideo.open(NAME , ex, captundRef.get(CV_CAP_PROP_FPS),S, true);
  if (!outputVideo.isOpened())
  {
    cout << "Could not open the output video for write: " << sourceReference << endl;
    return -1;
  }  */ 
  cout << "frame rate is " << captundRef.get(CV_CAP_PROP_FPS) << endl;
  cout << "no. of frames is " << captundRef.get(CV_CAP_PROP_FRAME_COUNT) << endl;
  int count = 0;
/*  char TrackbarName[50];
  sprintf( TrackbarName, "Alpha x %d", alpha_slider_max );
  cout << "enter the lowerThreshold" << endl;*/
//  cin >> lowThreshold;
//  createTrackbar( TrackbarName, "Linear Blend", &alpha_slider, alpha_slider_max);
  while(1)
  {
    int delay = 0;
    captundRef.read(src);
    if(src.empty())
      break;
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
 /*   for(int i=1;i<31;i+=2)
    {
      dst = Mat::zeros(src.size(),src.type());
  //    putText(dst,"gaussian blur",Point(src.cols/4,src.rows/2),CV_FONT_HERSHEY_COMPLEX, 1, Scalar(255, 255, 0));
  //    waitKey(100);
      GaussianBlur(src,dst,Size(i,i),0,0);
      namedWindow("filter demo",CV_WINDOW_AUTOSIZE);
      imshow("filter demo",dst);
      cvWaitKey(10);
    }  */
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
 //   cout << "delay in ms is"<< delay << endl;
     detectAndDisplay(src);
//     outputVideo << src;
  }
  return 0;
}
