#include "iostream"
#include <sstream>
#include <string>
#include <ros/ros.h> //ros库
#include <std_msgs/Empty.h>
#include <std_msgs/String.h>

using namespace std;

/*ros节点定义*/
class rosnode
{
public:
    rosnode(); //构造函数
    void messagepub(const string msg);

private:
    ros::NodeHandle nh;
    ros::Subscriber sub;
    ros::Publisher pub;
    void messagecallback(const std_msgs::String::ConstPtr &msg); //距离订阅回调函数
};

rosnode::rosnode() //构造函数初始化
{
    pub = nh.advertise<std_msgs::String>("talk", 10000);
    sub = nh.subscribe("listen", 1, &rosnode::messagecallback, this);
}

void rosnode::messagecallback(const std_msgs::String::ConstPtr &msg)
{
    ROS_INFO("I heard :%s", (msg->data).c_str());
}

void rosnode::messagepub(const string msg)
{
    std_msgs::String data;
    data.data = msg;
    pub.publish(data);
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "sp_class");
    rosnode sp;
    ros::Rate loop_rate(1);
    string pub_msgs;
    int cout = 0;
    while (ros::ok())
    {
        stringstream ss;
        ss << "test pub! " << cout;
        pub_msgs = ss.str();
        sp.messagepub(pub_msgs);
        ros::spinOnce();
        ++cout;
        loop_rate.sleep();
    }
    printf("Close...\n");
    return 0;
}
