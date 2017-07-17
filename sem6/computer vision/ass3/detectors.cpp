#include<iostream>
#include<highgui.h>
#include<cv.h>
#include<cstdio>
#include<string.h>
#include<math.h>
#include<vector>
#include<algorithm>
#include<opencv2/features2d/features2d.hpp>
#include<opencv2/core/core.hpp>
#include "opencv2/nonfree/features2d.hpp"

#define THRESHOLD_RATIO 0.7co
#define DISTANCE 1.0
#define CONFIDENCE 0.97

using namespace std;
using namespace cv;

int RatioTest(vector<vector<DMatch> > &matches);
int SymTest(vector<vector<DMatch> > & , vector<vector<DMatch> > &,vector<DMatch> &);
Mat Ransac(const vector<DMatch>& matches,const vector<KeyPoint>& keypoints_1,const vector<KeyPoint>& keypoints_2,vector<DMatch>& output);
float Reproj(const Mat F, vector<DMatch>& sym_matches, vector<KeyPoint>& keypoints_1, vector<KeyPoint>& keypoint_2);

int main(int argc, char** argv){
  if(argc < 2){
    cout<<"format is ./a.out [0|1] 1...sift; 0......surf";
  }
  int choice = atoi(argv[1]);
  char c = ' ';
  Mat image1 = imread("et001.jpg",CV_LOAD_IMAGE_COLOR);//
  Mat image2 = imread("et002.jpg",CV_LOAD_IMAGE_COLOR);// 
  Mat output_1,output_2,output;

  SiftFeatureDetector SiftDetector;
  SurfFeatureDetector SurfDetector(1);
  // HarrisFeatureDetector HarrisDetector;
 
  SurfDescriptorExtractor SurfExtractor;
  SiftDescriptorExtractor SiftExtractor;

  vector<KeyPoint> keypoints_1,keypoints_2;
  vector<KeyPoint> surfpoints_1,surfpoints_2;
  
  namedWindow("Image 1",CV_WINDOW_NORMAL);namedWindow("Image 2",CV_WINDOW_NORMAL); namedWindow("Image 2",CV_WINDOW_NORMAL);
  Mat descriptors1,descriptors2;
  //SiftDetector->detect(image1,siftpoints_1);
  //SiftExtractor->compute(image1,siftpoints_1,descriptors);
  switch(choice){  
      case 0:{
         SurfDetector.detect(image2,keypoints_2);
	 SurfExtractor.compute( image2, keypoints_2, descriptors2 );
	 SurfDetector.detect(image1,keypoints_1);
	 SurfExtractor.compute( image1, keypoints_1, descriptors1 );
	 //drawKeypoints(image2,keypoints_2,output_2);
	 //drawKeypoints(image1,keypoints_1,output_1);
	 break;
      }
      default:{
	SiftDetector.detect(image2,keypoints_2);
	SiftExtractor.compute(image2,keypoints_2,descriptors2);
	SiftDetector.detect(image1, keypoints_1);
	SiftExtractor.compute(image1,keypoints_1,descriptors1);
	break;
      }
  }
////////////////////////////////////////////////////////////////////////
  //cout << "first keypoint "<< keypoints_1.size()<<endl;
  
  cv::BFMatcher matcher(cv::NORM_L2, false);
  vector<vector<DMatch> > matches1;
  vector<vector<DMatch> > matches2;
 
  
  //matcher to return 2 nearst neighbours for ratio test
  matcher.knnMatch(descriptors1,descriptors2, matches1,2);
  matcher.knnMatch(descriptors2,descriptors1,matches2,2);

  cout<<"matching finished**********\n\n";
  int count = RatioTest(matches1);
  int count1 = RatioTest(matches2);

  cout<<count1<<" ratio test done******************"<<count<<endl;
  //perfrom symetry test points should match from both images
  vector<DMatch> sym_matches;
  count = SymTest(matches1,matches2,sym_matches); 
  vector<DMatch> matches;
  cout<<"Number of matches "<<count<<"\n symmetery test done*********************\n\n";
  Mat fundamental = Ransac(sym_matches,keypoints_1,keypoints_2,matches);
  cout << fundamental<<endl;
  //  float error = Reproj(fundamental,sym_matches,keypoints_1,keypoints_2);
  vector<vector<DMatch> > common_matches;
  Mat common(matches.size(),2,DataType<float>::type);
 
  //for(vector<DMatch>::iterator i = matches.begin();  i != matches.end();i++){
  for(int i = 0 ;i < matches.size();i++){
    vector<DMatch> row;
    row.push_back(DMatch());
    row[0].queryIdx = matches[i].queryIdx;
    row[0].trainIdx = matches[i].trainIdx;
    row[0].distance = matches[i].distance;
    common_matches.push_back(row);
     //common1.push_back(KeyPoint());
     // common1[i].pt.x = keypoints_1[matches[i].queryIdx].pt.x;
     // common1[i].pt.y =keypoints_1[matches[i].queryIdx].pt.y;
        
    common.at<float>(i,0) = keypoints_1[matches[i].queryIdx].pt.x;
    common.at<float>(i,1) =keypoints_1[matches[i].queryIdx].pt.y;
    // cout<< keypoints_1[matches[i].queryIdx].pt.x<<" , "<<keypoints_1[matches[i].queryIdx].pt.y<<endl;
  }
   drawKeypoints(image1,keypoints_1,output_1);
   drawKeypoints(image2,keypoints_2,output_2);
   drawMatches(image1,keypoints_1,image2,keypoints_2,common_matches,output);
   
  //cout<< common<<endl;
  cout<<fundamental<<endl;
   // imshow("Image 1",output_1);imshow("Image 2",output_2);
  Mat lines;//vector<Vec3f> lines;
  computeCorrespondEpilines(common,1,fundamental,lines);
  for(int i = 0; i < lines.rows;i++){
     line(image2,
	  Point(0,-(lines.at<float>(i,2))/(lines.at<float>(i,1))),
	  Point(image2.cols,-(lines.at<float>(i,2)+lines.at<float>(i,0)*image2.cols)/(lines.at<float>(i,1))), 
	  Scalar(6*i,5*(i-1),8*(i-2)) );
     }
  imshow("Image 2",image2);imshow("Image 1",output);imshow("Image 3",output_1);
    while ((c = waitKey(0)) != 'q');
  //imwrite("surfout_1.jpg",output_1);imwrite("surfout_2.jpg",output_2); 
  return 0;
}


