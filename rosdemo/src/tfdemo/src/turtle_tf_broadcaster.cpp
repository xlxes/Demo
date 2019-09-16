#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <turtlesim/Pose.h>

std::string turtle_name;

void possCallback(const turtlesim::PoseConstPtr &msg)
{
    static tf::TransformBroadcaster br; //tf广播器
    tf::Transform transform;
    transform.setOrigin(tf::Vector3(msg->x, msg->y, 0.0));  //设置位置变换矩阵（均以当前位置为基准） 
    tf::Quaternion q;           
    q.setRPY(0, 0, msg->theta);     //设置旋转角度
    transform.setRotation(q);       //设置旋转变换矩阵
    //发布当前乌龟相对世界的位置
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", turtle_name));
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "my_tf_broadcaster");
    if (argc != 2)
    {
        ROS_ERROR("need turtle name as argument");
        return -1;
    };
    turtle_name = argv[1];
    ros::NodeHandle n;
    //turtlesim节点会自动发布乌龟位置
    ros::Subscriber sub = n.subscribe(turtle_name + "/pose", 10, &possCallback);
    ros::spin();    //自循环 循环订阅位置后进入回调
    return 0;
}