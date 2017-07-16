#include <cstdio>
#include <cstring>
#include <algorithm>
#include <queue>
using namespace std;

#define MX 222
#define INF 1000000

int n;
bool vis[MX];
int cap[MX][MX];


bool aug(int u,int T,int f)
{
	if(u==T) return true;
	if(vis[u]) return false;
	vis[u] = true;

	for(int v = 1;v<=n;v++)
		if(cap[u][v]>=f && aug(v,T,f))
		{
			cap[u][v]-=f;
			cap[v][u]+=f;
			return true;
		}
	return false;
}

int maxFlow(int S,int T)
{
	int flow = 0;
	memset(vis,false,sizeof vis);

	for(int f=INF;f>0;)
	{
		if(aug(S,T,f))
			flow+=f;
		else
			f/=2;

		memset(vis,false,sizeof vis);
	}

	return flow;
}



int main()
{
	int kases;
	for(scanf("%d",&kases);kases--;)
	{
		scanf("%d",&n);
		memset(cap,0,sizeof cap);
		for(int i=1;i<n;i++)
		{
			int m;
			scanf("%d",&m);
			while(m--)
			{
				int j; scanf("%d",&j);
				if(i==1 || j==n) cap[i][j] = 1;
				else cap[i][j] = INF;
			}
		}
		printf("%d\n",maxFlow(1,n));
	}
	return 0;
}

