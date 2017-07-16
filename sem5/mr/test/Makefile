#Makefile to compile using Aria

CC 	= g++
FLAGS 	= -Wall -g
ARIALIB 	= -L /usr/local/Aria/lib/ -lAria -ldl -lpthread -lrt
ARIAINCLUDE	= -I /usr/local/Aria/include/

all: botConnector my_1 my_2 my_3 my_4

botConnector: botConnector.o 
	$(CC) -o $@ $? $(ARIALIB)
# "$@" is the variable for the ouput
# "$?" is the variable for the input

botConnector.o: botConnector.h botConnector.cpp 
	$(CC) -c botConnector.cpp $(ARIAINCLUDE)

my_1: my_1.o 
	$(CC) -o $@ $? $(ARIALIB)
# "$@" is the variable for the ouput
# "$?" is the variable for the input

my_1.o: botConnector.h my_1.cpp 
	$(CC) -c my_1.cpp $(ARIAINCLUDE)
my_2: my_2.o 
	$(CC) -o $@ $? $(ARIALIB)
# "$@" is the variable for the ouput
# "$?" is the variable for the input

my_2.o: botConnector.h my_2.cpp 
	$(CC) -c my_2.cpp $(ARIAINCLUDE)

my_3: my_3.o 
	$(CC) -o $@ $? $(ARIALIB)
# "$@" is the variable for the ouput
# "$?" is the variable for the input

my_3.o: botConnector.h my_3.cpp 
	$(CC) -c my_3.cpp $(ARIAINCLUDE)
my_4: my_4.o 
	$(CC) -o $@ $? $(ARIALIB)
# "$@" is the variable for the ouput
# "$?" is the variable for the input

my_4.o: botConnector.h my_4.cpp 
	$(CC) -c my_4.cpp $(ARIAINCLUDE)
#If pkg-config is giving error, follow instruction in Readme.txt

#Uncomment the below two lines if opencv is installed in the system


clean:
	rm -rf *.o
	rm -rf botConnector
	rm -rf my_2
	rm -rf my_3
	rm -rf my_4
