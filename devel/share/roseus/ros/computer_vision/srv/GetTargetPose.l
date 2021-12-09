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
  :slots (_pixel_height ))

(defmethod computer_vision::GetTargetPoseResponse
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

(defclass computer_vision::GetTargetPose
  :super ros::object
  :slots ())

(setf (get computer_vision::GetTargetPose :md5sum-) "52954f9f105493b6185412c8ca3e9ab4")
(setf (get computer_vision::GetTargetPose :datatype-) "computer_vision/GetTargetPose")
(setf (get computer_vision::GetTargetPose :request) computer_vision::GetTargetPoseRequest)
(setf (get computer_vision::GetTargetPose :response) computer_vision::GetTargetPoseResponse)

(defmethod computer_vision::GetTargetPoseRequest
  (:response () (instance computer_vision::GetTargetPoseResponse :init)))

(setf (get computer_vision::GetTargetPoseRequest :md5sum-) "52954f9f105493b6185412c8ca3e9ab4")
(setf (get computer_vision::GetTargetPoseRequest :datatype-) "computer_vision/GetTargetPoseRequest")
(setf (get computer_vision::GetTargetPoseRequest :definition-)
      "
---

float64 pixel_height

")

(setf (get computer_vision::GetTargetPoseResponse :md5sum-) "52954f9f105493b6185412c8ca3e9ab4")
(setf (get computer_vision::GetTargetPoseResponse :datatype-) "computer_vision/GetTargetPoseResponse")
(setf (get computer_vision::GetTargetPoseResponse :definition-)
      "
---

float64 pixel_height

")



(provide :computer_vision/GetTargetPose "52954f9f105493b6185412c8ca3e9ab4")


