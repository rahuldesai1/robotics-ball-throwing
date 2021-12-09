#!/usr/bin/env python
import rospy
import math
import time
pi = math.pi

from control.srv import PickUpBall, ThrowBall
from computer_vision.srv import GetTargetPose

from baxter_interface import gripper as robot_gripper
from baxter_interface import Limb

import numpy as np



def diff(left, curr_dict, wanted):
    lj = left.joint_names()
    
    d = 0
    for idx, name in enumerate(lj):
        d += np.abs(curr_dict[name] - wanted[idx])
    return d

def return_to_base(left):
    angles = [-0.05138835639416136, -0.6412039693361029,-1.6908303234466973, 0.9618059540041545, 1.1006312153077844, 2.0056798801601783, -0.25349032519806464]
    angle_dict = {}
    lj = left.joint_names()
    for i in range(len(lj)):
        angle_dict[lj[i]] = angles[i]
    current_angles = left.joint_angles()
    while not diff(left, current_angles, angles) < 0.05:
        left.set_joint_positions(angle_dict)
        rospy.sleep(0.01)
        current_angles = left.joint_angles()

def _setJointPositions(limb, joint_positions, delta=0.1):
    def close_enough(delta, target):
        for name in target:
            # print(name, self.limb.joint_angle(name), target[name])
            if abs(limb.joint_angle(name) - target[name]) > delta:
                return False
        return True

    while not close_enough(delta, joint_positions):
        limb.set_joint_positions(joint_positions)
        time.sleep(0.01)

def move_to_search_position(left):
    angle_dict = {
        'left_s0': 0,
        'left_s1': 0,
        'left_e0': -2.7,
        'left_e1': pi/2,
        'left_w0': pi/2,
        'left_w1': 2,
        'left_w2': 0,
    }
    _setJointPositions(left, angle_dict)

def main():
    # Wait for the services to become available
    rospy.wait_for_service('picker')
    rospy.wait_for_service('thrower')
    rospy.wait_for_service('target_pose')

    # Initialize the client node
    rospy.init_node('main')

    left = Limb('left')
    
    # Create the function used to call the service
    pick_up = rospy.ServiceProxy('picker', PickUpBall)
    throw = rospy.ServiceProxy('thrower', ThrowBall)
    get_target_pose = rospy.ServiceProxy('target_pose', GetTargetPose)

    print(left.joint_angles())

    arm = 'left'
    gripper = robot_gripper.Gripper(arm)
    print('Calibrating Gripper...')
    gripper.calibrate()
    
    target_pose = None
    while not rospy.is_shutdown():
        # p = pickup, t = throw
        char = raw_input('Press [f(find)/p(pick)/t(throw)/o(open)/c(close)] to perform an action: ')
        try:
            if char == 'f':
                move_to_search_position(left)
                target_pose = get_target_pose().target_pose
            elif char == 'p':
                return_to_base(left)
                success = pick_up() and success
                if not success:
                    print("Service call failed")
                    continue
            elif char == 't':
                if target_pose is None:
                    print("Must find the target before throwing")
                    continue
                success = throw(target_pose)
                if not success:
                    print("Service call failed")
                    continue
            elif char == 'c':
                gripper.close()
            elif char == 'o':
                gripper.open()
            else:
                break

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)
            continue

# Python's syntax for a main() method
if __name__ == '__main__':

    main()
