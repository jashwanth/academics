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
#include<math.h>
int thresh = 200;
int max_thresh = 255;
using namespace std;
using namespace cv;
Mat img1,img2;
string source_window("Source image");
string corners_window("Corners detected");
int main(int argc,char *argv[])
{
	int choice,match_type,mult_factor_for_elim;
//	cout<<"Enter 1 for SIFT or someother number for SURF"<<endl;
	choice=atoi(argv[3]);
//	cout<<"Enter 1 for normal match and 2 knn match with ratio test"<<endl;
	match_type=atoi(argv[4]);
	img1=imread(argv[1],0);
	img2=imread(argv[2],0);
	vector<KeyPoint> k1,k2;
	Mat descp_out1,descp_out2;
	Mat out_img1,out_img2;
	if (choice==1){
		mult_factor_for_elim=4;
		SiftFeatureDetector sif;
		SiftDescriptorExtractor sif_ex;
		sif.detect(img1,k1);
		sif.detect(img2,k2);
		sif_ex.compute(img1,k1,descp_out1);
		sif_ex.compute(img2,k2,descp_out2);
	}else{
		mult_factor_for_elim=2;
		SurfFeatureDetector sur;
		SurfDescriptorExtractor sur_ex;
		sur.detect(img1,k1);
		sur.detect(img2,k2);
		sur_ex.compute(img1,k1,descp_out1);
		sur_ex.compute(img2,k2,descp_out2);
	}
	FlannBasedMatcher matcher;
	vector< DMatch > good_matches;
	if (match_type==1){//normal match
		vector< DMatch > matches;
		matcher.match( descp_out1, descp_out2, matches );
		double max_dist = 0; double min_dist = 100;
		//-- Quick calculation of max and min distances between keypoints
		for( int i = 0; i < descp_out1.rows; i++ )
		{ double dist = matches[i].distance;
			if( dist < min_dist ) min_dist = dist;
			if( dist > max_dist ) max_dist = dist;
		}
//		printf("-- Max dist : %f \n", max_dist );
//		printf("-- Min dist : %f \n", min_dist );
		//-- Draw only "good" matches (i.e. whose distance is less than 2*min_dist )
		//-- PS.- radiusMatch can also be used here.
		for( int i = 0; i < descp_out1.rows; i++ )
		{ if( matches[i].distance < mult_factor_for_elim*min_dist )
			{ good_matches.push_back( matches[i]); }
		}
	}else{//knn match
		vector<vector<DMatch> > matches;
		matcher.knnMatch( descp_out1, descp_out2, matches,5 );
		//ratio test
		for (int i=0;i<(int)matches.size();i++){
			if (matches[i].size()>=2){
				if (matches[i][0].distance/matches[i][1].distance<0.7)
					good_matches.push_back(matches[i][0]);
			}
		}
	}
	//-- Draw only "good" matches
	Mat img_matches;
	//  int flags = DrawMatchesFlags::DEFAULT;
	int flags = 2;
	drawMatches( img1, k1, img2, k2,good_matches, img_matches,Scalar::all(-1),Scalar::all(-1), vector<char>() ,flags);
	//-- Show detected matches
//	imshow( "Good Matches", img_matches );
//	waitKey(0);
	imwrite("image_match.jpg",img_matches);
	vector<Point2f> points1,points2;
	for (int i=0;i<(int)good_matches.size();i++){
		int x=good_matches[i].queryIdx;
		int y=good_matches[i].trainIdx;
		points1.push_back(k1[x].pt);
		points2.push_back(k2[y].pt);
	}
	Mat fund=Mat_<float>(3,3,CV_32FC1);
	fund=findFundamentalMat(Mat(points1),Mat(points2),CV_FM_RANSAC,2,0.99);
	Mat lines=Mat_<float>((int)points1.size(),3,CV_32FC1);
	computeCorrespondEpilines(points1,1,fund,lines);
	Mat img3=imread(argv[1],-1);
	Mat img4=imread(argv[2],-1);
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
		circle(img3,points1[i],5,CV_RGB((12*i)%255,(20*i)%255,(25*i)%255),2,8,0);
		line(img4,first,second,CV_RGB((12*i)%255,(20*i)%255,(25*i)%255),1,8,0);
	}
//	imshow("First Image with points marked as circles\n",img3);
//	imshow("Second Image with corresponding epipolar lines of first image\n",img4);
//	waitKey(0);
	imwrite("points.jpg",img3);
	imwrite("epipolar_lines.jpg",img4);
	//Reprojection Error
	float error=0;
	fund.convertTo(fund,CV_32FC1);
	for (int i=0;i<(int)points1.size();i++){
		Mat x=Mat_<float>(3,1,CV_32FC1);
		x.at<float>(0,0)=points1[i].x;
		x.at<float>(1,0)=points1[i].y;
		x.at<float>(2,0)=1.0;
		Mat y=Mat_<float>(1,3,CV_32FC1);
		y.at<float>(0,0)=points2[i].x;
		y.at<float>(0,1)=points2[i].y;
		y.at<float>(0,2)=1.0;
		Mat res=y*fund*x;
//		cout<<res<<endl;
		error=error+fabs((res.at<float>(0,0)));
	}
	cout<<error/(int)points1.size()<<endl;
	return 0;
}
