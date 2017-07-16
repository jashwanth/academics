/*
MobileRobots Advanced Robotics Interface for Applications (ARIA)
Copyright (C) 2004, 2005 ActivMedia Robotics LLC
Copyright (C) 2006, 2007, 2008, 2009 MobileRobots Inc.

     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation; either version 2 of the License, or
     (at your option) any later version.

     This program is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.

     You should have received a copy of the GNU General Public License
     along with this program; if not, write to the Free Software
     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

If you wish to redistribute ARIA under different terms, contact 
MobileRobots for information about a commercial version of ARIA at 
robots@mobilerobots.com or 
MobileRobots Inc, 10 Columbia Drive, Amherst, NH 03031; 800-639-9481
*/
#include "Aria.h"

/** @example gotoActionExample.cpp Uses ArActionGoto to drive the robot in a square
 
  This program will make the robot drive in a 2.5x2.5 meter square by
  setting each corner in turn as the goal for an ArActionGoto action.
  It also uses speed limiting actions to avoid collisions. After some 
  time, it cancels the goal (and the robot stops due to a stopping action) 
  and exits.

  Press escape to shut down Aria and exit.
*/

int main(int argc, char **argv)
{
  Aria::init();
  ArArgumentParser parser(&argc, argv);
  parser.loadDefaultArguments();
  ArSimpleConnector simpleConnector(&parser);
  ArRobot robot;
  ArSonarDevice sonar;
  ArAnalogGyro gyro(&robot);
  robot.addRangeDevice(&sonar);
  float des_x,des_y;
  scanf("%f %f",&des_x,&des_y);
  // Make a key handler, so that escape will shut down the program
  // cleanly
/*  ArKeyHandler keyHandler;
  Aria::setKeyHandler(&keyHandler);
  robot.attachKeyHandler(&keyHandler);
  printf("You may press escape to exit\n");
*/
  // Collision avoidance actions at higher priority
/*  ArActionLimiterForwards limiterAction("speed limiter near", 300, 600, 250);
  ArActionLimiterForwards limiterFarAction("speed limiter far", 300, 1100, 400);
  ArActionLimiterTableSensor tableLimiterAction;
  robot.addAction(&tableLimiterAction, 100);
  robot.addAction(&limiterAction, 95);
  robot.addAction(&limiterFarAction, 90);
*/
  // Goto action at lower priority
  ArActionGoto gotoPoseAction("goto");
  robot.addAction(&gotoPoseAction, 50);
  gotoPoseAction.setGoal((ArPose(des_x,des_y)));
  // Stop action at lower priority, so the robot stops if it has no goal
  ArActionStop stopAction("stop");
  robot.addAction(&stopAction, 40);
  ArActionStallRecover recover;
  robot.addAction(&recover, 200);
  // Parse all command line arguments
  if (!Aria::parseArgs() || !parser.checkHelpAndWarnUnparsed())
  {    
    Aria::logOptions();
    exit(1);
  }

  // Connect to the robot
  if (!simpleConnector.connectRobot(&robot))
  {
    printf("Could not connect to robot... exiting\n");
    Aria::exit(1);
  }
  robot.runAsync(true);

  // turn on the motors, turn off amigobot sounds
  robot.enableMotors();
  robot.comInt(ArCommands::SOUNDTOG, 0);

  const int duration = 30000; //msec
//  ArLog::log(ArLog::Normal, "Going to four goals in turn for %d seconds, then cancelling goal and exiting.", duration/1000);

  ArTime start;
  start.setToNow();
  while (Aria::getRunning()) 
  {
    robot.lock();
    // Choose a new goal if this is the first loop iteration, or if we 
    // achieved the previous goal.
    if(gotoPoseAction.haveAchievedGoal())
    {
      robot.unlock();
      break;
    }
    float range,stop_dist=1000;
    range = sonar.currentReadingPolar(-90,90) - robot.getRobotRadius();
    if(range > stop_dist)
    {
    }
    else
    {
      printf("range < stop ");
      robot.setVel(0);
    }
    float left_range,right_range;
    left_range = sonar.currentReadingPolar(0,100) - robot.getRobotRadius();
    right_range = sonar.currentReadingPolar(-100,0) - robot.getRobotRadius();
    if(left_range > 1000 && right_range > 1000)
    {
    }
    else if(left_range > 1000 && right_range < 1000)
    {
      printf("left move ");
      robot.setDeltaHeading(10);
      ArUtil::sleep(500);
      robot.clearDirectMotion();
    }
    else if(left_range < 1000 && right_range > 1000)
    {
      printf("right move ");
      robot.setDeltaHeading(-10);
      ArUtil::sleep(500);
      robot.clearDirectMotion();
    }
    else if(left_range < right_range < 1000)
    {
      printf("right move but l_r < r_r ");
      robot.setDeltaHeading(-10);
      ArUtil::sleep(500);
      robot.clearDirectMotion();
    }
    else if(right_range < left_range < 1000)
    {
      printf("left move but r_r < l_r ");
      robot.setDeltaHeading(10);
      ArUtil::sleep(500);
      robot.clearDirectMotion();
    }  
    robot.unlock();

    ArUtil::sleep(100);
    ArLog::log(ArLog::Normal,"%f %f\n",robot.getX(),robot.getY());
    /*    if(start.mSecSince() >= duration) {
	  ArLog::log(ArLog::Normal, "%d seconds have elapsed. Cancelling current goal, waiting 3 seconds, and exiting.", duration/1000);
	  gotoPoseAction.cancelGoal();
	  robot.unlock();
	  ArUtil::sleep(3000);
	  break;
	  }*/
  }
  // Robot disconnected or time elapsed, shut down
  Aria::shutdown();
  return 0;
}
