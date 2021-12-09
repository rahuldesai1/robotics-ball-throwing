#!/usr/bin/env python
import rospy
import time

from control.srv import PickUpBall
from computer_vision.srv import GetBallPose

from moveit_msgs.srv import GetPositionIK, GetPositionIKRequest
from geometry_msgs.msg import PoseStamped
from moveit_commander import MoveGroupCommander
from baxter_interface import gripper as robot_gripper
from baxter_interface import Limb

class Picker:
    def __init__(self):
        # Wait for the dependent services to become available
        rospy.wait_for_service('ball_pose')

        # Initialize the node
        rospy.init_node('picker_listener')
        # Create the service
        rospy.Service('picker', PickUpBall, self.pickBall)

        # Create the function used to get the position of the ball
        self.get_ball_pose = rospy.ServiceProxy('ball_pose', GetBallPose)
        self.compute_ik = rospy.ServiceProxy('compute_ik', GetPositionIK)

        self.arm = 'left'
        self.limb = Limb(self.arm)
        self.limb.set_command_timeout(self.loop_period*5) # ensure we don't timeout
        self.gripper = robot_gripper.Gripper(self.arm)
        print('Calibrating Gripper...')
        self.gripper.calibrate()

        self.group = MoveGroupCommander(self.arm + "_arm")
        print("Service Initialized")

    def _moveArmToTarget(self, target):
        request = GetPositionIKRequest()
        request.ik_request.group_name = self.arm + "_arm"

        link = self.arm + "_gripper"

        request.ik_request.ik_link_name = link
        request.ik_request.attempts = 20
        request.ik_request.pose_stamped.header.frame_id = "base"

        # Set the desired orientation for the end effector to target, will have to tune this
        request.ik_request.pose_stamped.pose.position.x = target.pose.position.x
        request.ik_request.pose_stamped.pose.position.y = target.pose.position.y
        request.ik_request.pose_stamped.pose.position.z = target.pose.position.z
        request.ik_request.pose_stamped.pose.orientation.x = 0.0
        request.ik_request.pose_stamped.pose.orientation.y = 1.0
        request.ik_request.pose_stamped.pose.orientation.z = 0.0
        request.ik_request.pose_stamped.pose.orientation.w = 0.0

        # Send the request to the service
        response = self.compute_ik(request)
        joint_state = response.solution.joint_state

        joints = {}
        for name, position in zip(joint_state.name, joint_state.position):
            joints[name] = position

        self._setJointPositions(joints)

    def _moveArmToTargetWithMoveIt(self, target):
        request = GetPositionIKRequest()
        request.ik_request.group_name = self.arm + "_arm"

        link = self.arm + "_gripper"

        request.ik_request.ik_link_name = link
        request.ik_request.attempts = 20
        request.ik_request.pose_stamped.header.frame_id = "base"

        # Set the desired orientation for the end effector to target, will have to tune this
        request.ik_request.pose_stamped.pose.position.x = target.pose.position.x
        request.ik_request.pose_stamped.pose.position.y = target.pose.position.y
        request.ik_request.pose_stamped.pose.position.z = target.pose.position.z
        request.ik_request.pose_stamped.pose.orientation.x = 0.0
        request.ik_request.pose_stamped.pose.orientation.y = 1.0
        request.ik_request.pose_stamped.pose.orientation.z = 0.0
        request.ik_request.pose_stamped.pose.orientation.w = 0.0

        # Setting position and orientation target
        self.group.set_pose_target(request.ik_request.pose_stamped)

        # Plan IK and execute
        self.group.go(wait=True) # synchronous

        self.group.stop()
        self.group.clear_pose_targets()

    def _setJointPositions(self, joint_positions, delta=0.1):
        def close_enough(delta, target):
            for name in target:
                # print(name, self.limb.joint_angle(name), target[name])
                if abs(self.limb.joint_angle(name) - target[name]) > delta:
                    return False
            return True

        while not close_enough(delta, joint_positions):
            self.limb.set_joint_positions(joint_positions)
            time.sleep(0.01)

    # Callback
    def pickBall(self, request):
        print("REQUEST TO PICK UP BALL")
        # get the position of the ball in ?? coordinates
        ball_pose = self.get_ball_pose().ball_pose
        if ball_pose is None:
            return False
        above_pose = self.getPoseAbove(ball_pose)

        # use move it to compute IK and orient the end effector
        self._moveArmToTarget(above_pose)

        # open gripper
        print("Opening...")
        self.gripper.open()
        rospy.sleep(1.0)

        self._moveArmToTarget(ball_pose)

        # close gripper
        print("Closing...")
        self.gripper.close()
        rospy.sleep(1.0)

        self._moveArmToTarget(above_pose)
        return True

    def getPoseAbove(self, ball_pose):
        above_pose = PoseStamped()
        above_pose.pose.position.x = ball_pose.pose.position.x
        above_pose.pose.position.y = ball_pose.pose.position.y
        above_pose.pose.position.z = ball_pose.pose.position.z + 0.2
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
