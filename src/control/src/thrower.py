#!/usr/bin/env python
import rospy

# from sensor_msgs.msg import Image
# from lab4_cam.srv import ImageSrv, ImageSrvResponse
from control.srv import ThrowBall
from computer_vision.srv import GetTargetPose
from baxter_interface import gripper as robot_gripper

from planner import Planner
from controller import Controller

class Thrower:
    def __init__(self):
        # Wait for the dependent services to become available
        rospy.wait_for_service('target_pose')

        #Initialize the node
        rospy.init_node('thrower_listener')
        #Create the service
        rospy.Service('throw_ball', ThrowBall, self.throwBall)

        # Create the function used to get the position of the ball
        self.get_target_pose = rospy.ServiceProxy('target_pose', GetTargetPose)

        self.arm = 'right'
        self.right_gripper = robot_gripper.Gripper(self.arm)

        self.planner = Planner()
        self.controller = Controller()


    # Callback
    def throwBall(self, request):
        # get the position of the ball in ?? coordinates (PoseStamped)
        target_pose = self.get_target_pose()

        print('Calibrating Gripper...')
        self.right_gripper.calibrate()
        rospy.sleep(2.0)

        # logic to throw ball to target
        plan = self.planner.plan_to_pose(target_pose)

        return self.controller.execute_plan(plan)
      
    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Thrower()
    node.run()

