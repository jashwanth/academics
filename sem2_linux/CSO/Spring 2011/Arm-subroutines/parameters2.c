main()
{
  int retsum;
  retsum = sum(1, 3, 4, 5, 6);
}

int sum(int numA, int numB, int numC, int numD, int numE)
{
  int temp;
  temp = numE;
  temp += numA + numB + numC + numD;
  return temp;
}
