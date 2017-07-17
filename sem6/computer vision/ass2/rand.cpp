#include<cstdio>
#include<cstdlib>
#include<ctime>
#include<iostream>
using namespace std;
int main()
{
  srand(time(NULL));
  for(int k=0;k<10;k++)
  {
    int rand_gen[10];
    for(int i=0;i<10;i++)
    {
      rand_gen[i] =  rand();
    }
    for(int i=0;i<10;i++)
      cout << rand_gen[i] << ' ' ;
    cout << endl;
  }
    return 0;
}
