(in-package :3dm)

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

;; qw

(3dm-def:defsealed qw ((quat 3dm.f:quat))
  (3dm.f::qw quat))

(3dm-def:defsealed qw ((quat 3dm.d:quat))
  (3dm.d::qw quat))

(3dm-def:defsealed qw ((quat 3dm.rat:quat))
  (3dm.rat::qw quat))

(3dm-def:defsealed qw ((quat list))
  (cadddr quat))

(3dm-def:defsealed qw ((quat vector))
  (aref quat 3))

;; veccomps

(3dm-def:define-binary-op-macro cl:double-float :3dm.d :3dm.d :3dm.d)
(3dm-def:define-binary-op-macro cl:double-float :3dm.d&f :3dm.d :3dm.f)
(3dm-def:define-binary-op-macro cl:double-float :3dm.d&rat :3dm.d :3dm.rat)
(3dm-def:define-binary-op-macro cl:double-float :3dm.d&fix :3dm.d :3dm.fix)
(3dm-def:define-binary-op-macro cl:double-float :3dm.f :3dm.f :3dm.f)
(3dm-def:define-binary-op-macro cl:double-float :3dm.f&d :3dm.f :3dm.d)
(3dm-def:define-binary-op-macro cl:double-float :3dm.f&rat :3dm.f :3dm.rat)
(3dm-def:define-binary-op-macro cl:double-float :3dm.f&fix :3dm.f :3dm.fix)
(3dm-def:define-binary-op-macro cl:double-float :3dm.rat :3dm.rat :3dm.rat)
(3dm-def:define-binary-op-macro cl:double-float :3dm.rat&d :3dm.rat :3dm.d)
(3dm-def:define-binary-op-macro cl:double-float :3dm.rat&f :3dm.rat :3dm.f)
(3dm-def:define-binary-op-macro cl:double-float :3dm.rat&fix :3dm.rat :3dm.fix)
(3dm-def:define-binary-op-macro cl:double-float :3dm.fix :3dm.fix :3dm.fix)
(3dm-def:define-binary-op-macro cl:double-float :3dm.fix&d :3dm.fix :3dm.d)
(3dm-def:define-binary-op-macro cl:double-float :3dm.fix&f :3dm.fix :3dm.f)
(3dm-def:define-binary-op-macro cl:double-float :3dm.fix&rat :3dm.fix :3dm.rat)

(3dm-def:define-define-veccomp-macro :3dm.d :3dm.d :3dm.d)
(3dm-def:define-define-veccomp-macro :3dm.d&f :3dm.d :3dm.f)
(3dm-def:define-define-veccomp-macro :3dm.d&rat :3dm.d :3dm.rat)
(3dm-def:define-define-veccomp-macro :3dm.d&fix :3dm.d :3dm.fix)
(3dm-def:define-define-veccomp-macro :3dm.f :3dm.f :3dm.f)
(3dm-def:define-define-veccomp-macro :3dm.f&d :3dm.f :3dm.d)
(3dm-def:define-define-veccomp-macro :3dm.f&rat :3dm.f :3dm.rat)
(3dm-def:define-define-veccomp-macro :3dm.f&fix :3dm.f :3dm.fix)
(3dm-def:define-define-veccomp-macro :3dm.rat :3dm.rat :3dm.rat)
(3dm-def:define-define-veccomp-macro :3dm.rat&d :3dm.rat :3dm.d)
(3dm-def:define-define-veccomp-macro :3dm.rat&f :3dm.rat :3dm.f)
(3dm-def:define-define-veccomp-macro :3dm.rat&fix :3dm.rat :3dm.fix)
(3dm-def:define-define-veccomp-macro :3dm.fix :3dm.fix :3dm.fix)
(3dm-def:define-define-veccomp-macro :3dm.fix&d :3dm.fix :3dm.d)
(3dm-def:define-define-veccomp-macro :3dm.fix&f :3dm.fix :3dm.f)
(3dm-def:define-define-veccomp-macro :3dm.fix&rat :3dm.fix :3dm.rat)

