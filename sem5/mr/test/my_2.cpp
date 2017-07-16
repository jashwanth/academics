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
#include <iostream>
#include <cmath>
using namespace std;
class ActionGo : public ArAction
{
  public:
    // constructor, sets myMaxSpeed and myStopDistance
    ActionGo(double maxSpeed, double stopDistance);
    // destructor. does not need to do anything
    virtual ~ActionGo(void) {};
    // called by the action resolver to obtain this action's requested behavior
    virtual ArActionDesired *fire(ArActionDesired currentDesired);
    // store the robot pointer, and it's ArSonarDevice object, or deactivate this action if there is no sonar.
    virtual void setRobot(ArRobot *robot);
  protected:
    // the sonar device object obtained from the robot by setRobot()
    ArRangeDevice *mySonar;


    /* Our current desired action: fire() modifies this object and returns
       to the action resolver a pointer to this object.
       This object is kept as a class member so that it persists after fire()
       returns (otherwise fire() would have to create a new object each invocation,
       but would never be able to delete that object).
     */
    ArActionDesired myDesired;

    double myMaxSpeed;
    double myStopDistance;
};

/* Action that turns the robot away from obstacles detected by the 
 * sonar. */
class ActionTurn : public ArAction
{
  public:
    // constructor, sets the turnThreshold, and turnAmount
    ActionTurn(double turnThreshold, double turnAmount);
    // destructor, its just empty, we don't need to do anything
    virtual ~ActionTurn(void) {};
    // fire, this is what the resolver calls to figure out what this action wants
    virtual ArActionDesired *fire(ArActionDesired currentDesired);
    // sets the robot pointer, also gets the sonar device, or deactivates this action if there is no sonar.
    virtual void setRobot(ArRobot *robot);
  protected:
    // this is to hold the sonar device form the robot
    ArRangeDevice *mySonar;
    // what the action wants to do; used by the action resover after fire()
    ArActionDesired myDesired;
    // distance at which to start turning
    double myTurnThreshold;
    // amount to turn when turning is needed
    double myTurnAmount;
    // remember which turn direction we requested, to help keep turns smooth
    int myTurning; // -1 == left, 1 == right, 0 == none
};

/*
   Note the use of constructor chaining with 
   ArAction(actionName). Also note how it uses setNextArgument, which makes it so that 
   other parts of the program could find out what parameters this action has, and possibly modify them.
 */
ActionGo::ActionGo(double maxSpeed, double stopDistance) :
  ArAction("Go")
{
  mySonar = NULL;
  myMaxSpeed = maxSpeed;
  myStopDistance = stopDistance;
  setNextArgument(ArArg("maximum speed", &myMaxSpeed, "Maximum speed to go."));
  setNextArgument(ArArg("stop distance", &myStopDistance, "Distance at which to stop."));
}

/*
   Override ArAction::setRobot() to get the sonar device from the robot, or deactivate this action if it is missing.
   You must also call ArAction::setRobot() to properly store
   the ArRobot pointer in the ArAction base class.
 */
void ActionGo::setRobot(ArRobot *robot)
{
  ArAction::setRobot(robot);
  mySonar = robot->findRangeDevice("sonar");
  if (robot == NULL)
  {
    ArLog::log(ArLog::Terse, "actionExample: ActionGo: Warning: I found no sonar, deactivating.");
    deactivate();
  }
}

/*
   This fire is the whole point of the action.
   currentDesired is the combined desired action from other actions
   previously processed by the action resolver.  In this case, we're
   not interested in that, we will set our desired 
   forward velocity in the myDesired member, and return it.

   Note that myDesired must be a class member, since this method
   will return a pointer to myDesired to the caller. If we had
   declared the desired action as a local variable in this method,
   the pointer we returned would be invalid after this method
   returned.
 */
