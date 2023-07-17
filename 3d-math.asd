(defsystem 3d-math
  :description "Generic math common lisp library for 3d graphics applications."
  :depends-on (:fast-generic-functions)
  :components
  ((:file "package")
   (:file "macros")
   (:file "single-float-types")
   (:file "double-float-types")
   (:file "fixnum-types")
   (:file "rational-types")
   (:file "generic")
   (:file "vector-methods")))
