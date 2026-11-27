;;;; Opt-in Common Lisp interface; original 3dm:m* is not redefined.
(defpackage #:3dm.coalton
  (:use #:cl)
  (:export #:m* #:binary-m* #:run-tests #:benchmark))
(in-package #:3dm.coalton)

(defgeneric binary-m* (a b))

(defmethod binary-m* ((a 3dm.d::mat2) (b 3dm.d::vec2))
  (3dm.coalton.kernel::mul-d-mat2-d-vec2 a b))

(defmethod binary-m* ((a 3dm.d::vec2) (b 3dm.d::mat2))
  (3dm.coalton.kernel::mul-d-vec2-d-mat2 a b))

(defmethod binary-m* ((a 3dm.d::mat2) (b 3dm.f::vec2))
  (3dm.coalton.kernel::mul-d-mat2-f-vec2 a b))

(defmethod binary-m* ((a 3dm.f::vec2) (b 3dm.d::mat2))
  (3dm.coalton.kernel::mul-f-vec2-d-mat2 a b))

(defmethod binary-m* ((a 3dm.f::mat2) (b 3dm.f::vec2))
  (3dm.coalton.kernel::mul-f-mat2-f-vec2 a b))

(defmethod binary-m* ((a 3dm.f::vec2) (b 3dm.f::mat2))
  (3dm.coalton.kernel::mul-f-vec2-f-mat2 a b))

(defmethod binary-m* ((a 3dm.d::mat2) (b 3dm.d::mat2))
  (3dm.coalton.kernel::mul-d-mat2-d-mat2 a b))

(defmethod binary-m* ((a 3dm.f::mat2) (b 3dm.f::mat2))
  (3dm.coalton.kernel::mul-f-mat2-f-mat2 a b))

(defmethod binary-m* ((a 3dm.d::mat2) (b 3dm.f::mat2))
  (3dm.coalton.kernel::mul-d-mat2-f-mat2 a b))

(defmethod binary-m* ((a 3dm.d::mat3) (b 3dm.d::vec3))
  (3dm.coalton.kernel::mul-d-mat3-d-vec3 a b))

(defmethod binary-m* ((a 3dm.d::vec3) (b 3dm.d::mat3))
  (3dm.coalton.kernel::mul-d-vec3-d-mat3 a b))

(defmethod binary-m* ((a 3dm.d::mat3) (b 3dm.f::vec3))
  (3dm.coalton.kernel::mul-d-mat3-f-vec3 a b))

(defmethod binary-m* ((a 3dm.f::vec3) (b 3dm.d::mat3))
  (3dm.coalton.kernel::mul-f-vec3-d-mat3 a b))

(defmethod binary-m* ((a 3dm.f::mat3) (b 3dm.f::vec3))
  (3dm.coalton.kernel::mul-f-mat3-f-vec3 a b))

(defmethod binary-m* ((a 3dm.f::vec3) (b 3dm.f::mat3))
  (3dm.coalton.kernel::mul-f-vec3-f-mat3 a b))

(defmethod binary-m* ((a 3dm.d::mat4) (b 3dm.d::vec4))
  (3dm.coalton.kernel::mul-d-mat4-d-vec4 a b))

(defmethod binary-m* ((a 3dm.d::vec4) (b 3dm.d::mat4))
  (3dm.coalton.kernel::mul-d-vec4-d-mat4 a b))

(defmethod binary-m* ((a 3dm.d::mat4) (b 3dm.f::vec4))
  (3dm.coalton.kernel::mul-d-mat4-f-vec4 a b))

(defmethod binary-m* ((a 3dm.f::vec4) (b 3dm.d::mat4))
  (3dm.coalton.kernel::mul-f-vec4-d-mat4 a b))

(defmethod binary-m* ((a 3dm.f::mat4) (b 3dm.d::vec4))
  (3dm.coalton.kernel::mul-f-mat4-d-vec4 a b))

(defmethod binary-m* ((a 3dm.d::vec4) (b 3dm.f::mat4))
  (3dm.coalton.kernel::mul-d-vec4-f-mat4 a b))

(defmethod binary-m* ((a 3dm.f::mat4) (b 3dm.f::vec4))
  (3dm.coalton.kernel::mul-f-mat4-f-vec4 a b))

(defmethod binary-m* ((a 3dm.f::vec4) (b 3dm.f::mat4))
  (3dm.coalton.kernel::mul-f-vec4-f-mat4 a b))

(defmethod binary-m* ((a 3dm.d::mat4) (b 3dm.d::mat4))
  (3dm.coalton.kernel::mul-d-mat4-d-mat4 a b))

(defmethod binary-m* ((a 3dm.f::mat4) (b 3dm.f::mat4))
  (3dm.coalton.kernel::mul-f-mat4-f-mat4 a b))

(defmethod binary-m* ((a 3dm.d::mat4) (b 3dm.f::mat4))
  (3dm.coalton.kernel::mul-d-mat4-f-mat4 a b))

(defmethod binary-m* ((a 3dm.f::mat4) (b 3dm.d::mat4))
  (3dm.coalton.kernel::mul-f-mat4-d-mat4 a b))

;; Only specialized rank-two float arrays cross into the typed array kernels.
;; The original library's rational/general numeric array path stays available.
(defmethod binary-m* ((a array) (b array))
  (if (and (= (array-rank a) 2) (= (array-rank b) 2)
           (typep a 'simple-array) (typep b 'simple-array)
           (member (array-element-type a) '(single-float double-float))
           (member (array-element-type b) '(single-float double-float)))
      (destructuring-bind (m n) (array-dimensions a)
        (assert (= n (array-dimension b 0)))
        (let ((p (array-dimension b 1)))
          (check-type m (integer 0 #.most-positive-fixnum))
          (check-type n (integer 0 #.most-positive-fixnum))
          (check-type p (integer 0 #.most-positive-fixnum))
          (etypecase a
            ((simple-array single-float (* *))
             (etypecase b
               ((simple-array single-float (* *)) (3dm.coalton.kernel::mul-array-ff a b m n p))
               ((simple-array double-float (* *)) (3dm.coalton.kernel::mul-array-fd a b m n p))))
            ((simple-array double-float (* *))
             (etypecase b
               ((simple-array single-float (* *)) (3dm.coalton.kernel::mul-array-df a b m n p))
               ((simple-array double-float (* *)) (3dm.coalton.kernel::mul-array-dd a b m n p)))))))
      (3dm:m* a b)))

;; Preserve extensions and unsupported pairs' original dispatch behavior.
(defmethod binary-m* (a b)
  (3dm:m* a b))

(defun m* (val &rest vals)
  (reduce #'binary-m* vals :initial-value val))

(define-compiler-macro m* (val &rest vals)
  (reduce (lambda (a b) `(binary-m* ,a ,b)) vals :initial-value val))
