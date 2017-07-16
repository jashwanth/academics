#include "botConnector.h"
#include<cstdio>
#include<cmath>
#include<cstdlib>
#include "Aria.h"
float des_angle,omnicx,omnicy,des_x=0,des_y=6000,r[3][6],v=200,vleft=200,vright=200;
float tan_inv(float a,float b)
{
  if(b==0)
  {
    if(a>0)
      return 90;
    if(a<0)
      return 270;
  }
  if(a==0)
  {
    if(b>0)
      return 0;
    if(b<0)
      return 180;
  }
  if(a>0 && b>0)
    return atan(a/b)*(180/M_PI);
  if(a>0 && b<0)
    return (atan(a/b)+M_PI)*(180/M_PI);
  if(a<0 && b>0)
    return ((2.0*M_PI)+(atan(a/b)))*(180/M_PI);
  if(a<0 && b<0)
    return (atan(a/b)+M_PI)*(180/M_PI);
}
void adjust_pos()
{
  int i,flag=0,j,k,check_sum=0,check_sum2=0,check_sum3=0,comp = 0;
  float des_anglep,des_anglen,d_p,d_n,c2r_angle,cone_angle;
  comp = 0;
  while(1)
  {
    if(comp==0)
    {
      des_anglep = des_anglen = des_angle;
    }
    check_sum2 = check_sum3 = 0;
    for(i=1;i<=2;i++)
    {
      //    d_p  = tan_inv((v_net*sin(des_anglep*(PI/180)) - robot[i].vy),(v_net*cos(des_anglep*(PI/180)) - robot[i].vx));
      d_p  = tan_inv(v*sin(des_anglep) - r[i][4],v*cos(des_anglep) - r[i][3]);
      if((d_p < 90 && r[i][2] < omnicy))// && obj[h].xcent > obj[0].xcent)
	d_p = 360+ d_p;
      if((d_p > 270 && d_p < 360 && r[i][2] > omnicy))//&& obj[h].xcent > obj[0].xcent)
	d_p= d_p-360;
      c2r_angle   = tan_inv(r[i][2]-omnicy,r[i][1]-omnicx);
      float dist  = sqrt(pow(r[i][1]-omnicx,2)+pow(r[i][2]-omnicy,2));
      cone_angle  = asin((r[i][5]+r[0][5])/dist)*(180/M_PI);
      if(dist < 2*r[0][5]+r[i][5])
      {
	printf("collision occured\n");
	exit(1);
      }
      if((d_p > c2r_angle+cone_angle || d_p < c2r_angle-cone_angle))
      {
	check_sum2++;
      }
    }
    if(check_sum2==2)
    {
      des_angle = des_anglep;
      r[0][3] = v*cos(des_angle * (M_PI/180.0));
      r[0][4] = v*sin(des_angle * (M_PI/180.0));
      printf("return from adj_pos()\n");
      return;
    }
    check_sum3=0;
    for(i=1;i<=2;i++)
    {
      //      d_n  = tan_inv((v_net*sin(des_anglen*(PI/180)) - robot[i].vy),(v_net*cos(des_anglen*(PI/180)) - robot[i].vx));
      d_n  = tan_inv(v*sin(des_anglen)- r[i][4],v*cos(des_anglen) - r[i][3]);
      if((d_n < 90 && r[i][2] < omnicy))// && obj[h].xcent > obj[0].xcent)
	d_n= 360 + d_n;
      if((d_n > 270 && d_n < 360 && r[i][2] > omnicy))//&& obj[h].xcent > obj[0].xcent)
	d_n= d_n-360;
      c2r_angle   = tan_inv(r[i][2]-omnicy,r[i][1]-omnicx);
      float dist      = sqrt(pow(r[i][1]-omnicx,2)+pow(r[i][2]-omnicy,2));
      if(dist < 2*r[0][5]+r[i][5])
      {
	printf("collision occured\n");
	exit(1);
      }
      cone_angle  = asin((r[i][5]+r[0][5])/dist)*(180/M_PI);
      if(dist < (2*r[0][5])+r[i][5])
      {
	printf("collision occured\n");
	exit(1);
      }
      if((d_n > c2r_angle+cone_angle || d_n < c2r_angle-cone_angle))
      {
	check_sum3++;
      }
    }
    if(check_sum3==2)
    {
      des_angle = des_anglen;
      r[0][3] = v*cos(des_angle * (M_PI/180.0));
      r[0][4] = v*sin(des_angle * (M_PI/180.0));
      return ;
    }
    printf("check_sum2 = %d and check_sm3 = %d\n", check_sum2, check_sum3);
    if(check_sum2 < 2 && check_sum3 < 2)
    {
      des_anglep = des_anglep + 1;
      des_anglen = des_anglen - 1;
      comp +=1;
    }
    if(des_anglen < 0)
      des_anglen += 360;
    if(des_anglep >= 360)
      des_anglep -= 360;
    if(comp >= 180)
    {
      comp = 0;
      v+=100;
      printf("v_net= %.2f\n",v);
    }
  }
}

