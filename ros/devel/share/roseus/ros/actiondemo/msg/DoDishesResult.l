;; Auto-generated. Do not edit!


(when (boundp 'actiondemo::DoDishesResult)
  (if (not (find-package "ACTIONDEMO"))
    (make-package "ACTIONDEMO"))
  (shadow 'DoDishesResult (find-package "ACTIONDEMO")))
(unless (find-package "ACTIONDEMO::DODISHESRESULT")
  (make-package "ACTIONDEMO::DODISHESRESULT"))

(in-package "ROS")
;;//! \htmlinclude DoDishesResult.msg.html


(defclass actiondemo::DoDishesResult
  :super ros::object
  :slots (_total_dishes_cleaned ))

(defmethod actiondemo::DoDishesResult
  (:init
   (&key
    ((:total_dishes_cleaned __total_dishes_cleaned) 0)
    )
   (send-super :init)
   (setq _total_dishes_cleaned (round __total_dishes_cleaned))
   self)
  (:total_dishes_cleaned
   (&optional __total_dishes_cleaned)
   (if __total_dishes_cleaned (setq _total_dishes_cleaned __total_dishes_cleaned)) _total_dishes_cleaned)
  (:serialization-length
   ()
   (+
    ;; uint32 _total_dishes_cleaned
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _total_dishes_cleaned
       (write-long _total_dishes_cleaned s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _total_dishes_cleaned
     (setq _total_dishes_cleaned (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get actiondemo::DoDishesResult :md5sum-) "58faa44dda59c6545bea63ff57491cbe")
(setf (get actiondemo::DoDishesResult :datatype-) "actiondemo/DoDishesResult")
(setf (get actiondemo::DoDishesResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
uint32 total_dishes_cleaned

")



(provide :actiondemo/DoDishesResult "58faa44dda59c6545bea63ff57491cbe")


