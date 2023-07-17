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

(cl:deftype vec () `(cl::or vec2 vec3 vec4))

(3dm-def::define-vec2-constructor cl:single-float)
(3dm-def::define-vec3-constructor cl:single-float)
(3dm-def::define-vec4-constructor cl:single-float)

(3dm-def::define-mat2-constructor cl:single-float)
(3dm-def::define-mat3-constructor cl:single-float)
(3dm-def::define-mat4-constructor cl:single-float)
(3dm-def::define-matn-constructor cl:single-float)


(3dm-def::define-vsqrdistance-function cl:single-float)
(3dm-def::define-vdistance-function cl:single-float)

(3dm-def::define-vec2-vsqrlength-function cl:single-float)
(3dm-def::define-vec3-vsqrlength-function cl:single-float)
(3dm-def::define-vec4-vsqrlength-function cl:single-float)

(3dm-def::define-vec2-vlength-function cl:single-float)
(3dm-def::define-vec3-vlength-function cl:single-float)
(3dm-def::define-vec4-vlength-function cl:single-float)

(3dm-def::define-vec2-v2norm-function cl:single-float)
(3dm-def::define-vec3-v2norm-function cl:single-float)
(3dm-def::define-vec4-v2norm-function cl:single-float)



