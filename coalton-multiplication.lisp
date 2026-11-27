;;;; A Coalton implementation of the 3d-math multiplication interface.
;;;; No dependencies on the original Common Lisp structs or methods.

(cl:defpackage #:3dm.coalton
  (:use #:coalton #:coalton-prelude)
  (:local-nicknames (#:arr #:coalton/lisparray)
                    (#:types #:coalton/types))
  (:export #:Vec2 #:Vec3 #:Vec4
           #:Mat2 #:Mat3 #:Mat4 #:MatN
           #:make-mat2 #:make-mat3 #:make-mat4 #:make-matn
           #:mat2-ref #:mat3-ref #:mat4-ref #:matn-ref
           #:matn-rows #:matn-cols
           #:ScalarProduct #:scalar-product
           #:Multipliable #:m*))
(cl:in-package #:3dm.coalton)

(coalton-toplevel
  ;; Vectors are products of scalars; fixed matrices have their own
  ;; nominal types, each containing a specialized column-major array.
  (derive Eq)
  (define-type (Vec2 :a)
    (Vec2 :a :a))

  (derive Eq)
  (define-type (Mat2 :a)
    (Mat2Data (arr:LispArray :a)))

  (derive Eq)
  (define-type (Vec3 :a)
    (Vec3 :a :a :a))

  (derive Eq)
  (define-type (Mat3 :a)
    (Mat3Data (arr:LispArray :a)))

  (derive Eq)
  (define-type (Vec4 :a)
    (Vec4 :a :a :a :a))

  (derive Eq)
  (define-type (Mat4 :a)
    (Mat4Data (arr:LispArray :a)))

  (derive Eq)
  (define-type (MatN :a)
    (MatNData UFix UFix (arr:LispArray :a)))

  ;; Only the scalar typeclass needs to know about precision promotion.
  (define-class (Num :c => ScalarProduct :a :b :c (:a :b -> :c))
    (scalar-product (:a * :b -> :c)))

  (define-instance (Num :a => ScalarProduct :a :a :a)
    (inline)
    (define (scalar-product a b) (* a b)))

  (define-instance (ScalarProduct F32 F64 F64)
    (inline)
    (define (scalar-product a b) (* (into a) b)))

  (define-instance (ScalarProduct F64 F32 F64)
    (inline)
    (define (scalar-product a b) (* a (into b))))

  (define-class (Multipliable :a :b :c (:a :b -> :c))
    (m* (:a * :b -> :c)))

  (inline)
  (declare dot2 (ScalarProduct :a :b :c =>
                  :a * :a * :b * :b -> :c))
  (define (dot2 a0 a1 b0 b1)
    (+ (scalar-product a0 b0) (scalar-product a1 b1)))

  (inline)
  (declare make-mat2 (types:RuntimeRepr :a =>
                       :a * :a * :a * :a -> Mat2 :a))
  (define (make-mat2 e00 e01 e10 e11)
    (let ((data (arr:make-uninitialized 4)))
      (progn
        (arr:set! data 0 e00)
        (arr:set! data 1 e10)
        (arr:set! data 2 e01)
        (arr:set! data 3 e11)
        (Mat2Data data))))

  (inline)
  (declare mat2-ref (Mat2 :a * UFix * UFix -> :a))
  (define (mat2-ref (Mat2Data data) row col)
    (if (and (< row 2) (< col 2))
        (arr:aref data (+ row (* 2 col)))
        (error "Matrix index out of bounds")))

  (define-instance ((ScalarProduct :a :b :c) (types:RuntimeRepr :c) =>
                    Multipliable (Mat2 :a) (Mat2 :b) (Mat2 :c))
    (inline)
    (define (m* (Mat2Data a) (Mat2Data b))
      (make-mat2
        (dot2 (arr:aref a 0) (arr:aref a 2)
              (arr:aref b 0) (arr:aref b 1))
        (dot2 (arr:aref a 0) (arr:aref a 2)
              (arr:aref b 2) (arr:aref b 3))
        (dot2 (arr:aref a 1) (arr:aref a 3)
              (arr:aref b 0) (arr:aref b 1))
        (dot2 (arr:aref a 1) (arr:aref a 3)
              (arr:aref b 2) (arr:aref b 3)))))

  (define-instance (ScalarProduct :b :a :c =>
                    Multipliable (Mat2 :a) (Vec2 :b) (Vec2 :c))
    (inline)
    (define (m* (Mat2Data a) (Vec2 x y))
      (Vec2
        (dot2 x y
              (arr:aref a 0) (arr:aref a 2))
        (dot2 x y
              (arr:aref a 1) (arr:aref a 3)))))

  ;; Match 3d-math: vector * matrix denotes the same column-vector transform.
  (define-instance (ScalarProduct :a :b :c =>
                    Multipliable (Vec2 :a) (Mat2 :b) (Vec2 :c))
    (inline)
    (define (m* v m) (m* m v)))

  (inline)
  (declare dot3 (ScalarProduct :a :b :c =>
                  :a * :a * :a * :b * :b * :b -> :c))
  (define (dot3 a0 a1 a2 b0 b1 b2)
    (+ (+ (scalar-product a0 b0) (scalar-product a1 b1)) (scalar-product a2 b2)))

  (inline)
  (declare make-mat3 (types:RuntimeRepr :a =>
                       :a * :a * :a * :a * :a * :a * :a * :a * :a -> Mat3 :a))
  (define (make-mat3 e00 e01 e02 e10 e11 e12 e20 e21 e22)
    (let ((data (arr:make-uninitialized 9)))
      (progn
        (arr:set! data 0 e00)
        (arr:set! data 1 e10)
        (arr:set! data 2 e20)
        (arr:set! data 3 e01)
        (arr:set! data 4 e11)
        (arr:set! data 5 e21)
        (arr:set! data 6 e02)
        (arr:set! data 7 e12)
        (arr:set! data 8 e22)
        (Mat3Data data))))

  (inline)
  (declare mat3-ref (Mat3 :a * UFix * UFix -> :a))
  (define (mat3-ref (Mat3Data data) row col)
    (if (and (< row 3) (< col 3))
        (arr:aref data (+ row (* 3 col)))
        (error "Matrix index out of bounds")))

  (define-instance ((ScalarProduct :a :b :c) (types:RuntimeRepr :c) =>
                    Multipliable (Mat3 :a) (Mat3 :b) (Mat3 :c))
    (inline)
    (define (m* (Mat3Data a) (Mat3Data b))
      (make-mat3
        (dot3 (arr:aref a 0) (arr:aref a 3) (arr:aref a 6)
              (arr:aref b 0) (arr:aref b 1) (arr:aref b 2))
        (dot3 (arr:aref a 0) (arr:aref a 3) (arr:aref a 6)
              (arr:aref b 3) (arr:aref b 4) (arr:aref b 5))
        (dot3 (arr:aref a 0) (arr:aref a 3) (arr:aref a 6)
              (arr:aref b 6) (arr:aref b 7) (arr:aref b 8))
        (dot3 (arr:aref a 1) (arr:aref a 4) (arr:aref a 7)
              (arr:aref b 0) (arr:aref b 1) (arr:aref b 2))
        (dot3 (arr:aref a 1) (arr:aref a 4) (arr:aref a 7)
              (arr:aref b 3) (arr:aref b 4) (arr:aref b 5))
        (dot3 (arr:aref a 1) (arr:aref a 4) (arr:aref a 7)
              (arr:aref b 6) (arr:aref b 7) (arr:aref b 8))
        (dot3 (arr:aref a 2) (arr:aref a 5) (arr:aref a 8)
              (arr:aref b 0) (arr:aref b 1) (arr:aref b 2))
        (dot3 (arr:aref a 2) (arr:aref a 5) (arr:aref a 8)
              (arr:aref b 3) (arr:aref b 4) (arr:aref b 5))
        (dot3 (arr:aref a 2) (arr:aref a 5) (arr:aref a 8)
              (arr:aref b 6) (arr:aref b 7) (arr:aref b 8)))))

  (define-instance (ScalarProduct :b :a :c =>
                    Multipliable (Mat3 :a) (Vec3 :b) (Vec3 :c))
    (inline)
    (define (m* (Mat3Data a) (Vec3 x y z))
      (Vec3
        (dot3 x y z
              (arr:aref a 0) (arr:aref a 3) (arr:aref a 6))
        (dot3 x y z
              (arr:aref a 1) (arr:aref a 4) (arr:aref a 7))
        (dot3 x y z
              (arr:aref a 2) (arr:aref a 5) (arr:aref a 8)))))

  ;; Match 3d-math: vector * matrix denotes the same column-vector transform.
  (define-instance (ScalarProduct :a :b :c =>
                    Multipliable (Vec3 :a) (Mat3 :b) (Vec3 :c))
    (inline)
    (define (m* v m) (m* m v)))

  (inline)
  (declare dot4 (ScalarProduct :a :b :c =>
                  :a * :a * :a * :a * :b * :b * :b * :b -> :c))
  (define (dot4 a0 a1 a2 a3 b0 b1 b2 b3)
    (+ (+ (+ (scalar-product a0 b0) (scalar-product a1 b1)) (scalar-product a2 b2)) (scalar-product a3 b3)))

  (inline)
  (declare make-mat4 (types:RuntimeRepr :a =>
                       :a * :a * :a * :a * :a * :a * :a * :a * :a * :a * :a * :a * :a * :a * :a * :a -> Mat4 :a))
  (define (make-mat4 e00 e01 e02 e03 e10 e11 e12 e13 e20 e21 e22 e23 e30 e31 e32 e33)
    (let ((data (arr:make-uninitialized 16)))
      (progn
        (arr:set! data 0 e00)
        (arr:set! data 1 e10)
        (arr:set! data 2 e20)
        (arr:set! data 3 e30)
        (arr:set! data 4 e01)
        (arr:set! data 5 e11)
        (arr:set! data 6 e21)
        (arr:set! data 7 e31)
        (arr:set! data 8 e02)
        (arr:set! data 9 e12)
        (arr:set! data 10 e22)
        (arr:set! data 11 e32)
        (arr:set! data 12 e03)
        (arr:set! data 13 e13)
        (arr:set! data 14 e23)
        (arr:set! data 15 e33)
        (Mat4Data data))))

  (inline)
  (declare mat4-ref (Mat4 :a * UFix * UFix -> :a))
  (define (mat4-ref (Mat4Data data) row col)
    (if (and (< row 4) (< col 4))
        (arr:aref data (+ row (* 4 col)))
        (error "Matrix index out of bounds")))

  (define-instance ((ScalarProduct :a :b :c) (types:RuntimeRepr :c) =>
                    Multipliable (Mat4 :a) (Mat4 :b) (Mat4 :c))
    (inline)
    (define (m* (Mat4Data a) (Mat4Data b))
      (make-mat4
        (dot4 (arr:aref a 0) (arr:aref a 4) (arr:aref a 8) (arr:aref a 12)
              (arr:aref b 0) (arr:aref b 1) (arr:aref b 2) (arr:aref b 3))
        (dot4 (arr:aref a 0) (arr:aref a 4) (arr:aref a 8) (arr:aref a 12)
              (arr:aref b 4) (arr:aref b 5) (arr:aref b 6) (arr:aref b 7))
        (dot4 (arr:aref a 0) (arr:aref a 4) (arr:aref a 8) (arr:aref a 12)
              (arr:aref b 8) (arr:aref b 9) (arr:aref b 10) (arr:aref b 11))
        (dot4 (arr:aref a 0) (arr:aref a 4) (arr:aref a 8) (arr:aref a 12)
              (arr:aref b 12) (arr:aref b 13) (arr:aref b 14) (arr:aref b 15))
        (dot4 (arr:aref a 1) (arr:aref a 5) (arr:aref a 9) (arr:aref a 13)
              (arr:aref b 0) (arr:aref b 1) (arr:aref b 2) (arr:aref b 3))
        (dot4 (arr:aref a 1) (arr:aref a 5) (arr:aref a 9) (arr:aref a 13)
              (arr:aref b 4) (arr:aref b 5) (arr:aref b 6) (arr:aref b 7))
        (dot4 (arr:aref a 1) (arr:aref a 5) (arr:aref a 9) (arr:aref a 13)
              (arr:aref b 8) (arr:aref b 9) (arr:aref b 10) (arr:aref b 11))
        (dot4 (arr:aref a 1) (arr:aref a 5) (arr:aref a 9) (arr:aref a 13)
              (arr:aref b 12) (arr:aref b 13) (arr:aref b 14) (arr:aref b 15))
        (dot4 (arr:aref a 2) (arr:aref a 6) (arr:aref a 10) (arr:aref a 14)
              (arr:aref b 0) (arr:aref b 1) (arr:aref b 2) (arr:aref b 3))
        (dot4 (arr:aref a 2) (arr:aref a 6) (arr:aref a 10) (arr:aref a 14)
              (arr:aref b 4) (arr:aref b 5) (arr:aref b 6) (arr:aref b 7))
        (dot4 (arr:aref a 2) (arr:aref a 6) (arr:aref a 10) (arr:aref a 14)
              (arr:aref b 8) (arr:aref b 9) (arr:aref b 10) (arr:aref b 11))
        (dot4 (arr:aref a 2) (arr:aref a 6) (arr:aref a 10) (arr:aref a 14)
              (arr:aref b 12) (arr:aref b 13) (arr:aref b 14) (arr:aref b 15))
        (dot4 (arr:aref a 3) (arr:aref a 7) (arr:aref a 11) (arr:aref a 15)
              (arr:aref b 0) (arr:aref b 1) (arr:aref b 2) (arr:aref b 3))
        (dot4 (arr:aref a 3) (arr:aref a 7) (arr:aref a 11) (arr:aref a 15)
              (arr:aref b 4) (arr:aref b 5) (arr:aref b 6) (arr:aref b 7))
        (dot4 (arr:aref a 3) (arr:aref a 7) (arr:aref a 11) (arr:aref a 15)
              (arr:aref b 8) (arr:aref b 9) (arr:aref b 10) (arr:aref b 11))
        (dot4 (arr:aref a 3) (arr:aref a 7) (arr:aref a 11) (arr:aref a 15)
              (arr:aref b 12) (arr:aref b 13) (arr:aref b 14) (arr:aref b 15)))))

  (define-instance (ScalarProduct :b :a :c =>
                    Multipliable (Mat4 :a) (Vec4 :b) (Vec4 :c))
    (inline)
    (define (m* (Mat4Data a) (Vec4 x y z w))
      (Vec4
        (dot4 x y z w
              (arr:aref a 0) (arr:aref a 4) (arr:aref a 8) (arr:aref a 12))
        (dot4 x y z w
              (arr:aref a 1) (arr:aref a 5) (arr:aref a 9) (arr:aref a 13))
        (dot4 x y z w
              (arr:aref a 2) (arr:aref a 6) (arr:aref a 10) (arr:aref a 14))
        (dot4 x y z w
              (arr:aref a 3) (arr:aref a 7) (arr:aref a 11) (arr:aref a 15)))))

  ;; Match 3d-math: vector * matrix denotes the same column-vector transform.
  (define-instance (ScalarProduct :a :b :c =>
                    Multipliable (Vec4 :a) (Mat4 :b) (Vec4 :c))
    (inline)
    (define (m* v m) (m* m v)))

  ;; Dynamic rectangular matrices. Their input list and storage are
  ;; row-major, matching the original rank-two CL array path.
  (declare make-matn (types:RuntimeRepr :a =>
                      UFix * UFix * List :a -> MatN :a))
  (define (make-matn rows cols elements)
    (let ((data (into elements)))
      (if (== (arr:length data) (* rows cols))
          (MatNData rows cols data)
          (error "Incorrect number of matrix elements"))))

  (inline)
  (declare matn-rows (MatN :a -> UFix))
  (define (matn-rows (MatNData rows _ _)) rows)

  (inline)
  (declare matn-cols (MatN :a -> UFix))
  (define (matn-cols (MatNData _ cols _)) cols)

  (inline)
  (declare matn-ref (MatN :a * UFix * UFix -> :a))
  (define (matn-ref (MatNData rows cols data) i j)
    (if (and (< i rows) (< j cols))
        (arr:aref data (+ (* i cols) j))
        (error "Matrix index out of bounds")))

  (define-instance ((ScalarProduct :a :b :c) (types:RuntimeRepr :c) =>
                    Multipliable (MatN :a) (MatN :b) (MatN :c))
    (define (m* (MatNData m n a) (MatNData q p b))
      (if (not (== n q))
          (error "Incompatible matrix dimensions")
          (let ((out (arr:make-uninitialized (* m p))))
            (progn
              (rec rows ((i 0))
                (if (== i m)
                    (values)
                    (progn
                      (rec cols ((j 0))
                        (if (== j p)
                            (values)
                            (progn
                              (arr:set! out (+ (* i p) j)
                                (rec dot ((k 0) (acc 0))
                                  (if (== k n)
                                      acc
                                      (dot (+ k 1)
                                           (+ acc
                                              (scalar-product
                                                (arr:aref a (+ (* i n) k))
                                                (arr:aref b (+ (* k p) j))))))))
                              (cols (+ j 1)))))
                      (rows (+ i 1)))))
              (MatNData m p out)))))))
