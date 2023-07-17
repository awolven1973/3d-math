(cl:in-package :3dm.fix)

(3dm-def:define-vec2-type cl:fixnum)
(3dm-def:define-vec3-type cl:fixnum)
(3dm-def:define-vec4-type cl:fixnum)
(3dm-def:define-mat2-type cl:fixnum)
(3dm-def:define-mat3-type cl:fixnum)
(3dm-def:define-mat4-type cl:fixnum)
(3dm-def:define-matn-type cl:fixnum)

(3dm-def:define-with-vec2-macro cl:fixnum)
(3dm-def:define-with-vec3-macro cl:fixnum)
(3dm-def:define-with-vec4-macro cl:fixnum)
(3dm-def:define-with-vec-macro cl:fixnum)

(cl:deftype vec () `(cl::or vec2 vec3 vec4))