ArActionDesired *ActionGo::fire(ArActionDesired currentDesired)
{
  double range;
  double speed;

  // reset the actionDesired (must be done), to clear
  // its previous values.
  myDesired.reset();

  // if the sonar is null we can't do anything, so deactivate
  if (mySonar == NULL)
  {
    deactivate();
    return NULL;
  }
  // get the range of the sonar
  range = mySonar->currentReadingPolar(-90, 90) - myRobot->getRobotRadius();
  // if the range is greater than the stop distance, find some speed to go
  if (range > myStopDistance)
  {
    // just an arbitrary speed based on the range
    speed = range * .3;
    // if that speed is greater than our max, cap it
    if (speed > myMaxSpeed)
      speed = myMaxSpeed;
    // now set the velocity
    myDesired.setVel(speed);
  }
  // the range was less than the stop distance, so request stop
  else
  {
    myDesired.setVel(0);
  }
  ArLog::log(ArLog::Normal, " executing fire from action go\n");
  // return a pointer to the actionDesired to the resolver to make our request
  return &myDesired;
}


/*
   This is the ActionTurn constructor, note the use of constructor chaining 
   with the ArAction. also note how it uses setNextArgument, which makes 
   it so that other things can see what parameters this action has, and 
   set them.  It also initializes the classes variables.
 */
ActionTurn::ActionTurn(double turnThreshold, double turnAmount) :
  ArAction("Turn")
{
  myTurnThreshold = turnThreshold;
  myTurnAmount = turnAmount;
  setNextArgument(ArArg("turn threshold (mm)", &myTurnThreshold, "The number of mm away from obstacle to begin turnning."));
  setNextArgument(ArArg("turn amount (deg)", &myTurnAmount, "The number of degress to turn if turning."));
  myTurning = 0;
}

/*
   Sets the myRobot pointer (all setRobot overloaded functions must do this),
   finds the sonar device from the robot, and if the sonar isn't there, 
   then it deactivates itself.
 */
void ActionTurn::setRobot(ArRobot *robot)
{
  ArAction::setRobot(robot);
  mySonar = robot->findRangeDevice("sonar");
  if (mySonar == NULL)
  {
    ArLog::log(ArLog::Terse, "actionExample: ActionTurn: Warning: I found no sonar, deactivating.");
    deactivate(); 
  }
}

/*
   This is the guts of the Turn action.
 */
ArActionDesired *ActionTurn::fire(ArActionDesired currentDesired)
{
  double leftRange, rightRange;
  // reset the actionDesired (must be done)
  myDesired.reset();
  // if the sonar is null we can't do anything, so deactivate
  if (mySonar == NULL)
  {
    deactivate();
    return NULL;
  }
  // Get the left readings and right readings off of the sonar
  leftRange = (mySonar->currentReadingPolar(0, 100) - 
      myRobot->getRobotRadius());
  rightRange = (mySonar->currentReadingPolar(-100, 0) - 
      myRobot->getRobotRadius());
  // if neither left nor right range is within the turn threshold,
  // reset the turning variable and don't turn
  if (leftRange > myTurnThreshold && rightRange > myTurnThreshold)
  {
    myTurning = 0;
    myDesired.setDeltaHeading(0);
  }
  // if we're already turning some direction, keep turning that direction
  else if (myTurning)
  {
    myDesired.setDeltaHeading(myTurnAmount * myTurning);
  }
  // if we're not turning already, but need to, and left is closer, turn right
  // and set the turning variable so we turn the same direction for as long as
  // we need to
  else if (leftRange < rightRange)
  {
    myTurning = -1;
    myDesired.setDeltaHeading(myTurnAmount * myTurning);
  }
  // if we're not turning already, but need to, and right is closer, turn left
  // and set the turning variable so we turn the same direction for as long as
  // we need to
  else 
  {
    myTurning = 1;
    myDesired.setDeltaHeading(myTurnAmount * myTurning);
  }
  ArLog::log(ArLog::Normal, " executing fire from action turn\n");
  // return a pointer to the actionDesired, so resolver knows what to do
  return &myDesired;
}

