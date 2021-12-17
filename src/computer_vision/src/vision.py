#!/usr/bin/env python
import rospy

from cv_bridge import CvBridge
import cv2
import numpy as np

from computer_vision.srv import GetBallPose
from computer_vision.srv import GetTargetPose

from geometry_msgs.msg import PoseStamped

from sensor_msgs.msg import Image

from ball_detection_utils import ball_detection, pxl_to_pose
from bin_detection import bin_detection

class Vision:
    def __init__(self):
        # Wait for the dependent services to become available

        # Initialize the node
        rospy.init_node('vision')
        # Create the service
        rospy.Service('ball_pose', GetBallPose, self.localizeBall)
        rospy.Service('target_pose', GetTargetPose, self.localizeTarget)
        print("Service Initialized")

    # Callback 1
    def localizeBall(self, request):
        print("REQUEST FOR BALL POSE")
        img_msg = rospy.wait_for_message("/cameras/left_hand_camera/image", Image)
        base_position = [0.5,0.5,0.5] # TODO: need to get this position
        table_height = 0.0 # TODO: need to get this height
        print("Need to update base position!")
        print("Need to udpate table height!")
        bridge = CvBridge()
        cv_img = bridge.imgmsg_to_cv2(img_msg, 'rgb8')
        img = np.array(cv_img)
        center, radius = ball_detection(img)
        if not center:
            return None
        pose = pxl_to_pose(center[0],center[1])
        output = PoseStamped()
        output.pose.position.x = base_position[0] + pose[0]
        output.pose.position.y = base_position[1] + pose[1]
        output.pose.position.z = table_height
        return output

    # Callback 2
    def localizeTarget(self, request):
        print("REQUEST FOR TARGET POSE")
        img_msg = rospy.wait_for_message("/cameras/left_hand_camera/image", Image)
        bridge = CvBridge()
        cv_img = bridge.imgmsg_to_cv2(img_msg, 'rgb8')
        pixel = bin_detection(cv_img)
        if pixel is None:
            return -1, -1
        return pixel[1], pixel[0]
        
    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Vision()
    node.run()