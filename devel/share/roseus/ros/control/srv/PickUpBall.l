;; Auto-generated. Do not edit!


(when (boundp 'control::PickUpBall)
  (if (not (find-package "CONTROL"))
    (make-package "CONTROL"))
  (shadow 'PickUpBall (find-package "CONTROL")))
(unless (find-package "CONTROL::PICKUPBALL")
  (make-package "CONTROL::PICKUPBALL"))
(unless (find-package "CONTROL::PICKUPBALLREQUEST")
  (make-package "CONTROL::PICKUPBALLREQUEST"))
(unless (find-package "CONTROL::PICKUPBALLRESPONSE")
  (make-package "CONTROL::PICKUPBALLRESPONSE"))

(in-package "ROS")





(defclass control::PickUpBallRequest
  :super ros::object
  :slots ())

(defmethod control::PickUpBallRequest
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

(defclass control::PickUpBallResponse
  :super ros::object
  :slots (_ok ))

(defmethod control::PickUpBallResponse
  (:init
   (&key
    ((:ok __ok) nil)
    )
   (send-super :init)
   (setq _ok __ok)
   self)
  (:ok
   (&optional __ok)
   (if __ok (setq _ok __ok)) _ok)
  (:serialization-length
   ()
   (+
    ;; bool _ok
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _ok
       (if _ok (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _ok
     (setq _ok (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass control::PickUpBall
  :super ros::object
  :slots ())

(setf (get control::PickUpBall :md5sum-) "6f6da3883749771fac40d6deb24a8c02")
(setf (get control::PickUpBall :datatype-) "control/PickUpBall")
(setf (get control::PickUpBall :request) control::PickUpBallRequest)
(setf (get control::PickUpBall :response) control::PickUpBallResponse)

(defmethod control::PickUpBallRequest
  (:response () (instance control::PickUpBallResponse :init)))

(setf (get control::PickUpBallRequest :md5sum-) "6f6da3883749771fac40d6deb24a8c02")
(setf (get control::PickUpBallRequest :datatype-) "control/PickUpBallRequest")
(setf (get control::PickUpBallRequest :definition-)
      "
---

bool ok

")

(setf (get control::PickUpBallResponse :md5sum-) "6f6da3883749771fac40d6deb24a8c02")
(setf (get control::PickUpBallResponse :datatype-) "control/PickUpBallResponse")
(setf (get control::PickUpBallResponse :definition-)
      "
---

bool ok

")



(provide :control/PickUpBall "6f6da3883749771fac40d6deb24a8c02")


