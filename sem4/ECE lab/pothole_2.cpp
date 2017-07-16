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


int aug(int u,int T,int minCap)
{
	if(u==T) return minCap;
	if(vis[u]) return 0;
	vis[u] = true;

	for(int v = 1;v<=n;v++)
		if(cap[u][v]>0)
		{
			int f = aug(v,T,min(minCap,cap[u][v]));
			if(f>0)
			{
				cap[u][v]-=f;
				cap[v][u]+=f;
				return f;
			}
		}
	return 0;
}

int maxFlow(int S,int T)
{
	int flow = 0;
	memset(vis,false,sizeof vis);

	while(1)
	{
		int f = aug(S,T,INF);
		if(f==0) break;
		flow+=f;
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