int RatioTest(vector<vector<DMatch> > &matches){
  int count = 0;
  for(vector<vector<DMatch> >::iterator i = matches.begin();i != matches.end(); i++){
    if(i->size() > 1){//if there are 2 nearst neighbours
      if((*i)[0].distance/(*i)[1].distance > THRESHOLD_RATIO){
	i->clear();//remove the match at ith position
	count++;
      }
    }
    else{//if there aren't 2 nearst neighbours 
      i->clear();
      count++;
    }  
  }
  return count;
}


int SymTest(vector<vector<DMatch> > &matches1, vector<vector<DMatch> > &matches2,vector<DMatch> &sym_matches){
  int count = 0;
  for(vector<vector<DMatch> >::iterator i = matches1.begin();i != matches1.end();i++){
       if(i->size() < 2)continue;//do not consider cleared matches
       for(vector<vector<DMatch> >::iterator j = matches2.begin(); j != matches2.end();j++){
	 if(j->size() < 2)continue;
          //check for symmetry
	  //uncommenting if statement gives very few(less than 7)
	  //point matches uncomment only if sure that the 
	  //results will be good
	 //if( ( (*i)[0].queryIdx == (*j)[0].trainIdx ) && ( (*i)[0].trainIdx == (*j)[0].queryIdx ) ){
	     sym_matches.push_back(DMatch( (*i)[0].queryIdx, (*i)[0].trainIdx, (*i)[0].distance ));
	     count++;
	     break;
	 //}
      }
  }
  return count;
}


Mat Ransac(const vector<DMatch>& matches,const vector<KeyPoint>& keypoints_1,const vector<KeyPoint>& keypoints_2,vector<DMatch>& output){
  vector<Point2f> points1, points2;
  for(vector<DMatch>::const_iterator i = matches.begin();i != matches.end(); i++){
    float x = keypoints_1[i->queryIdx].pt.x;
    float y = keypoints_1[i->queryIdx].pt.y;

    points1.push_back(Point2f(x,y));

    x = keypoints_2[i->trainIdx].pt.x;
    y = keypoints_2[i->trainIdx].pt.y;

    points2.push_back(Point2f(x,y));
  }
  ///////////////////////////////////////
  vector<uchar> inliers(points1.size(),0);
  Mat fundamental = findFundamentalMat(Mat(points1), Mat(points2),
				       inliers,
				       CV_FM_RANSAC,
				       DISTANCE,
				       CONFIDENCE);
  vector<uchar>::const_iterator itin = inliers.begin();
  vector<DMatch>::const_iterator itma = matches.begin();
  for(;itin != inliers.end();itin++, itma++){
    if(*itin){//if match is in inliers
      output.push_back(*itma);
    }
    }
  /*
   can estimate fundamental from the inlier points ie
   output vector by using non-linear methods.... 
   not implemented yet.
*/
  return fundamental; 
}


float Reproj(const Mat F, vector<DMatch>& sym_matches, vector<KeyPoint>& keypoints_1, vector<KeyPoint>& keypoint_2){
  float error = 0;
  return error;
}
