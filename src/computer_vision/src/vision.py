#!/usr/bin/env python
import rospy

from computer_vision.srv import GetBallPose
from computer_vision.srv import GetTargetPose

from geometry_msgs.msg import PoseStamped

class Vision:
    def __init__(self):
        # Wait for the dependent services to become available

        # Initialize the node
        rospy.init_node('vision')
        # Create the service
        rospy.Service('ball_pose', GetBallPose, self.localizeBall)
        rospy.Service('target_pose', GetTargetPose, self.localizeTarget)

    # Callback 1
    def localizeBall(self, request):
        print("REQUEST FOR BALL POSE")
        mocked_result = PoseStamped()
        mocked_result.pose.position.x = 0.590
        mocked_result.pose.position.y = 0.288
        mocked_result.pose.position.z = -0.179
        return mocked_result

    # Callback 2
    def localizeTarget(self, request):
        print("REQUEST FOR TARGET POSE")
        mocked_result = PoseStamped()
        mocked_result.pose.position.x = 0.000
        mocked_result.pose.position.y = 0.000
        mocked_result.pose.position.z = 0.000
        return mocked_result
        
    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Vision()
    node.run()