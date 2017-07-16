#include <stdio.h>

int n;
main()
{
   scanf("%d",&n);
   printf("Nth Fibonacci Number: %d\n", fib(n));
}

int fib(int m)
{
 int f1, f2, temp;
 if( m == 0 ) return 1;
 if( m == 1 ) return 1;
 f1 = fib(m-1);
 f2 = fib(m-2);
 temp = f1 + f2;
 return temp;
}
