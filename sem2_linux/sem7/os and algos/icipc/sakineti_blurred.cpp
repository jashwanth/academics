#include<cstdio>
#include<iostream>
#include<vector>
#include<map>
#include<set>
#include<stack>
#include<queue>
#include<algorithm>
#include<cmath>
#include<string>
#include<cstdlib>
#include<climits>
#include<cstring>
using namespace std;

#define PB push_back
#define INF 1000000
#define MOD 1000007
#define MP make_pair
#define tr(container , it) for(typeof(container.begin()) it=container.begin() ; it!=container.end() ; it++)
#define FOR(i,a,b) for(i=a;i<b;i++)
#define REP(i,a) FOR(i,0,a)
#define LL long long
#define VI vector < int >
#define PII pair < int , int >

char s[15][15]; 
int m,n;


// Connect Overlap
int Overlap(int x1,int y1,int x2,int y2,int x3,int y3,int x4,int y4){
    // NO overlap
    if( !(y2<y3 or x1>y4 or x2<x3 or x1>x4 ))
	    return 1;	
    return 0;
}


void CheckOverlap(int i1,int j1,int i2,int j2,int *ans){
     int flag=0;

     int l=(i2-i1+1);
     int b=(j2-j1+1);

     for(int i=0;i<(m-l+1);i++){
             for(int j=0;j<(n-b+1);j++){
		     if(i==i1 and j==j1)
			    continue; 
		          for(int p=0;p<l;p++){
			          for(int q=0;q<b;q++){
				             if(s[i+p][j+q] != s[i1+p][j1+q]){
					         flag=1;
						 break;
					     }  
				  }
			          if(flag==1)
				    break;
			  }
			  if(flag==0){
			      *ans = l*b;
			      return ;
			  }
			  if(flag==1){
			       flag=0;
			  }
		     
	     }
     } 
     return ;

}



int main(){
   int t;
   cin >> t;
   while(t--){
	int ans=0;
	cin >> m >> n;
	for(int i=0;i<m;i++){
	   for(int j=0;j<n;j++){
	      cin >> s[i][j]; 
	   }
	}
	for(int i1=0;i1<m;i1++){
	        for(int j1=0;j1<n;j1++){
		        for(int i2=i1;i2<m;i2++){
			   for(int j2=j1;j2<n;j2++){
				   if( (i2-i1+1)*(j2-j1+1) > ans){ 
		                       CheckOverlap(i1,j1,i2,j2,&ans);	   
				   }
			   }   
			}
		 
		}  
	}
	cout << ans << endl;
   }
   return 0;
}
