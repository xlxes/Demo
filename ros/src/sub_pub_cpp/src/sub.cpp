#include "ros/ros.h"
#include "std_msgs/String.h"

void chatterCallback(const std_msgs::String::ConstPtr &msg) //是一个回调函数，当接收到 chatter 话题的时候就会被调用。
{
    ROS_INFO("I heard: [%s]", msg->data.c_str());
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "listener");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("chatter", 1, chatterCallback);
    //告诉 master 我们要订阅 chatter 话题上的消息。当有消息发布到这个话题时，ROS 就会调用 chatterCallback() 函数。
    //第二个参数是队列大小，以防我们处理消息的速度不够快，当缓存达到 1000 条消息后，再有新的消息到来就将开始丢弃先前接收的消息。
    // while (ros::ok)
    // {
    //     ros::spinOnce(); 
    // }
    ros::spin();
    //ros::spin() 进入自循环，可以尽可能快的调用消息回调函数。
    return 0;
}