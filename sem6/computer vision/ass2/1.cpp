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
  vector<double>::iterator it;
  vector<double>row1;
  vector<double>row2;
  double A[20][12];
  int num_of_points=0;
  vector<Point2f> two_d(10);
  vector<Point3f> three_d(10);
  two_d[0] = Point2f(269.66    , -76.5   );three_d[0] = Point3f(2.05224  ,  -0.786477 , -6.09246  );
  two_d[1] = Point2f(259.79    , -32.78  );three_d[1] = Point3f(1.8437   , -0.776633  , -6.41591  );
  two_d[2] = Point2f(-303.51   , -167.18 );three_d[2] = Point3f(-5.77714 ,  8.46097   , -11.8192  );
  two_d[3] = Point2f(-1.08     , 119.3   );three_d[3] = Point3f(2.55856  ,  9.70458   , -8.15778  );
  two_d[4] = Point2f(-126.63   , 61.75   );three_d[4] = Point3f(-0.666451, -0.163232  , -4.97466  );
  two_d[5] = Point2f(-64.62    , -62.58  );three_d[5] = Point3f(-0.10607 ,  7.68444   , -10.8461  );
  two_d[6] = Point2f(-111.84   , 132.06  );three_d[6] = Point3f(-0.420464, -0.0514918 , -4.57443  );
  two_d[7] = Point2f(0.38      , 65.88   );three_d[7] = Point3f(0.291173 ,  0.290549  , -5.42854  );
  two_d[8] = Point2f(231.87    , -130.22 );three_d[8] = Point3f(1.42909  , -0.995737  , -7.02336  );
  two_d[9] = Point2f(277.17    , -71.16  );three_d[9] = Point3f(1.80516  , -1.04873   , -6.59349  );
  for(int i=0;i<10;i++)
  {
    row1.push_back(three_d[i].x);
    row1.push_back(three_d[i].y);
    row1.push_back(three_d[i].z);
    row1.push_back(1);
    row1.insert(row1.end(),4,0);
    row1.push_back(- double(two_d[i].x*three_d[i].x));
    row1.push_back(- double(two_d[i].x*three_d[i].y));
    row1.push_back(- double(two_d[i].x*three_d[i].z));
    row1.push_back(- two_d[i].x);
    row2.insert(row2.begin(),4,0);
    row2.push_back(three_d[i].x);
    row2.push_back(three_d[i].y);
    row2.push_back(three_d[i].z);
    row2.push_back(1);
    row2.push_back(- double(two_d[i].y*three_d[i].x));
    row2.push_back(- double(two_d[i].y*three_d[i].y));
    row2.push_back(- double(two_d[i].y*three_d[i].z));
    row2.push_back(- two_d[i].y);
    for(int j=0;j<row1.size();j++)
    {
        A[num_of_points][j] = row1.at(j);
    }
    for(int j=0;j<row2.size();j++)
    {
       A[num_of_points+1][j] = row2.at(j);
    }
    row1.erase(row1.begin(),row1.end());
    row2.erase(row2.begin(),row2.end());
    num_of_points+=2;
  }
/*  for(int i=0;i<20;i++)
  {
    for(int j=0;j<12;j++)
    {
      cout << A[i][j] << ' ';
    }
    cout << endl;
  }*/
  Mat m(20,12,CV_64F,A);
  cout << m << endl;
  cout << endl << endl;
  Mat sol;
  SVD::solveZ(m,sol);
  cout << sol << endl;
  return 0;
}
