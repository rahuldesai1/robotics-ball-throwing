#!/usr/bin/env python
import rospy

from control.srv import PickUpBall, ThrowBall

def main():
    # Wait for the services to become available
    # rospy.wait_for_service('picker')
    rospy.wait_for_service('thrower')

    # Initialize the client node
    rospy.init_node('main')
    
    # Create the function used to call the service
    pick_up = rospy.ServiceProxy('picker', PickUpBall)
    throw = rospy.ServiceProxy('thrower', ThrowBall)
    
    while not rospy.is_shutdown():
        try:
            raw_input('Press enter to pick up ball:')
            # Send the request to pick up the ball
            #success = pick_up()
            #if not success:
            #    print("Service call failed")
            #    continue

            raw_input('Press enter to throw ball:')
            # Send the request to the service
            success = throw()
            if not success:
                print("Service call failed")
                continue

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)
            continue

# Python's syntax for a main() method
if __name__ == '__main__':
    main()