BotConnector::BotConnector(int argc, char **argv)
{
  Aria::init();
  parser=new ArArgumentParser(&argc, argv);
  parser->loadDefaultArguments();
  robotConnector=new ArRobotConnector(parser, &robot);
  ArSonarDevice sonar;
  robot.addRangeDevice(&sonar);
  gotoPoseAction = new ArActionGoto("goto");
  robot.addAction(gotoPoseAction,95);
}
/**
 * connect() take cares of all the things needed to connect to the bot.
 * @args: None
 * @return: Connection successfull or not.
 */
bool BotConnector::connect()
{
  bool success = true; //Let's be optimistic and not pesimistic.
  if(!robotConnector->connectRobot())
  {
    ArLog::log(ArLog::Terse, "simpleConnect: Could not connect to the robot.");
    if(parser->checkHelpAndWarnUnparsed())
    {
      // -help not given
      Aria::logOptions();
      Aria::exit(1);
      success = false;
    }
  }
  else if (!Aria::parseArgs())
  {
    Aria::logOptions();
    Aria::shutdown();
    success = false;
  }
  return success;
}

/**
 * getReadings() returns readings for all the sonar present on the robot.
 * To get the relation between sonar number and direction see getAngles().
 * @args: None
 * @return: A std::vector<int> containing all the sonar readings.
 */
vector<int> BotConnector::getReadings()
{
  int count = robot.getNumSonar();
  vector<int> Z;

  for(int i=0; i<count;i++){
    int reading =  robot.getSonarRange(i);
    Z.push_back(reading);
    //        printf("sensor reading=%d\n",reading);
  }
  //    ArSensorReading *reading = robot.getSonarReading(0);
  //    unsigned int gr = reading->getRange();
  //    ArPose lPose = reading->getLocalPose(), pose=reading->getPose();
  //    double lx,ly;
  //    lx=pose.getX();
  //    ly=pose.getY();
  //    unsigned int dd = sqrt(lx*lx + ly*ly);
  //    printf("lx=%f, ly=%f, r=%u, calc=%u\n",lx,ly,gr, dd);
  return Z;
}

/**
 * getAngles() gives the angle for all the sonar present w.r.t the robot.
 * @args: None
 * @return: A std::vector<int> containing all the sonar angles.
 */
