#Makefile to compile using Aria

CC 	= g++
FLAGS 	= -Wall -g
ARIALIB 	= -L /usr/local/Aria/lib/ -lAria -ldl -lpthread -lrt
ARIAINCLUDE	= -I /usr/local/Aria/include/
QTLIB 	= -lQtGui
QTINCLUDE	= -I /usr/include/qt4/

all: botconnector qtdraw cvdraw

botconnector: botConnector.o 
	$(CC) -o $@ $? $(ARIALIB)
# "$@" is the variable for the ouput
# "$?" is the variable for the input

botConnector.o: botConnector.h botConnector.cpp 
	$(CC) -c botConnector.cpp $(ARIAINCLUDE)

qtdraw: qtDraw.cpp
	$(CC) -o $@ $? $(QTINCLUDE) $(QTLIB)

#If pkg-config is giving error, follow instruction in Readme.txt

#Uncomment the below two lines if opencv is installed in the system

cvdraw: cvDraw.cpp 
	$(CC) -o $@ $? `pkg-config --cflags --libs opencv`

clean:
	rm -rf *.o
	rm -rf botconnector
	rm -rf qtdraw
	rm -rf cvdraw
