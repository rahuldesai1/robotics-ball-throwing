#!/usr/bin/env python

import rospy
from cv_bridge import CvBridge
import cv2
import baxter_interface
import baxter_external_devices
from sensor_msgs.msg import Image

from baxter_interface import CHECK_VERSION
import numpy as np
import matplotlib.pyplot as plt

IN_POSITION = False

def diff(curr_dict, wanted):
    left = baxter_interface.Limb('left')
    lj = left.joint_names()
    
    d = 0
    for idx, name in enumerate(lj):
        d += np.abs(curr_dict[name] - wanted[idx])
    return d

def img_callback(image_msg):
	bridge = CvBridge()
	cv_img = bridge.imgmsg_to_cv2(image_msg, 'bgr8')
	img = np.array(cv_img)
	#img = img.reshape((image_msg.height, image_msg.width))
	plt.imshow(img)
	plt.show()
	#cv2.imshow("window",cv_img)
	#cv2.waitKey()

def return_to_base(angles):
	angle_dict = {}
	left = baxter_interface.Limb('left')
	lj = left.joint_names()
	for i in range(len(lj)):
		angle_dict[lj[i]] = angles[i]
	current_angles = left.joint_angles()
	while not diff(current_angles, angles) < 0.05:
		left.set_joint_positions(angle_dict)
		rospy.sleep(0.01)
		current_angles = left.joint_angles()
	IN_POSITION = True


if __name__ == "__main__":
	rospy.init_node("rsdk_joint_position_keyboard")
	print("Getting robot state... ")
	rs = baxter_interface.RobotEnable(CHECK_VERSION)
	init_state = rs.state().enabled

	def clean_shutdown():
		print("\nExiting example...")
		if not init_state:
			print("Disabling robot...")
			rs.disable()
	rospy.on_shutdown(clean_shutdown)

	print("Enabling robot... ")
	rs.enable()
	s = rospy.Subscriber('/cameras/left_hand_camera/image', Image, img_callback)

	while not rospy.is_shutdown():
		#s0,s1,e0,e1,w0,w1,w2
		if not IN_POSITION:
			return_to_base([-0.05138835639416136, -0.6412039693361029,-1.6908303234466973, 0.9618059540041545, 1.1006312153077844, 2.0056798801601783, -0.25349032519806464])