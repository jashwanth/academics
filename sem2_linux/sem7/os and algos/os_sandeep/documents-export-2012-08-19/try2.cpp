#include <iostream>
#include <unistd.h>
#include <fcntl.h>

using namespace std;

int main()
{
	//First, we're going to open a file
	int file = open("myfile.txt", O_APPEND | O_WRONLY),x;
	if(file < 0)    return 1;

	//Now we redirect standard output to the file using dup2
	cout<<file<<endl;
	if((x=dup2(file,6)) < 0)    return 1;

	//Now standard out has been redirected, we can write to
	// the file
	cout << "This will print in myfile.txt" << endl;
	cout<<x<<endl;

	return 0;
}//end of function main


