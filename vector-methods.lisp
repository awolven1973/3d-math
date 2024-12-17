(in-package :3dm)

#+sbcl
(declaim (sb-ext:muffle-conditions sb-ext:compiler-note))

;; vx

(3dm-def:defsealed vx ((vec 3dm.f:vec2))
  (3dm.f::vx2 vec))

(3dm-def:defsealed vx ((vec 3dm.d:vec2))
  (3dm.d::vx2 vec))

(3dm-def:defsealed vx ((vec 3dm.rat:vec2))
  (3dm.rat::vx2 vec))

(3dm-def:defsealed vx ((vec 3dm.fix:vec2))
  (3dm.fix::vx2 vec))

(3dm-def:defsealed vx ((vec 3dm.f:vec3))
  (3dm.f::vx3 vec))

(3dm-def:defsealed vx ((vec 3dm.d:vec3))
  (3dm.d::vx3 vec))

(3dm-def:defsealed vx ((vec 3dm.rat:vec3))
  (3dm.rat::vx3 vec))

(3dm-def:defsealed vx ((vec 3dm.fix:vec3))
  (3dm.fix::vx3 vec))

(3dm-def:defsealed vx ((vec 3dm.f:vec4))
  (3dm.f::vx4 vec))

(3dm-def:defsealed vx ((vec 3dm.d:vec4))
  (3dm.d::vx4 vec))

(3dm-def:defsealed vx ((vec 3dm.rat:vec4))
  (3dm.rat::vx4 vec))

(3dm-def:defsealed vx ((vec 3dm.fix:vec4))
  (3dm.fix::vx4 vec))

(3dm-def:defsealed vx ((vec list))
  (car vec))

(3dm-def:defsealed vx ((vec vector))
  (aref vec 0))

;; vy

(3dm-def:defsealed vy ((vec 3dm.f:vec2))
  (3dm.f::vy2 vec))

(3dm-def:defsealed vy ((vec 3dm.d:vec2))
  (3dm.d::vy2 vec))

(3dm-def:defsealed vy ((vec 3dm.rat:vec2))
  (3dm.rat::vy2 vec))

(3dm-def:defsealed vy ((vec 3dm.fix:vec2))
  (3dm.fix::vy2 vec))

(3dm-def:defsealed vy ((vec 3dm.f:vec3))
  (3dm.f::vy3 vec))

(3dm-def:defsealed vy ((vec 3dm.d:vec3))
  (3dm.d::vy3 vec))

(3dm-def:defsealed vy ((vec 3dm.rat:vec3))
  (3dm.rat::vy3 vec))

(3dm-def:defsealed vy ((vec 3dm.fix:vec3))
  (3dm.fix::vy3 vec))

(3dm-def:defsealed vy ((vec 3dm.f:vec4))
  (3dm.f::vy4 vec))

(3dm-def:defsealed vy ((vec 3dm.d:vec4))
  (3dm.d::vy4 vec))

(3dm-def:defsealed vy ((vec 3dm.rat:vec4))
  (3dm.rat::vy4 vec))

(3dm-def:defsealed vy ((vec 3dm.fix:vec4))
  (3dm.fix::vy4 vec))

(3dm-def:defsealed vy ((vec list))
  (cadr vec))

(3dm-def:defsealed vy ((vec vector))
  (aref vec 1))

;; vz

(3dm-def:defsealed vz ((vec 3dm.f:vec3))
  (3dm.f::vz3 vec))

(3dm-def:defsealed vz ((vec 3dm.d:vec3))
  (3dm.d::vz3 vec))

(3dm-def:defsealed vz ((vec 3dm.rat:vec3))
  (3dm.rat::vz3 vec))

(3dm-def:defsealed vz ((vec 3dm.fix:vec3))
  (3dm.fix::vz3 vec))

(3dm-def:defsealed vz ((vec 3dm.f:vec4))
  (3dm.f::vz4 vec))

(3dm-def:defsealed vz ((vec 3dm.d:vec4))
  (3dm.d::vz4 vec))

(3dm-def:defsealed vz ((vec 3dm.rat:vec4))
  (3dm.rat::vz4 vec))

(3dm-def:defsealed vz ((vec 3dm.fix:vec4))
  (3dm.fix::vz4 vec))

(3dm-def:defsealed vz ((vec list))
  (caddr vec))

(3dm-def:defsealed vz ((vec vector))
  (aref vec 2))

;; vw

(3dm-def:defsealed vw ((vec 3dm.f:vec4))
  (3dm.f::vw4 vec))

(3dm-def:defsealed vw ((vec 3dm.d:vec4))
  (3dm.d::vw4 vec))

(3dm-def:defsealed vw ((vec 3dm.rat:vec4))
  (3dm.rat::vw4 vec))

(3dm-def:defsealed vw ((vec 3dm.fix:vec4))
  (3dm.fix::vw4 vec))

(3dm-def:defsealed vw ((vec list))
  (cadddr vec))

(3dm-def:defsealed vw ((vec vector))
  (aref vec 3))
;;;;;;

(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v= ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v= ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v= ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v= ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v= a b))

(3dm-def::defsealed binary-v= ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v= ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v= a b))

(3dm-def::defsealed binary-v= ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v= ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v= a b))

(3dm-def::defsealed binary-v= ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v= ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v= ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v= b a))

(3dm-def::def-vec2-vec2-binary-op cl:= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v= b a))

(3dm-def::def-vec3-vec3-binary-op cl:= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v= ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v= b a))

(3dm-def::def-vec4-vec4-binary-op cl:= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v= ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v= a b))
;;;;;;
  
(3dm-def::define-ofun v= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v= prev next)))

(define-compiler-macro v= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v= ,prev ,next))))
;;;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v/= ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v/= ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v/= ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v/= ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v/= a b))

(3dm-def::defsealed binary-v/= ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v/= ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v/= a b))

(3dm-def::defsealed binary-v/= ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v/= ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v/= a b))

(3dm-def::defsealed binary-v/= ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v/= ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v/= ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v/= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/= cl:or :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v/= b a))

(3dm-def::def-vec2-vec2-binary-op cl:/= cl:or :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v/= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/= cl:or :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v/= b a))

(3dm-def::def-vec3-vec3-binary-op cl:/= cl:or :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v/= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/= cl:or :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v/= ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v/= b a))

(3dm-def::def-vec4-vec4-binary-op cl:/= cl:or :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v/= ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v/= a b))

(3dm-def::define-ofun v/= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v/= prev next)))

(define-compiler-macro v/= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v/= ,prev ,next))))
;;;;;;

(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v< ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v< ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v< ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v< ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v< a b))

(3dm-def::defsealed binary-v< ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v< ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v< a b))