(3dm.d::define-veccomp v= cl:=)
(3dm.d&f::define-veccomp v= cl:=)
(3dm.d&rat::define-veccomp v= cl:=)
(3dm.d&fix::define-veccomp v= cl:=)

(3dm.f::define-veccomp v= cl:=)
(3dm.f&d::define-veccomp v= cl:=)
(3dm.f&rat::define-veccomp v= cl:=)
(3dm.f&fix::define-veccomp v= cl:=)

(3dm.rat::define-veccomp v= cl:=)
(3dm.rat&d::define-veccomp v= cl:=)
(3dm.rat&f::define-veccomp v= cl:=)
(3dm.rat&fix::define-veccomp v= cl:=)

(3dm.fix::define-veccomp v= cl:=)
(3dm.fix&d::define-veccomp v= cl:=)
(3dm.fix&f::define-veccomp v= cl:=)
(3dm.fix&rat::define-veccomp v= cl:=)

(3dm.d::define-veccomp v/= cl:/= cl:or)
(3dm.d&f::define-veccomp v/= cl:/= cl:or)
(3dm.d&rat::define-veccomp v/= cl:/= cl:or)
(3dm.d&fix::define-veccomp v/= cl:/= cl:or)

(3dm.f::define-veccomp v/= cl:/= cl:or)
(3dm.f&d::define-veccomp v/= cl:/= cl:or)
(3dm.f&rat::define-veccomp v/= cl:/= cl:or)
(3dm.f&fix::define-veccomp v/= cl:/= cl:or)

(3dm.rat::define-veccomp v/= cl:/= cl:or)
(3dm.rat&d::define-veccomp v/= cl:/= cl:or)
(3dm.rat&f::define-veccomp v/= cl:/= cl:or)
(3dm.rat&fix::define-veccomp v/= cl:/= cl:or)

(3dm.fix::define-veccomp v/= cl:/= cl:or)
(3dm.fix&d::define-veccomp v/= cl:/= cl:or)
(3dm.fix&f::define-veccomp v/= cl:/= cl:or)
(3dm.fix&rat::define-veccomp v/= cl:/= cl:or)

(3dm.d::define-veccomp v< cl:<)
(3dm.d&f::define-veccomp v< cl:<)
(3dm.d&rat::define-veccomp v< cl:<)
(3dm.d&fix::define-veccomp v< cl:<)

(3dm.f::define-veccomp v< cl:<)
(3dm.f&d::define-veccomp v< cl:<)
(3dm.f&rat::define-veccomp v< cl:<)
(3dm.f&fix::define-veccomp v< cl:<)

(3dm.rat::define-veccomp v< cl:<)
(3dm.rat&d::define-veccomp v< cl:<)
(3dm.rat&f::define-veccomp v< cl:<)
(3dm.rat&fix::define-veccomp v< cl:<)

(3dm.fix::define-veccomp v< cl:<)
(3dm.fix&d::define-veccomp v< cl:<)
(3dm.fix&f::define-veccomp v< cl:<)
(3dm.fix&rat::define-veccomp v< cl:<)

(3dm.d::define-veccomp v<= cl:<=)
(3dm.d&f::define-veccomp v<= cl:<=)
(3dm.d&rat::define-veccomp v<= cl:<=)
(3dm.d&fix::define-veccomp v<= cl:<=)

(3dm.f::define-veccomp v<= cl:<=)
(3dm.f&d::define-veccomp v<= cl:<=)
(3dm.f&rat::define-veccomp v<= cl:<=)
(3dm.f&fix::define-veccomp v<= cl:<=)

(3dm.rat::define-veccomp v<= cl:<=)
(3dm.rat&d::define-veccomp v<= cl:<=)
(3dm.rat&f::define-veccomp v<= cl:<=)
(3dm.rat&fix::define-veccomp v<= cl:<=)

