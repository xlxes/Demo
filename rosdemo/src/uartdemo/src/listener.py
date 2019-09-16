# -*- coding:utf-8 -*-
#!/usr/bin/env python

import rospy
import serial
from std_msgs.msg import Float32
from std_msgs.msg import String

def callback1(data):
    rospy.loginfo('I heard:%s', data.data)
    temp = str(int(data.data*4.0))
    command = temp + 't'
    print(command)
    #serialCom.write(command)
    #rec_data = serialCom.readline()
    #rospy.loginfo('Feedback:%s', data.data)
	

def callback2(data):
    rospy.loginfo('I heard:%s', data.data)
    serialCom.write(data.data)
    #rec_data = serialCom.readline()
    #rospy.loginfo('Feedback:%s', data.data)


def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('ter_time', Float32, callback1)
    rospy.Subscriber('ter_write', String, callback2)
    rospy.spin()
	
	
if __name__ == '__main__':
    try:
        #serialCom = serial.Serial('/dev/pi', 9600, timeout=0.5)
        listener()
    except KeyboardInterrupt:
        #serialCom.close()
	pass