(3dm-def::defsealed binary-v< ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v< ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v< a b))

(3dm-def::defsealed binary-v< ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v< ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v< ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v< a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:< cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v< b a))

(3dm-def::def-vec2-vec2-binary-op cl:< cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v< a b))
;;
(3dm-def::def-number-vec3-binary-op cl:< cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v< b a))

(3dm-def::def-vec3-vec3-binary-op cl:< cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v< a b))
;;
(3dm-def::def-number-vec4-binary-op cl:< cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v< ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v< b a))

(3dm-def::def-vec4-vec4-binary-op cl:< cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v< ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v< a b))

(3dm-def::define-ofun v< (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v< prev next)))

(define-compiler-macro v< (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v< ,prev ,next))))
;;;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v<= ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v<= ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v<= ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v<= ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v<= a b))

(3dm-def::defsealed binary-v<= ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v<= ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v<= a b))

(3dm-def::defsealed binary-v<= ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v<= ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v<= a b))

(3dm-def::defsealed binary-v<= ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v<= ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v<= ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v<= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:<= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v<= b a))

(3dm-def::def-vec2-vec2-binary-op cl:<= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v<= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:<= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v<= b a))

(3dm-def::def-vec3-vec3-binary-op cl:<= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v<= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:<= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v<= ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v<= b a))

(3dm-def::def-vec4-vec4-binary-op cl:<= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v<= ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v<= a b))

(3dm-def::define-ofun v<= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v<= prev next)))

(define-compiler-macro v<= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v<= ,prev ,next))))
;;;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v> ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v> ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v> ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v> ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v> a b))

(3dm-def::defsealed binary-v> ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v> ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v> a b))

(3dm-def::defsealed binary-v> ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v> ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v> a b))

(3dm-def::defsealed binary-v> ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v> ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v> ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v> a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:> cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v> b a))

(3dm-def::def-vec2-vec2-binary-op cl:> cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v> a b))
;;
(3dm-def::def-number-vec3-binary-op cl:> cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v> b a))

(3dm-def::def-vec3-vec3-binary-op cl:> cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v> a b))
;;
(3dm-def::def-number-vec4-binary-op cl:> cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v> ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v> b a))

(3dm-def::def-vec4-vec4-binary-op cl:> cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v> ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v> a b))

(3dm-def::define-ofun v> (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v> prev next)))

(define-compiler-macro v> (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v> ,prev ,next))))
;;;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v>= ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v>= ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v>= ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v>= ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v>= a b))

(3dm-def::defsealed binary-v>= ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v>= ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v>= a b))

(3dm-def::defsealed binary-v>= ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v>= ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v>= a b))

(3dm-def::defsealed binary-v>= ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v>= ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v>= ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v>= a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:>= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v>= b a))

(3dm-def::def-vec2-vec2-binary-op cl:>= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v>= a b))
;;
(3dm-def::def-number-vec3-binary-op cl:>= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v>= b a))

(3dm-def::def-vec3-vec3-binary-op cl:>= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v>= a b))
;;
(3dm-def::def-number-vec4-binary-op cl:>= cl:and :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v>= ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v>= b a))

(3dm-def::def-vec4-vec4-binary-op cl:>= cl:and :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v>= ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v>= a b))

(3dm-def::define-ofun v>= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v>= prev next)))

(define-compiler-macro v>= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v>= ,prev ,next))))
;;;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v+ ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v+ ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v+ ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v+ ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v+ a b))

(3dm-def::defsealed binary-v+ ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v+ ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v+ a b))

(3dm-def::defsealed binary-v+ ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v+ ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v+ a b))

(3dm-def::defsealed binary-v+ ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.f::%vec2 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.f::%vec2 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.f::%vec3 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.f::%vec3 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.f::%vec4 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.f::%vec4 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.rat::%vec2 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.rat::%vec2 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.rat::%vec3 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.rat::%vec3 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.rat::%vec4 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.rat::%vec4 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.d::%vec2 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.d::%vec3 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.d::%vec4 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.f::%vec2 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.f::%vec2 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.f::%vec3 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.f::%vec3 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.f::%vec4 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v+ ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.f::%vec4 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v+ ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v+ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:+ 3dm.f::%vec2 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v+ b a))

(3dm-def::def-vec2-vec2-binary-op cl:+ 3dm.f::%vec2 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v+ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:+ 3dm.f::%vec3 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v+ b a))

(3dm-def::def-vec3-vec3-binary-op cl:+ 3dm.f::%vec3 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v+ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:+ 3dm.f::%vec4 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v+ ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v+ a b))

(3dm-def:defsealed binary-v+ ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v+ b a))

(3dm-def::def-vec4-vec4-binary-op cl:+ 3dm.f::%vec4 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v+ ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v+ a b))

(3dm-def::define-ofun v+ (val &rest vals)
  (loop with result = val
	for next in vals
	do (setq result (binary-v+ result next))
	finally (return result)))