void BotConnector::getAngles(int no)
{
  vector<int> angle;
//  int count = robot.getNumSonar();
  const ArRobotParams *roboParams = robot.getRobotParams();
  r[no][0] = robot.getTh();
  r[no][1] = robot.getX();
  r[no][2] = robot.getY()-(no*1000);
  if(no!=0)
  {
    r[no][3] = v*cos(r[no][0]*(M_PI/180.0));
    r[no][4] = v*sin(r[no][0]*(M_PI/180.0));
  }
  printf("bot_number = %d,robot angle=%f, robot pose=(%f, %f) robot radius = %f\n",no,robot.getTh(),r[no][1],r[no][2],robot.getRobotRadius());
/*  for(int i=0; i<count;i++)
  {
    int sonarDir = roboParams->getSonarTh(i)+round(robot.getTh());
    angle.push_back(sonarDir);
    //        printf("angle[%d]=%d\t",i,sonarDir);
  }*/
//  printf("\n");
//  return angle;
}
void right_left()
{
  float ang = r[0][0]*(M_PI/180);
  vleft=r[0][3]*(cos(ang)+sin(ang))-r[0][4]*(cos(ang)-sin(ang));
 vright=r[0][3]*(cos(ang)-sin(ang))+r[0][4]*(cos(ang)+sin(ang));
}
/**
 * moveRobotTo() rotates the robot by the mentioned theta and displaces the robot
 * by the given distance in the new heading.
 * @args:
 * 	double r - the distance in Millimeter by which robot is to be moved. Default=1000.
 * 	double th - the angle in degrees by which the robot is to be rotated. Default=45
 * @return: None
 */
void BotConnector::moveRobot(double r, double th)
{
  ArTime start;
  robot.runAsync(true);
  robot.enableMotors();

  //rotating robot
  //    robot.lock();
  //    robot.setDeltaHeading(th);
  //    robot.unlock();
  //    ArUtil::sleep(10000);

  if( th!=0 )
  {
    robot.lock();
    robot.setHeading(th+robot.getTh());
    robot.unlock();
    start.setToNow();
    while (1)
    {
      robot.lock();
      if (robot.isHeadingDone(1))
      {
	printf("directMotionExample: Finished turn\n");
	robot.unlock();
	break;
      }
      if (start.mSecSince() > 15000)
      {
	printf("directMotionExample: Turn timed out\n");
	robot.unlock();
	break;
      }
      robot.unlock();
      ArUtil::sleep(100);
    }
  }

  //moving robot
  if( r!=0 )
  {
    robot.lock();
    robot.move(r);
    robot.unlock();
    start.setToNow();
    while (1)
    {
      robot.lock();
      if (robot.isMoveDone())
      {
	printf("directMotionExample: Finished distance\n");
	robot.unlock();
	break;
      }
      if (start.mSecSince() > 15000)
      {
	printf("directMotionExample: Distance timed out\n");
	robot.unlock();
	break;
      }
      robot.unlock();
      ArUtil::sleep(50);
    }
  }

  //    ArLog::log(ArLog::Normal, "Going to four goals in turn for %d seconds, then cancelling goal and exiting.", duration/1000);
  //    ArTime start;
  //    start.setToNow();
  //    while(Aria::getRunning())
  //    {
  //        if(robot.isHeadingDone())
  //        {
  //            robot.unlock();
  //            printf("turned in %ld\n",start.mSecSince());
  //            break;
  //        }
  //        gotoPoseAction->setGoal(pos);

  //        if(gotoPoseAction->haveAchievedGoal())
  //        if(start.mSecSince() >= duration)
  //        {
  //            gotoPoseAction->cancelGoal();
  //            printf("time out :(\n");
  //            break;
  //        }
  //        else if(gotoPoseAction->haveAchievedGoal())
  //        {
  //            gotoPoseAction->cancelGoal();
  //            printf("task in time %ld\n",start.mSecSince());
  //            break;
  //        }
  //    }
  printf("Movement Done\n");
}
void BotConnector::setRobotVelocity_idle(double vr, double vl)
{
  robot.runAsync(true);
  robot.enableMotors();

  printf("Setting vl=%.2lf mm/sec, vr=%.2lf mm/sec\n", vl, vr);
  robot.lock();
  robot.setVel2(vr, vl);
  robot.unlock();
}

/**
 * setRobotVelocity() sets the robot's right and left wheel velocity for a specified time.
 * @args:
 * 	double vr - Velocity of right wheel in Milimeter/sec. Default = 200.
 * 	double vl - Velocity of left wheel in Milimeter/sec. Default = 200.
 * 	unsigned int time - Time in MiliSecond for which the robot is to move. Default = 2000.
 * @return: None.
 */
