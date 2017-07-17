#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;
int n,m;
char a[20][20];
int compare(int x1,int y1,int x2,int y2,int size1,int size2)
{
  int i,j,p,q;  
  for(i=x1,p=x2;i<=x1+size1-1;i++,p++)
  {
    for(j=y1,q=y2;j<=y1+size2-1;j++,q++)
    {
      if(a[i][j] == a[p][q]);
      else
	return 0;
    }
  }  
  
  return 1;
}
int func(int x,int y)
{
  int i,j,p,q;
  for(i=1;i <= n-x+1;i++)
  {
    for(j=1;j <= m-y+1;j++)
    {
      for(p=i;p <= n-x+1;p++)
      {
	for(q=j;q <= m-y+1;q++)
	{
	  if(i==p && q==j)
	    continue;
	  if(compare(i,j,p,q,x,y))
	    return x*y;
	}
      }
    }
  }
  return -1;
}

int main() {

  int t,i,j;
  cin >> t;
  while(t--)
  {
    cin >> n >> m;
    for(i=1;i<=n;i++)
    {
      for(j=1;j<=m;j++)
      {
	cin >> a[i][j];
      }
    }
 /*   for (i=1;i<=n;i++){
      for (j=1;j<=m;j++){ printf("%d ",a[i][j]);}
      printf("\n");
    }  */
    int ans1,ans2,ans=0;
    for(i=n;i>=1;i--)
    {
      for(j=m;j>=1;j--)
      {
	if(i==n&&j==m)
	  continue; 
	ans1 = func(i,j);
	if(ans<ans1)
	  ans = ans1;
      }
    }
    cout << ans << endl;
  } 
  return 0;
}
