#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int sum(int a[],int end)
{
  int i,ans=0;
  for(i=0;i<=end;i++)
    ans += a[i];
  return ans;
}
int main() {
  int t,n,a_i,i;
  cin >> t;
  int *arr;
  while(t--)
  {
    cin >> n;
    arr = (int *)malloc(n*sizeof(int));
    for(i=0;i<n;i++)
      cin >> arr[i];
    sort(arr,arr+n);
    for(i=n-1;i>=0;i--)
    {
      if(i==1)
      {
	cout << -1 << endl;
	break;
      }
      if(arr[i] < sum(arr,i-1))
      {
	cout << i+1 << endl;
	break;
      }
    }
  }
  /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
  return 0;
}

