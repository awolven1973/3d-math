;;;; The old precision namespaces now contain coercing constructors and
;;;; compatibility functions, not independent runtime classes.
(cl:in-package :3dm-def)

(defun port-with-vec-expansion (vars value body kind &optional any-dimension)
  (let ((obj (gensym "VEC")) (components (gensym "COMPONENTS")))
    `(let* ((,obj ,value)
            (,components (if (realp ,obj)
                             (make-list ,(length vars) :initial-element ,obj)
                             (3dm::port-components ,obj))))
       ,@(unless any-dimension
           `((unless (= (length ,components) ,(length vars))
               (error "Expected ~D vector components" ,(length vars)))))
       (let ,(loop for var in vars for i from 0
                   collect `(,var (3dm::port-coerce (or (nth ,i ,components) 0) ,kind)))
         ,@body))))

(cl:in-package :3dm.d)

(cl:defun mperspective-vulkan (fovy aspect-ratio near far)
  "Vulkan perspective projection with double-float coefficients; FOVY in degrees."
  (3dm.coalton:mperspective-vulkan-d
   (cl:coerce fovy 'cl:double-float)
   (cl:coerce aspect-ratio 'cl:double-float)
   (cl:coerce near 'cl:double-float)
   (cl:coerce far 'cl:double-float)))

(cl:defun mortho-vulkan (left right bottom top near far)
  "Vulkan orthographic projection with double-float coefficients."
  (3dm.coalton:mortho-vulkan-d
   (cl:coerce left 'cl:double-float) (cl:coerce right 'cl:double-float)
   (cl:coerce bottom 'cl:double-float) (cl:coerce top 'cl:double-float)
   (cl:coerce near 'cl:double-float) (cl:coerce far 'cl:double-float)))


(cl:defun vec2-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec2) (3dm::port-precision-p v :vec2 :d)))

(cl:deftype vec2 () '(cl:and 3dm.coalton:vec2 (cl:satisfies vec2-p)))

(cl:defun vec3-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec3) (3dm::port-precision-p v :vec3 :d)))

(cl:deftype vec3 () '(cl:and 3dm.coalton:vec3 (cl:satisfies vec3-p)))

(cl:defun vec4-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec4) (3dm::port-precision-p v :vec4 :d)))

(cl:deftype vec4 () '(cl:and 3dm.coalton:vec4 (cl:satisfies vec4-p)))

(cl:defun mat2-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat2) (3dm::port-precision-p v :mat2 :d)))

(cl:deftype mat2 () '(cl:and 3dm.coalton:mat2 (cl:satisfies mat2-p)))

(cl:defun mat3-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat3) (3dm::port-precision-p v :mat3 :d)))

(cl:deftype mat3 () '(cl:and 3dm.coalton:mat3 (cl:satisfies mat3-p)))

(cl:defun mat4-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat4) (3dm::port-precision-p v :mat4 :d)))

(cl:deftype mat4 () '(cl:and 3dm.coalton:mat4 (cl:satisfies mat4-p)))

(cl:defun matn-p (v)
  (cl:and (cl:typep v '3dm.coalton:matn) (3dm::port-precision-p v :matn :d)))

(cl:deftype matn () '(cl:and 3dm.coalton:matn (cl:satisfies matn-p)))

(cl:defun quat-p (v)
  (cl:and (cl:typep v '3dm.coalton:quat) (3dm::port-precision-p v :quat :d)))

(cl:deftype quat () '(cl:and 3dm.coalton:quat (cl:satisfies quat-p)))

(cl:defun dquat-p (v)
  (cl:and (cl:typep v '3dm.coalton:dquat) (3dm::port-precision-p v :dquat :d)))

(cl:deftype dquat () '(cl:and 3dm.coalton:dquat (cl:satisfies dquat-p)))

(cl:deftype vec () '(cl:or vec2 vec3 vec4))
(cl:deftype mat () '(cl:or mat2 mat3 mat4 matn))

(cl:declaim (cl:inline vec2 %vec2))
(cl:defun vec2 (x y)
  (3dm.coalton:vec2 (cl:coerce x 'cl:double-float) (cl:coerce y 'cl:double-float)))
(cl:defun %vec2 (x y) (vec2 x y))

(cl:declaim (cl:inline vx2))
(cl:defun vx2 (v) (3dm.coalton::vec2-component-0 v))

(cl:declaim (cl:inline vy2))
(cl:defun vy2 (v) (3dm.coalton::vec2-component-1 v))

(cl:defun vcopy2 (v) (3dm:vcopy v))

(cl:defmacro with-vec2 ((x y) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y) value body :d))

(cl:defun mat2 (cl:&rest elements)
  (3dm::port-fixed-matrix 2 :d elements))
(cl:defun %mat2 () (mat2))

(cl:defun marr2 (m) (3dm::port-storage m))

(cl:defun mdet-mat2 (m) (3dm:mdet m))

(cl:defun minv-mat2 (m) (3dm:minv m))

(cl:defun mat2-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat2-mrow (m i) (3dm:mrow m i))

(cl:defun vec2-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec2-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat2-vec2 (m v) (3dm:m* m v))
(cl:defun m*-mat2-mat2 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec3 %vec3))
(cl:defun vec3 (x y z)
  (3dm.coalton:vec3 (cl:coerce x 'cl:double-float) (cl:coerce y 'cl:double-float) (cl:coerce z 'cl:double-float)))
(cl:defun %vec3 (x y z) (vec3 x y z))

(cl:declaim (cl:inline vx3))
(cl:defun vx3 (v) (3dm.coalton::vec3-component-0 v))

(cl:declaim (cl:inline vy3))
(cl:defun vy3 (v) (3dm.coalton::vec3-component-1 v))

(cl:declaim (cl:inline vz3))
(cl:defun vz3 (v) (3dm.coalton::vec3-component-2 v))

(cl:defun vcopy3 (v) (3dm:vcopy v))

(cl:defmacro with-vec3 ((x y z) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z) value body :d))

(cl:defun mat3 (cl:&rest elements)
  (3dm::port-fixed-matrix 3 :d elements))
(cl:defun %mat3 () (mat3))

(cl:defun marr3 (m) (3dm::port-storage m))

(cl:defun mdet-mat3 (m) (3dm:mdet m))

(cl:defun minv-mat3 (m) (3dm:minv m))

(cl:defun mat3-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat3-mrow (m i) (3dm:mrow m i))

(cl:defun vec3-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec3-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat3-vec3 (m v) (3dm:m* m v))
(cl:defun m*-mat3-mat3 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec4 %vec4))
(cl:defun vec4 (x y z w)
  (3dm.coalton:vec4 (cl:coerce x 'cl:double-float) (cl:coerce y 'cl:double-float) (cl:coerce z 'cl:double-float) (cl:coerce w 'cl:double-float)))
(cl:defun %vec4 (x y z w) (vec4 x y z w))

(cl:declaim (cl:inline vx4))
(cl:defun vx4 (v) (3dm.coalton::vec4-component-0 v))

(cl:declaim (cl:inline vy4))
(cl:defun vy4 (v) (3dm.coalton::vec4-component-1 v))

(cl:declaim (cl:inline vz4))
(cl:defun vz4 (v) (3dm.coalton::vec4-component-2 v))

(cl:declaim (cl:inline vw4))
(cl:defun vw4 (v) (3dm.coalton::vec4-component-3 v))

(cl:defun vcopy4 (v) (3dm:vcopy v))

(cl:defmacro with-vec4 ((x y z w) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :d))

(cl:defun mat4 (cl:&rest elements)
  (3dm::port-fixed-matrix 4 :d elements))
(cl:defun %mat4 () (mat4))

(cl:defun marr4 (m) (3dm::port-storage m))

(cl:defun mdet-mat4 (m) (3dm:mdet m))

(cl:defun minv-mat4 (m) (3dm:minv m))

(cl:defun mat4-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat4-mrow (m i) (3dm:mrow m i))

(cl:defun vec4-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec4-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat4-vec4 (m v) (3dm:m* m v))
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))

(cl:defmacro with-vec ((x y cl:&optional (z (cl:gensym "Z")) (w (cl:gensym "W"))) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :d cl:t))

(cl:defun matn (rows cols cl:&optional elements)
  (3dm::port-matn rows cols :d elements :column-major cl:t))
(cl:defun %matn (rows cols data)
  (3dm::port-matn rows cols :d data :column-major cl:t :fixed cl:nil))
(cl:defun marrn (m) (3dm::marr m))
(cl:defun marr (m) (3dm::marr m))
(cl:defun mrows (m) (3dm::port-dimensions m))
(cl:defun mcols (m) (cl:nth-value 1 (3dm::port-dimensions m)))
(cl:defun meye (n) (3dm::port-eye n :d))
(cl:defun quat (x y z w) (3dm.coalton:quat (cl:coerce x 'cl:double-float) (cl:coerce y 'cl:double-float) (cl:coerce z 'cl:double-float) (cl:coerce w 'cl:double-float)))
(cl:defun %quat (x y z w) (quat x y z w))
(cl:defun qcopy (q) (3dm::port-convert q (3dm::port-kind q) cl:t))
(cl:defun dquat (r d)
  (3dm.coalton:dquat (3dm::port-convert r :d) (3dm::port-convert d :d)))
(cl:defun %dquat (r d) (dquat r d))
(cl:defun qreal (q) (3dm.coalton::dquat-real q))
(cl:defun qdual (q) (3dm.coalton::dquat-dual q))
(cl:defun qx (q) (3dm.coalton::quat-component-0 q))
(cl:defun qy (q) (3dm.coalton::quat-component-1 q))
(cl:defun qz (q) (3dm.coalton::quat-component-2 q))
(cl:defun qw (q) (3dm.coalton::quat-component-3 q))
(cl:defparameter +vx+ (vec3 1 0 0))
(cl:defparameter +vy+ (vec3 0 1 0))
(cl:defparameter +vz+ (vec3 0 0 1))
(3dm-def::define-with-fast-matref cl:double-float)
(3dm-def::define-with-fast-matrefs)
(3dm-def::define-with-fast-matcase)
(3dm-def::define-do-mat-diag-macro)
(cl:defun mcol (m i) (3dm:mcol m i))
(cl:defun qconjugate (q) (3dm:qconjugate q))
(cl:defun quaternion-x-axis (q) (3dm:quaternion-x-axis q))
(cl:defun quaternion-y-axis (q) (3dm:quaternion-y-axis q))
(cl:defun quaternion-z-axis (q) (3dm:quaternion-z-axis q))
(cl:defun matrix-from-quaternion (q) (3dm:matrix-from-quaternion q))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.f)

(cl:defun mperspective-vulkan (fovy aspect-ratio near far)
  "Vulkan perspective projection with single-float coefficients; FOVY in degrees."
  (3dm.coalton:mperspective-vulkan-f
   (cl:coerce fovy 'cl:double-float)
   (3dm-def::clampf aspect-ratio)
   (3dm-def::clampf near)
   (3dm-def::clampf far)))

(cl:defun mortho-vulkan (left right bottom top near far)
  "Vulkan orthographic projection with single-float coefficients."
  (3dm.coalton:mortho-vulkan-f
   (3dm-def::clampf left) (3dm-def::clampf right)
   (3dm-def::clampf bottom) (3dm-def::clampf top)
   (3dm-def::clampf near) (3dm-def::clampf far)))


(cl:defun vec2-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec2) (3dm::port-precision-p v :vec2 :f)))

(cl:deftype vec2 () '(cl:and 3dm.coalton:vec2 (cl:satisfies vec2-p)))

(cl:defun vec3-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec3) (3dm::port-precision-p v :vec3 :f)))

(cl:deftype vec3 () '(cl:and 3dm.coalton:vec3 (cl:satisfies vec3-p)))

(cl:defun vec4-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec4) (3dm::port-precision-p v :vec4 :f)))

(cl:deftype vec4 () '(cl:and 3dm.coalton:vec4 (cl:satisfies vec4-p)))

(cl:defun mat2-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat2) (3dm::port-precision-p v :mat2 :f)))

(cl:deftype mat2 () '(cl:and 3dm.coalton:mat2 (cl:satisfies mat2-p)))

(cl:defun mat3-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat3) (3dm::port-precision-p v :mat3 :f)))

(cl:deftype mat3 () '(cl:and 3dm.coalton:mat3 (cl:satisfies mat3-p)))

(cl:defun mat4-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat4) (3dm::port-precision-p v :mat4 :f)))

(cl:deftype mat4 () '(cl:and 3dm.coalton:mat4 (cl:satisfies mat4-p)))

(cl:defun matn-p (v)
  (cl:and (cl:typep v '3dm.coalton:matn) (3dm::port-precision-p v :matn :f)))

(cl:deftype matn () '(cl:and 3dm.coalton:matn (cl:satisfies matn-p)))

(cl:defun quat-p (v)
  (cl:and (cl:typep v '3dm.coalton:quat) (3dm::port-precision-p v :quat :f)))

(cl:deftype quat () '(cl:and 3dm.coalton:quat (cl:satisfies quat-p)))

(cl:defun dquat-p (v)
  (cl:and (cl:typep v '3dm.coalton:dquat) (3dm::port-precision-p v :dquat :f)))

(cl:deftype dquat () '(cl:and 3dm.coalton:dquat (cl:satisfies dquat-p)))

(cl:deftype vec () '(cl:or vec2 vec3 vec4))
(cl:deftype mat () '(cl:or mat2 mat3 mat4 matn))

(cl:declaim (cl:inline vec2 %vec2))
(cl:defun vec2 (x y)
  (3dm.coalton:vec2 (3dm-def::clampf x) (3dm-def::clampf y)))
(cl:defun %vec2 (x y) (vec2 x y))

(cl:declaim (cl:inline vx2))
(cl:defun vx2 (v) (3dm.coalton::vec2-component-0 v))

(cl:declaim (cl:inline vy2))
(cl:defun vy2 (v) (3dm.coalton::vec2-component-1 v))

(cl:defun vcopy2 (v) (3dm:vcopy v))

(cl:defmacro with-vec2 ((x y) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y) value body :f))

(cl:defun mat2 (cl:&rest elements)
  (3dm::port-fixed-matrix 2 :f elements))
(cl:defun %mat2 () (mat2))

(cl:defun marr2 (m) (3dm::port-storage m))

(cl:defun mdet-mat2 (m) (3dm:mdet m))

(cl:defun minv-mat2 (m) (3dm:minv m))

(cl:defun mat2-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat2-mrow (m i) (3dm:mrow m i))

(cl:defun vec2-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec2-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat2-vec2 (m v) (3dm:m* m v))
(cl:defun m*-mat2-mat2 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec3 %vec3))
(cl:defun vec3 (x y z)
  (3dm.coalton:vec3 (3dm-def::clampf x) (3dm-def::clampf y) (3dm-def::clampf z)))
(cl:defun %vec3 (x y z) (vec3 x y z))

(cl:declaim (cl:inline vx3))
(cl:defun vx3 (v) (3dm.coalton::vec3-component-0 v))

(cl:declaim (cl:inline vy3))
(cl:defun vy3 (v) (3dm.coalton::vec3-component-1 v))

(cl:declaim (cl:inline vz3))
(cl:defun vz3 (v) (3dm.coalton::vec3-component-2 v))

(cl:defun vcopy3 (v) (3dm:vcopy v))

(cl:defmacro with-vec3 ((x y z) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z) value body :f))

(cl:defun mat3 (cl:&rest elements)
  (3dm::port-fixed-matrix 3 :f elements))
(cl:defun %mat3 () (mat3))

(cl:defun marr3 (m) (3dm::port-storage m))

(cl:defun mdet-mat3 (m) (3dm:mdet m))

(cl:defun minv-mat3 (m) (3dm:minv m))

(cl:defun mat3-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat3-mrow (m i) (3dm:mrow m i))

(cl:defun vec3-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec3-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat3-vec3 (m v) (3dm:m* m v))
(cl:defun m*-mat3-mat3 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec4 %vec4))
(cl:defun vec4 (x y z w)
  (3dm.coalton:vec4 (3dm-def::clampf x) (3dm-def::clampf y) (3dm-def::clampf z) (3dm-def::clampf w)))
(cl:defun %vec4 (x y z w) (vec4 x y z w))

(cl:declaim (cl:inline vx4))
(cl:defun vx4 (v) (3dm.coalton::vec4-component-0 v))

(cl:declaim (cl:inline vy4))
(cl:defun vy4 (v) (3dm.coalton::vec4-component-1 v))

(cl:declaim (cl:inline vz4))
(cl:defun vz4 (v) (3dm.coalton::vec4-component-2 v))

(cl:declaim (cl:inline vw4))
(cl:defun vw4 (v) (3dm.coalton::vec4-component-3 v))

(cl:defun vcopy4 (v) (3dm:vcopy v))

(cl:defmacro with-vec4 ((x y z w) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :f))

(cl:defun mat4 (cl:&rest elements)
  (3dm::port-fixed-matrix 4 :f elements))
(cl:defun %mat4 () (mat4))

(cl:defun marr4 (m) (3dm::port-storage m))

(cl:defun mdet-mat4 (m) (3dm:mdet m))

(cl:defun minv-mat4 (m) (3dm:minv m))

(cl:defun mat4-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat4-mrow (m i) (3dm:mrow m i))

(cl:defun vec4-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec4-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat4-vec4 (m v) (3dm:m* m v))
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))

(cl:defmacro with-vec ((x y cl:&optional (z (cl:gensym "Z")) (w (cl:gensym "W"))) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :f cl:t))

(cl:defun matn (rows cols cl:&optional elements)
  (3dm::port-matn rows cols :f elements :column-major cl:t))
(cl:defun %matn (rows cols data)
  (3dm::port-matn rows cols :f data :column-major cl:t :fixed cl:nil))
(cl:defun marrn (m) (3dm::marr m))
(cl:defun marr (m) (3dm::marr m))
(cl:defun mrows (m) (3dm::port-dimensions m))
(cl:defun mcols (m) (cl:nth-value 1 (3dm::port-dimensions m)))
(cl:defun meye (n) (3dm::port-eye n :f))
(cl:defun quat (x y z w) (3dm.coalton:quat (3dm-def::clampf x) (3dm-def::clampf y) (3dm-def::clampf z) (3dm-def::clampf w)))
(cl:defun %quat (x y z w) (quat x y z w))
(cl:defun qcopy (q) (3dm::port-convert q (3dm::port-kind q) cl:t))
(cl:defun dquat (r d)
  (3dm.coalton:dquat (3dm::port-convert r :f) (3dm::port-convert d :f)))
(cl:defun %dquat (r d) (dquat r d))
(cl:defun qreal (q) (3dm.coalton::dquat-real q))
(cl:defun qdual (q) (3dm.coalton::dquat-dual q))
(cl:defun qx (q) (3dm.coalton::quat-component-0 q))
(cl:defun qy (q) (3dm.coalton::quat-component-1 q))
(cl:defun qz (q) (3dm.coalton::quat-component-2 q))
(cl:defun qw (q) (3dm.coalton::quat-component-3 q))
(cl:defparameter +vx+ (vec3 1 0 0))
(cl:defparameter +vy+ (vec3 0 1 0))
(cl:defparameter +vz+ (vec3 0 0 1))
(3dm-def::define-with-fast-matref cl:single-float)
(3dm-def::define-with-fast-matrefs)
(3dm-def::define-with-fast-matcase)
(3dm-def::define-do-mat-diag-macro)
(cl:defun mcol (m i) (3dm:mcol m i))
(cl:defun qconjugate (q) (3dm:qconjugate q))
(cl:defun quaternion-x-axis (q) (3dm:quaternion-x-axis q))
(cl:defun quaternion-y-axis (q) (3dm:quaternion-y-axis q))
(cl:defun quaternion-z-axis (q) (3dm:quaternion-z-axis q))
(cl:defun matrix-from-quaternion (q) (3dm:matrix-from-quaternion q))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.rat)

(cl:defun vec2-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec2) (3dm::port-precision-p v :vec2 :r)))

(cl:deftype vec2 () '(cl:and 3dm.coalton:vec2 (cl:satisfies vec2-p)))

(cl:defun vec3-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec3) (3dm::port-precision-p v :vec3 :r)))

(cl:deftype vec3 () '(cl:and 3dm.coalton:vec3 (cl:satisfies vec3-p)))

(cl:defun vec4-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec4) (3dm::port-precision-p v :vec4 :r)))

(cl:deftype vec4 () '(cl:and 3dm.coalton:vec4 (cl:satisfies vec4-p)))

(cl:defun mat2-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat2) (3dm::port-precision-p v :mat2 :r)))

(cl:deftype mat2 () '(cl:and 3dm.coalton:mat2 (cl:satisfies mat2-p)))

(cl:defun mat3-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat3) (3dm::port-precision-p v :mat3 :r)))

(cl:deftype mat3 () '(cl:and 3dm.coalton:mat3 (cl:satisfies mat3-p)))

(cl:defun mat4-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat4) (3dm::port-precision-p v :mat4 :r)))

(cl:deftype mat4 () '(cl:and 3dm.coalton:mat4 (cl:satisfies mat4-p)))

(cl:defun matn-p (v)
  (cl:and (cl:typep v '3dm.coalton:matn) (3dm::port-precision-p v :matn :r)))

(cl:deftype matn () '(cl:and 3dm.coalton:matn (cl:satisfies matn-p)))

(cl:defun quat-p (v)
  (cl:and (cl:typep v '3dm.coalton:quat) (3dm::port-precision-p v :quat :r)))

(cl:deftype quat () '(cl:and 3dm.coalton:quat (cl:satisfies quat-p)))

(cl:defun dquat-p (v)
  (cl:and (cl:typep v '3dm.coalton:dquat) (3dm::port-precision-p v :dquat :r)))

(cl:deftype dquat () '(cl:and 3dm.coalton:dquat (cl:satisfies dquat-p)))

(cl:deftype vec () '(cl:or vec2 vec3 vec4))
(cl:deftype mat () '(cl:or mat2 mat3 mat4 matn))

(cl:declaim (cl:inline vec2 %vec2))
(cl:defun vec2 (x y)
  (3dm.coalton:vec2 (cl:rationalize x) (cl:rationalize y)))
(cl:defun %vec2 (x y) (vec2 x y))

(cl:declaim (cl:inline vx2))
(cl:defun vx2 (v) (3dm.coalton::vec2-component-0 v))

(cl:declaim (cl:inline vy2))
(cl:defun vy2 (v) (3dm.coalton::vec2-component-1 v))

(cl:defun vcopy2 (v) (3dm:vcopy v))

(cl:defmacro with-vec2 ((x y) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y) value body :r))

(cl:defun mat2 (cl:&rest elements)
  (3dm::port-fixed-matrix 2 :r elements))
(cl:defun %mat2 () (mat2))

(cl:defun marr2 (m) (3dm::port-storage m))

(cl:defun mdet-mat2 (m) (3dm:mdet m))

(cl:defun minv-mat2 (m) (3dm:minv m))

(cl:defun mat2-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat2-mrow (m i) (3dm:mrow m i))

(cl:defun vec2-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec2-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat2-vec2 (m v) (3dm:m* m v))
(cl:defun m*-mat2-mat2 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec3 %vec3))
(cl:defun vec3 (x y z)
  (3dm.coalton:vec3 (cl:rationalize x) (cl:rationalize y) (cl:rationalize z)))
(cl:defun %vec3 (x y z) (vec3 x y z))

(cl:declaim (cl:inline vx3))
(cl:defun vx3 (v) (3dm.coalton::vec3-component-0 v))

(cl:declaim (cl:inline vy3))
(cl:defun vy3 (v) (3dm.coalton::vec3-component-1 v))

(cl:declaim (cl:inline vz3))
(cl:defun vz3 (v) (3dm.coalton::vec3-component-2 v))

(cl:defun vcopy3 (v) (3dm:vcopy v))

(cl:defmacro with-vec3 ((x y z) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z) value body :r))

(cl:defun mat3 (cl:&rest elements)
  (3dm::port-fixed-matrix 3 :r elements))
(cl:defun %mat3 () (mat3))

(cl:defun marr3 (m) (3dm::port-storage m))

(cl:defun mdet-mat3 (m) (3dm:mdet m))

(cl:defun minv-mat3 (m) (3dm:minv m))

(cl:defun mat3-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat3-mrow (m i) (3dm:mrow m i))

(cl:defun vec3-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec3-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat3-vec3 (m v) (3dm:m* m v))
(cl:defun m*-mat3-mat3 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec4 %vec4))
(cl:defun vec4 (x y z w)
  (3dm.coalton:vec4 (cl:rationalize x) (cl:rationalize y) (cl:rationalize z) (cl:rationalize w)))
(cl:defun %vec4 (x y z w) (vec4 x y z w))

(cl:declaim (cl:inline vx4))
(cl:defun vx4 (v) (3dm.coalton::vec4-component-0 v))

(cl:declaim (cl:inline vy4))
(cl:defun vy4 (v) (3dm.coalton::vec4-component-1 v))

(cl:declaim (cl:inline vz4))
(cl:defun vz4 (v) (3dm.coalton::vec4-component-2 v))

(cl:declaim (cl:inline vw4))
(cl:defun vw4 (v) (3dm.coalton::vec4-component-3 v))

(cl:defun vcopy4 (v) (3dm:vcopy v))

(cl:defmacro with-vec4 ((x y z w) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :r))

(cl:defun mat4 (cl:&rest elements)
  (3dm::port-fixed-matrix 4 :r elements))
(cl:defun %mat4 () (mat4))

(cl:defun marr4 (m) (3dm::port-storage m))

(cl:defun mdet-mat4 (m) (3dm:mdet m))

(cl:defun minv-mat4 (m) (3dm:minv m))

(cl:defun mat4-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat4-mrow (m i) (3dm:mrow m i))

(cl:defun vec4-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec4-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat4-vec4 (m v) (3dm:m* m v))
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))

(cl:defmacro with-vec ((x y cl:&optional (z (cl:gensym "Z")) (w (cl:gensym "W"))) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :r cl:t))

(cl:defun matn (rows cols cl:&optional elements)
  (3dm::port-matn rows cols :r elements :column-major cl:t))
(cl:defun %matn (rows cols data)
  (3dm::port-matn rows cols :r data :column-major cl:t :fixed cl:nil))
(cl:defun marrn (m) (3dm::marr m))
(cl:defun marr (m) (3dm::marr m))
(cl:defun mrows (m) (3dm::port-dimensions m))
(cl:defun mcols (m) (cl:nth-value 1 (3dm::port-dimensions m)))
(cl:defun meye (n) (3dm::port-eye n :r))
(cl:defun quat (x y z w) (3dm.coalton:quat (cl:rationalize x) (cl:rationalize y) (cl:rationalize z) (cl:rationalize w)))
(cl:defun %quat (x y z w) (quat x y z w))
(cl:defun qcopy (q) (3dm::port-convert q (3dm::port-kind q) cl:t))
(cl:defun dquat (r d)
  (3dm.coalton:dquat (3dm::port-convert r :r) (3dm::port-convert d :r)))
(cl:defun %dquat (r d) (dquat r d))
(cl:defun qreal (q) (3dm.coalton::dquat-real q))
(cl:defun qdual (q) (3dm.coalton::dquat-dual q))
(cl:defun qx (q) (3dm.coalton::quat-component-0 q))
(cl:defun qy (q) (3dm.coalton::quat-component-1 q))
(cl:defun qz (q) (3dm.coalton::quat-component-2 q))
(cl:defun qw (q) (3dm.coalton::quat-component-3 q))
(cl:defparameter +vx+ (vec3 1 0 0))
(cl:defparameter +vy+ (vec3 0 1 0))
(cl:defparameter +vz+ (vec3 0 0 1))
(3dm-def::define-with-fast-matref cl:rational)
(3dm-def::define-with-fast-matrefs)
(3dm-def::define-with-fast-matcase)
(3dm-def::define-do-mat-diag-macro)
(cl:defun mcol (m i) (3dm:mcol m i))
(cl:defun qconjugate (q) (3dm:qconjugate q))
(cl:defun quaternion-x-axis (q) (3dm:quaternion-x-axis q))
(cl:defun quaternion-y-axis (q) (3dm:quaternion-y-axis q))
(cl:defun quaternion-z-axis (q) (3dm:quaternion-z-axis q))
(cl:defun matrix-from-quaternion (q) (3dm:matrix-from-quaternion q))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.fix)

(cl:defun vec2-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec2) (3dm::port-precision-p v :vec2 :fix)))

(cl:deftype vec2 () '(cl:and 3dm.coalton:vec2 (cl:satisfies vec2-p)))

(cl:defun vec3-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec3) (3dm::port-precision-p v :vec3 :fix)))

(cl:deftype vec3 () '(cl:and 3dm.coalton:vec3 (cl:satisfies vec3-p)))

(cl:defun vec4-p (v)
  (cl:and (cl:typep v '3dm.coalton:vec4) (3dm::port-precision-p v :vec4 :fix)))

(cl:deftype vec4 () '(cl:and 3dm.coalton:vec4 (cl:satisfies vec4-p)))

(cl:defun mat2-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat2) (3dm::port-precision-p v :mat2 :fix)))

(cl:deftype mat2 () '(cl:and 3dm.coalton:mat2 (cl:satisfies mat2-p)))

(cl:defun mat3-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat3) (3dm::port-precision-p v :mat3 :fix)))

(cl:deftype mat3 () '(cl:and 3dm.coalton:mat3 (cl:satisfies mat3-p)))

(cl:defun mat4-p (v)
  (cl:and (cl:typep v '3dm.coalton:mat4) (3dm::port-precision-p v :mat4 :fix)))

(cl:deftype mat4 () '(cl:and 3dm.coalton:mat4 (cl:satisfies mat4-p)))

(cl:defun matn-p (v)
  (cl:and (cl:typep v '3dm.coalton:matn) (3dm::port-precision-p v :matn :fix)))

(cl:deftype matn () '(cl:and 3dm.coalton:matn (cl:satisfies matn-p)))

(cl:defun quat-p (v)
  (cl:and (cl:typep v '3dm.coalton:quat) (3dm::port-precision-p v :quat :fix)))

(cl:deftype quat () '(cl:and 3dm.coalton:quat (cl:satisfies quat-p)))

(cl:defun dquat-p (v)
  (cl:and (cl:typep v '3dm.coalton:dquat) (3dm::port-precision-p v :dquat :fix)))

(cl:deftype dquat () '(cl:and 3dm.coalton:dquat (cl:satisfies dquat-p)))

(cl:deftype vec () '(cl:or vec2 vec3 vec4))
(cl:deftype mat () '(cl:or mat2 mat3 mat4 matn))

(cl:declaim (cl:inline vec2 %vec2))
(cl:defun vec2 (x y)
  (3dm.coalton:vec2 (cl:the cl:fixnum (cl:round x)) (cl:the cl:fixnum (cl:round y))))
(cl:defun %vec2 (x y) (vec2 x y))

(cl:declaim (cl:inline vx2))
(cl:defun vx2 (v) (3dm.coalton::vec2-component-0 v))

(cl:declaim (cl:inline vy2))
(cl:defun vy2 (v) (3dm.coalton::vec2-component-1 v))

(cl:defun vcopy2 (v) (3dm:vcopy v))

(cl:defmacro with-vec2 ((x y) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y) value body :fix))

(cl:defun mat2 (cl:&rest elements)
  (3dm::port-fixed-matrix 2 :fix elements))
(cl:defun %mat2 () (mat2))

(cl:defun marr2 (m) (3dm::port-storage m))

(cl:defun mdet-mat2 (m) (3dm:mdet m))

(cl:defun minv-mat2 (m) (3dm:minv m))

(cl:defun mat2-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat2-mrow (m i) (3dm:mrow m i))

(cl:defun vec2-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec2-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat2-vec2 (m v) (3dm:m* m v))
(cl:defun m*-mat2-mat2 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec3 %vec3))
(cl:defun vec3 (x y z)
  (3dm.coalton:vec3 (cl:the cl:fixnum (cl:round x)) (cl:the cl:fixnum (cl:round y)) (cl:the cl:fixnum (cl:round z))))
(cl:defun %vec3 (x y z) (vec3 x y z))

(cl:declaim (cl:inline vx3))
(cl:defun vx3 (v) (3dm.coalton::vec3-component-0 v))

(cl:declaim (cl:inline vy3))
(cl:defun vy3 (v) (3dm.coalton::vec3-component-1 v))

(cl:declaim (cl:inline vz3))
(cl:defun vz3 (v) (3dm.coalton::vec3-component-2 v))

(cl:defun vcopy3 (v) (3dm:vcopy v))

(cl:defmacro with-vec3 ((x y z) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z) value body :fix))

(cl:defun mat3 (cl:&rest elements)
  (3dm::port-fixed-matrix 3 :fix elements))
(cl:defun %mat3 () (mat3))

(cl:defun marr3 (m) (3dm::port-storage m))

(cl:defun mdet-mat3 (m) (3dm:mdet m))

(cl:defun minv-mat3 (m) (3dm:minv m))

(cl:defun mat3-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat3-mrow (m i) (3dm:mrow m i))

(cl:defun vec3-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec3-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat3-vec3 (m v) (3dm:m* m v))
(cl:defun m*-mat3-mat3 (a b) (3dm:m* a b))

(cl:declaim (cl:inline vec4 %vec4))
(cl:defun vec4 (x y z w)
  (3dm.coalton:vec4 (cl:the cl:fixnum (cl:round x)) (cl:the cl:fixnum (cl:round y)) (cl:the cl:fixnum (cl:round z)) (cl:the cl:fixnum (cl:round w))))
(cl:defun %vec4 (x y z w) (vec4 x y z w))

(cl:declaim (cl:inline vx4))
(cl:defun vx4 (v) (3dm.coalton::vec4-component-0 v))

(cl:declaim (cl:inline vy4))
(cl:defun vy4 (v) (3dm.coalton::vec4-component-1 v))

(cl:declaim (cl:inline vz4))
(cl:defun vz4 (v) (3dm.coalton::vec4-component-2 v))

(cl:declaim (cl:inline vw4))
(cl:defun vw4 (v) (3dm.coalton::vec4-component-3 v))

(cl:defun vcopy4 (v) (3dm:vcopy v))

(cl:defmacro with-vec4 ((x y z w) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :fix))

(cl:defun mat4 (cl:&rest elements)
  (3dm::port-fixed-matrix 4 :fix elements))
(cl:defun %mat4 () (mat4))

(cl:defun marr4 (m) (3dm::port-storage m))

(cl:defun mdet-mat4 (m) (3dm:mdet m))

(cl:defun minv-mat4 (m) (3dm:minv m))

(cl:defun mat4-mtranspose (m) (3dm:mtranspose m))

(cl:defun mat4-mrow (m i) (3dm:mrow m i))

(cl:defun vec4-vsqrlength (m) (3dm:vsqrlength m))

(cl:defun vec4-vsqr2norm (m) (3dm:vsqrlength m))

(cl:defun m*-mat4-vec4 (m v) (3dm:m* m v))
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))

(cl:defmacro with-vec ((x y cl:&optional (z (cl:gensym "Z")) (w (cl:gensym "W"))) value cl:&body body)
  (3dm-def::port-with-vec-expansion (cl:list x y z w) value body :fix cl:t))

(cl:defun matn (rows cols cl:&optional elements)
  (3dm::port-matn rows cols :fix elements :column-major cl:t))
(cl:defun %matn (rows cols data)
  (3dm::port-matn rows cols :fix data :column-major cl:t :fixed cl:nil))
(cl:defun marrn (m) (3dm::marr m))
(cl:defun marr (m) (3dm::marr m))
(cl:defun mrows (m) (3dm::port-dimensions m))
(cl:defun mcols (m) (cl:nth-value 1 (3dm::port-dimensions m)))
(cl:defun meye (n) (3dm::port-eye n :fix))
(cl:defun quat (x y z w) (3dm.coalton:quat (cl:the cl:fixnum (cl:round x)) (cl:the cl:fixnum (cl:round y)) (cl:the cl:fixnum (cl:round z)) (cl:the cl:fixnum (cl:round w))))
(cl:defun %quat (x y z w) (quat x y z w))
(cl:defun qcopy (q) (3dm::port-convert q (3dm::port-kind q) cl:t))
(cl:defun dquat (r d)
  (3dm.coalton:dquat (3dm::port-convert r :fix) (3dm::port-convert d :fix)))
(cl:defun %dquat (r d) (dquat r d))
(cl:defun qreal (q) (3dm.coalton::dquat-real q))
(cl:defun qdual (q) (3dm.coalton::dquat-dual q))
(cl:defun qx (q) (3dm.coalton::quat-component-0 q))
(cl:defun qy (q) (3dm.coalton::quat-component-1 q))
(cl:defun qz (q) (3dm.coalton::quat-component-2 q))
(cl:defun qw (q) (3dm.coalton::quat-component-3 q))
(cl:defparameter +vx+ (vec3 1 0 0))
(cl:defparameter +vy+ (vec3 0 1 0))
(cl:defparameter +vz+ (vec3 0 0 1))
(3dm-def::define-with-fast-matref cl:fixnum)
(3dm-def::define-with-fast-matrefs)
(3dm-def::define-with-fast-matcase)
(3dm-def::define-do-mat-diag-macro)
(cl:defun mcol (m i) (3dm:mcol m i))
(cl:defun qconjugate (q) (3dm:qconjugate q))
(cl:defun quaternion-x-axis (q) (3dm:quaternion-x-axis q))
(cl:defun quaternion-y-axis (q) (3dm:quaternion-y-axis q))
(cl:defun quaternion-z-axis (q) (3dm:quaternion-z-axis q))
(cl:defun matrix-from-quaternion (q) (3dm:matrix-from-quaternion q))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.d&f)
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.f&d)
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.d&rat)
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.rat&d)
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.f&rat)
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))

(cl:in-package :3dm.rat&f)
(cl:defun m*-mat4-mat4 (a b) (3dm:m* a b))
(cl:defun m*-mat4-single-float-mat4 (a b) (3dm::binary-m*-mat4-mat4-to-single-float-mat4 a b))
