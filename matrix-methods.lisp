(in-package :3dm)

#+sbcl
(declaim (sb-ext:muffle-conditions sb-ext:compiler-note))

(3dm-def:defsealed marr ((m 3dm.d::mat2))
  (3dm.d::marr2 m))

(3dm-def:defsealed marr ((m 3dm.f::mat2))
  (3dm.f::marr2 m))

(3dm-def:defsealed marr ((m 3dm.rat::mat2))
  (3dm.rat::marr2 m))

(3dm-def:defsealed marr ((m 3dm.fix::mat2))
  (3dm.fix::marr2 m))

(3dm-def:defsealed marr ((m 3dm.d::mat3))
  (3dm.d::marr3 m))

(3dm-def:defsealed marr ((m 3dm.f::mat3))
  (3dm.f::marr3 m))

(3dm-def:defsealed marr ((m 3dm.rat::mat3))
  (3dm.rat::marr3 m))

(3dm-def:defsealed marr ((m 3dm.fix::mat3))
  (3dm.fix::marr3 m))

(3dm-def:defsealed marr ((m 3dm.d::mat4))
  (3dm.d::marr4 m))

(3dm-def:defsealed marr ((m 3dm.f::mat4))
  (3dm.f::marr4 m))

(3dm-def:defsealed marr ((m 3dm.rat::mat4))
  (3dm.rat::marr4 m))

(3dm-def:defsealed marr ((m 3dm.fix::mat4))
  (3dm.fix::marr4 m))

(3dm-def:defsealed marr ((m 3dm.d::matn))
  (3dm.d::marrn m))

(3dm-def:defsealed marr ((m 3dm.f::matn))
  (3dm.f::marrn m))

(3dm-def:defsealed marr ((m 3dm.rat::matn))
  (3dm.rat::marrn m))

(3dm-def:defsealed marr ((m 3dm.fix::matn))
  (3dm.fix::marrn m))

(3dm-def::define-setf-mcol-mat2-vec2-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-setf-mcol-mat2-vec2-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-setf-mcol-mat2-vec2-function cl:single-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-setf-mcol-mat2-vec2-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-setf-mcol-mat2-vec2-function cl:rational :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed mcol ((mat 3dm.d::mat2) (i fixnum))
  (3dm.d::mcol mat i))

(3dm-def:defsealed mcol ((mat 3dm.d::mat3) (i fixnum))
  (3dm.d::mcol mat i))

(3dm-def:defsealed mcol ((mat 3dm.d::mat4) (i fixnum))
  (3dm.d::mcol mat i))

(3dm-def:defsealed (setf mcol) ((vec 3dm.d::vec2) (mat 3dm.d::mat2) (i fixnum))
  (setf (3dm.d::mcol-mat2-vec2 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.f::vec2) (mat 3dm.d::mat2) (i fixnum))
  (setf (3dm.d&f::mcol-mat2-vec2 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.d::vec2) (mat 3dm.f::mat2) (i fixnum))
  (setf (3dm.f&d::mcol-mat2-vec2 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.rat::vec2) (mat 3dm.rat::mat2) (i fixnum))
  (setf (3dm.rat::mcol-mat2-vec2 mat i) vec))

(3dm-def::define-setf-mcol-mat3-vec3-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-setf-mcol-mat3-vec3-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-setf-mcol-mat3-vec3-function cl:single-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-setf-mcol-mat3-vec3-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-setf-mcol-mat3-vec3-function cl:rational :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed (setf mcol) ((vec 3dm.d::vec3) (mat 3dm.d::mat3) (i fixnum))
  (setf (3dm.d::mcol-mat3-vec3 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.f::vec3) (mat 3dm.d::mat3) (i fixnum))
  (setf (3dm.d&f::mcol-mat3-vec3 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.d::vec3) (mat 3dm.f::mat3) (i fixnum))
  (setf (3dm.f&d::mcol-mat3-vec3 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.rat::vec3) (mat 3dm.rat::mat3) (i fixnum))
  (setf (3dm.rat::mcol-mat3-vec3 mat i) vec))

(3dm-def::define-setf-mcol-mat4-vec4-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-setf-mcol-mat4-vec4-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-setf-mcol-mat4-vec4-function cl:single-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-setf-mcol-mat4-vec4-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-setf-mcol-mat4-vec4-function cl:rational :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed (setf mcol) ((vec 3dm.d::vec4) (mat 3dm.d::mat4) (i fixnum))
  (setf (3dm.d::mcol-mat4-vec4 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.f::vec4) (mat 3dm.d::mat4) (i fixnum))
  (setf (3dm.d&f::mcol-mat4-vec4 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.d::vec4) (mat 3dm.f::mat4) (i fixnum))
  (setf (3dm.f&d::mcol-mat4-vec4 mat i) vec))

(3dm-def:defsealed (setf mcol) ((vec 3dm.rat::vec4) (mat 3dm.rat::mat4) (i fixnum))
  (setf (3dm.rat::mcol-mat4-vec4 mat i) vec))

(3dm-def:defsealed mrow ((mat 3dm.d::mat2) (i fixnum))
  (3dm.d::mat2-mrow mat i))

