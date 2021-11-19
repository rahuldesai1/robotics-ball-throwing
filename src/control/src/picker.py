#!/usr/bin/env python
import rospy

from sensor_msgs.msg import Image
# from lab4_cam.srv import ImageSrv, ImageSrvResponse
import PoseSrv

class Picker:
    def __init__(self):

        #Initialize the node
        rospy.init_node('picker_listener')

        self.ball_pose_srv = rospy.ServiceProxy('ball_pose', PoseSrv)

        #Create the service
        rospy.Service('pick_ball', None, self.pickBall)

    #Callback for when 
    def pickBall(self, request):
      ball_pose = self.ball_pose_srv()
      

    
    def run(self):
    rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = ImgService()
    node.run()




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