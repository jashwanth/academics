This Folder contains following files:

1. run.sh:
	This will execute the whole package needed for botconnector. It first executes MobileSim then botconnector and then kills MobileSim. If you don't want to kill MobileSim to observe the environment then comment the last line in the file.

2. botConnector.cpp:
	Code which can connect to Mobile sim or the robot and move it. There are six functions: connect, moveRobot, getReadings, getAngles, setRobotVelocity, disconnect.
       a. connect() - takes care of all the things needed to connect to robot. All you need to do is call this function. Connecting to MobileSim will require this much only, to connect to robot you will have to supply -rh <IP Address> or -rh <device file path>, there is no need to change the program.
       b. moveRobot() - You need to supply an r(distance to move) and theta (degrees to rotate) and robot will. Robot will first rotate by theta and than translate by r. Browse through the function to understand the aria calls.
       c. getReadings() - This function will return a vector which contains all the range values detected by sonars on the robot.
       d. getAngles() - This function will return the orientation of all the sonars with respect to robot orientation. A Vector is returned by the function. This will be needed to locate the direction of the obstacle.
       e. setRobotVelocity() - Using this function you can set velocieties of right and left wheel. This comes in handy if the robot has to move in more realistic way.
       f. disconnect() - Use this to break the connection in a clean manner.

       Usage: ./botconnector

3. botConnector.h:
	This the header file for botConnector.cpp

4. qtDraw.cpp:t
	This is a small program which using QT library reads an image, draws over it and then saves it. Displaying the image in QT is a bit more complicated, hence it was not included, if you are using QT and need to display the image please refer to documentation.

	Usage: ./qtdraw <Image name with full path>

5. cvDraw.cpp:
	This is a small program which using OpenCV library reads, displays, writes and draws over an image.

	Usage: ./cvdraw <Image name with full path>

6. Makefile:
	Using "make" command will compile botConnector, cvDraw and qtDraw for you. In case you are not familiar with make, you can also compile them individualy by
	make botconnector
	make cvdraw
	make qtdraw
	If you want to recompile the whole code first use "make clean" to delete output files of Makefile and than later use "make".

	There shouldn't be any issue with compilations if all the libraries are installed correctly. The following error is most likely while compiling cvDraw:
	"Package opencv was not found in the pkg-config search path.
	Perhaps you should add the directory containing `opencv.pc'
	to the PKG_CONFIG_PATH environment variable
	No package 'opencv' found."
	pkg-config is advantageous because it will take care of different versions, otherwise library names will differ.
	To get rid of the above error try following things:
	1. Execute "locate opencv.pc" one of the paths will be <Install Path>/lib/pkgconfig, in most cases <Install Path> should be /usr/local/, if you have changed the install path than opencv.pc should be in that directory.
	2. export PKG_CONFIG_PATH=<Install Path>/lib/pkgconfig.
	3. If the above don't help than `pkg-config ...` by 
	for v2.2 or later: -I <Install Path>/include/ -L <Install Path>/lib -lopencv_core -lopencv_highgui
	for v2.1 or earlier: -I <Install Path>/include/ -L <Install Path>/lib -lcv -lhighgui
