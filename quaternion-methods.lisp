(in-package :3dm)

#+sbcl
(declaim (sb-ext:muffle-conditions sb-ext:compiler-note))

(3dm-def:defsealed qx ((quat 3dm.d::quat))
  (3dm.d::qx quat))

(3dm-def:defsealed qx ((quat 3dm.f::quat))
  (3dm.f::qx quat))

(3dm-def:defsealed qx ((quat 3dm.rat::quat))
  (3dm.rat::qx quat))

(3dm-def:defsealed qx ((quat list))
  (car quat))

(3dm-def:defsealed qx ((quat vector))
  (aref quat 0))

(3dm-def:defsealed qy ((quat 3dm.d::quat))
  (3dm.d::qy quat))

(3dm-def:defsealed qy ((quat 3dm.f::quat))
  (3dm.f::qy quat))

(3dm-def:defsealed qy ((quat 3dm.rat::quat))
  (3dm.rat::qy quat))

(3dm-def:defsealed qy ((quat list))
  (cadr quat))

(3dm-def:defsealed qy ((quat vector))
  (aref quat 1))

(3dm-def:defsealed qz ((quat 3dm.d::quat))
  (3dm.d::qz quat))

(3dm-def:defsealed qz ((quat 3dm.f::quat))
  (3dm.f::qz quat))

(3dm-def:defsealed qz ((quat 3dm.rat::quat))
  (3dm.rat::qz quat))

(3dm-def:defsealed qz ((quat list))
  (caddr quat))

(3dm-def:defsealed qz ((quat vector))
  (aref quat 2))

(3dm-def:defsealed qw ((quat 3dm.d::quat))
  (3dm.d::qw quat))

(3dm-def:defsealed qw ((quat 3dm.f::quat))
  (3dm.f::qw quat))

(3dm-def:defsealed qw ((quat 3dm.rat::quat))
  (3dm.rat::qw quat))

(3dm-def:defsealed qw ((quat list))
  (cadddr quat))

(3dm-def:defsealed qz ((quat vector))
  (aref quat 3))

(3dm-def::define-qlerp-macro :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:quat) (b 3dm.d:quat) (param real))
  (3dm.d::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:quat) (b 3dm.f:quat) (param real))
  (3dm.d&f::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.f&d :3dm.f :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.f:quat) (b 3dm.d:quat) (param real))
  (3dm.f&d::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:quat) (b 3dm.f:quat) (param real))
  (3dm.f::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.f&rat :3dm.f :3dm.rat :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:quat) (b 3dm.rat:quat) (param real))
  (3dm.f&rat::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.rat&f :3dm.rat :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.rat:quat) (b 3dm.f:quat) (param real))
  (3dm.rat&f::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.d&rat :3dm.d :3dm.rat :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:quat) (b 3dm.rat:quat) (param real))
  (3dm.d&rat::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.rat&d :3dm.rat :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.rat:quat) (b 3dm.d:quat) (param real))
  (3dm.rat&d::qlerp a b param))

(3dm-def::define-qlerp-macro :3dm.rat :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed lerp ((a 3dm.rat:quat) (b 3dm.rat:quat) (param real))
  (3dm.rat::qlerp a b param))

;;;

(3dm-def:defsealed qconjugate ((q 3dm.d:quat))
  (3dm.d::qconjugate q))

(3dm-def:defsealed qconjugate ((q 3dm.f:quat))
  (3dm.f::qconjugate q))

(3dm-def:defsealed qconjugate ((q 3dm.rat:quat))
  (3dm.rat::qconjugate q))

