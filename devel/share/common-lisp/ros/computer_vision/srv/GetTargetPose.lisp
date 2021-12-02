; Auto-generated. Do not edit!


(cl:in-package computer_vision-srv)


;//! \htmlinclude GetTargetPose-request.msg.html

(cl:defclass <GetTargetPose-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetTargetPose-request (<GetTargetPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTargetPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTargetPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name computer_vision-srv:<GetTargetPose-request> is deprecated: use computer_vision-srv:GetTargetPose-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTargetPose-request>) ostream)
  "Serializes a message object of type '<GetTargetPose-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTargetPose-request>) istream)
  "Deserializes a message object of type '<GetTargetPose-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTargetPose-request>)))
  "Returns string type for a service object of type '<GetTargetPose-request>"
  "computer_vision/GetTargetPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTargetPose-request)))
  "Returns string type for a service object of type 'GetTargetPose-request"
  "computer_vision/GetTargetPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTargetPose-request>)))
  "Returns md5sum for a message object of type '<GetTargetPose-request>"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTargetPose-request)))
  "Returns md5sum for a message object of type 'GetTargetPose-request"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTargetPose-request>)))
  "Returns full string definition for message of type '<GetTargetPose-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTargetPose-request)))
  "Returns full string definition for message of type 'GetTargetPose-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTargetPose-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTargetPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTargetPose-request
))
;//! \htmlinclude GetTargetPose-response.msg.html

(cl:defclass <GetTargetPose-response> (roslisp-msg-protocol:ros-message)
  ((ball_pose
    :reader ball_pose
    :initarg :ball_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass GetTargetPose-response (<GetTargetPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTargetPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTargetPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name computer_vision-srv:<GetTargetPose-response> is deprecated: use computer_vision-srv:GetTargetPose-response instead.")))

(cl:ensure-generic-function 'ball_pose-val :lambda-list '(m))
(cl:defmethod ball_pose-val ((m <GetTargetPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader computer_vision-srv:ball_pose-val is deprecated.  Use computer_vision-srv:ball_pose instead.")
  (ball_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTargetPose-response>) ostream)
  "Serializes a message object of type '<GetTargetPose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ball_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTargetPose-response>) istream)
  "Deserializes a message object of type '<GetTargetPose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ball_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTargetPose-response>)))
  "Returns string type for a service object of type '<GetTargetPose-response>"
  "computer_vision/GetTargetPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTargetPose-response)))
  "Returns string type for a service object of type 'GetTargetPose-response"
  "computer_vision/GetTargetPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTargetPose-response>)))
  "Returns md5sum for a message object of type '<GetTargetPose-response>"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTargetPose-response)))
  "Returns md5sum for a message object of type 'GetTargetPose-response"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTargetPose-response>)))
  "Returns full string definition for message of type '<GetTargetPose-response>"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped ball_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTargetPose-response)))
  "Returns full string definition for message of type 'GetTargetPose-response"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped ball_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTargetPose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ball_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTargetPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTargetPose-response
    (cl:cons ':ball_pose (ball_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetTargetPose)))
  'GetTargetPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetTargetPose)))
  'GetTargetPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTargetPose)))
  "Returns string type for a service object of type '<GetTargetPose>"
  "computer_vision/GetTargetPose")