(3dm-def:defsealed mrow ((mat 3dm.d::mat3) (i fixnum))
  (3dm.d::mat3-mrow mat i))

(3dm-def:defsealed mrow ((mat 3dm.d::mat4) (i fixnum))
  (3dm.d::mat4-mrow mat i))

(3dm-def:defsealed mrow ((mat 3dm.f::mat2) (i fixnum))
  (3dm.f::mat2-mrow mat i))

(3dm-def:defsealed mrow ((mat 3dm.f::mat3) (i fixnum))
  (3dm.f::mat3-mrow mat i))

(3dm-def:defsealed mrow ((mat 3dm.f::mat4) (i fixnum))
  (3dm.f::mat4-mrow mat i))

(3dm-def::define-setf-mrow-mat2-vec2-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-setf-mrow-mat2-vec2-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-setf-mrow-mat2-vec2-function cl:single-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-setf-mrow-mat2-vec2-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-setf-mrow-mat2-vec2-function cl:rational :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed (setf mrow) ((vec 3dm.d::vec2) (mat 3dm.d::mat2) (i fixnum))
  (setf (3dm.d::mrow-mat2-vec2 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.f::vec2) (mat 3dm.d::mat2) (i fixnum))
  (setf (3dm.d&f::mrow-mat2-vec2 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.d::vec2) (mat 3dm.f::mat2) (i fixnum))
  (setf (3dm.f&d::mrow-mat2-vec2 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.rat::vec2) (mat 3dm.rat::mat2) (i fixnum))
  (setf (3dm.rat::mrow-mat2-vec2 mat i) vec))

(3dm-def::define-setf-mrow-mat3-vec3-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-setf-mrow-mat3-vec3-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-setf-mrow-mat3-vec3-function cl:single-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-setf-mrow-mat3-vec3-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-setf-mrow-mat3-vec3-function cl:rational :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed (setf mrow) ((vec 3dm.d::vec3) (mat 3dm.d::mat3) (i fixnum))
  (setf (3dm.d::mrow-mat3-vec3 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.f::vec3) (mat 3dm.d::mat3) (i fixnum))
  (setf (3dm.d&f::mrow-mat3-vec3 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.d::vec3) (mat 3dm.f::mat3) (i fixnum))
  (setf (3dm.f&d::mrow-mat3-vec3 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.rat::vec3) (mat 3dm.rat::mat3) (i fixnum))
  (setf (3dm.rat::mrow-mat3-vec3 mat i) vec))

(3dm-def::define-setf-mrow-mat4-vec4-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-setf-mrow-mat4-vec4-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-setf-mrow-mat4-vec4-function cl:single-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-setf-mrow-mat4-vec4-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-setf-mrow-mat4-vec4-function cl:rational :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed (setf mrow) ((vec 3dm.d::vec4) (mat 3dm.d::mat4) (i fixnum))
  (setf (3dm.d::mrow-mat4-vec4 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.f::vec4) (mat 3dm.d::mat4) (i fixnum))
  (setf (3dm.d&f::mrow-mat4-vec4 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.d::vec4) (mat 3dm.f::mat4) (i fixnum))
  (setf (3dm.f&d::mrow-mat4-vec4 mat i) vec))

(3dm-def:defsealed (setf mrow) ((vec 3dm.rat::vec4) (mat 3dm.rat::mat4) (i fixnum))
  (setf (3dm.rat::mrow-mat4-vec4 mat i) vec))

(3dm-def::define-m*-mat2-vec2 :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat2) (b 3dm.d::vec2))
  (3dm-def::coalton-matrix-vector a b 2 :3dm.d :3dm.d :3dm.d))

(3dm-def:defsealed binary-m* ((a 3dm.d::vec2) (b 3dm.d::mat2))
  (3dm-def::coalton-matrix-vector b a 2 :3dm.d :3dm.d :3dm.d))

(3dm-def::define-m*-mat2-vec2 :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat2) (b 3dm.f::vec2))
  (3dm-def::coalton-matrix-vector a b 2 :3dm.d :3dm.f :3dm.d))

(3dm-def:defsealed binary-m* ((a 3dm.f::vec2) (b 3dm.d::mat2))
  (3dm-def::coalton-matrix-vector b a 2 :3dm.d :3dm.f :3dm.d))

(3dm-def::define-m*-mat2-vec2 :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-m* ((a 3dm.f::mat2) (b 3dm.f::vec2))
  (3dm-def::coalton-matrix-vector a b 2 :3dm.f :3dm.f :3dm.f))

(3dm-def:defsealed binary-m* ((a 3dm.f::vec2) (b 3dm.f::mat2))
  (3dm-def::coalton-matrix-vector b a 2 :3dm.f :3dm.f :3dm.f))

(3dm-def::define-m*-mat2-mat2 :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat2) (b 3dm.d::mat2))
  (3dm-def::coalton-matrix-matrix a b 2 :3dm.d :3dm.d :3dm.d))

(3dm-def::define-m*-mat2-mat2 :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-m* ((a 3dm.f::mat2) (b 3dm.f::mat2))
  (3dm-def::coalton-matrix-matrix a b 2 :3dm.f :3dm.f :3dm.f))

(3dm-def::define-m*-mat2-mat2 :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat2) (b 3dm.f::mat2))
  (3dm-def::coalton-matrix-matrix a b 2 :3dm.d :3dm.f :3dm.d))

