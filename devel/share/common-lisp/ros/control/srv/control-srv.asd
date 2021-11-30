
(cl:in-package :asdf)

(defsystem "control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PickUpBall" :depends-on ("_package_PickUpBall"))
    (:file "_package_PickUpBall" :depends-on ("_package"))
    (:file "ThrowBall" :depends-on ("_package_ThrowBall"))
    (:file "_package_ThrowBall" :depends-on ("_package"))
  ))