(cl:in-package :3dm.d)

(3dm-def:define-vec2-type cl:double-float)
(3dm-def:define-vec3-type cl:double-float)
(3dm-def:define-vec4-type cl:double-float)
(3dm-def:define-mat2-type cl:double-float)
(3dm-def:define-mat3-type cl:double-float)
(3dm-def:define-mat4-type cl:double-float)
(3dm-def:define-matn-type cl:double-float)
(3dm-def:define-quat-type cl:double-float)
(3dm-def:define-dquat-type)

(3dm-def:define-with-vec2-macro cl:double-float)
(3dm-def:define-with-vec3-macro cl:double-float)
(3dm-def:define-with-vec4-macro cl:double-float)
(3dm-def:define-with-vec-macro cl:double-float)

(cl:deftype vec () `(cl::or vec2 vec3 vec4))

(3dm-def::define-vec2-constructor cl:double-float)
(3dm-def::define-vec3-constructor cl:double-float)
(3dm-def::define-vec4-constructor cl:double-float)

(3dm-def::define-mat2-constructor cl:double-float)
(3dm-def::define-mat3-constructor cl:double-float)
(3dm-def::define-mat4-constructor cl:double-float)
(3dm-def::define-matn-constructor cl:double-float)


(3dm-def::define-vsqrdistance-function cl:double-float)
(3dm-def::define-vdistance-function cl:double-float)

(3dm-def::define-vec2-vsqrlength-function cl:double-float)
(3dm-def::define-vec3-vsqrlength-function cl:double-float)
(3dm-def::define-vec4-vsqrlength-function cl:double-float)

(3dm-def::define-vec2-vlength-function cl:double-float)
(3dm-def::define-vec3-vlength-function cl:double-float)
(3dm-def::define-vec4-vlength-function cl:double-float)

(3dm-def::define-vec2-v2norm-function cl:double-float)
(3dm-def::define-vec3-v2norm-function cl:double-float)
(3dm-def::define-vec4-v2norm-function cl:double-float)