(define-compiler-macro v+ (val &rest vals)
  (cond ((null vals) val)
        (t (reduce (lambda (a b) `(binary-v+ ,a ,b)) (cons val vals)))))

;;;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.d::%vec2 :3dm.d :3dm.d cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v- ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.d::%vec3 :3dm.d :3dm.d cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v- ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.d::%vec4 :3dm.d :3dm.d cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v- ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v- ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.d::%vec2 :3dm.f&d :3dm.d cl:single-float)

(3dm-def::defsealed binary-v- ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.f&d::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v- ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.d::%vec3 :3dm.f&d :3dm.d cl:single-float)

(3dm-def::defsealed binary-v- ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.f&d::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v- ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.d::%vec4 :3dm.f&d :3dm.d cl:single-float)

(3dm-def::defsealed binary-v- ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.f&d::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.f::%vec2 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.f::%vec2 :3dm.f :3dm.f cl:single-float)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.f::%vec2 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.f::%vec3 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.f::%vec3 :3dm.f :3dm.f cl:single-float)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.f::%vec3 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.f::%vec4 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.f::%vec4 :3dm.f :3dm.f cl:single-float)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.f::%vec4 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.d::%vec2 :3dm.d&f :3dm.f cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.d::%vec3 :3dm.d&f :3dm.f cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.d::%vec4 :3dm.d&f :3dm.f cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.rat::%vec2 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.rat::%vec2 :3dm.rat :3dm.rat cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.rat::%vec2 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.rat::%vec3 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.rat::%vec3 :3dm.rat :3dm.rat cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.rat::%vec3 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.rat::%vec4 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.rat::%vec4 :3dm.rat :3dm.rat cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.rat::%vec4 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.d::%vec2 :3dm.d&rat :3dm.rat cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.d::%vec3 :3dm.d&rat :3dm.rat cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.d::%vec4 :3dm.d&rat :3dm.rat cl:double-float)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.d::%vec2 :3dm.rat&d :3dm.d cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.d::%vec2 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.d::%vec3 :3dm.rat&d :3dm.d cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.d::%vec3 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.d::%vec4 :3dm.rat&d :3dm.d cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.d::%vec4 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.f::%vec2 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.f::%vec2 :3dm.f&rat :3dm.rat cl:single-float)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.f::%vec2 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.f::%vec3 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.f::%vec3 :3dm.f&rat :3dm.rat cl:single-float)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.f::%vec3 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.f::%vec4 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v- ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.f::%vec4 :3dm.f&rat :3dm.rat cl:single-float)

(3dm-def:defsealed binary-v- ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.f::%vec4 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v- ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v- a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:- 3dm.f::%vec2 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v- a b))

(3dm-def::def-vec2-number-binary-op cl:- 3dm.f::%vec2 :3dm.rat&f :3dm.f cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::vec2-number-binary-v- a b))

(3dm-def::def-vec2-vec2-binary-op cl:- 3dm.f::%vec2 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v- a b))
;;
(3dm-def::def-number-vec3-binary-op cl:- 3dm.f::%vec3 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v- a b))

(3dm-def::def-vec3-number-binary-op cl:- 3dm.f::%vec3 :3dm.rat&f :3dm.f cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::vec3-number-binary-v- a b))

(3dm-def::def-vec3-vec3-binary-op cl:- 3dm.f::%vec3 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v- a b))
;;
(3dm-def::def-number-vec4-binary-op cl:- 3dm.f::%vec4 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v- ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v- a b))

(3dm-def::def-vec4-number-binary-op cl:- 3dm.f::%vec4 :3dm.rat&f :3dm.f cl:rational)

(3dm-def:defsealed binary-v- ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::vec4-number-binary-v- a b))

(3dm-def::def-vec4-vec4-binary-op cl:- 3dm.f::%vec4 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v- ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v- a b))

(3dm-def::define-ofun v- (val &rest vals)
  (if (null vals)
      (binary-v* -1 val)
      (loop with result = val
	    for next in vals
	    do (setq result (binary-v- result next))
	    finally (return result))))

(define-compiler-macro v- (val &rest vals)
  (cond ((null vals) `(binary-v* -1 ,val))
        (t (reduce (lambda (a b) `(binary-v- ,a ,b)) (cons val vals)))))

;;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v* ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v* ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v* ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v* ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v* a b))

(3dm-def::defsealed binary-v* ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.d::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v* ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v* a b))

(3dm-def::defsealed binary-v* ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.d::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v* ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v* a b))

(3dm-def::defsealed binary-v* ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.d::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.f::%vec2 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.f::%vec2 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.f::%vec3 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.f::%vec3 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.f::%vec4 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.f::%vec4 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.rat::%vec2 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.rat::%vec2 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.rat::%vec3 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.rat::%vec3 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.rat::%vec4 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.rat::%vec4 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.d::%vec2 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.d::%vec3 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.d::%vec4 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.f::%vec2 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.f::%vec2 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.f::%vec3 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.f::%vec3 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.f::%vec4 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v* ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.f::%vec4 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v* ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v* a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:* 3dm.f::%vec2 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::number-vec2-binary-v* b a))

(3dm-def::def-vec2-vec2-binary-op cl:* 3dm.f::%vec2 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v* a b))
;;
(3dm-def::def-number-vec3-binary-op cl:* 3dm.f::%vec3 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::number-vec3-binary-v* b a))

(3dm-def::def-vec3-vec3-binary-op cl:* 3dm.f::%vec3 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v* a b))
;;
(3dm-def::def-number-vec4-binary-op cl:* 3dm.f::%vec4 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v* ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v* a b))

(3dm-def:defsealed binary-v* ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::number-vec4-binary-v* b a))

(3dm-def::def-vec4-vec4-binary-op cl:* 3dm.f::%vec4 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v* ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v* a b))

(3dm-def::define-ofun v* (val &rest vals)
  (loop with result = val
	for next in vals
	do (setq result (binary-v* result next))
	finally (return result)))

(define-compiler-macro v* (val &rest vals)
  (cond ((null vals) val)
        (t (reduce (lambda (a b) `(binary-v* ,a ,b)) (cons val vals)))))
;;;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.d:vec2))
  (3dm.d::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.d::%vec2 :3dm.d :3dm.d cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec2) (b cl:double-float))
  (3dm.d::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v/ ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.d:vec3))
  (3dm.d::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.d::%vec3 :3dm.d :3dm.d cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec3) (b cl:double-float))
  (3dm.d::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v/ ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.d cl:double-float :3dm.d)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.d:vec4))
  (3dm.d::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.d::%vec4 :3dm.d :3dm.d cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec4) (b cl:double-float))
  (3dm.d::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.d :3dm.d :3dm.d)

