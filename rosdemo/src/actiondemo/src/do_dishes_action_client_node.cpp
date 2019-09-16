//这是actionlib的客户端

#include <actiondemo/DoDishesAction.h>
//#include <actionlib_msgs/GoalStatusArray.h>
#include <actionlib/client/simple_action_client.h>

//这样定义下会用起来简洁许多
typedef actionlib::SimpleActionClient<actiondemo::DoDishesAction> Client;

class DoDishesActionClient {
private:
    // Called once when the goal completes
    void DoneCb(const actionlib::SimpleClientGoalState& state,
            const actiondemo::DoDishesResultConstPtr& result) {
        ROS_INFO("Finished in state [%s]", state.toString().c_str());
        ROS_INFO("Toal dish cleaned: %i", result->total_dishes_cleaned);
        ros::shutdown();
    }

    // 当目标激活的时候，会调用一次
    void ActiveCb() {
        ROS_INFO("Goal just went active");
    }

    // 接收服务器的反馈信息
    void FeedbackCb(
            const actiondemo::DoDishesFeedbackConstPtr& feedback) {
        ROS_INFO("Got Feedback Complete Rate: %f", feedback->percent_complete);
    }
public:
    DoDishesActionClient(const std::string client_name, bool flag = true) :
            client(client_name, flag) {
    }

    //客户端开始
    void Start() {
        //等待服务器初始化完成
        client.waitForServer();
        //定义要做的目标
        actiondemo::DoDishesGoal goal;
        goal.dishwasher_id = 1;
        //发送目标至服务器
        client.sendGoal(goal,
                boost::bind(&DoDishesActionClient::DoneCb, this, _1, _2),
                boost::bind(&DoDishesActionClient::ActiveCb, this),
                boost::bind(&DoDishesActionClient::FeedbackCb, this, _1));
        //等待结果，时间间隔5秒
        client.waitForResult(ros::Duration(10.0));

        //根据返回结果，做相应的处理
        if (client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
            printf("Yay! The dishes are now clean");
        else {
            ROS_INFO("Cancel Goal!");
            client.cancelAllGoals();
        }

        printf("Current State: %s\n", client.getState().toString().c_str());
    }
private:
    Client client;
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "do_dishes_client");
    DoDishesActionClient actionclient("do_dishes", true);
    //启动客户端
    actionclient.Start();
    ros::spin();
    return 0;
}