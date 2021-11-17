#!/usr/bin/env python
import rospy

from control.srv import PickUpBall, ThrowBall

########## UNCOMMENT THIS LINE TO TEST WITH LAB 3 FORWARD KINEMATICS CODE ##########
# from baxter_forward_kinematics import baxter_forward_kinematics_from_angles

def main():
    # Wait for the IK service to become available
    rospy.wait_for_service('picker')
    rospy.wait_for_service('thrower')

    # Initialize the client node
    rospy.init_node('main')
    
    # Create the function used to call the service
    pick_up = rospy.ServiceProxy('picker', PickUpBall)
    throw = rospy.ServiceProxy('thrower', ThrowBall)
    
    while not rospy.is_shutdown():
        raw_input('Press enter to pick up ball:')
        
        # Construct the request
        try:
            # Send the request to the service
            ok = pick_up()
            if not ok:
                print("Service call failed")
                continue

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)
            continue

        raw_input('Press enter to throw ball:')
        
        # Construct the request
        try:
            # Send the request to the service
            ok = throw()
            if not ok:
                print("Service call failed")
                continue

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)
            continue

# Python's syntax for a main() method
if __name__ == '__main__':
    main()
