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
  :slots (_pixel_height ))

(defmethod control::ThrowBallRequest
  (:init
   (&key
    ((:pixel_height __pixel_height) 0.0)
    )
   (send-super :init)
   (setq _pixel_height (float __pixel_height))
   self)
  (:pixel_height
   (&optional __pixel_height)
   (if __pixel_height (setq _pixel_height __pixel_height)) _pixel_height)
  (:serialization-length
   ()
   (+
    ;; float64 _pixel_height
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pixel_height
       (sys::poke _pixel_height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pixel_height
     (setq _pixel_height (sys::peek buf ptr- :double)) (incf ptr- 8)
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

(setf (get control::ThrowBall :md5sum-) "1f0593be718173ba91ca9ae3b0c6177b")
(setf (get control::ThrowBall :datatype-) "control/ThrowBall")
(setf (get control::ThrowBall :request) control::ThrowBallRequest)
(setf (get control::ThrowBall :response) control::ThrowBallResponse)

(defmethod control::ThrowBallRequest
  (:response () (instance control::ThrowBallResponse :init)))

(setf (get control::ThrowBallRequest :md5sum-) "1f0593be718173ba91ca9ae3b0c6177b")
(setf (get control::ThrowBallRequest :datatype-) "control/ThrowBallRequest")
(setf (get control::ThrowBallRequest :definition-)
      "
float64 pixel_height
---

bool success

")

(setf (get control::ThrowBallResponse :md5sum-) "1f0593be718173ba91ca9ae3b0c6177b")
(setf (get control::ThrowBallResponse :datatype-) "control/ThrowBallResponse")
(setf (get control::ThrowBallResponse :definition-)
      "
float64 pixel_height
---

bool success

")



(provide :control/ThrowBall "1f0593be718173ba91ca9ae3b0c6177b")


