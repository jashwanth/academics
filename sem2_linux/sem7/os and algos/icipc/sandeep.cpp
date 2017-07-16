#include<cstdio>
#include<cstdlib>
#include<algorithm>
using namespace std;
char mat[16][16];
int match_func(int i,int j,int k,int l,int col_len){
  int x,ans=0;
  for (x=0;x<col_len;x++){
    if (mat[i][j+x]!=mat[k][l+x]){
      break;
    }else ans++;
  }
  return ans;
}
int main(){
  int T,n,m,i,j,k,l;
  scanf("%d",&T);
  while (T--){
    scanf("%d%d",&n,&m);
    for (i=0;i<n;i++) scanf("%s",mat[i]);
    int ans=0;
    for (i=0;i<n;i++){
      for (j=0;j<m;j++){
	for (k=0;k<n;k++){
	  for (l=0;l<m;l++){
	    if (i==k and j==l) continue;
	    int x=j,y=l,row_len=0,col_len=0,temp;
	    while (mat[i][x]==mat[k][y] and x<m and y<m){
	      x++,y++,col_len++;
	    }
	    x=i,y=k;
	    if (col_len>0){
	      while (x<n and y<n and (temp=match_func(x,j,y,l,col_len))>0){
		col_len=min(col_len,temp);
		x++,y++,row_len++;
		ans=max(ans,row_len*col_len);
	      }
	    }
	  }
	}
      }
    }
    printf("%d\n",ans);
  }
  return 0;
}

