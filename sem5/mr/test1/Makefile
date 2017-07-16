#Makefile to compile using Aria

CC 	= g++
FLAGS 	= -Wall -g
ARIALIB 	= -L /usr/local/Aria/lib/ -lAria -ldl -lpthread -lrt
ARIAINCLUDE	= -I /usr/local/Aria/include/
QTLIB 	= -lQtGui
QTINCLUDE	= -I /usr/include/qt4/

all: botConnector  my_1

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
clean:
	rm -rf *.o
	rm -rf botConnector
	rm -rf qtdraw
	rm -rf cvdraw
	rm -rf my_1
