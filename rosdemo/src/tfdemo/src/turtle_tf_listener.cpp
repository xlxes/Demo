#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/Twist.h>
#include <turtlesim/Spawn.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "my_tf_listener");
    ros::NodeHandle node;

    //调用服务产生第二只乌龟
    ros::service::waitForService("spawn");
    ros::ServiceClient add_turtle = node.serviceClient<turtlesim::Spawn>("spawn");
    turtlesim::Spawn srv;
    add_turtle.call(srv);

    //定义乌龟2的速度控制发布器
    ros::Publisher turtle_vel = node.advertise<geometry_msgs::Twist>("turtle2/cmd_vel",10);

    tf::TransformListener listerner;
    ros::Rate r(10);
    while(ros::ok())
    {
        tf::StampedTransform transform;
        try
        {
            //最长等待3秒至查找乌龟1与2之间的坐标变换
            listerner.waitForTransform("/turtle2","turtle1",ros::Time(0),ros::Duration(3.0));
            //将变换存储在transform
            listerner.lookupTransform("/turtle2","turtle1",ros::Time(0),transform);
        }

        catch(tf::TransformException &ex)
        {
            ROS_ERROR("%s",ex.what());
            ros::Duration(1.0).sleep();
            continue;
        }

        geometry_msgs::Twist vel_msg;
        vel_msg.angular.z = 4.0 * atan2(transform.getOrigin().y(),transform.getOrigin().x());
        vel_msg.linear.x = 0.5*sqrt(pow(transform.getOrigin().x(),2)+pow(transform.getOrigin().y(),2));
        turtle_vel.publish(vel_msg);
        r.sleep();
        
    }

}