/** @example gotoActionExample.cpp Uses ArActionGoto to drive the robot in a square
 
  This program will make the robot drive in a 2.5x2.5 meter square by
  setting each corner in turn as the goal for an ArActionGoto action.
  It also uses speed limiting actions to avoid collisions. After some 
  time, it cancels the goal (and the robot stops due to a stopping action) 
  and exits.

  Press escape to shut down Aria and exit.
*/
float tan_inv(float a,float b)
{
  if(b==0)
  {
    if(a>0)
      return 90.0;
    else
      return 270.0;
  }
  if(a==0)
  {
    if(b>0)
      return 0;
    else
      return 180;
  }
  return atan(a/b)*(180.0/M_PI);
}
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
//  ActionGo go(500 , 350);
//  ActionTurn turn(400, 10);
  ArActionStallRecover recover;

  // Make a key handler, so that escape will shut down the program
  // cleanly
  // Goto action at lower priority
  ArActionGoto gotoPoseAction("goto");
  robot.addAction(&gotoPoseAction, 99);
  gotoPoseAction.setGoal(ArPose(des_x,des_y));
  // Stop action at lower priority, so the robot stops if it has no goal
  ArActionStop stopAction("stop");
  robot.addAction(&stopAction, 40);
//  robot.addAction(&go,101);
//  robot.addAction(&turn,100);
  robot.addAction(&recover,250);
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

  bool first = true;
  int goalNum = 0;
  ArTime start;
  start.setToNow();
//  robot.setHeading(tan_inv((float)(des_y-robot.getY()),(float)(des_x-robot.getX())));
// ArUtil::sleep();
// ArLog::log(ArLog::Normal, "%f",robot.getDirectMotionPrecedenceTime());
  while (Aria::getRunning()) 
  {
  //  robot.clearDirectMotion();
    robot.lock();

    if (gotoPoseAction.haveAchievedGoal())
    {
      robot.unlock();
      break;
    }
/*    float stopDistance = 400+robot.getRobotRadius();
    float range = sonar.currentReadingPolar(-90, 90) - robot.getRobotRadius();
  // if the range is greater than the stop distance, find some speed to go
    if (range > stopDistance)
    { 
    // just an arbitrary speed based on the range
     float speed = range * .3;
    // if that speed is greater than our max, cap it
    if (speed > 400)
      speed = 400;
    // now set the velocity
      robot.setVel(speed);
    }
  // the range was less than the stop distance, so request stop
    else
    {
      robot.setVel(0);
    }
    float turnThreshold = 400+robot.getRobotRadius();
    float leftRange = (sonar.currentReadingPolar(0, 100) - 
      robot.getRobotRadius());
    float rightRange = (sonar.currentReadingPolar(-100, 0) - 
      robot.getRobotRadius());
    if(leftRange >  turnThreshold && rightRange > turnThreshold)
    {
      robot.setDeltaHeading(0);
    }
    else if (leftRange < rightRange < turnThreshold)
    {
      robot.setDeltaHeading(-10);
    }
    else if( rightRange < leftRange < turnThreshold)
    {
      robot.setDeltaHeading(10);
    }
    else if(leftRange < turnThreshold && rightRange > turnThreshold)
    {
      robot.setDeltaHeading(-10);
    }
    else if(rightRange < turnThreshold && leftRange > turnThreshold)
    {
      robot.setDeltaHeading(10);
    }*/
  // if we're not turning already, but need to, and right is closer, turn left
  // and set the turning variable so we turn the same direction for as long as
  // we need to
    
  // if we're already turning some direction, keep turning that direction
  /*  if(start.mSecSince() >= duration) {
      ArLog::log(ArLog::Normal, "%d seconds have elapsed. Cancelling current goal, waiting 3 seconds, and exiting.", duration/1000);
      gotoPoseAction.cancelGoal();
      robot.unlock();
      ArUtil::sleep(3000);
      break;
    }*/

    ArUtil::sleep(1000);
    robot.unlock();
//  robot.setDirectMotionPrecedenceTime(100);
  }
  
  // Robot disconnected or time elapsed, shut down
  Aria::shutdown();
  return 0;
}