(3dm-def::defsealed binary-v/ ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v/ ((a cl:single-float) (b 3dm.d:vec2))
  (3dm.f&d::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.d::%vec2 :3dm.f&d :3dm.d cl:single-float)

(3dm-def::defsealed binary-v/ ((a 3dm.d:vec2) (b cl:single-float))
  (3dm.f&d::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v/ ((a cl:single-float) (b 3dm.d:vec3))
  (3dm.f&d::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.d::%vec3 :3dm.f&d :3dm.d cl:single-float)

(3dm-def::defsealed binary-v/ ((a 3dm.d:vec3) (b cl:single-float))
  (3dm.f&d::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.f&d cl:single-float :3dm.d)

(3dm-def::defsealed binary-v/ ((a cl:single-float) (b 3dm.d:vec4))
  (3dm.f&d::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.d::%vec4 :3dm.f&d :3dm.d cl:single-float)

(3dm-def::defsealed binary-v/ ((a 3dm.d:vec4) (b cl:single-float))
  (3dm.f&d::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.f::%vec2 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:single-float) (b 3dm.f:vec2))
  (3dm.f::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.f::%vec2 :3dm.f :3dm.f cl:single-float)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec2) (b cl:single-float))
  (3dm.f::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.f::%vec2 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.f::%vec3 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:single-float) (b 3dm.f:vec3))
  (3dm.f::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.f::%vec3 :3dm.f :3dm.f cl:single-float)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec3) (b cl:single-float))
  (3dm.f::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.f::%vec3 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.f::%vec4 :3dm.f cl:single-float :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:single-float) (b 3dm.f:vec4))
  (3dm.f::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.f::%vec4 :3dm.f :3dm.f cl:single-float)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec4) (b cl:single-float))
  (3dm.f::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.f::%vec4 :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.f:vec2))
  (3dm.d&f::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.d::%vec2 :3dm.d&f :3dm.f cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec2) (b cl:double-float))
  (3dm.d&f::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.f:vec3))
  (3dm.d&f::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.d::%vec3 :3dm.d&f :3dm.f cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec3) (b cl:double-float))
  (3dm.d&f::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.d&f cl:double-float :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.f:vec4))
  (3dm.d&f::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.d::%vec4 :3dm.d&f :3dm.f cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec4) (b cl:double-float))
  (3dm.d&f::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.rat::%vec2 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.rat::vec2))
  (3dm.rat::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.rat::%vec2 :3dm.rat :3dm.rat cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec2) (b cl:rational))
  (3dm.rat::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.rat::%vec2 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.rat::%vec3 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.rat::vec3))
  (3dm.rat::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.rat::%vec3 :3dm.rat :3dm.rat cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec3) (b cl:rational))
  (3dm.rat::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.rat::%vec3 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.rat::%vec4 :3dm.rat cl:rational :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.rat::vec4))
  (3dm.rat::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.rat::%vec4 :3dm.rat :3dm.rat cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec4) (b cl:rational))
  (3dm.rat::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.rat::%vec4 :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.rat::vec2))
  (3dm.d&rat::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.d::%vec2 :3dm.d&rat :3dm.rat cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec2) (b cl:double-float))
  (3dm.d&rat::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.rat::vec3))
  (3dm.d&rat::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.d::%vec3 :3dm.d&rat :3dm.rat cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec3) (b cl:double-float))
  (3dm.d&rat::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.d&rat cl:double-float :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:double-float) (b 3dm.rat::vec4))
  (3dm.d&rat::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.d::%vec4 :3dm.d&rat :3dm.rat cl:double-float)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec4) (b cl:double-float))
  (3dm.d&rat::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.d::vec2))
  (3dm.rat&d::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.d::%vec2 :3dm.rat&d :3dm.d cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.d::vec2) (b cl:rational))
  (3dm.rat&d::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.d::%vec2 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.d::vec3))
  (3dm.rat&d::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.d::%vec3 :3dm.rat&d :3dm.d cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.d::vec3) (b cl:rational))
  (3dm.rat&d::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.d::%vec3 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.rat&d cl:rational :3dm.d)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.d::vec4))
  (3dm.rat&d::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.d::%vec4 :3dm.rat&d :3dm.d cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.d::vec4) (b cl:rational))
  (3dm.rat&d::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.d::%vec4 :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.f::%vec2 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:single-float) (b 3dm.rat::vec2))
  (3dm.f&rat::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.f::%vec2 :3dm.f&rat :3dm.rat cl:single-float)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec2) (b cl:single-float))
  (3dm.f&rat::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.f::%vec2 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.f::%vec3 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:single-float) (b 3dm.rat::vec3))
  (3dm.f&rat::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.f::%vec3 :3dm.f&rat :3dm.rat cl:single-float)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec3) (b cl:single-float))
  (3dm.f&rat::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.f::%vec3 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.f::%vec4 :3dm.f&rat cl:single-float :3dm.rat)

(3dm-def:defsealed binary-v/ ((a cl:single-float) (b 3dm.rat::vec4))
  (3dm.f&rat::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.f::%vec4 :3dm.f&rat :3dm.rat cl:single-float)

(3dm-def:defsealed binary-v/ ((a 3dm.rat::vec4) (b cl:single-float))
  (3dm.f&rat::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.f::%vec4 :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed binary-v/ ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vec4-binary-v/ a b))
;;;;
(3dm-def::def-number-vec2-binary-op cl:/ 3dm.f::%vec2 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.f::vec2))
  (3dm.rat&f::number-vec2-binary-v/ a b))

(3dm-def::def-vec2-number-binary-op cl:/ 3dm.f::%vec2 :3dm.rat&f :3dm.f cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.f::vec2) (b cl:rational))
  (3dm.rat&f::vec2-number-binary-v/ a b))

(3dm-def::def-vec2-vec2-binary-op cl:/ 3dm.f::%vec2 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vec2-binary-v/ a b))
;;
(3dm-def::def-number-vec3-binary-op cl:/ 3dm.f::%vec3 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.f::vec3))
  (3dm.rat&f::number-vec3-binary-v/ a b))

(3dm-def::def-vec3-number-binary-op cl:/ 3dm.f::%vec3 :3dm.rat&f :3dm.f cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.f::vec3) (b cl:rational))
  (3dm.rat&f::vec3-number-binary-v/ a b))

(3dm-def::def-vec3-vec3-binary-op cl:/ 3dm.f::%vec3 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vec3-binary-v/ a b))
;;
(3dm-def::def-number-vec4-binary-op cl:/ 3dm.f::%vec4 :3dm.rat&f cl:rational :3dm.f)

(3dm-def:defsealed binary-v/ ((a cl:rational) (b 3dm.f::vec4))
  (3dm.rat&f::number-vec4-binary-v/ a b))

(3dm-def::def-vec4-number-binary-op cl:/ 3dm.f::%vec4 :3dm.rat&f :3dm.f cl:rational)

(3dm-def:defsealed binary-v/ ((a 3dm.f::vec4) (b cl:rational))
  (3dm.rat&f::vec4-number-binary-v/ a b))

(3dm-def::def-vec4-vec4-binary-op cl:/ 3dm.f::%vec4 :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed binary-v/ ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vec4-binary-v/ a b))

(3dm-def::define-ofun v/ (val &rest vals)
  (if (null vals)
      (binary-v/ 1 val)
      (loop with result = val
	    for next in vals
	    do (setq result (binary-v/ result next))
	    finally (return result))))

(define-compiler-macro v/ (val &rest vals)
  (cond ((null vals) `(binary-v/ 1 ,val))
        (t (reduce (lambda (a b) `(binary-v/ ,a ,b)) (cons val vals)))))
;;;;;;

(3dm-def:defsealed vsqrlength ((v 3dm.d::vec2))
  (3dm.d::vec2-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.d::vec3))
  (3dm.d::vec3-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.d::vec4))
  (3dm.d::vec4-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.f::vec2))
  (3dm.f::vec2-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.f::vec3))
  (3dm.f::vec3-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.f::vec4))
  (3dm.f::vec4-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.rat::vec2))
  (3dm.rat::vec2-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.rat::vec3))
  (3dm.rat::vec3-vsqrlength v))

(3dm-def:defsealed vsqrlength ((v 3dm.rat::vec4))
  (3dm.rat::vec4-vsqrlength v))

