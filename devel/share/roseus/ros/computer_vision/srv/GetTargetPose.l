;; Auto-generated. Do not edit!


(when (boundp 'computer_vision::GetTargetPose)
  (if (not (find-package "COMPUTER_VISION"))
    (make-package "COMPUTER_VISION"))
  (shadow 'GetTargetPose (find-package "COMPUTER_VISION")))
(unless (find-package "COMPUTER_VISION::GETTARGETPOSE")
  (make-package "COMPUTER_VISION::GETTARGETPOSE"))
(unless (find-package "COMPUTER_VISION::GETTARGETPOSEREQUEST")
  (make-package "COMPUTER_VISION::GETTARGETPOSEREQUEST"))
(unless (find-package "COMPUTER_VISION::GETTARGETPOSERESPONSE")
  (make-package "COMPUTER_VISION::GETTARGETPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass computer_vision::GetTargetPoseRequest
  :super ros::object
  :slots ())

(defmethod computer_vision::GetTargetPoseRequest
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

(defclass computer_vision::GetTargetPoseResponse
  :super ros::object
  :slots (_target_pose ))

(defmethod computer_vision::GetTargetPoseResponse
  (:init
   (&key
    ((:target_pose __target_pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _target_pose __target_pose)
   self)
  (:target_pose
   (&rest __target_pose)
   (if (keywordp (car __target_pose))
       (send* _target_pose __target_pose)
     (progn
       (if __target_pose (setq _target_pose (car __target_pose)))
       _target_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _target_pose
    (send _target_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _target_pose
       (send _target_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _target_pose
     (send _target_pose :deserialize buf ptr-) (incf ptr- (send _target_pose :serialization-length))
   ;;
   self)
  )

(defclass computer_vision::GetTargetPose
  :super ros::object
  :slots ())

(setf (get computer_vision::GetTargetPose :md5sum-) "257d089627d7eb7136c24d3593d05a16")
(setf (get computer_vision::GetTargetPose :datatype-) "computer_vision/GetTargetPose")
(setf (get computer_vision::GetTargetPose :request) computer_vision::GetTargetPoseRequest)
(setf (get computer_vision::GetTargetPose :response) computer_vision::GetTargetPoseResponse)

(defmethod computer_vision::GetTargetPoseRequest
  (:response () (instance computer_vision::GetTargetPoseResponse :init)))

(setf (get computer_vision::GetTargetPoseRequest :md5sum-) "257d089627d7eb7136c24d3593d05a16")
(setf (get computer_vision::GetTargetPoseRequest :datatype-) "computer_vision/GetTargetPoseRequest")
(setf (get computer_vision::GetTargetPoseRequest :definition-)
      "
---

geometry_msgs/PoseStamped target_pose


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

(setf (get computer_vision::GetTargetPoseResponse :md5sum-) "257d089627d7eb7136c24d3593d05a16")
(setf (get computer_vision::GetTargetPoseResponse :datatype-) "computer_vision/GetTargetPoseResponse")
(setf (get computer_vision::GetTargetPoseResponse :definition-)
      "
---

geometry_msgs/PoseStamped target_pose


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



(provide :computer_vision/GetTargetPose "257d089627d7eb7136c24d3593d05a16")


