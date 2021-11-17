#!/usr/bin/env python
import numpy as np
import rospy
import moveit_commander
from moveit_msgs.msg import OrientationConstraint, Constraints, CollisionObject
from geometry_msgs.msg import PoseStamped
from shape_msgs.msg import SolidPrimitive

class PathPlanner():
    def __init__(self):
            def __init__(self, group_name):
        """
        Constructor.
        Inputs:
        group_name: the name of the move_group.
            For Baxter, this would be 'left_arm' or 'right_arm'
            For Sawyer, this would be 'right_arm'
        """

        # If the node is shutdown, call this function    
        rospy.on_shutdown(self.shutdown)

        # Initialize moveit_commander
        moveit_commander.roscpp_initialize(sys.argv)

        # Initialize the robot
        self._robot = moveit_commander.RobotCommander()

        # Initialize the planning scene
        self._scene = moveit_commander.PlanningSceneInterface()

        # This publishes updates to the planning scene
        self._planning_scene_publisher = rospy.Publisher('/collision_object', CollisionObject, queue_size=10)

        # Instantiate a move group
        self._group = moveit_commander.MoveGroupCommander(group_name)

        # Set the maximum time MoveIt will try to plan before giving up
        self._group.set_planning_time(5)

        # Set the bounds of the workspace
        self._group.set_workspace([-2, -2, -2, 2, 2, 2])

        # Sleep for a bit to ensure that all inititialization has finished
        rospy.sleep(0.5)

    def shutdown(self):
        """
        Code to run on shutdown. This is good practice for safety
        Currently deletes the object's MoveGroup, so that further commands will do nothing
        """
        self._group = None
        rospy.loginfo("Stopping Path Planner")

    def plan_to_pose(self, target):
        pose = self._get_end_pose(target)
        # Generate a plan given an end effector pose subject to orientation constraints
        # copied from: https://github.com/ucb-ee106/lab7_starter/blob/main/path_planner.py
        self._group.set_pose_target(pose)
        self._group.set_start_state_to_current_state()

        constraints = Constraints()
        constraints.orientation_constraints = orientation_constraints
        self._group.set_path_constraints(constraints)

        plan = self._group.plan()

        return plan

    def _get_end_pose(self):
        # get the end effector pose based on the position of the target
        pass

    def execute_path(self, path):
        pass