(3dm.fix::define-veccomp v<= cl:<=)
(3dm.fix&d::define-veccomp v<= cl:<=)
(3dm.fix&f::define-veccomp v<= cl:<=)
(3dm.fix&rat::define-veccomp v<= cl:<=)

(3dm.d::define-veccomp v> cl:>)
(3dm.d&f::define-veccomp v> cl:>)
(3dm.d&rat::define-veccomp v> cl:>)
(3dm.d&fix::define-veccomp v> cl:>)

(3dm.f::define-veccomp v> cl:>)
(3dm.f&d::define-veccomp v> cl:>)
(3dm.f&rat::define-veccomp v> cl:>)
(3dm.f&fix::define-veccomp v> cl:>)

(3dm.rat::define-veccomp v> cl:>)
(3dm.rat&d::define-veccomp v> cl:>)
(3dm.rat&f::define-veccomp v> cl:>)
(3dm.rat&fix::define-veccomp v> cl:>)

(3dm.fix::define-veccomp v> cl:>)
(3dm.fix&d::define-veccomp v> cl:>)
(3dm.fix&f::define-veccomp v> cl:>)
(3dm.fix&rat::define-veccomp v> cl:>)

(3dm.d::define-veccomp v>= cl:>=)
(3dm.d&f::define-veccomp v>= cl:>=)
(3dm.d&rat::define-veccomp v>= cl:>=)
(3dm.d&fix::define-veccomp v>= cl:>=)

(3dm.f::define-veccomp v>= cl:>=)
(3dm.f&d::define-veccomp v>= cl:>=)
(3dm.f&rat::define-veccomp v>= cl:>=)
(3dm.f&fix::define-veccomp v>= cl:>=)

(3dm.rat::define-veccomp v>= cl:>=)
(3dm.rat&d::define-veccomp v>= cl:>=)
(3dm.rat&f::define-veccomp v>= cl:>=)
(3dm.rat&fix::define-veccomp v>= cl:>=)

(3dm.fix::define-veccomp v>= cl:>=)
(3dm.fix&d::define-veccomp v>= cl:>=)
(3dm.fix&f::define-veccomp v>= cl:>=)
(3dm.fix&rat::define-veccomp v>= cl:>=)

;; binary-v=
(3dm-def:defsealed binary-v= ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (3dm.d::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (3dm.d&f::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d::vec2) (b 3dm.rat::vec2))
  (3dm.d&rat::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.d::vec2) (b 3dm.fix::vec2))
  (3dm.d&fix::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (3dm.f::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (3dm.f&d::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f::vec2) (b 3dm.rat::vec2))
  (3dm.f&rat::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.f::vec2) (b 3dm.fix::vec2))
  (3dm.f&fix::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (3dm.rat::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec2) (b 3dm.d::vec2))
  (3dm.rat&d::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec2) (b 3dm.f::vec2))
  (3dm.rat&f::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.rat::vec2) (b 3dm.fix::vec2))
  (3dm.rat&fix::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.fix::vec2) (b 3dm.fix::vec2))
  (3dm.fix::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.fix::vec2) (b 3dm.d::vec2))
  (3dm.fix&d::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.fix::vec2) (b 3dm.f::vec2))
  (3dm.fix&f::binary-v= a b))

(3dm-def:defsealed binary-v= ((a 3dm.fix::vec2) (b 3dm.rat::vec2))
  (3dm.fix&rat::binary-v= a b))

(3dm-def::define-ofun v= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v= prev next)))

(define-compiler-macro v= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v= ,prev ,next))))

;; binary-v/=
(3dm-def:defsealed binary-v/= ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (3dm.d::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (3dm.d&f::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d::vec2) (b 3dm.rat::vec2))
  (3dm.d&rat::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.d::vec2) (b 3dm.fix::vec2))
  (3dm.d&fix::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (3dm.f::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (3dm.f&d::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f::vec2) (b 3dm.rat::vec2))
  (3dm.f&rat::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.f::vec2) (b 3dm.fix::vec2))
  (3dm.f&fix::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (3dm.rat::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec2) (b 3dm.d::vec2))
  (3dm.rat&d::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec2) (b 3dm.f::vec2))
  (3dm.rat&f::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.rat::vec2) (b 3dm.fix::vec2))
  (3dm.rat&fix::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.fix::vec2) (b 3dm.fix::vec2))
  (3dm.fix::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.fix::vec2) (b 3dm.d::vec2))
  (3dm.fix&d::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.fix::vec2) (b 3dm.f::vec2))
  (3dm.fix&f::binary-v/= a b))

