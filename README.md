# Final Project

## Instruction for Running the Demo

1. Enable the robot
`./baxter.sh ayrton.local`
`rosrun baxter_tools enable_robot.py -e`

2. Launch move-it related services
`roslaunch ik move_group.launch`
`rosrun tf static_transform_publisher 0 0 0 0 0 0 world base 100`
`rosrun baxter_interface joint_trajectory_action_server.py`
`roslaunch baxter_moveit_config demo_baxter.launch right_electric_gripper:=true left_electric_gripper:=true`

3. Start our services
`rosrun control picker.py`

4. Run the main file
`rosrun control main.py`