(3dm-def:defsealed vlength ((v 3dm.d::vec2))
  (sqrt (3dm.d::vec2-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.d::vec3))
  (sqrt (3dm.d::vec3-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.d::vec4))
  (sqrt (3dm.d::vec4-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.f::vec2))
  (sqrt (3dm.f::vec2-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.f::vec3))
  (sqrt (3dm.f::vec3-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.f::vec4))
  (sqrt (3dm.f::vec4-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.rat::vec2))
  (sqrt (3dm.rat::vec2-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.rat::vec3))
  (sqrt (3dm.rat::vec3-vsqrlength v)))

(3dm-def:defsealed vlength ((v 3dm.rat::vec4))
  (sqrt (3dm.rat::vec4-vsqrlength v)))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.d&rat::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.rat&d::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (3dm.f&rat::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (3dm.f&rat::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.f&rat :3dm.f :3dm.rat)

(3dm-def:defsealed vsqrdistance ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (3dm.f&rat::vec4-vsqrdistance a b))

(3dm-def::define-vec2-vsqrdistance-macro :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (3dm.rat&f::vec2-vsqrdistance a b))

(3dm-def::define-vec3-vsqrdistance-macro :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (3dm.rat&f::vec3-vsqrdistance a b))

(3dm-def::define-vec4-vsqrdistance-macro :3dm.rat&f :3dm.rat :3dm.f)

(3dm-def:defsealed vsqrdistance ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (3dm.rat&f::vec4-vsqrdistance a b))
;;;;
(3dm-def:defsealed vdistance ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (sqrt (3dm.d::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d::vec3) (b 3dm.d::vec3))
  (sqrt (3dm.d::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d::vec4) (b 3dm.d::vec4))
  (sqrt (3dm.d::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (sqrt (3dm.f&d::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f::vec3) (b 3dm.d::vec3))
  (sqrt (3dm.f&d::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f::vec4) (b 3dm.d::vec4))
  (sqrt (3dm.f&d::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (sqrt (3dm.d&f::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d::vec3) (b 3dm.f::vec3))
  (sqrt (3dm.d&f::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d::vec4) (b 3dm.f::vec4))
  (sqrt (3dm.d&f::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (sqrt (3dm.f::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f::vec3) (b 3dm.f::vec3))
  (sqrt (3dm.f::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f::vec4) (b 3dm.f::vec4))
  (sqrt (3dm.f::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (sqrt (3dm.rat::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat::vec3) (b 3dm.rat::vec3))
  (sqrt (3dm.rat::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat::vec4) (b 3dm.rat::vec4))
  (sqrt (3dm.rat::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (sqrt (3dm.d&rat::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (sqrt (3dm.d&rat::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (sqrt (3dm.d&rat::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (sqrt (3dm.rat&d::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (sqrt (3dm.rat&d::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (sqrt (3dm.rat&d::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f:vec2) (b 3dm.rat:vec2))
  (sqrt (3dm.f&rat::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f:vec3) (b 3dm.rat:vec3))
  (sqrt (3dm.f&rat::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.f:vec4) (b 3dm.rat:vec4))
  (sqrt (3dm.f&rat::vec4-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat:vec2) (b 3dm.f:vec2))
  (sqrt (3dm.rat&f::vec2-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat:vec3) (b 3dm.f:vec3))
  (sqrt (3dm.rat&f::vec3-vsqrdistance a b)))

(3dm-def:defsealed vdistance ((a 3dm.rat:vec4) (b 3dm.f:vec4))
  (sqrt (3dm.rat&f::vec4-vsqrdistance a b)))
;;;;;;

(3dm-def:defsealed v2norm ((v 3dm.d::vec2))
  (sqrt (3dm.d::vec2-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.d::vec3))
  (sqrt (3dm.d::vec3-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.d::vec4))
  (sqrt (3dm.d::vec4-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.f::vec2))
  (sqrt (3dm.f::vec2-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.f::vec3))
  (sqrt (3dm.f::vec3-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.f::vec4))
  (sqrt (3dm.f::vec4-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.rat::vec2))
  (sqrt (3dm.rat::vec2-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.rat::vec3))
  (sqrt (3dm.f::vec3-vsqr2norm v)))

(3dm-def:defsealed v2norm ((v 3dm.rat::vec4))
  (sqrt (3dm.rat::vec4-vsqr2norm v)))

(3dm-def::define-vec2-v.-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-vec2-v.-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-vec2-v.-function cl:double-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-vec2-v.-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-vec2-v.-function cl:rational :3dm.rat :3dm.rat :3dm.rat)
(3dm-def::define-vec2-v.-function cl:double-float :3dm.d&rat :3dm.d :3dm.rat)
(3dm-def::define-vec2-v.-function cl:double-float :3dm.rat&d :3dm.rat :3dm.d)
(3dm-def::define-vec2-v.-function cl:single-float :3dm.rat&f :3dm.rat :3dm.f)
(3dm-def::define-vec2-v.-function cl:single-float :3dm.f&rat :3dm.f :3dm.rat)
(3dm-def::define-vec2-v.-function cl:integer :3dm.fix :3dm.fix :3dm.fix)

(3dm-def:defsealed v. ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (3dm.d::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (3dm.d&f::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (3dm.f&d::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (3dm.f::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (3dm.rat::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.d::vec2) (b 3dm.rat::vec2))
  (3dm.d&rat::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec2) (b 3dm.d::vec2))
  (3dm.rat&d::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec2) (b 3dm.f::vec2))
  (3dm.rat&f::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec2) (b 3dm.rat::vec2))
  (3dm.f&rat::vec2-v. a b))

(3dm-def:defsealed v. ((a 3dm.fix::vec2) (b 3dm.fix::vec2))
  (3dm.fix::vec2-v. a b))

(3dm-def::define-vec3-v.-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-vec3-v.-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-vec3-v.-function cl:double-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-vec3-v.-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-vec3-v.-function cl:rational :3dm.rat :3dm.rat :3dm.rat)
(3dm-def::define-vec3-v.-function cl:double-float :3dm.d&rat :3dm.d :3dm.rat)
(3dm-def::define-vec3-v.-function cl:double-float :3dm.rat&d :3dm.rat :3dm.d)
(3dm-def::define-vec3-v.-function cl:single-float :3dm.rat&f :3dm.rat :3dm.f)
(3dm-def::define-vec3-v.-function cl:single-float :3dm.f&rat :3dm.f :3dm.rat)
(3dm-def::define-vec3-v.-function cl:integer :3dm.fix :3dm.fix :3dm.fix)

(3dm-def:defsealed v. ((a 3dm.d::vec3) (b 3dm.d::vec3))
  (3dm.d::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.d::vec3) (b 3dm.f::vec3))
  (3dm.d&f::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec3) (b 3dm.d::vec3))
  (3dm.f&d::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec3) (b 3dm.f::vec3))
  (3dm.f::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec3) (b 3dm.rat::vec3))
  (3dm.rat::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.d::vec3) (b 3dm.rat::vec3))
  (3dm.d&rat::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec3) (b 3dm.d::vec3))
  (3dm.rat&d::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec3) (b 3dm.f::vec3))
  (3dm.rat&f::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec3) (b 3dm.rat::vec3))
  (3dm.f&rat::vec3-v. a b))

(3dm-def:defsealed v. ((a 3dm.fix::vec3) (b 3dm.fix::vec3))
  (3dm.fix::vec3-v. a b))

(3dm-def::define-vec4-v.-function cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def::define-vec4-v.-function cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def::define-vec4-v.-function cl:double-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def::define-vec4-v.-function cl:single-float :3dm.f :3dm.f :3dm.f)
(3dm-def::define-vec4-v.-function cl:rational :3dm.rat :3dm.rat :3dm.rat)
(3dm-def::define-vec4-v.-function cl:double-float :3dm.d&rat :3dm.d :3dm.rat)
(3dm-def::define-vec4-v.-function cl:double-float :3dm.rat&d :3dm.rat :3dm.d)
(3dm-def::define-vec4-v.-function cl:single-float :3dm.rat&f :3dm.rat :3dm.f)
(3dm-def::define-vec4-v.-function cl:single-float :3dm.f&rat :3dm.f :3dm.rat)
(3dm-def::define-vec4-v.-function cl:integer :3dm.fix :3dm.fix :3dm.fix)

(3dm-def:defsealed v. ((a 3dm.d::vec4) (b 3dm.d::vec4))
  (3dm.d::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.d::vec4) (b 3dm.f::vec4))
  (3dm.d&f::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec4) (b 3dm.d::vec4))
  (3dm.f&d::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec4) (b 3dm.f::vec4))
  (3dm.f::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec4) (b 3dm.rat::vec4))
  (3dm.rat::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.d::vec4) (b 3dm.rat::vec4))
  (3dm.d&rat::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec4) (b 3dm.d::vec4))
  (3dm.rat&d::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.rat::vec4) (b 3dm.f::vec4))
  (3dm.rat&f::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.f::vec4) (b 3dm.rat::vec4))
  (3dm.f&rat::vec4-v. a b))

(3dm-def:defsealed v. ((a 3dm.fix::vec4) (b 3dm.fix::vec4))
  (3dm.fix::vec4-v. a b))

(3dm-def::define-vc-function :3dm.d :3dm.d :3dm.d :3dm.d)
(3dm-def::define-vc-function :3dm.d&f :3dm.d :3dm.f :3dm.d)
(3dm-def::define-vc-function :3dm.f&d :3dm.f :3dm.d :3dm.d)
(3dm-def::define-vc-function :3dm.f :3dm.f :3dm.f :3dm.f)
(3dm-def::define-vc-function :3dm.d&rat :3dm.d :3dm.rat :3dm.d)
(3dm-def::define-vc-function :3dm.rat&d :3dm.rat :3dm.d :3dm.d)
(3dm-def::define-vc-function :3dm.rat :3dm.rat :3dm.rat :3dm.rat)

(3dm-def::defsealed vc ((a 3dm.d::vec3) (b 3dm.d::vec3))
  (3dm.d::vc a b))

(3dm-def::defsealed vc ((a 3dm.d::vec3) (b 3dm.f::vec3))
  (3dm.d&f::vc a b))

(3dm-def::defsealed vc ((a 3dm.f::vec3) (b 3dm.d::vec3))
  (3dm.f&d::vc a b))

(3dm-def::defsealed vc ((a 3dm.f::vec3) (b 3dm.f::vec3))
  (3dm.f::vc a b))

(3dm-def::defsealed vc ((a 3dm.d::vec3) (b 3dm.rat::vec3))
  (3dm.d&rat::vc a b))

(3dm-def::defsealed vc ((a 3dm.rat::vec3) (b 3dm.d::vec3))
  (3dm.rat&d::vc a b))

(3dm-def::defsealed vc ((a 3dm.rat::vec3) (b 3dm.rat::vec3))
  (3dm.rat::vc a b))

(3dm-def::define-vec2-vangle-function cl:double-float :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.d:vec2) (b 3dm.d:vec2))
  (3dm.d::vec2-vangle a b))

(3dm-def::define-vec2-vangle-function cl:double-float :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed vangle ((a 3dm.d:vec2) (b 3dm.f:vec2))
  (3dm.d&f::vec2-vangle a b))

(3dm-def::define-vec2-vangle-function cl:double-float :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.f:vec2) (b 3dm.d:vec2))
  (3dm.f&d::vec2-vangle a b))

(3dm-def::define-vec2-vangle-function cl:single-float :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed vangle ((a 3dm.f:vec2) (b 3dm.f:vec2))
  (3dm.f::vec2-vangle a b))

(3dm-def::define-vec2-vangle-function cl:double-float :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed vangle ((a 3dm.rat:vec2) (b 3dm.rat:vec2))
  (3dm.rat::vec2-vangle a b))

(3dm-def::define-vec2-vangle-function cl:double-float :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed vangle ((a 3dm.rat:vec2) (b 3dm.d:vec2))
  (3dm.d&rat::vec2-vangle a b))

(3dm-def::define-vec2-vangle-function cl:double-float :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.d:vec2) (b 3dm.rat:vec2))
  (3dm.rat&d::vec2-vangle a b))

