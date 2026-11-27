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

(setf (logical-pathname-translations "3D-MATH-SUBMODULES")
      (list (list "**;*.*.*"
		  (merge-pathnames (make-pathname
				    :directory '(:relative :wild-inferiors)
				    :name :wild
				    :type :wild
				    :version :wild)
				   (asdf/system:system-relative-pathname :3d-math "submodules/")))))

(let ((directories (list #p"3d-math-submodules:sealable-metaobjects;code;"
			 #p"3d-math-submodules:fast-generic-functions;code;")))
  (loop for directory in directories
	do (pushnew (translate-logical-pathname directory) asdf:*central-registry*)))


;; Independent experiment: no dependency on 3d-math itself.
(asdf:defsystem "3d-math/coalton"
  :description "Pure Coalton matrix and vector multiplication."
  :depends-on ("coalton")
  :components ((:file "coalton-multiplication"))
  :in-order-to ((asdf:test-op (asdf:test-op "3d-math/coalton/tests"))))

(asdf:defsystem "3d-math/coalton/tests"
  :depends-on ("3d-math/coalton")
  :components ((:file "coalton-tests"))
  :perform (asdf:test-op (op system)
             (declare (ignore op system))
             (uiop:symbol-call :3dm.coalton.tests :run-tests)))
