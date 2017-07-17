#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include<vector>
#include<string>
#include<iomanip>
#include<sstream>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/objdetect/objdetect.hpp>
using namespace std;
using namespace cv;
int main(int argc,char* argv[])
{
  float data[2][5] = {{1,2,3,4,5},{7,8,9,10,11}}; 
  Mat A = Mat(2, 5, CV_32SC1, &data, 2);
   cout << A << endl;
  return 0;
}
