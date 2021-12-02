# Final Project

## Instruction for Running the Demo

1. Enable the robot
`./baxter.sh ayrton.local`
`rosrun baxter_tools enable_robot.py -e`

**Note: Run all of the below commands after ssh'ing into the robot with `./baxter.sh ayrton.local`** 

2. Launch move-it related services
`rosrun tf static_transform_publisher 0 0 0 0 0 0 world base 100`
`rosrun baxter_interface joint_trajectory_action_server.py`
`roslaunch baxter_moveit_config demo_baxter.launch right_electric_gripper:=true left_electric_gripper:=true`

3. Start our services
`rosrun computer_vision vision.py`
`rosrun control picker.py`
`rosrun control thrower.py`

4. Run the main file
`rosrun control main.py`

##
Common Errors
`[rospack] Error: package 'computer_vision' not found`
Solution: Don't forget to run `source devel/setup.bash` when you open a new terminal

```
[rosrun] Found the following, but they're either not files,
[rosrun] or not executable:
[rosrun]   /home/cc/ee106a/fl21/class/ee106a-acq/ros_workspaces/robotics-ball-throwing/src/computer_vision/src/vision.py
```
Solution: `chmod +x src/control/src/*.py`, `chmod +x src/computer_vision/src/*.py`