(3dm-def::define-binary-q*-macro :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed binary-q* ((a 3dm.d:quat) (b 3dm.d:quat))
  (3dm.d::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed binary-q* ((a 3dm.d:quat) (b 3dm.f:quat))
  (3dm.d&f::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.f&d :3dm.f :3dm.d :3dm.d)

(3dm-def:defsealed binary-q* ((a 3dm.f:quat) (b 3dm.d:quat))
  (3dm.f&d::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-q* ((a 3dm.f:quat) (b 3dm.f:quat))
  (3dm.f::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.f&rat :3dm.f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-q* ((a 3dm.f:quat) (b 3dm.rat:quat))
  (3dm.f&rat::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.rat&f :3dm.rat :3dm.f :3dm.f)

(3dm-def:defsealed binary-q* ((a 3dm.rat:quat) (b 3dm.f:quat))
  (3dm.rat&f::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.d&rat :3dm.d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-q* ((a 3dm.d:quat) (b 3dm.rat:quat))
  (3dm.d&rat::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.rat&d :3dm.rat :3dm.d :3dm.d)

(3dm-def:defsealed binary-q* ((a 3dm.rat:quat) (b 3dm.d:quat))
  (3dm.rat&d::binary-q* a b))

(3dm-def::define-binary-q*-macro :3dm.rat :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-q* ((a 3dm.rat:quat) (b 3dm.rat:quat))
  (3dm.rat::binary-q* a b))

(3dm-def::define-ofun q* (val &rest vals)
  (loop with result = val
	for next in vals
	do (setq result (binary-q* result next))
	finally (return result)))

(define-compiler-macro q* (val &rest vals)
  (cond ((null vals) val)
        (t (reduce (lambda (a b) `(binary-q* ,a ,b)) (cons val vals)))))

(3dm-def::define-natural-%make-rotation-quat-macro cl:double-float :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed qrotation ((vec3 3dm.d:vec3) (theta cl:double-float))
  (3dm.d::natural-%make-rotation-quat vec3 theta))

(3dm-def::define-natural-%make-rotation-quat-macro cl:single-float :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed qrotation ((vec3 3dm.f:vec3) (theta cl:single-float))
  (3dm.d::natural-%make-rotation-quat vec3 theta))

(3dm-def::define-%make-rotation-quat-macro cl:double-float :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed qrotation ((vec3 3dm.d:vec3) (theta cl:single-float))
  (3dm.d::%make-rotation-quat vec3 theta))

(3dm-def:defsealed qrotation ((vec3 3dm.d:vec3) (theta cl:rational))
  (3dm.d::%make-rotation-quat vec3 theta))

(3dm-def::define-%make-rotation-quat-macro cl:double-float :3dm.d&f :3dm.f :3dm.d)

(3dm-def:defsealed qrotation ((vec3 3dm.f:vec3) (theta cl:double-float))
  (3dm.d&f::%make-rotation-quat vec3 theta))

(3dm-def:defsealed qrotation ((vec3 3dm.f:vec3) (theta cl:rational))
  (3dm.d&f::%make-rotation-quat vec3 theta))

(3dm-def::define-%make-rotation-quat-macro cl:double-float :3dm.d&rat :3dm.rat :3dm.d)

(3dm-def:defsealed qrotation ((vec3 3dm.rat:vec3) (theta cl:double-float))
  (3dm.d&rat::%make-rotation-quat vec3 theta))

(3dm-def:defsealed qrotation ((vec3 3dm.rat:vec3) (theta cl:single-float))
  (3dm.d&rat::%make-rotation-quat vec3 theta))

(3dm-def:defsealed qrotation ((vec3 3dm.rat:vec3) (theta cl:rational))
  (3dm.d&rat::%make-rotation-quat vec3 theta))

(3dm-def::define-quaternion-from-to-macro :3dm.d cl::double-float)
(3dm-def::define-quaternion-from-to-macro :3dm.f cl::single-float)

(3dm-def::defsealed quaternion-from-to ((u 3dm.d:vec3) (v 3dm.d:vec3))
  (3dm.d::quaternion-from-to u v))

(3dm-def::defsealed quaternion-from-to ((u 3dm.d:vec3) (v 3dm.f:vec3))
  (3dm.d::quaternion-from-to u v))

(3dm-def::defsealed quaternion-from-to ((u 3dm.f:vec3) (v 3dm.d:vec3))
  (3dm.d::quaternion-from-to u v))

(3dm-def::defsealed quaternion-from-to ((u 3dm.f:vec3) (v 3dm.f:vec3))
  (3dm.f::quaternion-from-to u v))

(3dm-def::defsealed quaternion-from-to ((u 3dm.rat:vec3) (v 3dm.rat:vec3))
  (3dm.d::quaternion-from-to u v))

(3dm-def::defsealed quaternion-from-to ((u 3dm.f:vec3) (v 3dm.rat:vec3))
  (3dm.f::quaternion-from-to u v))

(3dm-def::defsealed quaternion-from-to ((u 3dm.rat:vec3) (v 3dm.f:vec3))
  (3dm.f::quaternion-from-to u v))

(3dm-def::define-rotate-vector-macro :3dm.d :3dm.d cl:double-float :3dm.d :3dm.d)

(3dm-def:defsealed rotate-vector ((vec3 3dm.d:vec3) (quat 3dm.d:quat))
  (3dm.d::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.d&f :3dm.d cl:double-float :3dm.f :3dm.d)

(3dm-def:defsealed rotate-vector ((vec3 3dm.d:vec3) (quat 3dm.f:quat))
  (3dm.d&f::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.f&d :3dm.f cl:single-float :3dm.d :3dm.d)

(3dm-def:defsealed rotate-vector ((vec3 3dm.f:vec3) (quat 3dm.d:quat))
  (3dm.f&d::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.d&rat :3dm.d cl:double-float :3dm.rat :3dm.d)

(3dm-def:defsealed rotate-vector ((vec3 3dm.d:vec3) (quat 3dm.rat:quat))
  (3dm.d&rat::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.rat&d :3dm.rat cl:rational :3dm.d :3dm.d)

(3dm-def:defsealed rotate-vector ((vec3 3dm.rat:vec3) (quat 3dm.d:quat))
  (3dm.rat&d::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.f :3dm.f cl:single-float :3dm.f :3dm.f)

(3dm-def:defsealed rotate-vector ((vec3 3dm.f:vec3) (quat 3dm.f:quat))
  (3dm.f::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.f&rat :3dm.f cl:single-float :3dm.rat :3dm.f)

(3dm-def:defsealed rotate-vector ((vec3 3dm.f:vec3) (quat 3dm.rat:quat))
  (3dm.f&rat::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.rat&f :3dm.rat cl:rational :3dm.f :3dm.f)

(3dm-def:defsealed rotate-vector ((vec3 3dm.rat:vec3) (quat 3dm.f:quat))
  (3dm.rat&f::rotate-vector vec3 quat))

(3dm-def::define-rotate-vector-macro :3dm.rat :3dm.rat cl:rational :3dm.rat :3dm.rat)

(3dm-def:defsealed rotate-vector ((vec3 3dm.rat:vec3) (quat 3dm.rat:quat))
  (3dm.rat::rotate-vector vec3 quat))

;;;;;

(3dm-def:defsealed quaternion-x-axis ((quat 3dm.d:quat))
  (3dm.d::quaternion-x-axis quat))

(3dm-def:defsealed quaternion-x-axis ((quat 3dm.f:quat))
  (3dm.f::quaternion-x-axis quat))

(3dm-def:defsealed quaternion-x-axis ((quat 3dm.rat:quat))
  (3dm.rat::quaternion-x-axis quat))

;;

(3dm-def:defsealed quaternion-y-axis ((quat 3dm.d:quat))
  (3dm.d::quaternion-y-axis quat))

(3dm-def:defsealed quaternion-y-axis ((quat 3dm.f:quat))
  (3dm.f::quaternion-y-axis quat))

(3dm-def:defsealed quaternion-y-axis ((quat 3dm.rat:quat))
  (3dm.rat::quaternion-y-axis quat))

;;

(3dm-def:defsealed quaternion-z-axis ((quat 3dm.d:quat))
  (3dm.d::quaternion-z-axis quat))

(3dm-def:defsealed quaternion-z-axis ((quat 3dm.f:quat))
  (3dm.f::quaternion-z-axis quat))

(3dm-def:defsealed quaternion-z-axis ((quat 3dm.rat:quat))
  (3dm.rat::quaternion-z-axis quat))

;;;

(3dm-def:defsealed matrix-from-quaternion ((quat 3dm.d:quat))
  (3dm.d::matrix-from-quaternion quat))

(3dm-def:defsealed matrix-from-quaternion ((quat 3dm.f:quat))
  (3dm.f::matrix-from-quaternion quat))

(3dm-def:defsealed matrix-from-quaternion ((quat 3dm.rat:quat))
  (3dm.rat::matrix-from-quaternion quat))


