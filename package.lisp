(in-package :cl-user)

(defpackage 3dm
  (:nicknames :3d-math :3d-math-generic)
  (:use :cl)
  (:import-from #:fast-generic-functions
		#:inlineable)
  (:import-from #:sealable-metaobjects
		#:method-properties)
  (:export #:vx
	   #:vy
	   #:vz
	   #:vw
	   #:vcopy
	   #:qx
	   #:qy
	   #:qz
	   #:qw
	   #:v=
	   #:v/=
	   #:v<
	   #:v<=
	   #:v>
	   #:v>=
	   #:vsqrlength
	   #:vlength
	   #:vunit
	   #:v2norm
	   #:v.
	   #:vc
	   #:vangle
	   #:v+
	   #:v-
	   #:v*
	   #:v/
	   #:orthogonalize
	   #:mcol
	   #:mrow
	   #:m*
	   #:mtranspose
	   #:mdet
	   #:minv
	   #:mlookat
	   #:mcopy
	   #:nmtranslate
	   #:nmscale
	   #:nmrotate
	   #:lerp
	   #:q*
	   #:qconjugate
	   #:qrotation
	   #:rotate-vector
	   #:quaternion-from-to
	   #:quaternion-x-axis
	   #:quaternion-y-axis
	   #:quaternion-z-axis
	   #:matrix-from-quaternion))

(defmacro 3dm::define-package (name default &rest stuff)
  `(cl:defpackage ,name
     (:use :3dm)
     (:import-from ,default
		   #:vec2
		   #:vec3
		   #:vec4
		   #:mat2
		   #:mat3
		   #:mat4
		   #:matn
		   #:quat
		   #:meye
		   #:with-vec2
		   #:with-vec3
		   #:with-vec4
		   #:with-vec)
     ,@stuff))

(defpackage 3dm-def
  (:nicknames :3d-math-definitions)
  (:use :cl)
  (:export #:define-vecx-accessor
	   #:defsealed
	   #:define-vec2-type
	   #:define-vec3-type
	   #:define-vec4-type
	   #:define-mat2-type
	   #:define-mat3-type
	   #:define-mat4-type
	   #:define-matn-type
	   #:define-quat-type
	   #:define-dquat-type
	   #:define-with-vec2-macro
	   #:define-with-vec3-macro
	   #:define-with-vec4-macro
	   #:define-with-vec-macro
	   #:define-binary-op-macro
	   #:define-define-veccomp-macro
	   ))	   

(defmacro def-3d-math-package (name &key nicknames)
  `(defpackage ,name
     (:nicknames ,@nicknames)
     (:export #:vec2
	      #:vec3
	      #:vec4
	      #:mat2
	      #:mat3
	      #:mat4
	      #:matn
	      #:meye
	      #:quat
	      #:dquat
	      #:with-vec2
	      #:with-vec3
	      #:with-vec4
	      #:with-vec)))

(def-3d-math-package :3dm.d :nicknames (:3d-math-double-float))
(def-3d-math-package :3dm.f :nicknames (:3d-math-single-float))
(def-3d-math-package :3dm.fix :nicknames (:3d-math-fixnum))
(def-3d-math-package :3dm.rat :nicknames (:3d-math-rational))
(def-3d-math-package :3dm.fc :nicknames (:3d-math-single-float-complex))
(def-3d-math-package :3dm.dc :nicknames (:3d-math-double-float-complex))

(def-3d-math-package :3dm.d&f)
(def-3d-math-package :3dm.d&fix)
(def-3d-math-package :3dm.d&rat)
(def-3d-math-package :3dm.d&dc)
(def-3d-math-package :3dm.d&fc)

(def-3d-math-package :3dm.f&d)
(def-3d-math-package :3dm.f&fix)
(def-3d-math-package :3dm.f&rat)
(def-3d-math-package :3dm.f&dc)
(def-3d-math-package :3dm.f&fc)

(def-3d-math-package :3dm.rat&d)
(def-3d-math-package :3dm.rat&f)
(def-3d-math-package :3dm.rat&fix)
(def-3d-math-package :3dm.rat&dc)
(def-3d-math-package :3dm.rat&fc)

(def-3d-math-package :3dm.fix&d)
(def-3d-math-package :3dm.fix&f)
(def-3d-math-package :3dm.fix&rat)
(def-3d-math-package :3dm.fix&dc)
(def-3d-math-package :3dm.fix&fc)

