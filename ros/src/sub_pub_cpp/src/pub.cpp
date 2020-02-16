#include <sstream>
#include "iostream"
#include "ros/ros.h"
#include "std_msgs/String.h"

using namespace std;

int main(int argc, char **argv) //前面为输入参数个数 后面为输入参数的数组
{
    ros::init(argc, argv, "pub");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("chatter", 1000);
    //创建发布者，发布话题chatter，如果我们发布的消息的频率太高，缓冲区中的消息在大于1000个的时候就会开始丢弃先前发布的消息。
    ros::Rate loop_rate(10);

    int count = 0;
    while (ros::ok())
    {
        std_msgs::String msg;
        stringstream ss;
        ss << "hello world " << count;  //以字符串流的方式将数字转为字符串string
        msg.data = ss.str();            //调用str()函数后ss会自动销毁，故常赋值给string变量
        //c_str() 以 char* 形式传回 string 内含字符串，如果一个函数要求char*参数，可以使用c_str()方法
        ROS_INFO("%s", msg.data.c_str()); //ROS_INFO 和其他类似的函数可以用来代替 printf/cout 等函数。
        pub.publish(msg);                 //向所有订阅 chatter 话题的节点发送消息。
        ros::spinOnce();
        //ros::spinOnce()这一语句，否则你的回调函数就永远也不会被调用
        loop_rate.sleep();
        //调用 ros::Rate 对象来休眠一段时间以使得发布频率为 10Hz。
        ++count;
    }
    return 0;
}