(cl:in-package :3dm.f)

(3dm-def:define-vec2-type cl:single-float)
(3dm-def:define-vec3-type cl:single-float)
(3dm-def:define-vec4-type cl:single-float)
(3dm-def:define-mat2-type cl:single-float)
(3dm-def:define-mat3-type cl:single-float)
(3dm-def:define-mat4-type cl:single-float)
(3dm-def:define-matn-type cl:single-float)
(3dm-def:define-quat-type cl:single-float)
(3dm-def:define-dquat-type)

(3dm-def:define-with-vec2-macro cl:single-float)
(3dm-def:define-with-vec3-macro cl:single-float)
(3dm-def:define-with-vec4-macro cl:single-float)
(3dm-def:define-with-vec-macro cl:single-float)

(cl:deftype vec () `(cl:or vec2 vec3 vec4))
(cl:deftype mat () `(cl:or mat2 mat3 mat4 matn))

(3dm-def::define-vec2-constructor cl:single-float)
(3dm-def::define-vec3-constructor cl:single-float)
(3dm-def::define-vec4-constructor cl:single-float)

(cl:defparameter +vx+ (vec3 1 0 0))
(cl:defparameter +vy+ (vec3 0 1 0))
(cl:defparameter +vz+ (vec3 0 0 1))

(3dm-def::define-with-fast-matref cl:single-float)
(3dm-def::define-with-fast-matrefs)
(3dm-def::define-with-fast-matcase)
(3dm-def::define-do-mat-diag-macro)

(3dm-def::define-mat2-constructor cl:single-float)
(3dm-def::define-mat3-constructor cl:single-float)
(3dm-def::define-mat4-constructor cl:single-float)
(3dm-def::define-matn-constructor cl:single-float)

(3dm-def::define-quat-constructor cl:single-float)

(3dm-def::define-vec2-vsqrlength-function cl:single-float)
(3dm-def::define-vec3-vsqrlength-function cl:single-float)
(3dm-def::define-vec4-vsqrlength-function cl:single-float)

(3dm-def::define-vec2-vsqr2norm-function cl:single-float)
(3dm-def::define-vec3-vsqr2norm-function cl:single-float)
(3dm-def::define-vec4-vsqr2norm-function cl:single-float)

(3dm-def::define-mat2-mrow-function)
(3dm-def::define-mat3-mrow-function)
(3dm-def::define-mat4-mrow-function)

(3dm-def::define-mdet-mat2)
(3dm-def::define-mdet-mat3)
(3dm-def::define-mdet-mat4)

(3dm-def::define-minv-mat2)
(3dm-def::define-minv-mat3)
(3dm-def::define-minv-mat4)

(3dm-def::define-mlookat-macro cl:double-float)

(3dm-def::define-mat2-mtranspose-macro)
(3dm-def::define-mat3-mtranspose-macro)
(3dm-def::define-mat4-mtranspose-macro)

(3dm-def::define-qconjugate-macro)

(3dm-def::define-meye-function cl:single-float)

(3dm-def::define-quaternion-x-axis-macro cl:single-float)
(3dm-def::define-quaternion-y-axis-macro cl:single-float)
(3dm-def::define-quaternion-z-axis-macro cl:single-float)

(3dm-def::define-matrix-from-quaternion-macro cl:single-float)
