;;;; Generic numerical algorithms and concrete monomorphization roots.
(cl:in-package #:3dm.coalton)

(coalton-toplevel
  (inline)
  (declare vec2-component-0 ((Vec2 :a) -> :a))
  (define (vec2-component-0 (Vec2 a0 _))
    a0)

  (inline)
  (declare vec2-component-1 ((Vec2 :a) -> :a))
  (define (vec2-component-1 (Vec2 _ a1))
    a1)

  (inline)
  (declare vec2-add (Num :a => (Vec2 :a) * (Vec2 :a) -> (Vec2 :a)))
  (define (vec2-add (Vec2 a0 a1) (Vec2 b0 b1))
    (Vec2 (+ a0 b0) (+ a1 b1)))

  (inline)
  (declare vec2-sub (Num :a => (Vec2 :a) * (Vec2 :a) -> (Vec2 :a)))
  (define (vec2-sub (Vec2 a0 a1) (Vec2 b0 b1))
    (Vec2 (- a0 b0) (- a1 b1)))

  (inline)
  (declare vec2-mul (Num :a => (Vec2 :a) * (Vec2 :a) -> (Vec2 :a)))
  (define (vec2-mul (Vec2 a0 a1) (Vec2 b0 b1))
    (Vec2 (* a0 b0) (* a1 b1)))

  (inline)
  (declare vec2-div (Reciprocable :a => (Vec2 :a) * (Vec2 :a) -> (Vec2 :a)))
  (define (vec2-div (Vec2 a0 a1) (Vec2 b0 b1))
    (Vec2 (/ a0 b0) (/ a1 b1)))

  (inline)
  (declare vec2-eq (Eq :a => (Vec2 :a) * (Vec2 :a) -> Boolean))
  (define (vec2-eq (Vec2 a0 a1) (Vec2 b0 b1))
    (and (== a0 b0) (== a1 b1)))

  (inline)
  (declare vec2-ne (Eq :a => (Vec2 :a) * (Vec2 :a) -> Boolean))
  (define (vec2-ne (Vec2 a0 a1) (Vec2 b0 b1))
    (or (not (== a0 b0)) (not (== a1 b1))))

  (inline)
  (declare vec2-lt (Ord :a => (Vec2 :a) * (Vec2 :a) -> Boolean))
  (define (vec2-lt (Vec2 a0 a1) (Vec2 b0 b1))
    (and (< a0 b0) (< a1 b1)))

  (inline)
  (declare vec2-le (Ord :a => (Vec2 :a) * (Vec2 :a) -> Boolean))
  (define (vec2-le (Vec2 a0 a1) (Vec2 b0 b1))
    (and (<= a0 b0) (<= a1 b1)))

  (inline)
  (declare vec2-gt (Ord :a => (Vec2 :a) * (Vec2 :a) -> Boolean))
  (define (vec2-gt (Vec2 a0 a1) (Vec2 b0 b1))
    (and (> a0 b0) (> a1 b1)))

  (inline)
  (declare vec2-ge (Ord :a => (Vec2 :a) * (Vec2 :a) -> Boolean))
  (define (vec2-ge (Vec2 a0 a1) (Vec2 b0 b1))
    (and (>= a0 b0) (>= a1 b1)))

  (inline)
  (declare vec2-dot (Num :a => (Vec2 :a) * (Vec2 :a) -> :a))
  (define (vec2-dot (Vec2 a0 a1) (Vec2 b0 b1))
    (+ (* a0 b0) (* a1 b1)))

  (inline)
  (declare vec2-sqrlength (Num :a => (Vec2 :a) -> :a))
  (define (vec2-sqrlength v)
    (vec2-dot v v))

  (inline)
  (declare vec2-sqrdistance (Num :a => (Vec2 :a) * (Vec2 :a) -> :a))
  (define (vec2-sqrdistance a b)
    (vec2-sqrlength (vec2-sub a b)))

  (inline)
  (declare vec2-lerp (Num :a => (Vec2 :a) * (Vec2 :a) * :a -> (Vec2 :a)))
  (define (vec2-lerp (Vec2 a0 a1) (Vec2 b0 b1) s)
    (Vec2 (+ a0 (* (- b0 a0) s)) (+ a1 (* (- b1 a1) s))))

  (inline)
  (declare vec2-length ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec2 :a) -> :a))
  (define (vec2-length v)
    (sqrt (vec2-sqrlength v)))

  (inline)
  (declare vec2-unit ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec2 :a) -> (Vec2 :a)))
  (define (vec2-unit (Vec2 a0 a1))
    (let ((len (vec2-length (Vec2 a0 a1))))
      (Vec2 (/ a0 len) (/ a1 len))))

  (inline)
  (declare vec2-angle ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec2 :a) * (Vec2 :a) -> :a))
  (define (vec2-angle a b)
    (acos (min 1 (max -1 (/ (/ (vec2-dot a b) (vec2-length a)) (vec2-length b))))))

  (inline)
  (declare mat2-storage ((Mat2 :a) -> (arr:LispArray :a)))
  (define (mat2-storage (Mat2Data a))
    a)

  (inline)
  (declare mat2-transpose (types:RuntimeRepr :a => (Mat2 :a) -> (Mat2 :a)))
  (define (mat2-transpose m)
    (make-mat2 (mat2-ref m 0 0) (mat2-ref m 1 0) (mat2-ref m 0 1) (mat2-ref m 1 1)))

  (inline)
  (declare mat2-det (Num :a => (Mat2 :a) -> :a))
  (define (mat2-det m)
    (+ (* (mat2-ref m 0 0) (mat2-ref m 1 1)) (negate (* (mat2-ref m 0 1) (mat2-ref m 1 0)))))

  (inline)
  (declare mat2-inverse ((Reciprocable :a) (types:RuntimeRepr :a) => (Mat2 :a) -> (Mat2 :a)))
  (define (mat2-inverse m)
    (let ((invdet (/ 1 (mat2-det m))))
      (make-mat2 (* invdet (mat2-ref m 1 1)) (* invdet (negate (mat2-ref m 0 1))) (* invdet (negate (mat2-ref m 1 0))) (* invdet (mat2-ref m 0 0)))))

  (inline)
  (declare vec3-component-0 ((Vec3 :a) -> :a))
  (define (vec3-component-0 (Vec3 a0 _ _))
    a0)

  (inline)
  (declare vec3-component-1 ((Vec3 :a) -> :a))
  (define (vec3-component-1 (Vec3 _ a1 _))
    a1)

  (inline)
  (declare vec3-component-2 ((Vec3 :a) -> :a))
  (define (vec3-component-2 (Vec3 _ _ a2))
    a2)

  (inline)
  (declare vec3-add (Num :a => (Vec3 :a) * (Vec3 :a) -> (Vec3 :a)))
  (define (vec3-add (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (Vec3 (+ a0 b0) (+ a1 b1) (+ a2 b2)))

  (inline)
  (declare vec3-sub (Num :a => (Vec3 :a) * (Vec3 :a) -> (Vec3 :a)))
  (define (vec3-sub (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (Vec3 (- a0 b0) (- a1 b1) (- a2 b2)))

  (inline)
  (declare vec3-mul (Num :a => (Vec3 :a) * (Vec3 :a) -> (Vec3 :a)))
  (define (vec3-mul (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (Vec3 (* a0 b0) (* a1 b1) (* a2 b2)))

  (inline)
  (declare vec3-div (Reciprocable :a => (Vec3 :a) * (Vec3 :a) -> (Vec3 :a)))
  (define (vec3-div (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (Vec3 (/ a0 b0) (/ a1 b1) (/ a2 b2)))

  (inline)
  (declare vec3-eq (Eq :a => (Vec3 :a) * (Vec3 :a) -> Boolean))
  (define (vec3-eq (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (and (and (== a0 b0) (== a1 b1)) (== a2 b2)))

  (inline)
  (declare vec3-ne (Eq :a => (Vec3 :a) * (Vec3 :a) -> Boolean))
  (define (vec3-ne (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (or (or (not (== a0 b0)) (not (== a1 b1))) (not (== a2 b2))))

  (inline)
  (declare vec3-lt (Ord :a => (Vec3 :a) * (Vec3 :a) -> Boolean))
  (define (vec3-lt (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (and (and (< a0 b0) (< a1 b1)) (< a2 b2)))

  (inline)
  (declare vec3-le (Ord :a => (Vec3 :a) * (Vec3 :a) -> Boolean))
  (define (vec3-le (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (and (and (<= a0 b0) (<= a1 b1)) (<= a2 b2)))

  (inline)
  (declare vec3-gt (Ord :a => (Vec3 :a) * (Vec3 :a) -> Boolean))
  (define (vec3-gt (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (and (and (> a0 b0) (> a1 b1)) (> a2 b2)))

  (inline)
  (declare vec3-ge (Ord :a => (Vec3 :a) * (Vec3 :a) -> Boolean))
  (define (vec3-ge (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (and (and (>= a0 b0) (>= a1 b1)) (>= a2 b2)))

  (inline)
  (declare vec3-dot (Num :a => (Vec3 :a) * (Vec3 :a) -> :a))
  (define (vec3-dot (Vec3 a0 a1 a2) (Vec3 b0 b1 b2))
    (+ (+ (* a0 b0) (* a1 b1)) (* a2 b2)))

  (inline)
  (declare vec3-sqrlength (Num :a => (Vec3 :a) -> :a))
  (define (vec3-sqrlength v)
    (vec3-dot v v))

  (inline)
  (declare vec3-sqrdistance (Num :a => (Vec3 :a) * (Vec3 :a) -> :a))
  (define (vec3-sqrdistance a b)
    (vec3-sqrlength (vec3-sub a b)))

  (inline)
  (declare vec3-lerp (Num :a => (Vec3 :a) * (Vec3 :a) * :a -> (Vec3 :a)))
  (define (vec3-lerp (Vec3 a0 a1 a2) (Vec3 b0 b1 b2) s)
    (Vec3 (+ a0 (* (- b0 a0) s)) (+ a1 (* (- b1 a1) s)) (+ a2 (* (- b2 a2) s))))

  (inline)
  (declare vec3-length ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec3 :a) -> :a))
  (define (vec3-length v)
    (sqrt (vec3-sqrlength v)))

  (inline)
  (declare vec3-unit ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec3 :a) -> (Vec3 :a)))
  (define (vec3-unit (Vec3 a0 a1 a2))
    (let ((len (vec3-length (Vec3 a0 a1 a2))))
      (Vec3 (/ a0 len) (/ a1 len) (/ a2 len))))

  (inline)
  (declare vec3-angle ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec3 :a) * (Vec3 :a) -> :a))
  (define (vec3-angle a b)
    (acos (min 1 (max -1 (/ (/ (vec3-dot a b) (vec3-length a)) (vec3-length b))))))

  (inline)
  (declare mat3-storage ((Mat3 :a) -> (arr:LispArray :a)))
  (define (mat3-storage (Mat3Data a))
    a)

  (inline)
  (declare mat3-transpose (types:RuntimeRepr :a => (Mat3 :a) -> (Mat3 :a)))
  (define (mat3-transpose m)
    (make-mat3 (mat3-ref m 0 0) (mat3-ref m 1 0) (mat3-ref m 2 0) (mat3-ref m 0 1) (mat3-ref m 1 1) (mat3-ref m 2 1) (mat3-ref m 0 2) (mat3-ref m 1 2) (mat3-ref m 2 2)))

  (inline)
  (declare mat3-det (Num :a => (Mat3 :a) -> :a))
  (define (mat3-det m)
    (+ (+ (* (mat3-ref m 0 0) (+ (* (mat3-ref m 1 1) (mat3-ref m 2 2)) (negate (* (mat3-ref m 1 2) (mat3-ref m 2 1))))) (negate (* (mat3-ref m 0 1) (+ (* (mat3-ref m 1 0) (mat3-ref m 2 2)) (negate (* (mat3-ref m 1 2) (mat3-ref m 2 0))))))) (* (mat3-ref m 0 2) (+ (* (mat3-ref m 1 0) (mat3-ref m 2 1)) (negate (* (mat3-ref m 1 1) (mat3-ref m 2 0)))))))

  (inline)
  (declare mat3-inverse ((Reciprocable :a) (types:RuntimeRepr :a) => (Mat3 :a) -> (Mat3 :a)))
  (define (mat3-inverse m)
    (let ((invdet (/ 1 (mat3-det m))))
      (make-mat3 (* invdet (+ (* (mat3-ref m 1 1) (mat3-ref m 2 2)) (negate (* (mat3-ref m 1 2) (mat3-ref m 2 1))))) (* invdet (negate (+ (* (mat3-ref m 0 1) (mat3-ref m 2 2)) (negate (* (mat3-ref m 0 2) (mat3-ref m 2 1)))))) (* invdet (+ (* (mat3-ref m 0 1) (mat3-ref m 1 2)) (negate (* (mat3-ref m 0 2) (mat3-ref m 1 1))))) (* invdet (negate (+ (* (mat3-ref m 1 0) (mat3-ref m 2 2)) (negate (* (mat3-ref m 1 2) (mat3-ref m 2 0)))))) (* invdet (+ (* (mat3-ref m 0 0) (mat3-ref m 2 2)) (negate (* (mat3-ref m 0 2) (mat3-ref m 2 0))))) (* invdet (negate (+ (* (mat3-ref m 0 0) (mat3-ref m 1 2)) (negate (* (mat3-ref m 0 2) (mat3-ref m 1 0)))))) (* invdet (+ (* (mat3-ref m 1 0) (mat3-ref m 2 1)) (negate (* (mat3-ref m 1 1) (mat3-ref m 2 0))))) (* invdet (negate (+ (* (mat3-ref m 0 0) (mat3-ref m 2 1)) (negate (* (mat3-ref m 0 1) (mat3-ref m 2 0)))))) (* invdet (+ (* (mat3-ref m 0 0) (mat3-ref m 1 1)) (negate (* (mat3-ref m 0 1) (mat3-ref m 1 0))))))))

  (inline)
  (declare vec4-component-0 ((Vec4 :a) -> :a))
  (define (vec4-component-0 (Vec4 a0 _ _ _))
    a0)

  (inline)
  (declare vec4-component-1 ((Vec4 :a) -> :a))
  (define (vec4-component-1 (Vec4 _ a1 _ _))
    a1)

  (inline)
  (declare vec4-component-2 ((Vec4 :a) -> :a))
  (define (vec4-component-2 (Vec4 _ _ a2 _))
    a2)

  (inline)
  (declare vec4-component-3 ((Vec4 :a) -> :a))
  (define (vec4-component-3 (Vec4 _ _ _ a3))
    a3)

  (inline)
  (declare vec4-add (Num :a => (Vec4 :a) * (Vec4 :a) -> (Vec4 :a)))
  (define (vec4-add (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (Vec4 (+ a0 b0) (+ a1 b1) (+ a2 b2) (+ a3 b3)))

  (inline)
  (declare vec4-sub (Num :a => (Vec4 :a) * (Vec4 :a) -> (Vec4 :a)))
  (define (vec4-sub (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (Vec4 (- a0 b0) (- a1 b1) (- a2 b2) (- a3 b3)))

  (inline)
  (declare vec4-mul (Num :a => (Vec4 :a) * (Vec4 :a) -> (Vec4 :a)))
  (define (vec4-mul (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (Vec4 (* a0 b0) (* a1 b1) (* a2 b2) (* a3 b3)))

  (inline)
  (declare vec4-div (Reciprocable :a => (Vec4 :a) * (Vec4 :a) -> (Vec4 :a)))
  (define (vec4-div (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (Vec4 (/ a0 b0) (/ a1 b1) (/ a2 b2) (/ a3 b3)))

  (inline)
  (declare vec4-eq (Eq :a => (Vec4 :a) * (Vec4 :a) -> Boolean))
  (define (vec4-eq (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (and (and (and (== a0 b0) (== a1 b1)) (== a2 b2)) (== a3 b3)))

  (inline)
  (declare vec4-ne (Eq :a => (Vec4 :a) * (Vec4 :a) -> Boolean))
  (define (vec4-ne (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (or (or (or (not (== a0 b0)) (not (== a1 b1))) (not (== a2 b2))) (not (== a3 b3))))

  (inline)
  (declare vec4-lt (Ord :a => (Vec4 :a) * (Vec4 :a) -> Boolean))
  (define (vec4-lt (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (and (and (and (< a0 b0) (< a1 b1)) (< a2 b2)) (< a3 b3)))

  (inline)
  (declare vec4-le (Ord :a => (Vec4 :a) * (Vec4 :a) -> Boolean))
  (define (vec4-le (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (and (and (and (<= a0 b0) (<= a1 b1)) (<= a2 b2)) (<= a3 b3)))

  (inline)
  (declare vec4-gt (Ord :a => (Vec4 :a) * (Vec4 :a) -> Boolean))
  (define (vec4-gt (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (and (and (and (> a0 b0) (> a1 b1)) (> a2 b2)) (> a3 b3)))

  (inline)
  (declare vec4-ge (Ord :a => (Vec4 :a) * (Vec4 :a) -> Boolean))
  (define (vec4-ge (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (and (and (and (>= a0 b0) (>= a1 b1)) (>= a2 b2)) (>= a3 b3)))

  (inline)
  (declare vec4-dot (Num :a => (Vec4 :a) * (Vec4 :a) -> :a))
  (define (vec4-dot (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3))
    (+ (+ (+ (* a0 b0) (* a1 b1)) (* a2 b2)) (* a3 b3)))

  (inline)
  (declare vec4-sqrlength (Num :a => (Vec4 :a) -> :a))
  (define (vec4-sqrlength v)
    (vec4-dot v v))

  (inline)
  (declare vec4-sqrdistance (Num :a => (Vec4 :a) * (Vec4 :a) -> :a))
  (define (vec4-sqrdistance a b)
    (vec4-sqrlength (vec4-sub a b)))

  (inline)
  (declare vec4-lerp (Num :a => (Vec4 :a) * (Vec4 :a) * :a -> (Vec4 :a)))
  (define (vec4-lerp (Vec4 a0 a1 a2 a3) (Vec4 b0 b1 b2 b3) s)
    (Vec4 (+ a0 (* (- b0 a0) s)) (+ a1 (* (- b1 a1) s)) (+ a2 (* (- b2 a2) s)) (+ a3 (* (- b3 a3) s))))

  (inline)
  (declare vec4-length ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec4 :a) -> :a))
  (define (vec4-length v)
    (sqrt (vec4-sqrlength v)))

  (inline)
  (declare vec4-unit ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec4 :a) -> (Vec4 :a)))
  (define (vec4-unit (Vec4 a0 a1 a2 a3))
    (let ((len (vec4-length (Vec4 a0 a1 a2 a3))))
      (Vec4 (/ a0 len) (/ a1 len) (/ a2 len) (/ a3 len))))

  (inline)
  (declare vec4-angle ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec4 :a) * (Vec4 :a) -> :a))
  (define (vec4-angle a b)
    (acos (min 1 (max -1 (/ (/ (vec4-dot a b) (vec4-length a)) (vec4-length b))))))

  (inline)
  (declare mat4-storage ((Mat4 :a) -> (arr:LispArray :a)))
  (define (mat4-storage (Mat4Data a))
    a)

  (inline)
  (declare mat4-transpose (types:RuntimeRepr :a => (Mat4 :a) -> (Mat4 :a)))
  (define (mat4-transpose m)
    (make-mat4 (mat4-ref m 0 0) (mat4-ref m 1 0) (mat4-ref m 2 0) (mat4-ref m 3 0) (mat4-ref m 0 1) (mat4-ref m 1 1) (mat4-ref m 2 1) (mat4-ref m 3 1) (mat4-ref m 0 2) (mat4-ref m 1 2) (mat4-ref m 2 2) (mat4-ref m 3 2) (mat4-ref m 0 3) (mat4-ref m 1 3) (mat4-ref m 2 3) (mat4-ref m 3 3)))

  (inline)
  (declare mat4-det (Num :a => (Mat4 :a) -> :a))
  (define (mat4-det m)
    (+ (+ (+ (* (mat4-ref m 0 0) (+ (+ (* (mat4-ref m 1 1) (+ (* (mat4-ref m 2 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 1 2) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 1))))))) (* (mat4-ref m 1 3) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 1))))))) (negate (* (mat4-ref m 0 1) (+ (+ (* (mat4-ref m 1 0) (+ (* (mat4-ref m 2 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 1 2) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 1 3) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 0))))))))) (* (mat4-ref m 0 2) (+ (+ (* (mat4-ref m 1 0) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 1 1) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 1 3) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 2 1) (mat4-ref m 3 0)))))))) (negate (* (mat4-ref m 0 3) (+ (+ (* (mat4-ref m 1 0) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 1 1) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 0))))))) (* (mat4-ref m 1 2) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 2 1) (mat4-ref m 3 0))))))))))

  (inline)
  (declare mat4-inverse ((Reciprocable :a) (types:RuntimeRepr :a) => (Mat4 :a) -> (Mat4 :a)))
  (define (mat4-inverse m)
    (let ((invdet (/ 1 (mat4-det m))))
      (make-mat4 (* invdet (+ (+ (* (mat4-ref m 1 1) (+ (* (mat4-ref m 2 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 1 2) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 1))))))) (* (mat4-ref m 1 3) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 1))))))) (* invdet (negate (+ (+ (* (mat4-ref m 0 1) (+ (* (mat4-ref m 2 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 0 2) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 1))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 1)))))))) (* invdet (+ (+ (* (mat4-ref m 0 1) (+ (* (mat4-ref m 1 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 0 2) (+ (* (mat4-ref m 1 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 3 1))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 1 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 3 1))))))) (* invdet (negate (+ (+ (* (mat4-ref m 0 1) (+ (* (mat4-ref m 1 2) (mat4-ref m 2 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 2 2))))) (negate (* (mat4-ref m 0 2) (+ (* (mat4-ref m 1 1) (mat4-ref m 2 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 2 1))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 1 1) (mat4-ref m 2 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 2 1)))))))) (* invdet (negate (+ (+ (* (mat4-ref m 1 0) (+ (* (mat4-ref m 2 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 1 2) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 1 3) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 0)))))))) (* invdet (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 2 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 0 2) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 0))))))) (* invdet (negate (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 1 2) (mat4-ref m 3 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 3 2))))) (negate (* (mat4-ref m 0 2) (+ (* (mat4-ref m 1 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 1 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 3 0)))))))) (* invdet (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 1 2) (mat4-ref m 2 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 2 2))))) (negate (* (mat4-ref m 0 2) (+ (* (mat4-ref m 1 0) (mat4-ref m 2 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 2 0))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 1 0) (mat4-ref m 2 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 2 0))))))) (* invdet (+ (+ (* (mat4-ref m 1 0) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 1 1) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 1 3) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 2 1) (mat4-ref m 3 0))))))) (* invdet (negate (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 0 1) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 2 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 2 1) (mat4-ref m 3 0)))))))) (* invdet (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 1 1) (mat4-ref m 3 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 0 1) (+ (* (mat4-ref m 1 0) (mat4-ref m 3 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 3 0))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 1 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 1 1) (mat4-ref m 3 0))))))) (* invdet (negate (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 1 1) (mat4-ref m 2 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 2 1))))) (negate (* (mat4-ref m 0 1) (+ (* (mat4-ref m 1 0) (mat4-ref m 2 3)) (negate (* (mat4-ref m 1 3) (mat4-ref m 2 0))))))) (* (mat4-ref m 0 3) (+ (* (mat4-ref m 1 0) (mat4-ref m 2 1)) (negate (* (mat4-ref m 1 1) (mat4-ref m 2 0)))))))) (* invdet (negate (+ (+ (* (mat4-ref m 1 0) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 1 1) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 0))))))) (* (mat4-ref m 1 2) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 2 1) (mat4-ref m 3 0)))))))) (* invdet (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 2 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 0 1) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 2 2) (mat4-ref m 3 0))))))) (* (mat4-ref m 0 2) (+ (* (mat4-ref m 2 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 2 1) (mat4-ref m 3 0))))))) (* invdet (negate (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 1 1) (mat4-ref m 3 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 3 1))))) (negate (* (mat4-ref m 0 1) (+ (* (mat4-ref m 1 0) (mat4-ref m 3 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 3 0))))))) (* (mat4-ref m 0 2) (+ (* (mat4-ref m 1 0) (mat4-ref m 3 1)) (negate (* (mat4-ref m 1 1) (mat4-ref m 3 0)))))))) (* invdet (+ (+ (* (mat4-ref m 0 0) (+ (* (mat4-ref m 1 1) (mat4-ref m 2 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 2 1))))) (negate (* (mat4-ref m 0 1) (+ (* (mat4-ref m 1 0) (mat4-ref m 2 2)) (negate (* (mat4-ref m 1 2) (mat4-ref m 2 0))))))) (* (mat4-ref m 0 2) (+ (* (mat4-ref m 1 0) (mat4-ref m 2 1)) (negate (* (mat4-ref m 1 1) (mat4-ref m 2 0))))))))))

  (inline)
  (declare matn-storage ((MatN :a) -> (arr:LispArray :a)))
  (define (matn-storage (MatNData _ _ data))
    data)

  (inline)
  (declare vec3-cross (Num :a => (Vec3 :a) * (Vec3 :a) -> (Vec3 :a)))
  (define (vec3-cross (Vec3 ax ay az) (Vec3 bx by bz))
    (Vec3 (- (* ay bz) (* az by)) (- (* az bx) (* ax bz)) (- (* ax by) (* ay bx))))

  (inline)
  (declare quat-component-0 ((Quat :a) -> :a))
  (define (quat-component-0 (Quat x _ _ _))
    x)

  (inline)
  (declare quat-component-1 ((Quat :a) -> :a))
  (define (quat-component-1 (Quat _ y _ _))
    y)

  (inline)
  (declare quat-component-2 ((Quat :a) -> :a))
  (define (quat-component-2 (Quat _ _ z _))
    z)

  (inline)
  (declare quat-component-3 ((Quat :a) -> :a))
  (define (quat-component-3 (Quat _ _ _ w))
    w)

  (inline)
  (declare dquat-real ((DQuat :a) -> (Quat :a)))
  (define (dquat-real (DQuat r _))
    r)

  (inline)
  (declare dquat-dual ((DQuat :a) -> (Quat :a)))
  (define (dquat-dual (DQuat _ d))
    d)

  (inline)
  (declare quat-conjugate (Num :a => (Quat :a) -> (Quat :a)))
  (define (quat-conjugate (Quat x y z w))
    (Quat (negate x) (negate y) (negate z) w))

  (inline)
  (declare quat-mul (Num :a => (Quat :a) * (Quat :a) -> (Quat :a)))
  (define (quat-mul (Quat ax ay az aw) (Quat bx by bz bw))
    (Quat
      (- (+ (+ (* aw bx) (* ax bw)) (* ay bz)) (* az by))
      (+ (- (* aw by) (* ax bz)) (+ (* ay bw) (* az bx)))
      (+ (- (+ (* aw bz) (* ax by)) (* ay bx)) (* az bw))
      (- (- (- (* aw bw) (* ax bx)) (* ay by)) (* az bz))))

  (inline)
  (declare quat-lerp (Num :a => (Quat :a) * (Quat :a) * :a -> (Quat :a)))
  (define (quat-lerp (Quat ax ay az aw) (Quat bx by bz bw) s)
    (Quat (+ ax (* (- bx ax) s)) (+ ay (* (- by ay) s)) (+ az (* (- bz az) s)) (+ aw (* (- bw aw) s))))

  (inline)
  (declare quat-rotate-vector (Num :a => (Vec3 :a) * (Quat :a) -> (Vec3 :a)))
  (define (quat-rotate-vector (Vec3 x y z) q)
    (match (quat-mul (quat-mul q (Quat x y z 0)) (quat-conjugate q))
      ((Quat a b c _) (Vec3 a b c))))

  (inline)
  (declare quat-rotation ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec3 :a) * :a -> (Quat :a)))
  (define (quat-rotation v theta)
    (let ((half (/ theta 2)))
      (let ((s (sin half)))
      (match (vec3-unit v)
      ((Vec3 x y z) (Quat (* x s) (* y s) (* z s) (cos half)))))))

  (inline)
  (declare quat-from-to ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Vec3 :a) * (Vec3 :a) -> (Quat :a)))
  (define (quat-from-to u v)
    (let ((from (vec3-unit u)))
      (let ((to (vec3-unit v)))
      (if (vec3-eq from to)
      (Quat 0 0 0 1)
      (if (vec3-eq from (vec3-sub (Vec3 0 0 0) to))
          (match from
            ((Vec3 x y z)
             (let ((ortho (if (< (abs y) (abs x))
                              (Vec3 0 1 0)
                              (if (and (< (abs z) (abs y)) (< (abs z) (abs x)))
                                  (Vec3 0 0 1)
                                  (Vec3 1 0 0)))))
               (match (vec3-unit (vec3-cross from ortho))
                 ((Vec3 a b c) (Quat a b c 0))))))
          (let ((half (vec3-unit (vec3-add from to))))
            (match (vec3-cross from half)
              ((Vec3 a b c) (Quat a b c (vec3-dot from half))))))))))

  (inline)
  (declare quat-matrix ((Num :a) (types:RuntimeRepr :a) => (Quat :a) -> (Mat4 :a)))
  (define (quat-matrix (Quat x y z w))
    (make-mat4 (- (- 1 (* 2 (* y y))) (* 2 (* z z))) (* 2 (- (* x y) (* w z))) (* 2 (+ (* x z) (* w y))) 0 (* 2 (+ (* x y) (* w z))) (- (- 1 (* 2 (* x x))) (* 2 (* z z))) (* 2 (- (* y z) (* w x))) 0 (* 2 (- (* x z) (* w y))) (* 2 (+ (* y z) (* w x))) (- (- 1 (* 2 (* x x))) (* 2 (* y y))) 0 0 0 0 1))

  (inline)
  (declare quat-x-axis ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Quat :a) -> (Vec3 :a)))
  (define (quat-x-axis (Quat x y z w))
    (vec3-unit (Vec3 (+ (+ (+ (* w w) (* x x)) (negate (* y y))) (negate (* z z))) (* 2 (+ (* x y) (* w z))) (* 2 (- (* x z) (* w y))))))

  (inline)
  (declare quat-y-axis ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Quat :a) -> (Vec3 :a)))
  (define (quat-y-axis (Quat x y z w))
    (vec3-unit (Vec3 (* 2 (- (* x y) (* w z))) (+ (+ (+ (* w w) (negate (* x x))) (* y y)) (negate (* z z))) (* 2 (+ (* y z) (* w x))))))

  (inline)
  (declare quat-z-axis ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) => (Quat :a) -> (Vec3 :a)))
  (define (quat-z-axis (Quat x y z w))
    (vec3-unit (Vec3 (* 2 (+ (* x z) (* w y))) (* 2 (- (* y z) (* w x))) (+ (+ (+ (* w w) (negate (* x x))) (negate (* y y))) (* z z)))))

  (inline)
  (declare mat4-translate ((Num :a) (types:RuntimeRepr :a) => (Mat4 :a) * (Vec3 :a) -> (Mat4 :a)))
  (define (mat4-translate m (Vec3 x y z))
    (make-mat4 (mat4-ref m 0 0) (mat4-ref m 0 1) (mat4-ref m 0 2) (+ (+ (+ (mat4-ref m 0 3) (* (mat4-ref m 0 0) x)) (* (mat4-ref m 0 1) y)) (* (mat4-ref m 0 2) z)) (mat4-ref m 1 0) (mat4-ref m 1 1) (mat4-ref m 1 2) (+ (+ (+ (mat4-ref m 1 3) (* (mat4-ref m 1 0) x)) (* (mat4-ref m 1 1) y)) (* (mat4-ref m 1 2) z)) (mat4-ref m 2 0) (mat4-ref m 2 1) (mat4-ref m 2 2) (+ (+ (+ (mat4-ref m 2 3) (* (mat4-ref m 2 0) x)) (* (mat4-ref m 2 1) y)) (* (mat4-ref m 2 2) z)) (mat4-ref m 3 0) (mat4-ref m 3 1) (mat4-ref m 3 2) (+ (+ (+ (mat4-ref m 3 3) (* (mat4-ref m 3 0) x)) (* (mat4-ref m 3 1) y)) (* (mat4-ref m 3 2) z))))

  (inline)
  (declare mat4-scale ((Num :a) (types:RuntimeRepr :a) => (Mat4 :a) * (Vec3 :a) -> (Mat4 :a)))
  (define (mat4-scale m (Vec3 x y z))
    (make-mat4 (* (mat4-ref m 0 0) x) (* (mat4-ref m 0 1) y) (* (mat4-ref m 0 2) z) (mat4-ref m 0 3) (* (mat4-ref m 1 0) x) (* (mat4-ref m 1 1) y) (* (mat4-ref m 1 2) z) (mat4-ref m 1 3) (* (mat4-ref m 2 0) x) (* (mat4-ref m 2 1) y) (* (mat4-ref m 2 2) z) (mat4-ref m 2 3) (* (mat4-ref m 3 0) x) (* (mat4-ref m 3 1) y) (* (mat4-ref m 3 2) z) (mat4-ref m 3 3)))

  (inline)
  (declare lookat ((coalton/math/elementary:Radical :a) (Reciprocable :a) (Ord :a) (coalton/math/elementary:Trigonometric :a) (types:RuntimeRepr :a) => (Vec3 :a) * (Vec3 :a) * (Vec3 :a) -> (Mat4 :a)))
  (define (lookat eye target up)
    (let ((z (vec3-unit (vec3-sub eye target))))
      (let ((u (vec3-unit up)))
      (let ((adjusted (if (or (vec3-eq z u) (vec3-eq z (vec3-sub (Vec3 0 0 0) u))) (vec3-add up (Vec3 0 (/ 1 100) 0)) up)))
      (let ((x (vec3-unit (vec3-cross adjusted z))))
      (let ((y (vec3-cross z x)))
      (make-mat4 (vec3-component-0 x) (vec3-component-1 x) (vec3-component-2 x) (negate (vec3-dot x eye))
     (vec3-component-0 y) (vec3-component-1 y) (vec3-component-2 y) (negate (vec3-dot y eye))
     (vec3-component-0 z) (vec3-component-1 z) (vec3-component-2 z) (negate (vec3-dot z eye))
     0 0 0 1)))))))
)