(3dm-def::define-vec3-vangle-function cl:double-float :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.d:vec3) (b 3dm.d:vec3))
  (3dm.d::vec3-vangle a b))

(3dm-def::define-vec3-vangle-function cl:double-float :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed vangle ((a 3dm.d:vec3) (b 3dm.f:vec3))
  (3dm.d&f::vec3-vangle a b))

(3dm-def::define-vec3-vangle-function cl:double-float :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.f:vec3) (b 3dm.d:vec3))
  (3dm.f&d::vec3-vangle a b))

(3dm-def::define-vec3-vangle-function cl:single-float :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed vangle ((a 3dm.f:vec3) (b 3dm.f:vec3))
  (3dm.f::vec3-vangle a b))

(3dm-def::define-vec3-vangle-function cl:double-float :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed vangle ((a 3dm.rat:vec3) (b 3dm.rat:vec3))
  (3dm.rat::vec3-vangle a b))

(3dm-def::define-vec3-vangle-function cl:double-float :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed vangle ((a 3dm.d:vec3) (b 3dm.rat:vec3))
  (3dm.d&rat::vec3-vangle a b))

(3dm-def::define-vec3-vangle-function cl:double-float :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.rat:vec3) (b 3dm.d:vec3))
  (3dm.rat&d::vec3-vangle a b))
