;; Auto-generated. Do not edit!


(when (boundp 'computer_vision::GetBallPose)
  (if (not (find-package "COMPUTER_VISION"))
    (make-package "COMPUTER_VISION"))
  (shadow 'GetBallPose (find-package "COMPUTER_VISION")))
(unless (find-package "COMPUTER_VISION::GETBALLPOSE")
  (make-package "COMPUTER_VISION::GETBALLPOSE"))
(unless (find-package "COMPUTER_VISION::GETBALLPOSEREQUEST")
  (make-package "COMPUTER_VISION::GETBALLPOSEREQUEST"))
(unless (find-package "COMPUTER_VISION::GETBALLPOSERESPONSE")
  (make-package "COMPUTER_VISION::GETBALLPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass computer_vision::GetBallPoseRequest
  :super ros::object
  :slots ())

(defmethod computer_vision::GetBallPoseRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass computer_vision::GetBallPoseResponse
  :super ros::object
  :slots (_ball_pose ))

(defmethod computer_vision::GetBallPoseResponse
  (:init
   (&key
    ((:ball_pose __ball_pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _ball_pose __ball_pose)
   self)
  (:ball_pose
   (&rest __ball_pose)
   (if (keywordp (car __ball_pose))
       (send* _ball_pose __ball_pose)
     (progn
       (if __ball_pose (setq _ball_pose (car __ball_pose)))
       _ball_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _ball_pose
    (send _ball_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _ball_pose
       (send _ball_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _ball_pose
     (send _ball_pose :deserialize buf ptr-) (incf ptr- (send _ball_pose :serialization-length))
   ;;
   self)
  )

(defclass computer_vision::GetBallPose
  :super ros::object
  :slots ())

(setf (get computer_vision::GetBallPose :md5sum-) "1d7a58f8ac7c61cd568e699d96ad3e1c")
(setf (get computer_vision::GetBallPose :datatype-) "computer_vision/GetBallPose")
(setf (get computer_vision::GetBallPose :request) computer_vision::GetBallPoseRequest)
(setf (get computer_vision::GetBallPose :response) computer_vision::GetBallPoseResponse)

(defmethod computer_vision::GetBallPoseRequest
  (:response () (instance computer_vision::GetBallPoseResponse :init)))

(setf (get computer_vision::GetBallPoseRequest :md5sum-) "1d7a58f8ac7c61cd568e699d96ad3e1c")
(setf (get computer_vision::GetBallPoseRequest :datatype-) "computer_vision/GetBallPoseRequest")
(setf (get computer_vision::GetBallPoseRequest :definition-)
      "
---

geometry_msgs/PoseStamped ball_pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get computer_vision::GetBallPoseResponse :md5sum-) "1d7a58f8ac7c61cd568e699d96ad3e1c")
(setf (get computer_vision::GetBallPoseResponse :datatype-) "computer_vision/GetBallPoseResponse")
(setf (get computer_vision::GetBallPoseResponse :definition-)
      "
---

geometry_msgs/PoseStamped ball_pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :computer_vision/GetBallPose "1d7a58f8ac7c61cd568e699d96ad3e1c")


