main()
{
  int retsum;
  retsum = sum(1, 2, 3, 4, 5, 6);
}

int sum(int numA, int numB, int numC, int numD, int numE, int numF)
{
  int temp;
  temp = numF;
  temp += numA + numB + numC + numD + numE;
  return temp;
}
