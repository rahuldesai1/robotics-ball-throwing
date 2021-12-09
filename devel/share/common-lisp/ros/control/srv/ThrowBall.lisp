; Auto-generated. Do not edit!


(cl:in-package control-srv)


;//! \htmlinclude ThrowBall-request.msg.html

(cl:defclass <ThrowBall-request> (roslisp-msg-protocol:ros-message)
  ((target_pose
    :reader target_pose
    :initarg :target_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass ThrowBall-request (<ThrowBall-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrowBall-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrowBall-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control-srv:<ThrowBall-request> is deprecated: use control-srv:ThrowBall-request instead.")))

(cl:ensure-generic-function 'target_pose-val :lambda-list '(m))
(cl:defmethod target_pose-val ((m <ThrowBall-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control-srv:target_pose-val is deprecated.  Use control-srv:target_pose instead.")
  (target_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrowBall-request>) ostream)
  "Serializes a message object of type '<ThrowBall-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrowBall-request>) istream)
  "Deserializes a message object of type '<ThrowBall-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrowBall-request>)))
  "Returns string type for a service object of type '<ThrowBall-request>"
  "control/ThrowBallRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrowBall-request)))
  "Returns string type for a service object of type 'ThrowBall-request"
  "control/ThrowBallRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrowBall-request>)))
  "Returns md5sum for a message object of type '<ThrowBall-request>"
  "548e99f135dd6026231a1f7b41de0e99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrowBall-request)))
  "Returns md5sum for a message object of type 'ThrowBall-request"
  "548e99f135dd6026231a1f7b41de0e99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrowBall-request>)))
  "Returns full string definition for message of type '<ThrowBall-request>"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped target_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrowBall-request)))
  "Returns full string definition for message of type 'ThrowBall-request"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped target_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrowBall-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrowBall-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrowBall-request
    (cl:cons ':target_pose (target_pose msg))
))
;//! \htmlinclude ThrowBall-response.msg.html

(cl:defclass <ThrowBall-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ThrowBall-response (<ThrowBall-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrowBall-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrowBall-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control-srv:<ThrowBall-response> is deprecated: use control-srv:ThrowBall-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ThrowBall-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control-srv:success-val is deprecated.  Use control-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrowBall-response>) ostream)
  "Serializes a message object of type '<ThrowBall-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrowBall-response>) istream)
  "Deserializes a message object of type '<ThrowBall-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrowBall-response>)))
  "Returns string type for a service object of type '<ThrowBall-response>"
  "control/ThrowBallResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrowBall-response)))
  "Returns string type for a service object of type 'ThrowBall-response"
  "control/ThrowBallResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrowBall-response>)))
  "Returns md5sum for a message object of type '<ThrowBall-response>"
  "548e99f135dd6026231a1f7b41de0e99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrowBall-response)))
  "Returns md5sum for a message object of type 'ThrowBall-response"
  "548e99f135dd6026231a1f7b41de0e99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrowBall-response>)))
  "Returns full string definition for message of type '<ThrowBall-response>"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrowBall-response)))
  "Returns full string definition for message of type 'ThrowBall-response"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrowBall-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrowBall-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrowBall-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ThrowBall)))
  'ThrowBall-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ThrowBall)))
  'ThrowBall-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrowBall)))
  "Returns string type for a service object of type '<ThrowBall>"
  "control/ThrowBall")