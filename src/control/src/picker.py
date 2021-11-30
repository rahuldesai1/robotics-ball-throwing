#!/usr/bin/env python
import rospy

# from sensor_msgs.msg import Image
# from lab4_cam.srv import ImageSrv, ImageSrvResponse
from moveit_msgs.srv import GetPositionIK, GetPositionIKRequest, GetPositionIKResponse
from control.srv import PickUpBall
from geometry_msgs.msg import PoseStamped
from moveit_commander import MoveGroupCommander
# from computer_vision.srv import GetBallPose
from baxter_interface import gripper as robot_gripper

class Picker:
    def __init__(self):
        # Wait for the dependent services to become available
        # rospy.wait_for_service('ball_pose')

        # Initialize the node
        rospy.init_node('picker_listener')
        # Create the service
        rospy.Service('picker', PickUpBall, self.pickBall)

        # Create the function used to get the position of the ball
        # self.get_ball_pose = rospy.ServiceProxy('ball_pose', GetBallPose)
        mocked_result = PoseStamped()
        mocked_result.pose.position.x = 0.590
        mocked_result.pose.position.y = 0.288
        mocked_result.pose.position.z = -0.179
        self.get_ball_pose = lambda: mocked_result
        self.compute_ik = rospy.ServiceProxy('compute_ik', GetPositionIK)

        self.arm = 'left'
        self.gripper = robot_gripper.Gripper(self.arm)

    def _moveArmToTarget(self, target):
        request = GetPositionIKRequest()
        request.ik_request.group_name = self.arm + "_arm"

        link = self.arm + "_gripper"

        request.ik_request.ik_link_name = link
        request.ik_request.attempts = 20
        request.ik_request.pose_stamped.header.frame_id = "base"

        # Set the desired orientation for the end effector to target, will have to tune this
        # TODO
        request.ik_request.pose_stamped.pose.position.x = target.pose.position.x
        request.ik_request.pose_stamped.pose.position.y = target.pose.position.y
        request.ik_request.pose_stamped.pose.position.z = target.pose.position.z
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
        print("REQUEST TO PICK UP BALL")
        # get the position of the ball in ?? coordinates
        ball_pose = self.get_ball_pose()
        above_pose = self.getPoseAbove(ball_pose)

        print('Calibrating Gripper...')
        self.gripper.calibrate()
        rospy.sleep(2.0)
        # open gripper
        print("Opening...")
        self.gripper.open()
        rospy.sleep(1.0)

        # use move it to compute IK and orient the end effector
        self._moveArmToTarget(above_pose)
        self._moveArmToTarget(ball_pose)

        # close gripper
        print("Closing...")
        self.gripper.close()
        rospy.sleep(1.0)

        self._moveArmToTarget(above_pose)
        return True

    def getPoseAbove(ball_pose):
        above_pose = StampedPose()
        above_pose.pose.position = ball_pose.pose.position
        above_pose.pose.position.z += 0.4
        above_pose.pose.orientation.x = 0.0
        above_pose.pose.orientation.y = 1.0
        above_pose.pose.orientation.z = 0.0
        above_pose.pose.orientation.w = 0.0
        return above_pose

    def run(self):
        rospy.spin()

#Python's syntax for a main() method
if __name__ == '__main__':
    node = Picker()
    node.run()



