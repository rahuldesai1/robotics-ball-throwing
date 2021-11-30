;; Auto-generated. Do not edit!


(when (boundp 'control::ThrowBall)
  (if (not (find-package "CONTROL"))
    (make-package "CONTROL"))
  (shadow 'ThrowBall (find-package "CONTROL")))
(unless (find-package "CONTROL::THROWBALL")
  (make-package "CONTROL::THROWBALL"))
(unless (find-package "CONTROL::THROWBALLREQUEST")
  (make-package "CONTROL::THROWBALLREQUEST"))
(unless (find-package "CONTROL::THROWBALLRESPONSE")
  (make-package "CONTROL::THROWBALLRESPONSE"))

(in-package "ROS")





(defclass control::ThrowBallRequest
  :super ros::object
  :slots ())

(defmethod control::ThrowBallRequest
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

(defclass control::ThrowBallResponse
  :super ros::object
  :slots (_success ))

(defmethod control::ThrowBallResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass control::ThrowBall
  :super ros::object
  :slots ())

(setf (get control::ThrowBall :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get control::ThrowBall :datatype-) "control/ThrowBall")
(setf (get control::ThrowBall :request) control::ThrowBallRequest)
(setf (get control::ThrowBall :response) control::ThrowBallResponse)

(defmethod control::ThrowBallRequest
  (:response () (instance control::ThrowBallResponse :init)))

(setf (get control::ThrowBallRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get control::ThrowBallRequest :datatype-) "control/ThrowBallRequest")
(setf (get control::ThrowBallRequest :definition-)
      "
---

bool success

")

(setf (get control::ThrowBallResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get control::ThrowBallResponse :datatype-) "control/ThrowBallResponse")
(setf (get control::ThrowBallResponse :definition-)
      "
---

bool success

")



(provide :control/ThrowBall "358e233cde0c8a8bcfea4ce193f8fc15")


