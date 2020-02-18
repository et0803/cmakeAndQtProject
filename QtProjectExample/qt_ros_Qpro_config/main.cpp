#include <ros/ros.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "qt_joy");
    ros::NodeHandle nh_;
    ros::Subscriber s_;
    ros::Publisher p_;

    nh_.shutdown();

    return 0;
}
