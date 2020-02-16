#include<ros/ros.h>
#include<std_msgs/Float64.h>
#include<geometry_msgs/Twist.h>

/*消息类型采用Twist 
 *线速度x,y,z代表参数a,k,r
 *角速度x,y代表参数步态和开关*/

//构造ros特有数据
ros::Publisher pub[11];         //构造发布话题的节点数组
std_msgs::Float64 joints[11];   //等待发布的关节变量
bool Ismove = false;
float gait = 1;
float para_a = 1;
float para_k = 2.3;
float para_r = 0;
float t1,t;
const float w = 5;	//定义电机角速度w

void sk_move();
void gait_pub();
void wy_move();
void u_move();
void pp_move();	
void para_change(const geometry_msgs::TwistConstPtr& msg);

int main(int argc,char **argv)
{
  
  ros::init(argc,argv,"snake_control");
  ros::NodeHandle nh;
  pub[0]=nh.advertise<std_msgs::Float64>("/snake/joint1_controller/command",1000);
  pub[1]=nh.advertise<std_msgs::Float64>("/snake/joint2_controller/command",1000);
  pub[2]=nh.advertise<std_msgs::Float64>("/snake/joint3_controller/command",1000);
  pub[3]=nh.advertise<std_msgs::Float64>("/snake/joint4_controller/command",1000);
  pub[4]=nh.advertise<std_msgs::Float64>("/snake/joint5_controller/command",1000);
  pub[5]=nh.advertise<std_msgs::Float64>("/snake/joint6_controller/command",1000);
  pub[6]=nh.advertise<std_msgs::Float64>("/snake/joint7_controller/command",1000);
  pub[7]=nh.advertise<std_msgs::Float64>("/snake/joint8_controller/command",1000);
  pub[8]=nh.advertise<std_msgs::Float64>("/snake/joint9_controller/command",1000);
  pub[9]=nh.advertise<std_msgs::Float64>("/snake/joint10_controller/command",1000);
  pub[10]=nh.advertise<std_msgs::Float64>("/snake/joint11_controller/command",1000);
  ros::Subscriber para_get=nh.subscribe("/para",1000,&para_change);
  
  ros::Rate r(100);
  ros::Time cur_time;
  cur_time = ros::Time::now();
  t1 = cur_time.sec;
  ROS_INFO_STREAM("Init Ok!");
  
  while(ros::ok())
  {
    ros::spinOnce();	//运行回调函数，捕获参数输入
    cur_time = ros::Time::now();
    if (Ismove == true)
      t =cur_time.sec+(cur_time.nsec*10e-10)-t1;       //获得相对时间
    else
      t1 = t;
    sk_move();
    r.sleep();
  }
}

//蜿蜒
void wy_move()		
{ 
  for (int i = 0; i<11;i++)
  {
        //奇关节
    if((i%2)==0)
	joints[i].data=-(para_a*sin(para_k*(i+1)+t*w)+para_r);
    else 	
	joints[i].data=0;
  }
}

//U型
void u_move()		
{
	for (int i = 0; i<11;i++)
	{     
	    if((i%4)==1||(i%4)==2)        //奇关节
	      joints[i].data=-(para_a*sin(1.57*(i+1)+t*w)+para_r);
	    else if((i%4)==3||(i%4)==0)	//偶关节
	      joints[i].data=(para_a*sin(1.57*(i+1)+t*w)+para_r);
	}
}

//攀爬
void pp_move()		
{
	for (int i = 0; i<11;i++)
	{     
	    if((i%4)==1||(i%4)==2)        //奇关节
	      joints[i].data=-(para_a*sin(para_k*(i+1)+t*w)+para_r);
	    else if((i%4)==3||(i%4)==0)	//偶关节
	      joints[i].data=(para_a*sin(para_k*(i+1)+t*w)+para_r);
	}
}

//步态发布
void gait_pub()		
{
  //ROS_INFO_STREAM(para_a);
  for(int i = 0 ; i<11;i++)
  {
    pub[i].publish(joints[i]);
  }
}

//步态选择
void sk_move()		
{
  if(gait == 1)
  {
    wy_move();
  }
  else if(gait == 2)
  {
    u_move();
  }
  else if(gait == 3)
  {
    pp_move();
  }
  gait_pub();
}

//仿真参数获取回调函数
void para_change(const geometry_msgs::TwistConstPtr& msg)
{
  float station;
  station = msg->angular.y;
  if(station == 0)
    Ismove = false;
  if(station == 1)
    Ismove = true;
  para_a = msg->linear.x;
  para_k = msg->linear.y;
  para_r = msg->linear.z;
  gait = msg->angular.x;
}