;;;
(3dm-def::define-vec4-vangle-function cl:double-float :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.d:vec4) (b 3dm.d:vec4))
  (3dm.d::vec4-vangle a b))

(3dm-def::define-vec4-vangle-function cl:double-float :3dm.d&f :3dm.d :3dm.f)

(3dm-def:defsealed vangle ((a 3dm.d:vec4) (b 3dm.f:vec4))
  (3dm.d&f::vec4-vangle a b))

(3dm-def::define-vec4-vangle-function cl:double-float :3dm.f&d :3dm.f :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.f:vec4) (b 3dm.d:vec4))
  (3dm.f&d::vec4-vangle a b))

(3dm-def::define-vec4-vangle-function cl:single-float :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed vangle ((a 3dm.f:vec4) (b 3dm.f:vec4))
  (3dm.f::vec4-vangle a b))

(3dm-def::define-vec4-vangle-function cl:double-float :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed vangle ((a 3dm.rat:vec4) (b 3dm.rat:vec4))
  (3dm.rat::vec4-vangle a b))

(3dm-def::define-vec4-vangle-function cl:double-float :3dm.d&rat :3dm.d :3dm.rat)

(3dm-def:defsealed vangle ((a 3dm.d:vec4) (b 3dm.rat:vec4))
  (3dm.d&rat::vec4-vangle a b))

(3dm-def::define-vec4-vangle-function cl:double-float :3dm.rat&d :3dm.rat :3dm.d)

(3dm-def:defsealed vangle ((a 3dm.rat:vec4) (b 3dm.d:vec4))
  (3dm.rat&d::vec4-vangle a b))
;;;;;

(3dm-def:defsealed vunit ((vec 3dm.f::vec2))
  (binary-v/ vec (vlength vec)))

(3dm-def:defsealed vunit ((vec 3dm.f::vec3))
  (binary-v/ vec (vlength vec)))

(3dm-def:defsealed vunit ((vec 3dm.f::vec4))
  (binary-v/ vec (vlength vec)))
;;
(3dm-def:defsealed vunit ((vec 3dm.d::vec2))
  (binary-v/ vec (vlength vec)))

(3dm-def:defsealed vunit ((vec 3dm.d::vec3))
  (binary-v/ vec (vlength vec)))

(3dm-def:defsealed vunit ((vec 3dm.d::vec4))
  (binary-v/ vec (vlength vec)))
;;
(3dm-def:defsealed vunit ((vec 3dm.rat::vec2))
  (binary-v/ vec (vlength vec)))

(3dm-def:defsealed vunit ((vec 3dm.rat::vec3))
  (binary-v/ vec (vlength vec)))

(3dm-def:defsealed vunit ((vec 3dm.rat::vec4))
  (binary-v/ vec (vlength vec)))

;;;
(3dm-def:defsealed vcopy ((vec 3dm.d::vec2))
  (3dm.d::%vec2 (3dm.d::vx2 vec) (3dm.d::vy2 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.f::vec2))
  (3dm.f::%vec2 (3dm.f::vx2 vec) (3dm.f::vy2 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.rat::vec2))
  (3dm.rat::%vec2 (3dm.rat::vx2 vec) (3dm.rat::vy2 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.fix::vec2))
  (3dm.fix::%vec2 (3dm.fix::vx2 vec) (3dm.fix::vy2 vec)))
;;
(3dm-def:defsealed vcopy ((vec 3dm.d::vec3))
  (3dm.d::%vec3 (3dm.d::vx3 vec) (3dm.d::vy3 vec) (3dm.d::vz3 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.f::vec3))
  (3dm.f::%vec3 (3dm.f::vx3 vec) (3dm.f::vy3 vec) (3dm.f::vz3 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.rat::vec3))
  (3dm.rat::%vec3 (3dm.rat::vx3 vec) (3dm.rat::vy3 vec) (3dm.rat::vz3 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.fix::vec3))
  (3dm.fix::%vec3 (3dm.fix::vx3 vec) (3dm.fix::vy3 vec) (3dm.fix::vz3 vec)))
;;
(3dm-def:defsealed vcopy ((vec 3dm.d::vec4))
  (3dm.d::%vec4 (3dm.d::vx4 vec) (3dm.d::vy4 vec) (3dm.d::vz4 vec) (3dm.d::vw4 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.f::vec4))
  (3dm.f::%vec4 (3dm.f::vx4 vec) (3dm.f::vy4 vec) (3dm.f::vz4 vec) (3dm.f::vw4 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.rat::vec4))
  (3dm.rat::%vec4 (3dm.rat::vx4 vec) (3dm.rat::vy4 vec) (3dm.rat::vz4 vec) (3dm.rat::vw4 vec)))

(3dm-def:defsealed vcopy ((vec 3dm.fix::vec4))
  (3dm.fix::%vec4 (3dm.fix::vx4 vec) (3dm.fix::vy4 vec) (3dm.fix::vz4 vec) (3dm.fix::vw4 vec)))
;;;;

(3dm-def:defsealed orthogonalize ((u 3dm.d::vec3) (v 3dm.d::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.f::vec3) (v 3dm.f::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.d::vec3) (v 3dm.f::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.f::vec3) (v 3dm.d::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.rat::vec3) (v 3dm.rat::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.d::vec3) (v 3dm.rat::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.rat::vec3) (v 3dm.d::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.f::vec3) (v 3dm.rat::vec3))
  (vc (vc u v) u))

(3dm-def:defsealed orthogonalize ((u 3dm.rat::vec3) (v 3dm.f::vec3))
  (vc (vc u v) u))

;;;;
(3dm-def:defsealed lerp ((a vector) (b vector) (s real))
  (map 'vector
       #'+
       (map 'vector #'(lambda (value)
			(* (- 1 s) value)) a)
       (map 'vector #'(lambda (value)
			(* s value)) b)))

(3dm-def:defsealed lerp ((a list) (b list) (s real))
  (mapcar
   #'+
   (mapcar #'(lambda (value)
	       (* (- 1 s) value)) a)
   (mapcar #'(lambda (value)
	       (* s value)) b)))
;;;

