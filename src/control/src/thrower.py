#!/usr/bin/env python
import rospy
import time

from control.srv import ThrowBall
# from computer_vision.srv import GetTargetPose

from baxter_interface import Limb
from geometry_msgs.msg import PoseStamped
from baxter_interface import gripper as robot_gripper

STARTING_JOINT_POSITIONS = {'left_w0': 1.4024419353242394, 'left_w1': -0.08015049616701286, 'left_w2': -2.8785149484669788, 'left_e0': -3.05453924387683, 'left_e1': 1.6693545924163016, 'left_s0': 0.6093738679874806, 'left_s1': 0.054072822772960834}
TARGET_JOINT_POSITIONS = {'left_w0': 1.2816409482782631, 'left_w1': 0.1737233242280231, 'left_w2': -2.90152466028526, 'left_e0': -1.8461458782200955, 'left_e1': 1.6064613801129994, 'left_s0': 0.7202039799122018, 'left_s1': -0.05675728915176031}
TARGET_JOINT_VELOCITY = {'left_w0': 0, 'left_w1': 0, 'left_w2': 0, 'left_e0': 2, 'left_e1': 0, 'left_s0': 0, 'left_s1': 0}
RELEASE_ANGLE = -2.8
JOINT_NAMES = ["left_s0", "left_s1", "left_e0", "left_e1", "left_w0", "left_w1", "left_w2"]

class Thrower:
    def __init__(self):
        # Wait for the dependent services to become available
        # rospy.wait_for_service('target_pose')

        # Initialize the node
        rospy.init_node('thrower_listener')
        # Create the service
        rospy.Service('thrower', ThrowBall, self.throwBall)

        # Create the function used to get the position of the ball
        # self.get_target_pose = rospy.ServiceProxy('target_pose', GetTargetPose)
        mocked_result = PoseStamped()
        mocked_result.pose.position.x = 0.000
        mocked_result.pose.position.y = 0.000
        mocked_result.pose.position.z = 0.000
        self.get_target_pose = lambda: mocked_result

        # define robot attributes
        self.arm = 'left'
        self.throwing_elbow = 'left_e0'
        self.limb = Limb(self.arm)
        self.gripper = robot_gripper.Gripper(self.arm)
        print('Calibrating Gripper...')
        self.gripper.calibrate()

    def _setJointPositions(self, joint_positions):
        def close_enough(delta, target):
            for name in JOINT_NAMES:
                if abs(self.limb.joint_angle(name) - target[name]) > delta:
                    return False
            return True

        delta = 0.1
        while not close_enough(delta, joint_positions):
            self.limb.set_joint_positions(joint_positions)
            time.sleep(0.01)

    def _throw(self, joint_velocities):
        def close_enough(delta, target):
            return self.limb.joint_angle(self.throwing_elbow) > TARGET_JOINT_POSITIONS[self.throwing_elbow]

        def should_open_gripper():
            return self.limb.joint_angle(self.throwing_elbow) > RELEASE_ANGLE

        delta = 0.1
        isOpen = False
        while not close_enough(delta, joint_velocities):
            self.limb.set_joint_velocities(joint_velocities)
            if not isOpen and should_open_gripper():
                self.gripper.open()
                isOpen = True

            time.sleep(0.01)

    # Callback
    def throwBall(self, request):
        print("REQUEST TO THROW BALL")
        # get the position of the target in ?? coordinates (PoseStamped)
        target_pose = self.get_target_pose()
        
        # close gripper
        print("Closing...")
        self.gripper.close()
        rospy.sleep(1.0)

        print(self.limb.joint_angles())
        # self._setJointPositions(STARTING_JOINT_POSITIONS)
        # self._throw(TARGET_JOINT_VELOCITY)

        return True
      
    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Thrower()
    node.run()

