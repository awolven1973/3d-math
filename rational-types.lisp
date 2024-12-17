(cl:in-package :3dm.rat)

#+sbcl
(cl:declaim (sb-ext:muffle-conditions sb-ext:compiler-note))

(3dm-def:define-vec2-type cl:rational)
(3dm-def:define-vec3-type cl:rational)
(3dm-def:define-vec4-type cl:rational)
(3dm-def:define-mat2-type cl:rational)
(3dm-def:define-mat3-type cl:rational)
(3dm-def:define-mat4-type cl:rational)
(3dm-def:define-matn-type cl:rational)
(3dm-def:define-quat-type cl:rational)
(3dm-def:define-dquat-type)

(3dm-def:define-with-vec2-macro cl:rational)
(3dm-def:define-with-vec3-macro cl:rational)
(3dm-def:define-with-vec4-macro cl:rational)
(3dm-def:define-with-vec-macro cl:rational)

(cl:deftype vec () `(cl::or vec2 vec3 vec4))

(3dm-def::define-vec2-constructor cl:rational)
(3dm-def::define-vec3-constructor cl:rational)
(3dm-def::define-vec4-constructor cl:rational)

(cl:defparameter +vx+ (vec3 1 0 0))
(cl:defparameter +vy+ (vec3 0 1 0))
(cl:defparameter +vz+ (vec3 0 0 1))

(cl:deftype mat () `(cl::or mat2 mat3 mat4 matn))

(3dm-def::define-with-fast-matref cl:rational)
(3dm-def::define-with-fast-matrefs)
(3dm-def::define-with-fast-matcase)

(3dm-def::define-mat2-constructor cl:rational)
(3dm-def::define-mat3-constructor cl:rational)
(3dm-def::define-mat4-constructor cl:rational)
(3dm-def::define-matn-constructor cl:rational)

(3dm-def::define-quat-constructor cl:rational)

(3dm-def::define-vec2-vsqrlength-function cl:rational)
(3dm-def::define-vec3-vsqrlength-function cl:rational)
(3dm-def::define-vec4-vsqrlength-function cl:rational)

(3dm-def::define-vec2-vsqr2norm-function cl:rational)
(3dm-def::define-vec3-vsqr2norm-function cl:rational)
(3dm-def::define-vec4-vsqr2norm-function cl:rational)

(3dm-def::define-mat2-mtranspose-macro)
(3dm-def::define-mat3-mtranspose-macro)
(3dm-def::define-mat4-mtranspose-macro)

(3dm-def::define-qconjugate-macro)

(3dm-def::define-do-mat-diag-macro)
(3dm-def::define-meye-function cl:rational)

(3dm-def::define-quaternion-x-axis-macro cl:rational)
(3dm-def::define-quaternion-y-axis-macro cl:rational)
(3dm-def::define-quaternion-z-axis-macro cl:rational)

(3dm-def::define-matrix-from-quaternion-macro cl:rational)
