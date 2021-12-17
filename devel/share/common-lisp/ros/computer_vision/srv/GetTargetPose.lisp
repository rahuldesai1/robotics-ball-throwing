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
  "90d674dbca60d081c5c435b4dff7bfa7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTargetPose-request)))
  "Returns md5sum for a message object of type 'GetTargetPose-request"
  "90d674dbca60d081c5c435b4dff7bfa7")
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
  ((pixel_height
    :reader pixel_height
    :initarg :pixel_height
    :type cl:float
    :initform 0.0)
   (pixel_width
    :reader pixel_width
    :initarg :pixel_width
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetTargetPose-response (<GetTargetPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTargetPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTargetPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name computer_vision-srv:<GetTargetPose-response> is deprecated: use computer_vision-srv:GetTargetPose-response instead.")))

(cl:ensure-generic-function 'pixel_height-val :lambda-list '(m))
(cl:defmethod pixel_height-val ((m <GetTargetPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader computer_vision-srv:pixel_height-val is deprecated.  Use computer_vision-srv:pixel_height instead.")
  (pixel_height m))

(cl:ensure-generic-function 'pixel_width-val :lambda-list '(m))
(cl:defmethod pixel_width-val ((m <GetTargetPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader computer_vision-srv:pixel_width-val is deprecated.  Use computer_vision-srv:pixel_width instead.")
  (pixel_width m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTargetPose-response>) ostream)
  "Serializes a message object of type '<GetTargetPose-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pixel_height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pixel_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTargetPose-response>) istream)
  "Deserializes a message object of type '<GetTargetPose-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pixel_height) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pixel_width) (roslisp-utils:decode-double-float-bits bits)))
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
  "90d674dbca60d081c5c435b4dff7bfa7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTargetPose-response)))
  "Returns md5sum for a message object of type 'GetTargetPose-response"
  "90d674dbca60d081c5c435b4dff7bfa7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTargetPose-response>)))
  "Returns full string definition for message of type '<GetTargetPose-response>"
  (cl:format cl:nil "~%float64 pixel_height~%float64 pixel_width~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTargetPose-response)))
  "Returns full string definition for message of type 'GetTargetPose-response"
  (cl:format cl:nil "~%float64 pixel_height~%float64 pixel_width~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTargetPose-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTargetPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTargetPose-response
    (cl:cons ':pixel_height (pixel_height msg))
    (cl:cons ':pixel_width (pixel_width msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetTargetPose)))
  'GetTargetPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetTargetPose)))
  'GetTargetPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTargetPose)))
  "Returns string type for a service object of type '<GetTargetPose>"
  "computer_vision/GetTargetPose")