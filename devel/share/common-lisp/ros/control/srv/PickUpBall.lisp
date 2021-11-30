; Auto-generated. Do not edit!


(cl:in-package control-srv)


;//! \htmlinclude PickUpBall-request.msg.html

(cl:defclass <PickUpBall-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass PickUpBall-request (<PickUpBall-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickUpBall-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickUpBall-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control-srv:<PickUpBall-request> is deprecated: use control-srv:PickUpBall-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickUpBall-request>) ostream)
  "Serializes a message object of type '<PickUpBall-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickUpBall-request>) istream)
  "Deserializes a message object of type '<PickUpBall-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickUpBall-request>)))
  "Returns string type for a service object of type '<PickUpBall-request>"
  "control/PickUpBallRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickUpBall-request)))
  "Returns string type for a service object of type 'PickUpBall-request"
  "control/PickUpBallRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickUpBall-request>)))
  "Returns md5sum for a message object of type '<PickUpBall-request>"
  "6f6da3883749771fac40d6deb24a8c02")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickUpBall-request)))
  "Returns md5sum for a message object of type 'PickUpBall-request"
  "6f6da3883749771fac40d6deb24a8c02")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickUpBall-request>)))
  "Returns full string definition for message of type '<PickUpBall-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickUpBall-request)))
  "Returns full string definition for message of type 'PickUpBall-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickUpBall-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickUpBall-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PickUpBall-request
))
;//! \htmlinclude PickUpBall-response.msg.html

(cl:defclass <PickUpBall-response> (roslisp-msg-protocol:ros-message)
  ((ok
    :reader ok
    :initarg :ok
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PickUpBall-response (<PickUpBall-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickUpBall-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickUpBall-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control-srv:<PickUpBall-response> is deprecated: use control-srv:PickUpBall-response instead.")))

(cl:ensure-generic-function 'ok-val :lambda-list '(m))
(cl:defmethod ok-val ((m <PickUpBall-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control-srv:ok-val is deprecated.  Use control-srv:ok instead.")
  (ok m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickUpBall-response>) ostream)
  "Serializes a message object of type '<PickUpBall-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ok) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickUpBall-response>) istream)
  "Deserializes a message object of type '<PickUpBall-response>"
    (cl:setf (cl:slot-value msg 'ok) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickUpBall-response>)))
  "Returns string type for a service object of type '<PickUpBall-response>"
  "control/PickUpBallResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickUpBall-response)))
  "Returns string type for a service object of type 'PickUpBall-response"
  "control/PickUpBallResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickUpBall-response>)))
  "Returns md5sum for a message object of type '<PickUpBall-response>"
  "6f6da3883749771fac40d6deb24a8c02")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickUpBall-response)))
  "Returns md5sum for a message object of type 'PickUpBall-response"
  "6f6da3883749771fac40d6deb24a8c02")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickUpBall-response>)))
  "Returns full string definition for message of type '<PickUpBall-response>"
  (cl:format cl:nil "~%bool ok~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickUpBall-response)))
  "Returns full string definition for message of type 'PickUpBall-response"
  (cl:format cl:nil "~%bool ok~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickUpBall-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickUpBall-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PickUpBall-response
    (cl:cons ':ok (ok msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PickUpBall)))
  'PickUpBall-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PickUpBall)))
  'PickUpBall-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickUpBall)))
  "Returns string type for a service object of type '<PickUpBall>"
  "control/PickUpBall")