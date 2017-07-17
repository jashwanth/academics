#include <iostream>
#include <fstream>
#include<stdio.h>
using namespace std;

int main () {
  FILE* inp;
  inp = fopen ("ImageDetails.txt","r");
  double ch;
  while(!feof(inp))
  {
      fscanf(inp,"%lf",&ch);
      cout <<  ch << ' ';
  }
  fclose(inp);
  return 0;
}