void BotConnector::setRobotVelocity(double vr, double vl, unsigned int time)
{
    robot.runAsync(true);
    robot.enableMotors();

    printf("Setting vl=%.2lf mm/sec, vr=%.2lf mm/sec, then sleeping for %d seconds\n", vl, vr, time/1000);
    robot.lock();
    robot.setVel2(vr, vl);
    robot.unlock();

    //Just to let you know that in Aria TIME exists!!
    //ArTime start;
    //start.setToNow();
    //while (start.secSince()<2)
    //{
    //    ArUtil::sleep(50);
    //}
    

    ArUtil::sleep(time);//argument passed is in MilliSecond.
    robot.lock();
    robot.stop();
    robot.unlock();
}

/**
 * disconnect() stops the robot and severs all the connections to it. Like Father disowns the son in hindi movies.
 * @args: None
 * @return: A std::vector<int> containing all the sonar angles.
 */
int BotConnector::disconnect()
{
    robot.stopRunning();
    robot.waitForRunExit();
    return 0;
}

int main(int argc, char **argv)
{
  scanf("%f %f",&des_x,&des_y);
  BotConnector bc(argc, argv);
  if( bc.connect())
  {
    printf( "Connected to Robot\n" );
  }
  else
  {
    printf( "Connection attempt to Robot failed, Sorry :(\n" );
    return EXIT_SUCCESS;
  }
//  bc.disconnect();
  argv[1]="-rrtp";
  argv[2]="8102";
  argc=3;
  BotConnector bc1(argc, argv);
  if( bc1.connect())
  {
    printf( "Connected to Robot\n" );
  }
  else
  {
    printf( "Connection attempt to Robot failed, Sorry :(\n" );
    return EXIT_SUCCESS;
  }
  bc.setRobotVelocity_idle(400,400);
//  bc.setRobotVelocity(100,100,10000);
  bc.getAngles(0);
//  bc1.disconnect();
//  bc.moveRobot(2000.0, 45.0);
//  bc1.moveRobot(6000.0, 90.0);
//  bc1.moveRobot(6000,90);
//  bc1.moveRobot(0,180);
  argv[1]="-rrtp";
  argv[2]="8103";
  argc=3;
  BotConnector bc2(argc, argv);
  if( bc2.connect())
  {
    printf( "Connected to Robot\n" );
  }
  else
  {
    printf( "Connection attempt to Robot failed, Sorry :(\n" );
    return EXIT_SUCCESS;
  }
/*  vector<int> readings = bc.getReadings();
  for( int i=0; i<readings.size(); i++ )
  {
    printf("%d\t", readings[i]);
  }
  printf("\n");
  printf("Sleeping for 5 seconds\n");
  ArUtil::sleep(5000);
//  bc.setRobotVelocity(400, 200, 10000);
*/
//  bc2.moveRobot(2000,-45);
//  bc2.moveRobot(0,135);
//  bc.setRobotVelocity(-100,-100, 10000);
//  bc.moveRobot(0,90);
  bc.getAngles(0);
  bc1.getAngles(1);
  bc2.getAngles(2);
  bc1.setRobotVelocity_idle(0,0);
  bc2.setRobotVelocity_idle(0,0);
  omnicx = r[0][1];
  omnicy = r[0][2]+300;
  for(int f=0;f<=200;f++)
  {
    des_angle = tan_inv((des_y-omnicy),(des_x-omnicx));
    adjust_pos();
    right_left();
    bc.setRobotVelocity_idle(vright,vleft);
    ArUtil::sleep(300);
    bc.getAngles(0);
    bc1.getAngles(1);
    bc2.getAngles(2);
    //bc3.getAngles(3);
    omnicx = omnicx+r[0][3]*0.3;
    omnicy = omnicy+r[0][4]*0.3;
  }
  bc.disconnect();
  bc1.disconnect();
  return bc2.disconnect();
}
