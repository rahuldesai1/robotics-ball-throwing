
(cl:in-package :asdf)

(defsystem "computer_vision-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GetBallPose" :depends-on ("_package_GetBallPose"))
    (:file "_package_GetBallPose" :depends-on ("_package"))
    (:file "GetTargetPose" :depends-on ("_package_GetTargetPose"))
    (:file "_package_GetTargetPose" :depends-on ("_package"))
  ))