(3dm-def::define-m*-mat3-vec3 :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat3) (b 3dm.d::vec3))
  (3dm-def::coalton-matrix-vector a b 3 :3dm.d :3dm.d :3dm.d))

(3dm-def:defsealed binary-m* ((a 3dm.d::vec3) (b 3dm.d::mat3))
  (3dm-def::coalton-matrix-vector b a 3 :3dm.d :3dm.d :3dm.d))

(3dm-def::define-m*-mat3-vec3 :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat3) (b 3dm.f::vec3))
  (3dm-def::coalton-matrix-vector a b 3 :3dm.d :3dm.f :3dm.d))

(3dm-def:defsealed binary-m* ((a 3dm.f::vec3) (b 3dm.d::mat3))
  (3dm-def::coalton-matrix-vector b a 3 :3dm.d :3dm.f :3dm.d))

(3dm-def::define-m*-mat3-vec3 :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-m* ((a 3dm.f::mat3) (b 3dm.f::vec3))
  (3dm-def::coalton-matrix-vector a b 3 :3dm.f :3dm.f :3dm.f))

(3dm-def:defsealed binary-m* ((a 3dm.f::vec3) (b 3dm.f::mat3))
  (3dm-def::coalton-matrix-vector b a 3 :3dm.f :3dm.f :3dm.f))

(3dm-def::define-m*-mat4-vec4 :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat4) (b 3dm.d::vec4))
  (3dm-def::coalton-matrix-vector a b 4 :3dm.d :3dm.d :3dm.d))

(3dm-def:defsealed binary-m* ((a 3dm.d::vec4) (b 3dm.d::mat4))
  (3dm-def::coalton-matrix-vector b a 4 :3dm.d :3dm.d :3dm.d))

(3dm-def::define-m*-mat4-vec4 :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.d::mat4) (b 3dm.f::vec4))
  (3dm-def::coalton-matrix-vector a b 4 :3dm.d :3dm.f :3dm.d))

(3dm-def:defsealed binary-m* ((a 3dm.f::vec4) (b 3dm.d::mat4))
  (3dm-def::coalton-matrix-vector b a 4 :3dm.d :3dm.f :3dm.d))

(3dm-def::define-m*-mat4-vec4 :3dm.f&d :3dm.f :3dm.d :3dm.d)

(3dm-def:defsealed binary-m* ((a 3dm.f::mat4) (b 3dm.d::vec4))
  (3dm-def::coalton-matrix-vector a b 4 :3dm.f :3dm.d :3dm.d))

(3dm-def:defsealed binary-m* ((a 3dm.d::vec4) (b 3dm.f::mat4))
  (3dm-def::coalton-matrix-vector b a 4 :3dm.f :3dm.d :3dm.d))

(3dm-def::define-m*-mat4-vec4 :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-m* ((a 3dm.f::mat4) (b 3dm.f::vec4))
  (3dm-def::coalton-matrix-vector a b 4 :3dm.f :3dm.f :3dm.f))

(3dm-def:defsealed binary-m* ((a 3dm.f::vec4) (b 3dm.f::mat4))
  (3dm-def::coalton-matrix-vector b a 4 :3dm.f :3dm.f :3dm.f))

(3dm-def::define-m*-mat4-mat4 :3dm.d :3dm.d :3dm.d :3dm.d)
(3dm-def::define-m*-mat4-single-float-mat4 :3dm.d :3dm.d :3dm.d) ;; used by krma

(3dm-def:defsealed binary-m* ((a 3dm.d::mat4) (b 3dm.d::mat4))
  (3dm-def::coalton-matrix-matrix a b 4 :3dm.d :3dm.d :3dm.d))

(3dm-def::define-m*-mat4-mat4 :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-m* ((a 3dm.f::mat4) (b 3dm.f::mat4))
  (3dm-def::coalton-matrix-matrix a b 4 :3dm.f :3dm.f :3dm.f))

(3dm-def::define-m*-mat4-mat4 :3dm.d&f :3dm.d :3dm.f :3dm.d)
(3dm-def::define-m*-mat4-single-float-mat4 :3dm.d&f :3dm.d :3dm.f) ;; used by krma

(3dm-def:defsealed binary-m* ((a 3dm.d::mat4) (b 3dm.f::mat4))
  (3dm-def::coalton-matrix-matrix a b 4 :3dm.d :3dm.f :3dm.d))

(3dm-def::define-m*-mat4-mat4 :3dm.f&d :3dm.f :3dm.d :3dm.d)
(3dm-def::define-m*-mat4-single-float-mat4 :3dm.f&d :3dm.f :3dm.d) ;; used by krma

(3dm-def:defsealed binary-m* ((a 3dm.f::mat4) (b 3dm.d::mat4))
  (3dm-def::coalton-matrix-matrix a b 4 :3dm.f :3dm.d :3dm.d))

