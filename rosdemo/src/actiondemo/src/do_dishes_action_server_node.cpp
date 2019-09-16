//这是actionlib的服务端

#include <actiondemo/DoDishesAction.h>
#include <actionlib/server/simple_action_server.h>

//这样定义下会用起来简洁许多
typedef actionlib::SimpleActionServer<actiondemo::DoDishesAction> Server;

class DoDishesActionServer
{
public:
    DoDishesActionServer(ros::NodeHandle n):
            server(n, "do_dishes",
                    boost::bind(&DoDishesActionServer::ExecuteCb, this, _1), false)
    {
        //注册抢占回调函数
        server.registerPreemptCallback(boost::bind(&DoDishesActionServer::preemptCb, this));
    }

    //启动服务
    void Start()
    {
        server.start();
    }

    //回调函数，在此添加代码实现你要的功能
    void ExecuteCb(const actiondemo::DoDishesGoalConstPtr& goal) {
        // 在次添加你所要实现的功能
        ROS_INFO("Received goal,the dish id is :%d", goal->dishwasher_id);
        //反馈
        actiondemo::DoDishesFeedback feedback;
        ros::Rate rate(1);
        int cur_finished_i = 1;
        int toal_dish_num = 10;
        for(cur_finished_i = 1; cur_finished_i <= toal_dish_num; cur_finished_i++)
        {
            if(!server.isActive())break;

            ROS_INFO("Cleanning the dish::%d", cur_finished_i);
            feedback.percent_complete = cur_finished_i/10.0;
            server.publishFeedback(feedback);
            rate.sleep();
        }
        actiondemo::DoDishesResult result;
        result.total_dishes_cleaned = cur_finished_i;

        if(server.isActive())server.setSucceeded();

    }

    //中断回调函数
    void preemptCb()
    {
        if(server.isActive()){
            server.setPreempted();//强制中断
        }
    }

    Server server;
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "do_dishes_server");
    ros::NodeHandle n;
    //初始化，绑定回调函数

    DoDishesActionServer actionServer(n);
    //启动服务器，等待客户端信息到来
    actionServer.Start();
    ros::spin();
    return 0;
}