(3dm-def:defsealed binary-v/= ((a 3dm.fix::vec2) (b 3dm.rat::vec2))
  (3dm.fix&rat::binary-v/= a b))

(3dm-def::define-ofun v/= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v/= prev next)))

(define-compiler-macro v/= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v/= ,prev ,next))))

;; binary-v<
(3dm-def:defsealed binary-v< ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (3dm.d::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (3dm.d&f::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d::vec2) (b 3dm.rat::vec2))
  (3dm.d&rat::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.d::vec2) (b 3dm.fix::vec2))
  (3dm.d&fix::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (3dm.f::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (3dm.f&d::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f::vec2) (b 3dm.rat::vec2))
  (3dm.f&rat::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.f::vec2) (b 3dm.fix::vec2))
  (3dm.f&fix::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (3dm.rat::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec2) (b 3dm.d::vec2))
  (3dm.rat&d::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec2) (b 3dm.f::vec2))
  (3dm.rat&f::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.rat::vec2) (b 3dm.fix::vec2))
  (3dm.rat&fix::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.fix::vec2) (b 3dm.fix::vec2))
  (3dm.fix::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.fix::vec2) (b 3dm.d::vec2))
  (3dm.fix&d::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.fix::vec2) (b 3dm.f::vec2))
  (3dm.fix&f::binary-v< a b))

(3dm-def:defsealed binary-v< ((a 3dm.fix::vec2) (b 3dm.rat::vec2))
  (3dm.fix&rat::binary-v< a b))

(3dm-def::define-ofun v< (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v< prev next)))

(define-compiler-macro v< (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v< ,prev ,next))))

;; binary-v<=
(3dm-def:defsealed binary-v<= ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (3dm.d::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (3dm.d&f::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d::vec2) (b 3dm.rat::vec2))
  (3dm.d&rat::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.d::vec2) (b 3dm.fix::vec2))
  (3dm.d&fix::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (3dm.f::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (3dm.f&d::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f::vec2) (b 3dm.rat::vec2))
  (3dm.f&rat::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.f::vec2) (b 3dm.fix::vec2))
  (3dm.f&fix::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (3dm.rat::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec2) (b 3dm.d::vec2))
  (3dm.rat&d::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec2) (b 3dm.f::vec2))
  (3dm.rat&f::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.rat::vec2) (b 3dm.fix::vec2))
  (3dm.rat&fix::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.fix::vec2) (b 3dm.fix::vec2))
  (3dm.fix::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.fix::vec2) (b 3dm.d::vec2))
  (3dm.fix&d::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.fix::vec2) (b 3dm.f::vec2))
  (3dm.fix&f::binary-v<= a b))

(3dm-def:defsealed binary-v<= ((a 3dm.fix::vec2) (b 3dm.rat::vec2))
  (3dm.fix&rat::binary-v<= a b))

(3dm-def::define-ofun v<= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v<= prev next)))

(define-compiler-macro v<= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v<= ,prev ,next))))

;; binary-v>
(3dm-def:defsealed binary-v> ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (3dm.d::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (3dm.d&f::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d::vec2) (b 3dm.rat::vec2))
  (3dm.d&rat::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.d::vec2) (b 3dm.fix::vec2))
  (3dm.d&fix::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (3dm.f::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (3dm.f&d::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f::vec2) (b 3dm.rat::vec2))
  (3dm.f&rat::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.f::vec2) (b 3dm.fix::vec2))
  (3dm.f&fix::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (3dm.rat::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec2) (b 3dm.d::vec2))
  (3dm.rat&d::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec2) (b 3dm.f::vec2))
  (3dm.rat&f::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.rat::vec2) (b 3dm.fix::vec2))
  (3dm.rat&fix::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.fix::vec2) (b 3dm.fix::vec2))
  (3dm.fix::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.fix::vec2) (b 3dm.d::vec2))
  (3dm.fix&d::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.fix::vec2) (b 3dm.f::vec2))
  (3dm.fix&f::binary-v> a b))

