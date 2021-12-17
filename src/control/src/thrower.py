#!/usr/bin/env python
import rospy
import time
import math
pi = math.pi
import numpy as np

from control.srv import ThrowBall
from computer_vision.srv import GetTargetPose

from baxter_interface import Limb
from geometry_msgs.msg import PoseStamped
from baxter_interface import gripper as robot_gripper

STARTING_JOINT_POSITIONS = {
    'left_s0': 0,
    'left_s1': 0,
    'left_e0': -pi/2,
    'left_e1': pi/2,
    'left_w0': pi/2,
    'left_w1': pi/2,
    'left_w2': 0,
}
JOINT_NAMES = ["left_s0", "left_s1", "left_e0", "left_e1", "left_w0", "left_w1", "left_w2"]


class Thrower:
    def __init__(self):
        # Wait for the dependent services to become available
        rospy.wait_for_service('target_pose')

        # Initialize the node
        rospy.init_node('thrower_listener')
        # Create the service
        rospy.Service('thrower', ThrowBall, self.throwBall)

        # Create the function used to get the position of the ball
        self.get_target_pose = rospy.ServiceProxy('target_pose', GetTargetPose)

        self.loop_period = 0.01

        # define robot attributes
        self.arm = 'left'
        self.throwing_elbow = 'left_e0'
        self.throwing_wrist = 'left_w1'
        self.shoulder = 'left_s0'
        self.limb = Limb(self.arm)
        self.limb.set_command_timeout(self.loop_period*5) # ensure we don't timeout
        self.gripper = robot_gripper.Gripper(self.arm)
        print('Calibrating Gripper...')
        self.gripper.calibrate()

        print(self.limb.joint_angles())

    def _setJointPositions(self, joint_positions, delta=0.1):
        def close_enough(delta, target):
            for name in target:
                # print(name, self.limb.joint_angle(name), target[name])
                if abs(self.limb.joint_angle(name) - target[name]) > delta:
                    return False
            return True

        while not close_enough(delta, joint_positions):
            self.limb.set_joint_positions(joint_positions)
            time.sleep(self.loop_period)

    def _throw(self, joint_name, vel, limit_angle, release_angle):
        released = False
        while True:
            angle = self.limb.joint_angle(joint_name)

            # Release once reached release_angle
            if not released and np.sign(release_angle - angle) != np.sign(vel):
                self.gripper.open()
                released = True

            # Stop if passed limit
            if np.sign(limit_angle - angle) != np.sign(vel):
                self.limb.set_joint_velocities({joint_name: 0})
                return released # True if successfully thrown, False if stopped early

            # Set velocity
            self.limb.set_joint_velocities({joint_name: vel})
            rospy.sleep(self.loop_period)


    def _throw_multi_joint(self, joint_specs):
        joints = list(joint_specs.keys())

        def passed(cur_angle, limit, vel):
            return np.sign(limit - cur_angle) != np.sign(vel)

        def should_release(angles): # Release if passed release_angle on any joint
            for joint, specs in joint_specs.items():
                if "release_angle" in specs:
                    if passed(angles[joint], specs["release_angle"], specs["vel"]):
                        return True
            return False

        released = False
        while True:
            angles = {joint: self.limb.joint_angle(joint) for joint in joints}

            if not released and should_release(angles):
                self.gripper.open()
                released = True

            # Stop if passed limit on any joint
            for joint in joints:
                if passed(angles[joint], joint_specs[joint]["limit_angle"], joint_specs[joint]["vel"]):
                    self.limb.set_joint_velocities({joint: 0})
                    return released # True if successfully thrown, False if stopped early

            # Set velocity
            self.limb.set_joint_velocities({joint: specs["vel"] for joint, specs in joint_specs.items()})
            rospy.sleep(self.loop_period)


    # Callback
    def throwBall(self, request):
        print("REQUEST TO THROW BALL")
        # get the position of the target in ?? coordinates (PoseStamped)
        target_pose = self.get_target_pose()

        raw_input("Press [enter] to go to starting position:")
        self._setJointPositions(STARTING_JOINT_POSITIONS)
        print("Initial angles", self.limb.joint_angles())
        time.sleep(1.5)

        # calculate from target_pose. should target_pose be in request?
        shoulder_angle = 0.5 # depends on angle to goal in x-y plane
        start_elbow_angle = -3.05 # max angle, dont go further than -3
        wrist_angle = -pi/4

        limit_angle = -pi/2
        release_angle = -2.8
        vel = 1
        joint_specs = {
            self.throwing_elbow: {"start_angle": -3, "limit_angle": -pi/2, "release_angle": -2.8, "vel": 1},
            self.throwing_wrist: {"start_angle": -pi/4, "limit_angle": pi/2, "release_angle": 0.2, "vel": 1}
        }

        # aim_positions = {joint: joint_specs[joint]["start_angle"] for joint in throwing_joints}
        # aim_positions[self.shoulder] = shoulder_angle

        aim_positions = {
            self.shoulder: shoulder_angle,
            self.throwing_elbow: joint_specs[self.throwing_elbow]["start_angle"],
            self.throwing_wrist: joint_specs[self.throwing_wrist]["start_angle"],
        }

        raw_input("Press [enter] to go to windup position:")
        self._setJointPositions(aim_positions)
        print("Windup angles", self.limb.joint_angles())
        time.sleep(1.5)

        raw_input("Press [enter] to go to throw:")
        # success = self._throw(self.throwing_elbow, vel, limit_angle, release_angle)
        success = self._throw_multi_joint(joint_specs)

        print("Final angles", self.limb.joint_angles())


        print("DONE!")

        return success

    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Thrower()
    node.run()

