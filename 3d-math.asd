(defsystem 3d-math
  :description "Generic 3d math common lisp library for 3d graphics applications."
  :author "Andrew Kenneth Wolven <awolven@gmail.com>"
  :license "MIT"
  :depends-on (:fast-generic-functions)
  :components
  ((:file "package")
   (:file "macros")
   (:file "single-float-types")
   (:file "double-float-types")
   (:file "fixnum-types")
   (:file "rational-types")
   (:file "generic")
   (:file "vector-methods")
   (:file "matrix-methods")
   (:file "quaternion-methods")))