(3dm-def:defsealed binary-v> ((a 3dm.fix::vec2) (b 3dm.rat::vec2))
  (3dm.fix&rat::binary-v> a b))

(3dm-def::define-ofun v> (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v> prev next)))

(define-compiler-macro v> (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v> ,prev ,next))))

;; binary-v>=
(3dm-def:defsealed binary-v>= ((a 3dm.d::vec2) (b 3dm.d::vec2))
  (3dm.d::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d::vec2) (b 3dm.f::vec2))
  (3dm.d&f::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d::vec2) (b 3dm.rat::vec2))
  (3dm.d&rat::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.d::vec2) (b 3dm.fix::vec2))
  (3dm.d&fix::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f::vec2) (b 3dm.f::vec2))
  (3dm.f::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f::vec2) (b 3dm.d::vec2))
  (3dm.f&d::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f::vec2) (b 3dm.rat::vec2))
  (3dm.f&rat::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.f::vec2) (b 3dm.fix::vec2))
  (3dm.f&fix::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec2) (b 3dm.rat::vec2))
  (3dm.rat::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec2) (b 3dm.d::vec2))
  (3dm.rat&d::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec2) (b 3dm.f::vec2))
  (3dm.rat&f::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.rat::vec2) (b 3dm.fix::vec2))
  (3dm.rat&fix::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.fix::vec2) (b 3dm.fix::vec2))
  (3dm.fix::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.fix::vec2) (b 3dm.d::vec2))
  (3dm.fix&d::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.fix::vec2) (b 3dm.f::vec2))
  (3dm.fix&f::binary-v>= a b))

(3dm-def:defsealed binary-v>= ((a 3dm.fix::vec2) (b 3dm.rat::vec2))
  (3dm.fix&rat::binary-v>= a b))

(3dm-def::define-ofun v>= (val &rest vals)
  (loop for prev = val then next
	for next in vals
	always (binary-v>= prev next)))

(define-compiler-macro v>= (val &rest vals)
  `(and ,@(loop for prev = val then next
		for next in vals
		collect `(binary-v>= ,prev ,next))))

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
  (3dm.d::vec2-vlength v))

(3dm-def:defsealed vlength ((v 3dm.d::vec3))
  (3dm.d::vec3-vlength v))

(3dm-def:defsealed vlength ((v 3dm.d::vec4))
  (3dm.d::vec4-vlength v))

(3dm-def:defsealed vlength ((v 3dm.f::vec2))
  (3dm.f::vec2-vlength v))

(3dm-def:defsealed vlength ((v 3dm.f::vec3))
  (3dm.f::vec3-vlength v))

(3dm-def:defsealed vlength ((v 3dm.f::vec4))
  (3dm.f::vec4-vlength v))

(3dm-def:defsealed v2norm ((v 3dm.d::vec2))
  (3dm.d::vec2-v2norm v))

(3dm-def:defsealed v2norm ((v 3dm.d::vec3))
  (3dm.d::vec3-v2norm v))

(3dm-def:defsealed v2norm ((v 3dm.d::vec4))
  (3dm.d::vec4-v2norm v))

(3dm-def:defsealed v2norm ((v 3dm.f::vec2))
  (3dm.f::vec2-v2norm v))

(3dm-def:defsealed v2norm ((v 3dm.f::vec3))
  (3dm.f::vec3-v2norm v))

(3dm-def:defsealed v2norm ((v 3dm.f::vec4))
  (3dm.f::vec4-v2norm v))


