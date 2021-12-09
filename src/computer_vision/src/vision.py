#!/usr/bin/env python
import rospy

from cv_bridge import CvBridge
import cv2
import numpy as np

from computer_vision.srv import GetBallPose
from computer_vision.srv import GetTargetPose

from geometry_msgs.msg import PoseStamped

from sensor_msgs.msg import Image

from ball_detection_utils import ball_detection, ball_pose_estimation

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
        img_msg = rospy.wait_for_message("/cameras/left_hand_camera/image", Image)
        bridge = CvBridge()
        cv_img = bridge.imgmsg_to_cv2(img_msg, 'rgb8')
        img = np.array(cv_img)
        print(img.shape)
        center, radius = ball_detection(img)
        if not center:
            return None
        pose = ball_pose_estimation(center)
        output = PoseStamped()
        output.pose.position.x = pose[0]
        output.pose.position.y = pose[1]
        output.pose.position.z = pose[2]
        return output

    # Callback 2
    def localizeTarget(self, request):
        print("REQUEST FOR TARGET POSE")
        img_msg = rospy.wait_for_message("/cameras/left_hand_camera/image", Image)
        output = PoseStamped()
        return output
        
    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Vision()
    node.run()