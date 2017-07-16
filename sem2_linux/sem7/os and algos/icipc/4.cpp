#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;
int n,m,a[20][20];
int compare(int x1,int y1,int x2,int y2,int size1,int size2)
{
  int i,j,k;
  for(i=x1,x2;i<=x1+size1-1;i++,x2++)
  {
    for(j=y1,y2;j<=y1+size2-1;j++,y2++)
    {
      if(a[i][j] == a[x2][y2]){}
      else
	return 0;
    }
  }
  return 1;
}
int func(int x,int y)
{
  int i=1,j=1,i1,j1;
  for(i=1;i<=n-x+1 ;i++)
  {
    for(j=1;j<=m-y+1;j++)
    {
      for(i1=i;i1<=n-x+1;i1++)
      {
	for(j1=j;j1<=m-y+1;j1++)
	{
	  if(i==i1 && j1==j)
	    continue;
          if(compare(i,j,i1,j1,x,y))
	    return x*y;
	}
      }
    }
  }
  return -1;
}
//  compare(a,i,j,

int main() {

  int t,i,j;
  char ch;
  cin >> t;
  while(t--)
  {
    cin >> n >> m;
    for(i=1;i<=n;i++)
    {
      for(j=1;j<=m;j++)
      {
	cin >> ch;
	a[i][j] = ch;
      }
//      getchar();
    }
/*   for(i=1;i<=n;i++)
   {
     for(j=1;j<=m;j++)
     {  
       cout << a[i][j] << ' ' ;
     }
     cout << endl;
   } */
    int ans1,ans2,ans=1;
   for(i=n;i>=1;i--)
   {
     for(j=m;j>=1;j--)
     {
       ans1 = func(i,j-1);
       ans2 = func(i-1,j);
       if(ans1!=-1 && ans<ans1)
	 ans = ans1;
       if(ans2!=-1 && ans<ans2)
	 ans = ans2;
     }
   }
   cout << ans << endl;
  } 
  return 0;
}