(3dm-def:defsealed binary-m* ((a #-(or ALLEGRO ECL) simple-array #+(or ALLEGRO ECL) array)
			      (b #-(or ALLEGRO ECL) simple-array #+(or ALLEGRO ECL) array))
  (declare (optimize (speed 3) (safety 3)))
  (cond ((and (eq (array-element-type a) 'double-float)
	      (eq (array-element-type b) 'double-float))
	 (3dm-def::coalton-simple-array-multiply a b double-float double-float double-float))
	((and (eq (array-element-type a) 'single-float)
	      (eq (array-element-type b) 'double-float))
	 (3dm-def::coalton-simple-array-multiply a b single-float double-float double-float))
	((and (eq (array-element-type a) 'double-float)
	      (eq (array-element-type b) 'single-float))
	 (3dm-def::coalton-simple-array-multiply a b double-float single-float double-float))
	((and (eq (array-element-type a) 'single-float)
	      (eq (array-element-type b) 'single-float))
	 (3dm-def::coalton-simple-array-multiply a b single-float single-float single-float))
	((and (eq (array-element-type a) 'rational)
	      (eq (array-element-type b) 'rational))
	 (3dm-def::coalton-simple-array-multiply a b rational rational rational))
	(t (3dm-def::binary-m*-simple-array a b number number t))))

(3dm-def::define-ofun m* (val &rest vals)
  (loop with result = val
	for next in vals
	do (setq result (binary-m* result next))
	finally (return result)))

(define-compiler-macro m* (val &rest vals)
  (cond ((null vals) val)
        (t (reduce (lambda (a b) `(binary-m* ,a ,b)) (cons val vals)))))
;;

(3dm-def:defsealed mdet ((mat 3dm.d::mat2))
  (3dm.d::mdet-mat2 mat))

(3dm-def:defsealed mdet ((mat 3dm.d::mat3))
  (3dm.d::mdet-mat3 mat))

(3dm-def:defsealed mdet ((mat 3dm.d::mat4))
  (3dm.d::mdet-mat4 mat))

(3dm-def:defsealed mdet ((mat 3dm.f::mat2))
  (3dm.f::mdet-mat2 mat))

(3dm-def:defsealed mdet ((mat 3dm.f::mat3))
  (3dm.f::mdet-mat3 mat))

(3dm-def:defsealed mdet ((mat 3dm.f::mat4))
  (3dm.f::mdet-mat4 mat))

;;

(3dm-def:defsealed minv ((mat 3dm.d::mat2))
  (3dm.d::minv-mat2 mat))

(3dm-def:defsealed minv ((mat 3dm.d::mat3))
  (3dm.d::minv-mat3 mat))

(3dm-def:defsealed minv ((mat 3dm.d::mat4))
  (3dm.d::minv-mat4 mat))

(3dm-def:defsealed minv ((mat 3dm.f::mat2))
  (3dm.f::minv-mat2 mat))

(3dm-def:defsealed minv ((mat 3dm.f::mat3))
  (3dm.f::minv-mat3 mat))

(3dm-def:defsealed minv ((mat 3dm.f::mat4))
  (3dm.f::minv-mat4 mat))

(3dm-def:defsealed mlookat ((eye 3dm.d::vec3) (target 3dm.d::vec3) (up 3dm.d::vec3))
  (3dm.d::%mlookat eye target up))

(3dm-def:defsealed mlookat ((eye 3dm.f::vec3) (target 3dm.f::vec3) (up 3dm.f::vec3))
  (3dm.f::%mlookat eye target up))

(3dm-def:defsealed mlookat ((eye 3dm.d::vec3) (target 3dm.d::vec3) (up 3dm.f::vec3))
  (3dm.d::%mlookat eye target up))

(3dm-def:defsealed mlookat ((eye 3dm.d::vec3) (target 3dm.f::vec3) (up 3dm.f::vec3))
  (3dm.d::%mlookat eye target up))

(3dm-def:defsealed mlookat ((eye 3dm.f::vec3) (target 3dm.d::vec3) (up 3dm.f::vec3))
  (3dm.d::%mlookat eye target up))

(3dm-def:defsealed mlookat ((eye 3dm.f::vec3) (target 3dm.d::vec3) (up 3dm.d::vec3))
  (3dm.d::%mlookat eye target up))

(3dm-def:defsealed mlookat ((eye 3dm.d::vec3) (target 3dm.f::vec3) (up 3dm.d::vec3))
  (3dm.d::%mlookat eye target up))

(3dm-def:defsealed mcopy ((mat 3dm.d::mat2))
  (3dm.d::with-fast-matref (f mat 2)
    (let ((copy (3dm.d::%mat2)))
      (3dm.d::with-fast-matref (e copy 2)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1))
	copy))))

(3dm-def:defsealed mtranspose ((mat 3dm.d::mat2))
  (3dm.d::mat2-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.f::mat2))
  (3dm.f::with-fast-matref (f mat 2)
    (let ((copy (3dm.f::%mat2)))
      (3dm.f::with-fast-matref (e copy 2)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1))
	copy))))

(3dm-def:defsealed mtranspose ((mat 3dm.f::mat2))
  (3dm.f::mat2-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.rat::mat2))
  (3dm.rat::with-fast-matref (f mat 2)
    (let ((copy (3dm.rat::%mat2)))
      (3dm.rat::with-fast-matref (e copy 2)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1))
	copy))))

(3dm-def:defsealed mcopy ((mat 3dm.rat::mat2))
  (3dm.rat::mat2-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.d::mat3))
  (3dm.d::with-fast-matref (f mat 3)
    (let ((copy (3dm.d::%mat3)))
      (3dm.d::with-fast-matref (e copy 3)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 0 2) (f 0 2)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1)
	      (e 1 2) (f 1 2)
	      (e 2 0) (f 2 0)
	      (e 2 1) (f 2 1)
	      (e 2 2) (f 2 2))
	copy))))

(3dm-def:defsealed mcopy ((mat 3dm.d::mat3))
  (3dm.d::mat3-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.f::mat3))
  (3dm.f::with-fast-matref (f mat 3)
    (let ((copy (3dm.f::%mat3)))
      (3dm.f::with-fast-matref (e copy 3)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 0 2) (f 0 2)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1)
	      (e 1 2) (f 1 2)
	      (e 2 0) (f 2 0)
	      (e 2 1) (f 2 1)
	      (e 2 2) (f 2 2))
	copy))))

(3dm-def:defsealed mtranspose ((mat 3dm.f::mat3))
  (3dm.f::mat3-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.rat::mat3))
  (3dm.rat::with-fast-matref (f mat 3)
    (let ((copy (3dm.rat::%mat3)))
      (3dm.rat::with-fast-matref (e copy 3)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 0 2) (f 0 2)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1)
	      (e 1 2) (f 1 2)
	      (e 2 0) (f 2 0)
	      (e 2 1) (f 2 1)
	      (e 2 2) (f 2 2))
	copy))))

(3dm-def:defsealed mtranspose ((mat 3dm.rat::mat3))
  (3dm.rat::mat3-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.d::mat4))
  (3dm.d::with-fast-matref (f mat 4)
    (let ((copy (3dm.d::%mat4)))
      (3dm.d::with-fast-matref (e copy 4)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 0 2) (f 0 2)
	      (e 0 3) (f 0 3)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1)
	      (e 1 2) (f 1 2)
	      (e 1 3) (f 1 3)
	      (e 2 0) (f 2 0)
	      (e 2 1) (f 2 1)
	      (e 2 2) (f 2 2)
	      (e 2 3) (f 2 3)
	      (e 3 0) (f 3 0)
	      (e 3 1) (f 3 1)
	      (e 3 2) (f 3 2)
	      (e 3 3) (f 3 3))
	copy))))

(3dm-def:defsealed mtranspose ((mat 3dm.d::mat4))
  (3dm.d::mat4-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.f::mat4))
  (3dm.f::with-fast-matref (f mat 4)
    (let ((copy (3dm.f::%mat4)))
      (3dm.f::with-fast-matref (e copy 4)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 0 2) (f 0 2)
	      (e 0 3) (f 0 3)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1)
	      (e 1 2) (f 1 2)
	      (e 1 3) (f 1 3)
	      (e 2 0) (f 2 0)
	      (e 2 1) (f 2 1)
	      (e 2 2) (f 2 2)
	      (e 2 3) (f 2 3)
	      (e 3 0) (f 3 0)
	      (e 3 1) (f 3 1)
	      (e 3 2) (f 3 2)
	      (e 3 3) (f 3 3))
	copy))))

(3dm-def:defsealed mtranspose ((mat 3dm.f::mat4))
  (3dm.f::mat4-mtranspose mat))

(3dm-def:defsealed mcopy ((mat 3dm.rat::mat4))
  (3dm.rat::with-fast-matref (f mat 4)
    (let ((copy (3dm.rat::%mat4)))
      (3dm.rat::with-fast-matref (e copy 4)
	(setf (e 0 0) (f 0 0)
	      (e 0 1) (f 0 1)
	      (e 0 2) (f 0 2)
	      (e 0 3) (f 0 3)
	      (e 1 0) (f 1 0)
	      (e 1 1) (f 1 1)
	      (e 1 2) (f 1 2)
	      (e 1 3) (f 1 3)
	      (e 2 0) (f 2 0)
	      (e 2 1) (f 2 1)
	      (e 2 2) (f 2 2)
	      (e 2 3) (f 2 3)
	      (e 3 0) (f 3 0)
	      (e 3 1) (f 3 1)
	      (e 3 2) (f 3 2)
	      (e 3 3) (f 3 3))
	copy))))

(defun binary-m*-mat4-mat4-to-single-float-mat4 (a b)
  ;; todo: write some optimized m* for simple-array mixed with 3dm types
  (typecase a
    (3dm.f::mat4
     (typecase b
       (3dm.f::mat4 (3dm.f::m*-mat4-mat4 a b))
       (3dm.d::mat4 (3dm.f&d::m*-mat4-single-float-mat4 a b))
       (t (3dm::m* a b))))
    (3dm.d::mat4
     (typecase b
       (3dm.f::mat4 (3dm.d&f::m*-mat4-single-float-mat4 a b))
       (3dm.d::mat4 (3dm.d::m*-mat4-single-float-mat4 a b))
       (t (3dm::m* a b))))
    (#+allegro simple-array #-allegro array
     (typecase b
       (#+allegro simple-array #-allegro array
	(3dm.f::m*-mat4-mat4 (mcopy-mat4-to-single-float a) (mcopy-mat4-to-single-float b)))
       (3dm.f::mat4
        (3dm.f::m*-mat4-mat4 (mcopy-mat4-to-single-float a) b))
       (3dm.d::mat4
	(3dm.f&d::m*-mat4-single-float-mat4 (mcopy-mat4-to-single-float a) b))
       (t (m* a b))))
    (t (3dm::m* a b))))       

(defun mcopy-mat4-to-single-float (mat4)
  (etypecase mat4
    (null (3dm.f::meye 4))
    (3dm.f::mat4 (3dm.f::with-fast-matref (f mat4 4)
		   (let ((copy (3dm.f::%mat4)))
		     (3dm.f::with-fast-matref (e copy 4)
		       (setf (e 0 0) (f 0 0)
			     (e 0 1) (f 0 1)
			     (e 0 2) (f 0 2)
			     (e 0 3) (f 0 3)
			     (e 1 0) (f 1 0)
			     (e 1 1) (f 1 1)
			     (e 1 2) (f 1 2)
			     (e 1 3) (f 1 3)
			     (e 2 0) (f 2 0)
			     (e 2 1) (f 2 1)
			     (e 2 2) (f 2 2)
			     (e 2 3) (f 2 3)
			     (e 3 0) (f 3 0)
			     (e 3 1) (f 3 1)
			     (e 3 2) (f 3 2)
			     (e 3 3) (f 3 3)))
		     copy)))
    
    (#-ALLEGRO simple-array #+ALLEGRO array
     (let ((copy (3dm.f::%mat4)))
       (3dm.f::with-fast-matref (e copy 4)
	 (setf (e 0 0) (3dm-def::clampf (aref mat4 0 0))
	       (e 0 1) (3dm-def::clampf (aref mat4 0 1))
	       (e 0 2) (3dm-def::clampf (aref mat4 0 2))
	       (e 0 3) (3dm-def::clampf (aref mat4 0 3))
	       (e 1 0) (3dm-def::clampf (aref mat4 1 0))
	       (e 1 1) (3dm-def::clampf (aref mat4 1 1))
	       (e 1 2) (3dm-def::clampf (aref mat4 1 2))
	       (e 1 3) (3dm-def::clampf (aref mat4 1 3))
	       (e 2 0) (3dm-def::clampf (aref mat4 2 0))
	       (e 2 1) (3dm-def::clampf (aref mat4 2 1))
	       (e 2 2) (3dm-def::clampf (aref mat4 2 2))
	       (e 2 3) (3dm-def::clampf (aref mat4 2 3))
	       (e 3 0) (3dm-def::clampf (aref mat4 3 0))
	       (e 3 1) (3dm-def::clampf (aref mat4 3 1))
	       (e 3 2) (3dm-def::clampf (aref mat4 3 2))
	       (e 3 3) (3dm-def::clampf (aref mat4 3 3))))
       copy))
    
    (3dm.d::mat4 (3dm.d::with-fast-matref (f mat4 4)
		   (let ((copy (3dm.f::%mat4)))
		     (3dm.f::with-fast-matref (e copy 4)
		       (setf (e 0 0) (3dm-def::clampf (f 0 0))
			     (e 0 1) (3dm-def::clampf (f 0 1))
			     (e 0 2) (3dm-def::clampf (f 0 2))
			     (e 0 3) (3dm-def::clampf (f 0 3))
			     (e 1 0) (3dm-def::clampf (f 1 0))
			     (e 1 1) (3dm-def::clampf (f 1 1))
			     (e 1 2) (3dm-def::clampf (f 1 2))
			     (e 1 3) (3dm-def::clampf (f 1 3))
			     (e 2 0) (3dm-def::clampf (f 2 0))
			     (e 2 1) (3dm-def::clampf (f 2 1))
			     (e 2 2) (3dm-def::clampf (f 2 2))
			     (e 2 3) (3dm-def::clampf (f 2 3))
			     (e 3 0) (3dm-def::clampf (f 3 0))
			     (e 3 1) (3dm-def::clampf (f 3 1))
			     (e 3 2) (3dm-def::clampf (f 3 2))
			     (e 3 3) (3dm-def::clampf (f 3 3))))
		     copy)))
    (3dm.rat::mat4 (3dm.rat::with-fast-matref (f mat4 4)
		     (let ((copy (3dm.f::%mat4)))
		       (3dm.f::with-fast-matref (e copy 4)
			 (setf (e 0 0) (3dm-def::clampf (f 0 0))
			       (e 0 1) (3dm-def::clampf (f 0 1))
			       (e 0 2) (3dm-def::clampf (f 0 2))
			       (e 0 3) (3dm-def::clampf (f 0 3))
			       (e 1 0) (3dm-def::clampf (f 1 0))
			       (e 1 1) (3dm-def::clampf (f 1 1))
			       (e 1 2) (3dm-def::clampf (f 1 2))
			       (e 1 3) (3dm-def::clampf (f 1 3))
			       (e 2 0) (3dm-def::clampf (f 2 0))
			       (e 2 1) (3dm-def::clampf (f 2 1))
			       (e 2 2) (3dm-def::clampf (f 2 2))
			       (e 2 3) (3dm-def::clampf (f 2 3))
			       (e 3 0) (3dm-def::clampf (f 3 0))
			       (e 3 1) (3dm-def::clampf (f 3 1))
			       (e 3 2) (3dm-def::clampf (f 3 2))
			       (e 3 3) (3dm-def::clampf (f 3 3))))
		       copy)))))

(3dm-def:defsealed mtranspose ((mat 3dm.rat::mat4))
  (3dm.rat::mat4-mtranspose mat))

(3dm-def::define-nmtranslate-macro :3dm.d :3dm.d :3dm.d)
(3dm-def::define-nmtranslate-macro :3dm.d&rat :3dm.d :3dm.rat)
(3dm-def::define-nmtranslate-macro :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed nmtranslate ((mat 3dm.d:mat4) (vec3 3dm.d:vec3))
  (3dm.d::nmtranslate mat vec3))

(3dm-def:defsealed nmtranslate ((mat 3dm.d:mat4) (vec3 3dm.rat:vec3))
  (3dm.d&rat::nmtranslate mat vec3))

(3dm-def:defsealed nmtranslate ((mat 3dm.d:mat4) (vec3 3dm.f:vec3))
  (3dm.d&f::nmtranslate mat vec3))

(3dm-def::define-nmtranslate-macro :3dm.f :3dm.f :3dm.f)
(3dm-def::define-nmtranslate-macro :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed nmtranslate ((mat 3dm.f:mat4) (vec3 3dm.f:vec3))
  (3dm.f::nmtranslate mat vec3))

(3dm-def:defsealed nmtranslate ((mat 3dm.f:mat4) (vec3 3dm.rat:vec3))
  (3dm.f&rat::nmtranslate mat vec3))

(3dm-def::define-nmtranslate-macro :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed nmtranslate ((mat 3dm.rat:mat4) (vec3 3dm.rat:vec3))
  (3dm.rat::nmtranslate mat vec3))
;;;;;;

(3dm-def::define-nmscale-macro :3dm.d :3dm.d :3dm.d)
(3dm-def::define-nmscale-macro :3dm.d&rat :3dm.d :3dm.rat)
(3dm-def::define-nmscale-macro :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed nmscale ((mat 3dm.d:mat4) (vec3 3dm.d:vec3))
  (3dm.d::nmscale mat vec3))

(3dm-def:defsealed nmscale ((mat 3dm.d:mat4) (vec3 3dm.rat:vec3))
  (3dm.d&rat::nmscale mat vec3))

(3dm-def:defsealed nmscale ((mat 3dm.d:mat4) (vec3 3dm.f:vec3))
  (3dm.d&f::nmscale mat vec3))

(3dm-def::define-nmscale-macro :3dm.f :3dm.f :3dm.f)
(3dm-def::define-nmscale-macro :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed nmscale ((mat 3dm.f:mat4) (vec3 3dm.f:vec3))
  (3dm.f::nmscale mat vec3))

(3dm-def:defsealed nmscale ((mat 3dm.f:mat4) (vec3 3dm.rat:vec3))
  (3dm.f&rat::nmscale mat vec3))

(3dm-def::define-nmscale-macro :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed nmscale ((mat 3dm.rat:mat4) (vec3 3dm.rat:vec3))
  (3dm.rat::nmscale mat vec3))
;;;;;;

(3dm-def::define-%mrotation-macro cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-%mrotation-macro cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-%mrotation-macro cl:double-float :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def::define-%mrotation-macro cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-%mrotation-macro cl:single-float :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def::define-mrotate-macro :3dm.d :3dm.d)

(3dm-def:defsealed mrotate ((mat4 3dm.d:mat4) (vec3 3dm.d:vec3) (angle real))
  (3dm.d::mrotate mat4 vec3 angle))

(3dm-def::define-mrotate-macro :3dm.d&f :3dm.d)

(3dm-def:defsealed mrotate ((mat4 3dm.d:mat4) (vec3 3dm.f:vec3) (angle real))
  (3dm.d&f::mrotate mat4 vec3 angle))

(3dm-def::define-mrotate-macro :3dm.d&rat :3dm.d)

(3dm-def:defsealed mrotate ((mat4 3dm.d:mat4) (vec3 3dm.rat:vec3) (angle real))
  (3dm.d&rat::mrotate mat4 vec3 angle))

(3dm-def::define-mrotate-macro :3dm.f :3dm.f)

(3dm-def:defsealed mrotate ((mat4 3dm.f:mat4) (vec3 3dm.f:vec3) (angle real))
  (3dm.f::mrotate mat4 vec3 angle))

(3dm-def::define-mrotate-macro :3dm.f&rat :3dm.f)

(3dm-def:defsealed mrotate ((mat4 3dm.f:mat4) (vec3 3dm.rat:vec3) (angle real))
  (3dm.f&rat::mrotate mat4 vec3 angle))

(3dm-def:defsealed coerce-to-double-float ((mat4 3dm.d:mat4))
  mat4)

(3dm-def:defsealed coerce-to-double-float ((mat4 3dm.f:mat4))
  (let ((copy (3dm.d::%mat4)))
    (3dm.d::with-fast-matref (d copy 4)
      (3dm.f::with-fast-matref (f mat4 4)
	(setf (d 0 0) (coerce (f 0 0) 'double-float)
	      (d 0 1) (coerce (f 0 1) 'double-float)
	      (d 0 2) (coerce (f 0 2) 'double-float)
	      (d 0 3) (coerce (f 0 3) 'double-float)
	      (d 1 0) (coerce (f 1 0) 'double-float)
	      (d 1 1) (coerce (f 1 1) 'double-float)
	      (d 1 2) (coerce (f 1 2) 'double-float)
	      (d 1 3) (coerce (f 1 3) 'double-float)
	      (d 2 0) (coerce (f 2 0) 'double-float)
	      (d 2 1) (coerce (f 2 1) 'double-float)
	      (d 2 2) (coerce (f 2 2) 'double-float)
	      (d 2 3) (coerce (f 2 3) 'double-float)
	      (d 3 0) (coerce (f 3 0) 'double-float)
	      (d 3 1) (coerce (f 3 1) 'double-float)
	      (d 3 2) (coerce (f 3 2) 'double-float)
	      (d 3 3) (coerce (f 3 3) 'double-float))))
    copy))

(3dm-def:defsealed coerce-to-double-float ((mat4 3dm.rat:mat4))
  (let ((copy (3dm.d::%mat4)))
    (3dm.d::with-fast-matref (d copy 4)
      (3dm.rat::with-fast-matref (f mat4 4)
	(setf (d 0 0) (coerce (f 0 0) 'double-float)
	      (d 0 1) (coerce (f 0 1) 'double-float)
	      (d 0 2) (coerce (f 0 2) 'double-float)
	      (d 0 3) (coerce (f 0 3) 'double-float)
	      (d 1 0) (coerce (f 1 0) 'double-float)
	      (d 1 1) (coerce (f 1 1) 'double-float)
	      (d 1 2) (coerce (f 1 2) 'double-float)
	      (d 1 3) (coerce (f 1 3) 'double-float)
	      (d 2 0) (coerce (f 2 0) 'double-float)
	      (d 2 1) (coerce (f 2 1) 'double-float)
	      (d 2 2) (coerce (f 2 2) 'double-float)
	      (d 2 3) (coerce (f 2 3) 'double-float)
	      (d 3 0) (coerce (f 3 0) 'double-float)
	      (d 3 1) (coerce (f 3 1) 'double-float)
	      (d 3 2) (coerce (f 3 2) 'double-float)
	      (d 3 3) (coerce (f 3 3) 'double-float))))
    copy))

(3dm-def:defsealed coerce-to-single-float ((mat4 3dm.f:mat4))
  mat4)

(3dm-def:defsealed coerce-to-single-float ((mat4 3dm.d:mat4))
  (3dm.d::with-fast-matref (f mat4 4)
    (let ((copy (3dm.f::%mat4)))
      (3dm.f::with-fast-matref (e copy 4)
	(setf (e 0 0) (3dm-def::clampf (f 0 0))
	      (e 0 1) (3dm-def::clampf (f 0 1))
	      (e 0 2) (3dm-def::clampf (f 0 2))
	      (e 0 3) (3dm-def::clampf (f 0 3))
	      (e 1 0) (3dm-def::clampf (f 1 0))
	      (e 1 1) (3dm-def::clampf (f 1 1))
	      (e 1 2) (3dm-def::clampf (f 1 2))
	      (e 1 3) (3dm-def::clampf (f 1 3))
	      (e 2 0) (3dm-def::clampf (f 2 0))
	      (e 2 1) (3dm-def::clampf (f 2 1))
	      (e 2 2) (3dm-def::clampf (f 2 2))
	      (e 2 3) (3dm-def::clampf (f 2 3))
	      (e 3 0) (3dm-def::clampf (f 3 0))
	      (e 3 1) (3dm-def::clampf (f 3 1))
	      (e 3 2) (3dm-def::clampf (f 3 2))
	      (e 3 3) (3dm-def::clampf (f 3 3))))
      copy)))

(3dm-def:defsealed coerce-to-single-float ((mat4 3dm.rat:mat4))
  (3dm.rat::with-fast-matref (f mat4 4)
    (let ((copy (3dm.f::%mat4)))
      (3dm.f::with-fast-matref (e copy 4)
	(setf (e 0 0) (3dm-def::clampf (f 0 0))
	      (e 0 1) (3dm-def::clampf (f 0 1))
	      (e 0 2) (3dm-def::clampf (f 0 2))
	      (e 0 3) (3dm-def::clampf (f 0 3))
	      (e 1 0) (3dm-def::clampf (f 1 0))
	      (e 1 1) (3dm-def::clampf (f 1 1))
	      (e 1 2) (3dm-def::clampf (f 1 2))
	      (e 1 3) (3dm-def::clampf (f 1 3))
	      (e 2 0) (3dm-def::clampf (f 2 0))
	      (e 2 1) (3dm-def::clampf (f 2 1))
	      (e 2 2) (3dm-def::clampf (f 2 2))
	      (e 2 3) (3dm-def::clampf (f 2 3))
	      (e 3 0) (3dm-def::clampf (f 3 0))
	      (e 3 1) (3dm-def::clampf (f 3 1))
	      (e 3 2) (3dm-def::clampf (f 3 2))
	      (e 3 3) (3dm-def::clampf (f 3 3))))
      copy)))