(coalton-toplevel
  (inline)
  (monomorphize)
  (declare vec2-add-f ((Vec2 F32) * (Vec2 F32) -> (Vec2 F32)))
  (define (vec2-add-f p0 p1) (vec2-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-add-d ((Vec2 F64) * (Vec2 F64) -> (Vec2 F64)))
  (define (vec2-add-d p0 p1) (vec2-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-add-r ((Vec2 Fraction) * (Vec2 Fraction) -> (Vec2 Fraction)))
  (define (vec2-add-r p0 p1) (vec2-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-sub-f ((Vec2 F32) * (Vec2 F32) -> (Vec2 F32)))
  (define (vec2-sub-f p0 p1) (vec2-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-sub-d ((Vec2 F64) * (Vec2 F64) -> (Vec2 F64)))
  (define (vec2-sub-d p0 p1) (vec2-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-sub-r ((Vec2 Fraction) * (Vec2 Fraction) -> (Vec2 Fraction)))
  (define (vec2-sub-r p0 p1) (vec2-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-mul-f ((Vec2 F32) * (Vec2 F32) -> (Vec2 F32)))
  (define (vec2-mul-f p0 p1) (vec2-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-mul-d ((Vec2 F64) * (Vec2 F64) -> (Vec2 F64)))
  (define (vec2-mul-d p0 p1) (vec2-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-mul-r ((Vec2 Fraction) * (Vec2 Fraction) -> (Vec2 Fraction)))
  (define (vec2-mul-r p0 p1) (vec2-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-div-f ((Vec2 F32) * (Vec2 F32) -> (Vec2 F32)))
  (define (vec2-div-f p0 p1) (vec2-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-div-d ((Vec2 F64) * (Vec2 F64) -> (Vec2 F64)))
  (define (vec2-div-d p0 p1) (vec2-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-div-r ((Vec2 Fraction) * (Vec2 Fraction) -> (Vec2 Fraction)))
  (define (vec2-div-r p0 p1) (vec2-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-eq-f ((Vec2 F32) * (Vec2 F32) -> Boolean))
  (define (vec2-eq-f p0 p1) (vec2-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-eq-d ((Vec2 F64) * (Vec2 F64) -> Boolean))
  (define (vec2-eq-d p0 p1) (vec2-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-eq-r ((Vec2 Fraction) * (Vec2 Fraction) -> Boolean))
  (define (vec2-eq-r p0 p1) (vec2-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-ne-f ((Vec2 F32) * (Vec2 F32) -> Boolean))
  (define (vec2-ne-f p0 p1) (vec2-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-ne-d ((Vec2 F64) * (Vec2 F64) -> Boolean))
  (define (vec2-ne-d p0 p1) (vec2-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-ne-r ((Vec2 Fraction) * (Vec2 Fraction) -> Boolean))
  (define (vec2-ne-r p0 p1) (vec2-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-lt-f ((Vec2 F32) * (Vec2 F32) -> Boolean))
  (define (vec2-lt-f p0 p1) (vec2-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-lt-d ((Vec2 F64) * (Vec2 F64) -> Boolean))
  (define (vec2-lt-d p0 p1) (vec2-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-lt-r ((Vec2 Fraction) * (Vec2 Fraction) -> Boolean))
  (define (vec2-lt-r p0 p1) (vec2-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-le-f ((Vec2 F32) * (Vec2 F32) -> Boolean))
  (define (vec2-le-f p0 p1) (vec2-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-le-d ((Vec2 F64) * (Vec2 F64) -> Boolean))
  (define (vec2-le-d p0 p1) (vec2-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-le-r ((Vec2 Fraction) * (Vec2 Fraction) -> Boolean))
  (define (vec2-le-r p0 p1) (vec2-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-gt-f ((Vec2 F32) * (Vec2 F32) -> Boolean))
  (define (vec2-gt-f p0 p1) (vec2-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-gt-d ((Vec2 F64) * (Vec2 F64) -> Boolean))
  (define (vec2-gt-d p0 p1) (vec2-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-gt-r ((Vec2 Fraction) * (Vec2 Fraction) -> Boolean))
  (define (vec2-gt-r p0 p1) (vec2-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-ge-f ((Vec2 F32) * (Vec2 F32) -> Boolean))
  (define (vec2-ge-f p0 p1) (vec2-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-ge-d ((Vec2 F64) * (Vec2 F64) -> Boolean))
  (define (vec2-ge-d p0 p1) (vec2-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-ge-r ((Vec2 Fraction) * (Vec2 Fraction) -> Boolean))
  (define (vec2-ge-r p0 p1) (vec2-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-dot-f ((Vec2 F32) * (Vec2 F32) -> F32))
  (define (vec2-dot-f p0 p1) (vec2-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-dot-d ((Vec2 F64) * (Vec2 F64) -> F64))
  (define (vec2-dot-d p0 p1) (vec2-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-dot-r ((Vec2 Fraction) * (Vec2 Fraction) -> Fraction))
  (define (vec2-dot-r p0 p1) (vec2-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-sqrlength-f ((Vec2 F32) -> F32))
  (define (vec2-sqrlength-f p0) (vec2-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec2-sqrlength-d ((Vec2 F64) -> F64))
  (define (vec2-sqrlength-d p0) (vec2-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec2-sqrlength-r ((Vec2 Fraction) -> Fraction))
  (define (vec2-sqrlength-r p0) (vec2-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec2-sqrdistance-f ((Vec2 F32) * (Vec2 F32) -> F32))
  (define (vec2-sqrdistance-f p0 p1) (vec2-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-sqrdistance-d ((Vec2 F64) * (Vec2 F64) -> F64))
  (define (vec2-sqrdistance-d p0 p1) (vec2-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-sqrdistance-r ((Vec2 Fraction) * (Vec2 Fraction) -> Fraction))
  (define (vec2-sqrdistance-r p0 p1) (vec2-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-lerp-f ((Vec2 F32) * (Vec2 F32) * F32 -> (Vec2 F32)))
  (define (vec2-lerp-f p0 p1 p2) (vec2-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec2-lerp-d ((Vec2 F64) * (Vec2 F64) * F64 -> (Vec2 F64)))
  (define (vec2-lerp-d p0 p1 p2) (vec2-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec2-lerp-r ((Vec2 Fraction) * (Vec2 Fraction) * Fraction -> (Vec2 Fraction)))
  (define (vec2-lerp-r p0 p1 p2) (vec2-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec2-length-f ((Vec2 F32) -> F32))
  (define (vec2-length-f p0) (vec2-length p0))

  (inline)
  (monomorphize)
  (declare vec2-length-d ((Vec2 F64) -> F64))
  (define (vec2-length-d p0) (vec2-length p0))

  (inline)
  (monomorphize)
  (declare vec2-unit-f ((Vec2 F32) -> (Vec2 F32)))
  (define (vec2-unit-f p0) (vec2-unit p0))

  (inline)
  (monomorphize)
  (declare vec2-unit-d ((Vec2 F64) -> (Vec2 F64)))
  (define (vec2-unit-d p0) (vec2-unit p0))

  (inline)
  (monomorphize)
  (declare vec2-angle-f ((Vec2 F32) * (Vec2 F32) -> F32))
  (define (vec2-angle-f p0 p1) (vec2-angle p0 p1))

  (inline)
  (monomorphize)
  (declare vec2-angle-d ((Vec2 F64) * (Vec2 F64) -> F64))
  (define (vec2-angle-d p0 p1) (vec2-angle p0 p1))

  (inline)
  (monomorphize)
  (declare mat2-transpose-f ((Mat2 F32) -> (Mat2 F32)))
  (define (mat2-transpose-f p0) (mat2-transpose p0))

  (inline)
  (monomorphize)
  (declare mat2-transpose-d ((Mat2 F64) -> (Mat2 F64)))
  (define (mat2-transpose-d p0) (mat2-transpose p0))

  (inline)
  (monomorphize)
  (declare mat2-transpose-r ((Mat2 Fraction) -> (Mat2 Fraction)))
  (define (mat2-transpose-r p0) (mat2-transpose p0))

  (inline)
  (monomorphize)
  (declare mat2-det-f ((Mat2 F32) -> F32))
  (define (mat2-det-f p0) (mat2-det p0))

  (inline)
  (monomorphize)
  (declare mat2-det-d ((Mat2 F64) -> F64))
  (define (mat2-det-d p0) (mat2-det p0))

  (inline)
  (monomorphize)
  (declare mat2-det-r ((Mat2 Fraction) -> Fraction))
  (define (mat2-det-r p0) (mat2-det p0))

  (inline)
  (monomorphize)
  (declare mat2-inverse-f ((Mat2 F32) -> (Mat2 F32)))
  (define (mat2-inverse-f p0) (mat2-inverse p0))

  (inline)
  (monomorphize)
  (declare mat2-inverse-d ((Mat2 F64) -> (Mat2 F64)))
  (define (mat2-inverse-d p0) (mat2-inverse p0))

  (inline)
  (monomorphize)
  (declare mat2-inverse-r ((Mat2 Fraction) -> (Mat2 Fraction)))
  (define (mat2-inverse-r p0) (mat2-inverse p0))

  (inline)
  (monomorphize)
  (declare mat2-mm-f ((Mat2 F32) * (Mat2 F32) -> (Mat2 F32)))
  (define (mat2-mm-f a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat2-mm-d ((Mat2 F64) * (Mat2 F64) -> (Mat2 F64)))
  (define (mat2-mm-d a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat2-mm-r ((Mat2 Fraction) * (Mat2 Fraction) -> (Mat2 Fraction)))
  (define (mat2-mm-r a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat2-mv-f ((Mat2 F32) * (Vec2 F32) -> (Vec2 F32)))
  (define (mat2-mv-f a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat2-mv-d ((Mat2 F64) * (Vec2 F64) -> (Vec2 F64)))
  (define (mat2-mv-d a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat2-mv-r ((Mat2 Fraction) * (Vec2 Fraction) -> (Vec2 Fraction)))
  (define (mat2-mv-r a b) (m* a b))

  (inline)
  (monomorphize)
  (declare vec3-add-f ((Vec3 F32) * (Vec3 F32) -> (Vec3 F32)))
  (define (vec3-add-f p0 p1) (vec3-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-add-d ((Vec3 F64) * (Vec3 F64) -> (Vec3 F64)))
  (define (vec3-add-d p0 p1) (vec3-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-add-r ((Vec3 Fraction) * (Vec3 Fraction) -> (Vec3 Fraction)))
  (define (vec3-add-r p0 p1) (vec3-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-sub-f ((Vec3 F32) * (Vec3 F32) -> (Vec3 F32)))
  (define (vec3-sub-f p0 p1) (vec3-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-sub-d ((Vec3 F64) * (Vec3 F64) -> (Vec3 F64)))
  (define (vec3-sub-d p0 p1) (vec3-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-sub-r ((Vec3 Fraction) * (Vec3 Fraction) -> (Vec3 Fraction)))
  (define (vec3-sub-r p0 p1) (vec3-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-mul-f ((Vec3 F32) * (Vec3 F32) -> (Vec3 F32)))
  (define (vec3-mul-f p0 p1) (vec3-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-mul-d ((Vec3 F64) * (Vec3 F64) -> (Vec3 F64)))
  (define (vec3-mul-d p0 p1) (vec3-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-mul-r ((Vec3 Fraction) * (Vec3 Fraction) -> (Vec3 Fraction)))
  (define (vec3-mul-r p0 p1) (vec3-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-div-f ((Vec3 F32) * (Vec3 F32) -> (Vec3 F32)))
  (define (vec3-div-f p0 p1) (vec3-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-div-d ((Vec3 F64) * (Vec3 F64) -> (Vec3 F64)))
  (define (vec3-div-d p0 p1) (vec3-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-div-r ((Vec3 Fraction) * (Vec3 Fraction) -> (Vec3 Fraction)))
  (define (vec3-div-r p0 p1) (vec3-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-eq-f ((Vec3 F32) * (Vec3 F32) -> Boolean))
  (define (vec3-eq-f p0 p1) (vec3-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-eq-d ((Vec3 F64) * (Vec3 F64) -> Boolean))
  (define (vec3-eq-d p0 p1) (vec3-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-eq-r ((Vec3 Fraction) * (Vec3 Fraction) -> Boolean))
  (define (vec3-eq-r p0 p1) (vec3-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-ne-f ((Vec3 F32) * (Vec3 F32) -> Boolean))
  (define (vec3-ne-f p0 p1) (vec3-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-ne-d ((Vec3 F64) * (Vec3 F64) -> Boolean))
  (define (vec3-ne-d p0 p1) (vec3-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-ne-r ((Vec3 Fraction) * (Vec3 Fraction) -> Boolean))
  (define (vec3-ne-r p0 p1) (vec3-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-lt-f ((Vec3 F32) * (Vec3 F32) -> Boolean))
  (define (vec3-lt-f p0 p1) (vec3-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-lt-d ((Vec3 F64) * (Vec3 F64) -> Boolean))
  (define (vec3-lt-d p0 p1) (vec3-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-lt-r ((Vec3 Fraction) * (Vec3 Fraction) -> Boolean))
  (define (vec3-lt-r p0 p1) (vec3-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-le-f ((Vec3 F32) * (Vec3 F32) -> Boolean))
  (define (vec3-le-f p0 p1) (vec3-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-le-d ((Vec3 F64) * (Vec3 F64) -> Boolean))
  (define (vec3-le-d p0 p1) (vec3-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-le-r ((Vec3 Fraction) * (Vec3 Fraction) -> Boolean))
  (define (vec3-le-r p0 p1) (vec3-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-gt-f ((Vec3 F32) * (Vec3 F32) -> Boolean))
  (define (vec3-gt-f p0 p1) (vec3-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-gt-d ((Vec3 F64) * (Vec3 F64) -> Boolean))
  (define (vec3-gt-d p0 p1) (vec3-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-gt-r ((Vec3 Fraction) * (Vec3 Fraction) -> Boolean))
  (define (vec3-gt-r p0 p1) (vec3-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-ge-f ((Vec3 F32) * (Vec3 F32) -> Boolean))
  (define (vec3-ge-f p0 p1) (vec3-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-ge-d ((Vec3 F64) * (Vec3 F64) -> Boolean))
  (define (vec3-ge-d p0 p1) (vec3-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-ge-r ((Vec3 Fraction) * (Vec3 Fraction) -> Boolean))
  (define (vec3-ge-r p0 p1) (vec3-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-dot-f ((Vec3 F32) * (Vec3 F32) -> F32))
  (define (vec3-dot-f p0 p1) (vec3-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-dot-d ((Vec3 F64) * (Vec3 F64) -> F64))
  (define (vec3-dot-d p0 p1) (vec3-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-dot-r ((Vec3 Fraction) * (Vec3 Fraction) -> Fraction))
  (define (vec3-dot-r p0 p1) (vec3-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-sqrlength-f ((Vec3 F32) -> F32))
  (define (vec3-sqrlength-f p0) (vec3-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec3-sqrlength-d ((Vec3 F64) -> F64))
  (define (vec3-sqrlength-d p0) (vec3-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec3-sqrlength-r ((Vec3 Fraction) -> Fraction))
  (define (vec3-sqrlength-r p0) (vec3-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec3-sqrdistance-f ((Vec3 F32) * (Vec3 F32) -> F32))
  (define (vec3-sqrdistance-f p0 p1) (vec3-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-sqrdistance-d ((Vec3 F64) * (Vec3 F64) -> F64))
  (define (vec3-sqrdistance-d p0 p1) (vec3-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-sqrdistance-r ((Vec3 Fraction) * (Vec3 Fraction) -> Fraction))
  (define (vec3-sqrdistance-r p0 p1) (vec3-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-lerp-f ((Vec3 F32) * (Vec3 F32) * F32 -> (Vec3 F32)))
  (define (vec3-lerp-f p0 p1 p2) (vec3-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec3-lerp-d ((Vec3 F64) * (Vec3 F64) * F64 -> (Vec3 F64)))
  (define (vec3-lerp-d p0 p1 p2) (vec3-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec3-lerp-r ((Vec3 Fraction) * (Vec3 Fraction) * Fraction -> (Vec3 Fraction)))
  (define (vec3-lerp-r p0 p1 p2) (vec3-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec3-length-f ((Vec3 F32) -> F32))
  (define (vec3-length-f p0) (vec3-length p0))

  (inline)
  (monomorphize)
  (declare vec3-length-d ((Vec3 F64) -> F64))
  (define (vec3-length-d p0) (vec3-length p0))

  (inline)
  (monomorphize)
  (declare vec3-unit-f ((Vec3 F32) -> (Vec3 F32)))
  (define (vec3-unit-f p0) (vec3-unit p0))

  (inline)
  (monomorphize)
  (declare vec3-unit-d ((Vec3 F64) -> (Vec3 F64)))
  (define (vec3-unit-d p0) (vec3-unit p0))

  (inline)
  (monomorphize)
  (declare vec3-angle-f ((Vec3 F32) * (Vec3 F32) -> F32))
  (define (vec3-angle-f p0 p1) (vec3-angle p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-angle-d ((Vec3 F64) * (Vec3 F64) -> F64))
  (define (vec3-angle-d p0 p1) (vec3-angle p0 p1))

  (inline)
  (monomorphize)
  (declare mat3-transpose-f ((Mat3 F32) -> (Mat3 F32)))
  (define (mat3-transpose-f p0) (mat3-transpose p0))

  (inline)
  (monomorphize)
  (declare mat3-transpose-d ((Mat3 F64) -> (Mat3 F64)))
  (define (mat3-transpose-d p0) (mat3-transpose p0))

  (inline)
  (monomorphize)
  (declare mat3-transpose-r ((Mat3 Fraction) -> (Mat3 Fraction)))
  (define (mat3-transpose-r p0) (mat3-transpose p0))

  (inline)
  (monomorphize)
  (declare mat3-det-f ((Mat3 F32) -> F32))
  (define (mat3-det-f p0) (mat3-det p0))

  (inline)
  (monomorphize)
  (declare mat3-det-d ((Mat3 F64) -> F64))
  (define (mat3-det-d p0) (mat3-det p0))

  (inline)
  (monomorphize)
  (declare mat3-det-r ((Mat3 Fraction) -> Fraction))
  (define (mat3-det-r p0) (mat3-det p0))

  (inline)
  (monomorphize)
  (declare mat3-inverse-f ((Mat3 F32) -> (Mat3 F32)))
  (define (mat3-inverse-f p0) (mat3-inverse p0))

  (inline)
  (monomorphize)
  (declare mat3-inverse-d ((Mat3 F64) -> (Mat3 F64)))
  (define (mat3-inverse-d p0) (mat3-inverse p0))

  (inline)
  (monomorphize)
  (declare mat3-inverse-r ((Mat3 Fraction) -> (Mat3 Fraction)))
  (define (mat3-inverse-r p0) (mat3-inverse p0))

  (inline)
  (monomorphize)
  (declare mat3-mm-f ((Mat3 F32) * (Mat3 F32) -> (Mat3 F32)))
  (define (mat3-mm-f a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat3-mm-d ((Mat3 F64) * (Mat3 F64) -> (Mat3 F64)))
  (define (mat3-mm-d a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat3-mm-r ((Mat3 Fraction) * (Mat3 Fraction) -> (Mat3 Fraction)))
  (define (mat3-mm-r a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat3-mv-f ((Mat3 F32) * (Vec3 F32) -> (Vec3 F32)))
  (define (mat3-mv-f a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat3-mv-d ((Mat3 F64) * (Vec3 F64) -> (Vec3 F64)))
  (define (mat3-mv-d a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat3-mv-r ((Mat3 Fraction) * (Vec3 Fraction) -> (Vec3 Fraction)))
  (define (mat3-mv-r a b) (m* a b))

  (inline)
  (monomorphize)
  (declare vec4-add-f ((Vec4 F32) * (Vec4 F32) -> (Vec4 F32)))
  (define (vec4-add-f p0 p1) (vec4-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-add-d ((Vec4 F64) * (Vec4 F64) -> (Vec4 F64)))
  (define (vec4-add-d p0 p1) (vec4-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-add-r ((Vec4 Fraction) * (Vec4 Fraction) -> (Vec4 Fraction)))
  (define (vec4-add-r p0 p1) (vec4-add p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-sub-f ((Vec4 F32) * (Vec4 F32) -> (Vec4 F32)))
  (define (vec4-sub-f p0 p1) (vec4-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-sub-d ((Vec4 F64) * (Vec4 F64) -> (Vec4 F64)))
  (define (vec4-sub-d p0 p1) (vec4-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-sub-r ((Vec4 Fraction) * (Vec4 Fraction) -> (Vec4 Fraction)))
  (define (vec4-sub-r p0 p1) (vec4-sub p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-mul-f ((Vec4 F32) * (Vec4 F32) -> (Vec4 F32)))
  (define (vec4-mul-f p0 p1) (vec4-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-mul-d ((Vec4 F64) * (Vec4 F64) -> (Vec4 F64)))
  (define (vec4-mul-d p0 p1) (vec4-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-mul-r ((Vec4 Fraction) * (Vec4 Fraction) -> (Vec4 Fraction)))
  (define (vec4-mul-r p0 p1) (vec4-mul p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-div-f ((Vec4 F32) * (Vec4 F32) -> (Vec4 F32)))
  (define (vec4-div-f p0 p1) (vec4-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-div-d ((Vec4 F64) * (Vec4 F64) -> (Vec4 F64)))
  (define (vec4-div-d p0 p1) (vec4-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-div-r ((Vec4 Fraction) * (Vec4 Fraction) -> (Vec4 Fraction)))
  (define (vec4-div-r p0 p1) (vec4-div p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-eq-f ((Vec4 F32) * (Vec4 F32) -> Boolean))
  (define (vec4-eq-f p0 p1) (vec4-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-eq-d ((Vec4 F64) * (Vec4 F64) -> Boolean))
  (define (vec4-eq-d p0 p1) (vec4-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-eq-r ((Vec4 Fraction) * (Vec4 Fraction) -> Boolean))
  (define (vec4-eq-r p0 p1) (vec4-eq p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-ne-f ((Vec4 F32) * (Vec4 F32) -> Boolean))
  (define (vec4-ne-f p0 p1) (vec4-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-ne-d ((Vec4 F64) * (Vec4 F64) -> Boolean))
  (define (vec4-ne-d p0 p1) (vec4-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-ne-r ((Vec4 Fraction) * (Vec4 Fraction) -> Boolean))
  (define (vec4-ne-r p0 p1) (vec4-ne p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-lt-f ((Vec4 F32) * (Vec4 F32) -> Boolean))
  (define (vec4-lt-f p0 p1) (vec4-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-lt-d ((Vec4 F64) * (Vec4 F64) -> Boolean))
  (define (vec4-lt-d p0 p1) (vec4-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-lt-r ((Vec4 Fraction) * (Vec4 Fraction) -> Boolean))
  (define (vec4-lt-r p0 p1) (vec4-lt p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-le-f ((Vec4 F32) * (Vec4 F32) -> Boolean))
  (define (vec4-le-f p0 p1) (vec4-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-le-d ((Vec4 F64) * (Vec4 F64) -> Boolean))
  (define (vec4-le-d p0 p1) (vec4-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-le-r ((Vec4 Fraction) * (Vec4 Fraction) -> Boolean))
  (define (vec4-le-r p0 p1) (vec4-le p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-gt-f ((Vec4 F32) * (Vec4 F32) -> Boolean))
  (define (vec4-gt-f p0 p1) (vec4-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-gt-d ((Vec4 F64) * (Vec4 F64) -> Boolean))
  (define (vec4-gt-d p0 p1) (vec4-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-gt-r ((Vec4 Fraction) * (Vec4 Fraction) -> Boolean))
  (define (vec4-gt-r p0 p1) (vec4-gt p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-ge-f ((Vec4 F32) * (Vec4 F32) -> Boolean))
  (define (vec4-ge-f p0 p1) (vec4-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-ge-d ((Vec4 F64) * (Vec4 F64) -> Boolean))
  (define (vec4-ge-d p0 p1) (vec4-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-ge-r ((Vec4 Fraction) * (Vec4 Fraction) -> Boolean))
  (define (vec4-ge-r p0 p1) (vec4-ge p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-dot-f ((Vec4 F32) * (Vec4 F32) -> F32))
  (define (vec4-dot-f p0 p1) (vec4-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-dot-d ((Vec4 F64) * (Vec4 F64) -> F64))
  (define (vec4-dot-d p0 p1) (vec4-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-dot-r ((Vec4 Fraction) * (Vec4 Fraction) -> Fraction))
  (define (vec4-dot-r p0 p1) (vec4-dot p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-sqrlength-f ((Vec4 F32) -> F32))
  (define (vec4-sqrlength-f p0) (vec4-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec4-sqrlength-d ((Vec4 F64) -> F64))
  (define (vec4-sqrlength-d p0) (vec4-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec4-sqrlength-r ((Vec4 Fraction) -> Fraction))
  (define (vec4-sqrlength-r p0) (vec4-sqrlength p0))

  (inline)
  (monomorphize)
  (declare vec4-sqrdistance-f ((Vec4 F32) * (Vec4 F32) -> F32))
  (define (vec4-sqrdistance-f p0 p1) (vec4-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-sqrdistance-d ((Vec4 F64) * (Vec4 F64) -> F64))
  (define (vec4-sqrdistance-d p0 p1) (vec4-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-sqrdistance-r ((Vec4 Fraction) * (Vec4 Fraction) -> Fraction))
  (define (vec4-sqrdistance-r p0 p1) (vec4-sqrdistance p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-lerp-f ((Vec4 F32) * (Vec4 F32) * F32 -> (Vec4 F32)))
  (define (vec4-lerp-f p0 p1 p2) (vec4-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec4-lerp-d ((Vec4 F64) * (Vec4 F64) * F64 -> (Vec4 F64)))
  (define (vec4-lerp-d p0 p1 p2) (vec4-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec4-lerp-r ((Vec4 Fraction) * (Vec4 Fraction) * Fraction -> (Vec4 Fraction)))
  (define (vec4-lerp-r p0 p1 p2) (vec4-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare vec4-length-f ((Vec4 F32) -> F32))
  (define (vec4-length-f p0) (vec4-length p0))

  (inline)
  (monomorphize)
  (declare vec4-length-d ((Vec4 F64) -> F64))
  (define (vec4-length-d p0) (vec4-length p0))

  (inline)
  (monomorphize)
  (declare vec4-unit-f ((Vec4 F32) -> (Vec4 F32)))
  (define (vec4-unit-f p0) (vec4-unit p0))

  (inline)
  (monomorphize)
  (declare vec4-unit-d ((Vec4 F64) -> (Vec4 F64)))
  (define (vec4-unit-d p0) (vec4-unit p0))

  (inline)
  (monomorphize)
  (declare vec4-angle-f ((Vec4 F32) * (Vec4 F32) -> F32))
  (define (vec4-angle-f p0 p1) (vec4-angle p0 p1))

  (inline)
  (monomorphize)
  (declare vec4-angle-d ((Vec4 F64) * (Vec4 F64) -> F64))
  (define (vec4-angle-d p0 p1) (vec4-angle p0 p1))

  (inline)
  (monomorphize)
  (declare mat4-transpose-f ((Mat4 F32) -> (Mat4 F32)))
  (define (mat4-transpose-f p0) (mat4-transpose p0))

  (inline)
  (monomorphize)
  (declare mat4-transpose-d ((Mat4 F64) -> (Mat4 F64)))
  (define (mat4-transpose-d p0) (mat4-transpose p0))

  (inline)
  (monomorphize)
  (declare mat4-transpose-r ((Mat4 Fraction) -> (Mat4 Fraction)))
  (define (mat4-transpose-r p0) (mat4-transpose p0))

  (inline)
  (monomorphize)
  (declare mat4-det-f ((Mat4 F32) -> F32))
  (define (mat4-det-f p0) (mat4-det p0))

  (inline)
  (monomorphize)
  (declare mat4-det-d ((Mat4 F64) -> F64))
  (define (mat4-det-d p0) (mat4-det p0))

  (inline)
  (monomorphize)
  (declare mat4-det-r ((Mat4 Fraction) -> Fraction))
  (define (mat4-det-r p0) (mat4-det p0))

  (inline)
  (monomorphize)
  (declare mat4-inverse-f ((Mat4 F32) -> (Mat4 F32)))
  (define (mat4-inverse-f p0) (mat4-inverse p0))

  (inline)
  (monomorphize)
  (declare mat4-inverse-d ((Mat4 F64) -> (Mat4 F64)))
  (define (mat4-inverse-d p0) (mat4-inverse p0))

  (inline)
  (monomorphize)
  (declare mat4-inverse-r ((Mat4 Fraction) -> (Mat4 Fraction)))
  (define (mat4-inverse-r p0) (mat4-inverse p0))

  (inline)
  (monomorphize)
  (declare mat4-mm-f ((Mat4 F32) * (Mat4 F32) -> (Mat4 F32)))
  (define (mat4-mm-f a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat4-mm-d ((Mat4 F64) * (Mat4 F64) -> (Mat4 F64)))
  (define (mat4-mm-d a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat4-mm-r ((Mat4 Fraction) * (Mat4 Fraction) -> (Mat4 Fraction)))
  (define (mat4-mm-r a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat4-mv-f ((Mat4 F32) * (Vec4 F32) -> (Vec4 F32)))
  (define (mat4-mv-f a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat4-mv-d ((Mat4 F64) * (Vec4 F64) -> (Vec4 F64)))
  (define (mat4-mv-d a b) (m* a b))

  (inline)
  (monomorphize)
  (declare mat4-mv-r ((Mat4 Fraction) * (Vec4 Fraction) -> (Vec4 Fraction)))
  (define (mat4-mv-r a b) (m* a b))

  (monomorphize)
  (declare matn-mm-f ((MatN F32) * (MatN F32) -> (MatN F32)))
  (define (matn-mm-f a b) (m* a b))

  (monomorphize)
  (declare matn-mm-d ((MatN F64) * (MatN F64) -> (MatN F64)))
  (define (matn-mm-d a b) (m* a b))

  (monomorphize)
  (declare matn-mm-r ((MatN Fraction) * (MatN Fraction) -> (MatN Fraction)))
  (define (matn-mm-r a b) (m* a b))

  (inline)
  (monomorphize)
  (declare vec3-cross-f ((Vec3 F32) * (Vec3 F32) -> (Vec3 F32)))
  (define (vec3-cross-f p0 p1) (vec3-cross p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-cross-d ((Vec3 F64) * (Vec3 F64) -> (Vec3 F64)))
  (define (vec3-cross-d p0 p1) (vec3-cross p0 p1))

  (inline)
  (monomorphize)
  (declare vec3-cross-r ((Vec3 Fraction) * (Vec3 Fraction) -> (Vec3 Fraction)))
  (define (vec3-cross-r p0 p1) (vec3-cross p0 p1))

  (inline)
  (monomorphize)
  (declare quat-conjugate-f ((Quat F32) -> (Quat F32)))
  (define (quat-conjugate-f p0) (quat-conjugate p0))

  (inline)
  (monomorphize)
  (declare quat-conjugate-d ((Quat F64) -> (Quat F64)))
  (define (quat-conjugate-d p0) (quat-conjugate p0))

  (inline)
  (monomorphize)
  (declare quat-conjugate-r ((Quat Fraction) -> (Quat Fraction)))
  (define (quat-conjugate-r p0) (quat-conjugate p0))

  (inline)
  (monomorphize)
  (declare quat-mul-f ((Quat F32) * (Quat F32) -> (Quat F32)))
  (define (quat-mul-f p0 p1) (quat-mul p0 p1))

  (inline)
  (monomorphize)
  (declare quat-mul-d ((Quat F64) * (Quat F64) -> (Quat F64)))
  (define (quat-mul-d p0 p1) (quat-mul p0 p1))

  (inline)
  (monomorphize)
  (declare quat-mul-r ((Quat Fraction) * (Quat Fraction) -> (Quat Fraction)))
  (define (quat-mul-r p0 p1) (quat-mul p0 p1))

  (inline)
  (monomorphize)
  (declare quat-lerp-f ((Quat F32) * (Quat F32) * F32 -> (Quat F32)))
  (define (quat-lerp-f p0 p1 p2) (quat-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare quat-lerp-d ((Quat F64) * (Quat F64) * F64 -> (Quat F64)))
  (define (quat-lerp-d p0 p1 p2) (quat-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare quat-lerp-r ((Quat Fraction) * (Quat Fraction) * Fraction -> (Quat Fraction)))
  (define (quat-lerp-r p0 p1 p2) (quat-lerp p0 p1 p2))

  (inline)
  (monomorphize)
  (declare quat-rotate-vector-f ((Vec3 F32) * (Quat F32) -> (Vec3 F32)))
  (define (quat-rotate-vector-f p0 p1) (quat-rotate-vector p0 p1))

  (inline)
  (monomorphize)
  (declare quat-rotate-vector-d ((Vec3 F64) * (Quat F64) -> (Vec3 F64)))
  (define (quat-rotate-vector-d p0 p1) (quat-rotate-vector p0 p1))

  (inline)
  (monomorphize)
  (declare quat-rotate-vector-r ((Vec3 Fraction) * (Quat Fraction) -> (Vec3 Fraction)))
  (define (quat-rotate-vector-r p0 p1) (quat-rotate-vector p0 p1))

  (inline)
  (monomorphize)
  (declare quat-rotation-f ((Vec3 F32) * F32 -> (Quat F32)))
  (define (quat-rotation-f p0 p1) (quat-rotation p0 p1))

  (inline)
  (monomorphize)
  (declare quat-rotation-d ((Vec3 F64) * F64 -> (Quat F64)))
  (define (quat-rotation-d p0 p1) (quat-rotation p0 p1))

  (inline)
  (monomorphize)
  (declare quat-from-to-f ((Vec3 F32) * (Vec3 F32) -> (Quat F32)))
  (define (quat-from-to-f p0 p1) (quat-from-to p0 p1))

  (inline)
  (monomorphize)
  (declare quat-from-to-d ((Vec3 F64) * (Vec3 F64) -> (Quat F64)))
  (define (quat-from-to-d p0 p1) (quat-from-to p0 p1))

  (inline)
  (monomorphize)
  (declare quat-matrix-f ((Quat F32) -> (Mat4 F32)))
  (define (quat-matrix-f p0) (quat-matrix p0))

  (inline)
  (monomorphize)
  (declare quat-matrix-d ((Quat F64) -> (Mat4 F64)))
  (define (quat-matrix-d p0) (quat-matrix p0))

  (inline)
  (monomorphize)
  (declare quat-matrix-r ((Quat Fraction) -> (Mat4 Fraction)))
  (define (quat-matrix-r p0) (quat-matrix p0))

  (inline)
  (monomorphize)
  (declare quat-x-axis-f ((Quat F32) -> (Vec3 F32)))
  (define (quat-x-axis-f p0) (quat-x-axis p0))

  (inline)
  (monomorphize)
  (declare quat-x-axis-d ((Quat F64) -> (Vec3 F64)))
  (define (quat-x-axis-d p0) (quat-x-axis p0))

  (inline)
  (monomorphize)
  (declare quat-y-axis-f ((Quat F32) -> (Vec3 F32)))
  (define (quat-y-axis-f p0) (quat-y-axis p0))

  (inline)
  (monomorphize)
  (declare quat-y-axis-d ((Quat F64) -> (Vec3 F64)))
  (define (quat-y-axis-d p0) (quat-y-axis p0))

  (inline)
  (monomorphize)
  (declare quat-z-axis-f ((Quat F32) -> (Vec3 F32)))
  (define (quat-z-axis-f p0) (quat-z-axis p0))

  (inline)
  (monomorphize)
  (declare quat-z-axis-d ((Quat F64) -> (Vec3 F64)))
  (define (quat-z-axis-d p0) (quat-z-axis p0))

  (inline)
  (monomorphize)
  (declare mat4-translate-f ((Mat4 F32) * (Vec3 F32) -> (Mat4 F32)))
  (define (mat4-translate-f p0 p1) (mat4-translate p0 p1))

  (inline)
  (monomorphize)
  (declare mat4-translate-d ((Mat4 F64) * (Vec3 F64) -> (Mat4 F64)))
  (define (mat4-translate-d p0 p1) (mat4-translate p0 p1))

  (inline)
  (monomorphize)
  (declare mat4-translate-r ((Mat4 Fraction) * (Vec3 Fraction) -> (Mat4 Fraction)))
  (define (mat4-translate-r p0 p1) (mat4-translate p0 p1))

  (inline)
  (monomorphize)
  (declare mat4-scale-f ((Mat4 F32) * (Vec3 F32) -> (Mat4 F32)))
  (define (mat4-scale-f p0 p1) (mat4-scale p0 p1))

  (inline)
  (monomorphize)
  (declare mat4-scale-d ((Mat4 F64) * (Vec3 F64) -> (Mat4 F64)))
  (define (mat4-scale-d p0 p1) (mat4-scale p0 p1))

  (inline)
  (monomorphize)
  (declare mat4-scale-r ((Mat4 Fraction) * (Vec3 Fraction) -> (Mat4 Fraction)))
  (define (mat4-scale-r p0 p1) (mat4-scale p0 p1))

  (inline)
  (monomorphize)
  (declare lookat-f ((Vec3 F32) * (Vec3 F32) * (Vec3 F32) -> (Mat4 F32)))
  (define (lookat-f p0 p1 p2) (lookat p0 p1 p2))

  (inline)
  (monomorphize)
  (declare lookat-d ((Vec3 F64) * (Vec3 F64) * (Vec3 F64) -> (Mat4 F64)))
  (define (lookat-d p0 p1 p2) (lookat p0 p1 p2))
)

;;;; Vulkan projection matrices, ported from KRMA utilities.lisp.
;;;; Right-handed eye coordinates (forward = -Z), NDC depth [0,1],
;;;; inverted Y, column-vector multiplication. make-mat4 takes rows.

(coalton-toplevel
  (inline)
  (declare perspective-vulkan-from-tangent
    ((Reciprocable :a) (types:RuntimeRepr :a) =>
     :a * :a * :a * :a -> (Mat4 :a)))
  (define (perspective-vulkan-from-tangent half-fovy-tangent aspect-ratio near far)
    (let ((f (/ 1 half-fovy-tangent))
          (near-far (- near far)))
      (let ((a (/ far near-far))
            (b (/ (* near far) near-far))
            (x (/ f aspect-ratio))
            (y (negate f)))
        (make-mat4 x 0 0 0
                   0 y 0 0
                   0 0 a b
                   0 0 -1 0))))

  (inline)
  (declare mperspective-vulkan
    ((Reciprocable :a) (coalton/math/elementary:Trigonometric :a)
     (types:RuntimeRepr :a) =>
     :a * :a * :a * :a -> (Mat4 :a)))
  (define (mperspective-vulkan fovy aspect-ratio near far)
    "Perspective projection. FOVY is the vertical field of view in degrees."
    (perspective-vulkan-from-tangent
     (coalton/math/elementary:tan
      (* (/ 1 2) (* fovy (/ coalton/math/elementary:pi 180))))
     aspect-ratio near far))

  (inline)
  (declare mortho-vulkan
    ((Reciprocable :a) (types:RuntimeRepr :a) =>
     :a * :a * :a * :a * :a * :a -> (Mat4 :a)))
  (define (mortho-vulkan left right bottom top near far)
    "Orthographic projection. NEAR and FAR are distances along negative Z."
    (let ((rl (- right left))
          (bu (- bottom top))
          (nf (- near far)))
      (make-mat4 (/ 2 rl) 0 0 (negate (/ (+ right left) rl))
                 0 (/ 2 bu) 0 (negate (/ (+ bottom top) bu))
                 0 0 (/ 1 nf) (/ near nf)
                 0 0 0 1))))

(coalton-toplevel
  ;; Match KRMA: compute tan in double precision even when the rest
  ;; of the perspective coefficients and the result are single-float.
  (inline)
  (monomorphize)
  (declare mperspective-vulkan-f (F64 * F32 * F32 * F32 -> (Mat4 F32)))
  (define (mperspective-vulkan-f fovy aspect-ratio near far)
    (let ((tangent (coalton/math/elementary:tan
                    (* 0.5d0 (* fovy (/ (the F64 coalton/math/elementary:pi) 180))))))
      (perspective-vulkan-from-tangent
       (lisp (-> F32) (tangent) (cl:coerce tangent 'cl:single-float))
       aspect-ratio near far)))

  (inline)
  (monomorphize)
  (declare mperspective-vulkan-d (F64 * F64 * F64 * F64 -> (Mat4 F64)))
  (define (mperspective-vulkan-d fovy aspect-ratio near far)
    (mperspective-vulkan fovy aspect-ratio near far))

  (inline)
  (monomorphize)
  (declare mortho-vulkan-f (F32 * F32 * F32 * F32 * F32 * F32 -> (Mat4 F32)))
  (define (mortho-vulkan-f left right bottom top near far)
    (mortho-vulkan left right bottom top near far))

  (inline)
  (monomorphize)
  (declare mortho-vulkan-d (F64 * F64 * F64 * F64 * F64 * F64 -> (Mat4 F64)))
  (define (mortho-vulkan-d left right bottom top near far)
    (mortho-vulkan left right bottom top near far)))
