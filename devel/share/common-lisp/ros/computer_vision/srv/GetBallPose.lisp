; Auto-generated. Do not edit!


(cl:in-package computer_vision-srv)


;//! \htmlinclude GetBallPose-request.msg.html

(cl:defclass <GetBallPose-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetBallPose-request (<GetBallPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBallPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBallPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name computer_vision-srv:<GetBallPose-request> is deprecated: use computer_vision-srv:GetBallPose-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBallPose-request>) ostream)
  "Serializes a message object of type '<GetBallPose-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBallPose-request>) istream)
  "Deserializes a message object of type '<GetBallPose-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBallPose-request>)))
  "Returns string type for a service object of type '<GetBallPose-request>"
  "computer_vision/GetBallPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBallPose-request)))
  "Returns string type for a service object of type 'GetBallPose-request"
  "computer_vision/GetBallPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBallPose-request>)))
  "Returns md5sum for a message object of type '<GetBallPose-request>"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBallPose-request)))
  "Returns md5sum for a message object of type 'GetBallPose-request"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBallPose-request>)))
  "Returns full string definition for message of type '<GetBallPose-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBallPose-request)))
  "Returns full string definition for message of type 'GetBallPose-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBallPose-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBallPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBallPose-request
))
;//! \htmlinclude GetBallPose-response.msg.html

(cl:defclass <GetBallPose-response> (roslisp-msg-protocol:ros-message)
  ((ball_pose
    :reader ball_pose
    :initarg :ball_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass GetBallPose-response (<GetBallPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBallPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBallPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name computer_vision-srv:<GetBallPose-response> is deprecated: use computer_vision-srv:GetBallPose-response instead.")))

(cl:ensure-generic-function 'ball_pose-val :lambda-list '(m))
(cl:defmethod ball_pose-val ((m <GetBallPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader computer_vision-srv:ball_pose-val is deprecated.  Use computer_vision-srv:ball_pose instead.")
  (ball_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBallPose-response>) ostream)
  "Serializes a message object of type '<GetBallPose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ball_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBallPose-response>) istream)
  "Deserializes a message object of type '<GetBallPose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ball_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBallPose-response>)))
  "Returns string type for a service object of type '<GetBallPose-response>"
  "computer_vision/GetBallPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBallPose-response)))
  "Returns string type for a service object of type 'GetBallPose-response"
  "computer_vision/GetBallPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBallPose-response>)))
  "Returns md5sum for a message object of type '<GetBallPose-response>"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBallPose-response)))
  "Returns md5sum for a message object of type 'GetBallPose-response"
  "1d7a58f8ac7c61cd568e699d96ad3e1c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBallPose-response>)))
  "Returns full string definition for message of type '<GetBallPose-response>"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped ball_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBallPose-response)))
  "Returns full string definition for message of type 'GetBallPose-response"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped ball_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBallPose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ball_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBallPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBallPose-response
    (cl:cons ':ball_pose (ball_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetBallPose)))
  'GetBallPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetBallPose)))
  'GetBallPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBallPose)))
  "Returns string type for a service object of type '<GetBallPose>"
  "computer_vision/GetBallPose")