(3dm-def::define-vec2-vlerp-macro :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec2) (b 3dm.d:vec2) (param real))
  (3dm.d::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec2) (b 3dm.f:vec2) (param real))
  (3dm.d&f::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.f&d :3dm.f :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.f:vec2) (b 3dm.d:vec2) (param real))
  (3dm.f&d::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:vec2) (b 3dm.f:vec2) (param real))
  (3dm.f::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.f&rat :3dm.f :3dm.rat :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:vec2) (b 3dm.rat:vec2) (param real))
  (3dm.f&rat::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.rat&f :3dm.rat :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.rat:vec2) (b 3dm.f:vec2) (param real))
  (3dm.rat&f::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.d&rat :3dm.d :3dm.rat :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec2) (b 3dm.rat:vec2) (param real))
  (3dm.d&rat::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.rat&d :3dm.rat :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.rat:vec2) (b 3dm.d:vec2) (param real))
  (3dm.rat&d::vec2-vlerp a b param))

(3dm-def::define-vec2-vlerp-macro :3dm.rat :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed lerp ((a 3dm.rat:vec2) (b 3dm.rat:vec2) (param real))
  (3dm.rat::vec2-vlerp a b param))

;;;;

(3dm-def::define-vec3-vlerp-macro :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec3) (b 3dm.d:vec3) (param real))
  (3dm.d::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec3) (b 3dm.f:vec3) (param real))
  (3dm.d&f::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.f&d :3dm.f :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.f:vec3) (b 3dm.d:vec3) (param real))
  (3dm.f&d::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:vec3) (b 3dm.f:vec3) (param real))
  (3dm.f::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.f&rat :3dm.f :3dm.rat :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:vec3) (b 3dm.rat:vec3) (param real))
  (3dm.f&rat::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.rat&f :3dm.rat :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.rat:vec3) (b 3dm.f:vec3) (param real))
  (3dm.rat&f::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.d&rat :3dm.d :3dm.rat :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec3) (b 3dm.rat:vec3) (param real))
  (3dm.d&rat::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.rat&d :3dm.rat :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.rat:vec3) (b 3dm.d:vec3) (param real))
  (3dm.rat&d::vec3-vlerp a b param))

(3dm-def::define-vec3-vlerp-macro :3dm.rat :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed lerp ((a 3dm.rat:vec3) (b 3dm.rat:vec3) (param real))
  (3dm.rat::vec3-vlerp a b param))
;;;;;

(3dm-def::define-vec4-vlerp-macro :3dm.d :3dm.d :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec4) (b 3dm.d:vec4) (param real))
  (3dm.d::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.d&f :3dm.d :3dm.f :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec4) (b 3dm.f:vec4) (param real))
  (3dm.d&f::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.f&d :3dm.f :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.f:vec4) (b 3dm.d:vec4) (param real))
  (3dm.f&d::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.f :3dm.f :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:vec4) (b 3dm.f:vec4) (param real))
  (3dm.f::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.f&rat :3dm.f :3dm.rat :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.f:vec4) (b 3dm.rat:vec4) (param real))
  (3dm.f&rat::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.rat&f :3dm.rat :3dm.f :3dm.f)

(3dm-def:defsealed lerp ((a 3dm.rat:vec4) (b 3dm.f:vec4) (param real))
  (3dm.rat&f::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.d&rat :3dm.d :3dm.rat :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.d:vec4) (b 3dm.rat:vec4) (param real))
  (3dm.d&rat::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.rat&d :3dm.rat :3dm.d :3dm.d)

(3dm-def:defsealed lerp ((a 3dm.rat:vec4) (b 3dm.d:vec4) (param real))
  (3dm.rat&d::vec4-vlerp a b param))

(3dm-def::define-vec4-vlerp-macro :3dm.rat :3dm.rat :3dm.rat :3dm.rat)

(3dm-def:defsealed lerp ((a 3dm.rat:vec4) (b 3dm.rat:vec4) (param real))
  (3dm.rat::vec4-vlerp a b param))

(3dm-def:defsealed coerce-to-double-float ((v 3dm.d::vec2))
  v)

(3dm-def:defsealed coerce-to-double-float ((v 3dm.d::vec3))
  v)

(3dm-def:defsealed coerce-to-double-float ((v 3dm.d::vec4))
  v)

(3dm-def:defsealed coerce-to-double-float ((v 3dm.f::vec2))
  (3dm.d::vec2 (vx v) (vy v)))

(3dm-def:defsealed coerce-to-double-float ((v 3dm.f::vec3))
  (3dm.d::vec3 (vx v) (vy v) (vz v)))

(3dm-def:defsealed coerce-to-double-float ((v 3dm.f::vec4))
  (3dm.d::vec4 (vx v) (vy v) (vz v) (vw v)))

(3dm-def:defsealed coerce-to-double-float ((v 3dm.rat::vec2))
  (3dm.d::vec2 (vx v) (vy v)))

(3dm-def:defsealed coerce-to-double-float ((v 3dm.rat::vec3))
  (3dm.d::vec3 (vx v) (vy v) (vz v)))

(3dm-def:defsealed coerce-to-double-float ((v 3dm.rat::vec4))
  (3dm.d::vec4 (vx v) (vy v) (vz v) (vw v)))

(3dm-def:defsealed coerce-to-double-float ((number double-float))
  number)

(3dm-def:defsealed coerce-to-double-float ((number single-float))
  (coerce number 'double-float))

(3dm-def:defsealed coerce-to-double-float ((number rational))
  (coerce number 'double-float))

(3dm-def:defsealed coerce-to-single-float ((v 3dm.f::vec2))
  v)

(3dm-def:defsealed coerce-to-single-float ((v 3dm.f::vec3))
  v)

(3dm-def:defsealed coerce-to-single-float ((v 3dm.f::vec4))
  v)

(3dm-def:defsealed coerce-to-single-float ((v 3dm.d::vec2))
  (3dm.f::vec2 (vx v) (vy v)))

(3dm-def:defsealed coerce-to-single-float ((v 3dm.d::vec3))
  (3dm.f::vec3 (vx v) (vy v) (vz v)))

(3dm-def:defsealed coerce-to-single-float ((v 3dm.d::vec4))
  (3dm.f::vec4 (vx v) (vy v) (vz v) (vw v)))

(3dm-def:defsealed coerce-to-single-float ((v 3dm.rat::vec2))
  (3dm.f::vec2 (vx v) (vy v)))

(3dm-def:defsealed coerce-to-single-float ((v 3dm.rat::vec3))
  (3dm.f::vec3 (vx v) (vy v) (vz v)))

(3dm-def:defsealed coerce-to-single-float ((v 3dm.rat::vec4))
  (3dm.f::vec4 (vx v) (vy v) (vz v) (vw v)))

(3dm-def:defsealed coerce-to-single-float ((number single-float))
  number)

(3dm-def:defsealed coerce-to-single-float ((number double-float))
  (3dm-def::clampf number))

(3dm-def:defsealed coerce-to-single-float ((number rational))
  (3dm-def::clampf number))


