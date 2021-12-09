; Auto-generated. Do not edit!


(cl:in-package control-srv)


;//! \htmlinclude ThrowBall-request.msg.html

(cl:defclass <ThrowBall-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass ThrowBall-request (<ThrowBall-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrowBall-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrowBall-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control-srv:<ThrowBall-request> is deprecated: use control-srv:ThrowBall-request instead.")))

(cl:ensure-generic-function 'pixel_height-val :lambda-list '(m))
(cl:defmethod pixel_height-val ((m <ThrowBall-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control-srv:pixel_height-val is deprecated.  Use control-srv:pixel_height instead.")
  (pixel_height m))

(cl:ensure-generic-function 'pixel_width-val :lambda-list '(m))
(cl:defmethod pixel_width-val ((m <ThrowBall-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control-srv:pixel_width-val is deprecated.  Use control-srv:pixel_width instead.")
  (pixel_width m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrowBall-request>) ostream)
  "Serializes a message object of type '<ThrowBall-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrowBall-request>) istream)
  "Deserializes a message object of type '<ThrowBall-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrowBall-request>)))
  "Returns string type for a service object of type '<ThrowBall-request>"
  "control/ThrowBallRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrowBall-request)))
  "Returns string type for a service object of type 'ThrowBall-request"
  "control/ThrowBallRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrowBall-request>)))
  "Returns md5sum for a message object of type '<ThrowBall-request>"
  "f7e1f764558f025facd58a98ecb551a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrowBall-request)))
  "Returns md5sum for a message object of type 'ThrowBall-request"
  "f7e1f764558f025facd58a98ecb551a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrowBall-request>)))
  "Returns full string definition for message of type '<ThrowBall-request>"
  (cl:format cl:nil "~%float64 pixel_height~%float64 pixel_width~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrowBall-request)))
  "Returns full string definition for message of type 'ThrowBall-request"
  (cl:format cl:nil "~%float64 pixel_height~%float64 pixel_width~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrowBall-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrowBall-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrowBall-request
    (cl:cons ':pixel_height (pixel_height msg))
    (cl:cons ':pixel_width (pixel_width msg))
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
  "f7e1f764558f025facd58a98ecb551a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrowBall-response)))
  "Returns md5sum for a message object of type 'ThrowBall-response"
  "f7e1f764558f025facd58a98ecb551a0")
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