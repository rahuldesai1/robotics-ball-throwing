#!/usr/bin/env python
import rospy

from control.srv import PickUpBall, ThrowBall

from baxter_interface import gripper as robot_gripper



def main():
    # Wait for the services to become available
    # rospy.wait_for_service('picker')
    rospy.wait_for_service('thrower')

    # Initialize the client node
    rospy.init_node('main')
    
    # Create the function used to call the service
    pick_up = rospy.ServiceProxy('picker', PickUpBall)
    throw = rospy.ServiceProxy('thrower', ThrowBall)

    arm = 'left'
    gripper = robot_gripper.Gripper(arm)
    print('Calibrating Gripper...')
    gripper.calibrate()
    
    while not rospy.is_shutdown():
        # p = pickup, t = throw
        char = raw_input('Press [p(pick)/t(throw)/o(open)/c(close)] to perform an action: ')
        try:
            if char == 'p':
                # Send the request to pick up the ball
                success = pick_up()
                if not success:
                    print("Service call failed")
                    continue
            elif char == 't':
                # Send the request to the service
                success = throw()
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
