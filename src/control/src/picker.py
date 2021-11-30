#!/usr/bin/env python
import rospy

# from sensor_msgs.msg import Image
# from lab4_cam.srv import ImageSrv, ImageSrvResponse
from moveit_msgs.srv import GetPositionIK, GetPositionIKRequest, GetPositionIKResponse
from control.srv import PickUpBall
from geometry_msgs.msg import PoseStamped
from moveit_commander import MoveGroupCommander
from computer_vision.srv import GetBallPose
from baxter_interface import gripper as robot_gripper

class Picker:
    def __init__(self):
        # Wait for the dependent services to become available
        rospy.wait_for_service('ball_pose')

        #Initialize the node
        rospy.init_node('picker_listener')
        #Create the service
        rospy.Service('pick_ball', PickUpBall, self.pickBall)

        # Create the function used to get the position of the ball
        self.get_ball_pose = rospy.ServiceProxy('ball_pose', GetBallPose)
        self.compute_ik = rospy.ServiceProxy('compute_ik', GetPositionIK)

        self.arm = 'right'
        self.right_gripper = robot_gripper.Gripper(self.arm)

    def _moveArmToTarget(self, target):
        request = GetPositionIKRequest()
        request.ik_request.group_name = self.arm + "_arm"

        link = self.arm + "_gripper"

        request.ik_request.ik_link_name = link
        request.ik_request.attempts = 20
        request.ik_request.pose_stamped.header.frame_id = "base"

        # Set the desired orientation for the end effector to target, will have to tune this
        # TODO
        request.ik_request.pose_stamped.pose.position.x = 0.5
        request.ik_request.pose_stamped.pose.position.y = 0.5
        request.ik_request.pose_stamped.pose.position.z = 0.0
        request.ik_request.pose_stamped.pose.orientation.x = 0.0
        request.ik_request.pose_stamped.pose.orientation.y = 1.0
        request.ik_request.pose_stamped.pose.orientation.z = 0.0
        request.ik_request.pose_stamped.pose.orientation.w = 0.0

        try:
            # Send the request to the service
            response = self.compute_ik(request)

            # Print the response HERE
            print(response)
            group = MoveGroupCommander(self.arm + "_arm")

            # Setting position and orientation target
            group.set_pose_target(request.ik_request.pose_stamped)

            # Plan IK and execute
            group.go()

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

    # Callback
    def pickBall(self, request):
        # get the position of the ball in ?? coordinates
        ball_pose = self.get_ball_pose()

        print('Calibrating Gripper...')
        self.right_gripper.calibrate()
        rospy.sleep(2.0)
        # open gripper
        self.right_gripper.open()
        rospy.sleep(1.0)

        # use move it to compute IK and orient the end effector
        self._moveArmToTarget(ball_pose)

        # close gripper
        self.right_gripper.close()
        rospy.sleep(1.0)

        return True
      
    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Picker()
    node.run()


"""
if __name__ == '__main__':
    
    # Waits for the ball pose service to become available
    rospy.wait_for_service('ball_pose')
    
    # Initializes the node
    rospy.init_node('picker_node')
    
    # Creates a function used to call the 
    # ball pose service: PoseSrv is the service type
    ball_pose_srv = rospy.ServiceProxy('ball_pose', PoseSrv)

    # Create an empty list to hold the coordinates of the clicked points
    points = []


    while not rospy.is_shutdown():
    try:
      # Waits for a key input to continue
      raw_input('Press enter to capture an image:')
    except KeyboardInterrupt:
      print 'Break from raw_input'
      break
    
    try:
      # Request the last image from the image service
      # And extract the ROS Image from the ImageSrv service
      # Remember that ImageSrv.image_data was
      # defined to be of type sensor_msgs.msg.Image
      ros_img_msg = last_image_service().image_data

      # Convert the ROS message to a NumPy image
      np_image = ros_to_np_img(ros_img_msg)

      # Display the CV Image
      cv2.imshow("CV Image", np_image)

      # Tell OpenCV that it should call 'on_mouse_click' when the user
      # clicks the window. This will add clicked points to our list
      cv2.setMouseCallback("CV Image", on_mouse_click, param=1)

      # Zero out list each time we have a new image
      points = []

      # Loop until the user has clicked enough points
      while len(points) < TOT_CLICKS:
        if rospy.is_shutdown():
          raise KeyboardInterrupt
        cv2.waitKey(10)

      # Convert the Python list of points to a NumPy array of the form
      #   | u1 u2 u3 u4 |
      #   | v1 v2 v3 v4 |
      uv = np.array(points).T
"""



