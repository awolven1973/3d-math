(cl:in-package :3dm.rat)

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

(3dm-def::define-mat2-constructor cl:rational)
(3dm-def::define-mat3-constructor cl:rational)
(3dm-def::define-mat4-constructor cl:rational)
(3dm-def::define-matn-constructor cl:rational)


(3dm-def::define-vsqrdistance-function cl:rational)


(3dm-def::define-vec2-vsqrlength-function cl:rational)
(3dm-def::define-vec3-vsqrlength-function cl:rational)
(3dm-def::define-vec4-vsqrlength-function cl:rational)

