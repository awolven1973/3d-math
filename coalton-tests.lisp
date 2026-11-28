(cl:defpackage #:3dm.coalton.tests
  (:use #:coalton #:coalton-prelude #:3dm.coalton)
  (:export #:run-tests))
(cl:in-package #:3dm.coalton.tests)

(coalton-toplevel
  (declare check (Boolean * String -> Void))
  (define (check ok message)
    (if ok
        (values)
        (lisp (-> Void) (message)
          (cl:error "~A" message)))))

;; Compile each assertion independently to isolate fundep solver failures.
(coalton-toplevel
  (declare test-01-2d-f32-f32-matrix-product (Void -> Void))
  (define (test-01-2d-f32-f32-matrix-product)
    (check (== (m* (make-mat2 1.0f0 2.0f0 3.0f0 4.0f0)
                  (make-mat2 -2.0f0 1.0f0 -3.0f0 0.0f0))
               (make-mat2 -8.0f0 1.0f0 -18.0f0 3.0f0))
           "2D F32/F32 matrix product")))

(coalton-toplevel
  (declare test-02-2d-f32-f32-matrix-vector (Void -> Void))
  (define (test-02-2d-f32-f32-matrix-vector)
    (check (== (m* (make-mat2 1.0f0 2.0f0 3.0f0 4.0f0)
                  (Vec2 2.0f0 3.0f0))
               (Vec2 8.0f0 18.0f0))
           "2D F32/F32 matrix-vector")))

(coalton-toplevel
  (declare test-03-2d-f32-f32-vector-matrix (Void -> Void))
  (define (test-03-2d-f32-f32-vector-matrix)
    (check (== (m* (Vec2 2.0f0 3.0f0)
                  (make-mat2 1.0f0 2.0f0 3.0f0 4.0f0))
               (Vec2 8.0f0 18.0f0))
           "2D F32/F32 vector-matrix")))

(coalton-toplevel
  (declare test-04-2d-f32-f64-matrix-product (Void -> Void))
  (define (test-04-2d-f32-f64-matrix-product)
    (check (== (m* (make-mat2 1.0f0 2.0f0 3.0f0 4.0f0)
                  (make-mat2 -2.0d0 1.0d0 -3.0d0 0.0d0))
               (make-mat2 -8.0d0 1.0d0 -18.0d0 3.0d0))
           "2D F32/F64 matrix product")))

(coalton-toplevel
  (declare test-05-2d-f32-f64-matrix-vector (Void -> Void))
  (define (test-05-2d-f32-f64-matrix-vector)
    (check (== (m* (make-mat2 1.0f0 2.0f0 3.0f0 4.0f0)
                  (Vec2 2.0d0 3.0d0))
               (Vec2 8.0d0 18.0d0))
           "2D F32/F64 matrix-vector")))

(coalton-toplevel
  (declare test-06-2d-f32-f64-vector-matrix (Void -> Void))
  (define (test-06-2d-f32-f64-vector-matrix)
    (check (== (m* (Vec2 2.0d0 3.0d0)
                  (make-mat2 1.0f0 2.0f0 3.0f0 4.0f0))
               (Vec2 8.0d0 18.0d0))
           "2D F32/F64 vector-matrix")))

(coalton-toplevel
  (declare test-07-2d-f64-f32-matrix-product (Void -> Void))
  (define (test-07-2d-f64-f32-matrix-product)
    (check (== (m* (make-mat2 1.0d0 2.0d0 3.0d0 4.0d0)
                  (make-mat2 -2.0f0 1.0f0 -3.0f0 0.0f0))
               (make-mat2 -8.0d0 1.0d0 -18.0d0 3.0d0))
           "2D F64/F32 matrix product")))

(coalton-toplevel
  (declare test-08-2d-f64-f32-matrix-vector (Void -> Void))
  (define (test-08-2d-f64-f32-matrix-vector)
    (check (== (m* (make-mat2 1.0d0 2.0d0 3.0d0 4.0d0)
                  (Vec2 2.0f0 3.0f0))
               (Vec2 8.0d0 18.0d0))
           "2D F64/F32 matrix-vector")))

(coalton-toplevel
  (declare test-09-2d-f64-f32-vector-matrix (Void -> Void))
  (define (test-09-2d-f64-f32-vector-matrix)
    (check (== (m* (Vec2 2.0f0 3.0f0)
                  (make-mat2 1.0d0 2.0d0 3.0d0 4.0d0))
               (Vec2 8.0d0 18.0d0))
           "2D F64/F32 vector-matrix")))

(coalton-toplevel
  (declare test-10-2d-f64-f64-matrix-product (Void -> Void))
  (define (test-10-2d-f64-f64-matrix-product)
    (check (== (m* (make-mat2 1.0d0 2.0d0 3.0d0 4.0d0)
                  (make-mat2 -2.0d0 1.0d0 -3.0d0 0.0d0))
               (make-mat2 -8.0d0 1.0d0 -18.0d0 3.0d0))
           "2D F64/F64 matrix product")))

(coalton-toplevel
  (declare test-11-2d-f64-f64-matrix-vector (Void -> Void))
  (define (test-11-2d-f64-f64-matrix-vector)
    (check (== (m* (make-mat2 1.0d0 2.0d0 3.0d0 4.0d0)
                  (Vec2 2.0d0 3.0d0))
               (Vec2 8.0d0 18.0d0))
           "2D F64/F64 matrix-vector")))

(coalton-toplevel
  (declare test-12-2d-f64-f64-vector-matrix (Void -> Void))
  (define (test-12-2d-f64-f64-vector-matrix)
    (check (== (m* (Vec2 2.0d0 3.0d0)
                  (make-mat2 1.0d0 2.0d0 3.0d0 4.0d0))
               (Vec2 8.0d0 18.0d0))
           "2D F64/F64 vector-matrix")))

(coalton-toplevel
  (declare test-13-3d-f32-f32-matrix-product (Void -> Void))
  (define (test-13-3d-f32-f32-matrix-product)
    (check (== (m* (make-mat3 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0)
                  (make-mat3 -2.0f0 1.0f0 -3.0f0 0.0f0 3.0f0 -1.0f0 2.0f0 -2.0f0 1.0f0))
               (make-mat3 4.0f0 1.0f0 -2.0f0 4.0f0 7.0f0 -11.0f0 4.0f0 13.0f0 -20.0f0))
           "3D F32/F32 matrix product")))

(coalton-toplevel
  (declare test-14-3d-f32-f32-matrix-vector (Void -> Void))
  (define (test-14-3d-f32-f32-matrix-vector)
    (check (== (m* (make-mat3 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0)
                  (Vec3 2.0f0 3.0f0 4.0f0))
               (Vec3 20.0f0 47.0f0 74.0f0))
           "3D F32/F32 matrix-vector")))

(coalton-toplevel
  (declare test-15-3d-f32-f32-vector-matrix (Void -> Void))
  (define (test-15-3d-f32-f32-vector-matrix)
    (check (== (m* (Vec3 2.0f0 3.0f0 4.0f0)
                  (make-mat3 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0))
               (Vec3 20.0f0 47.0f0 74.0f0))
           "3D F32/F32 vector-matrix")))

(coalton-toplevel
  (declare test-16-3d-f32-f64-matrix-product (Void -> Void))
  (define (test-16-3d-f32-f64-matrix-product)
    (check (== (m* (make-mat3 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0)
                  (make-mat3 -2.0d0 1.0d0 -3.0d0 0.0d0 3.0d0 -1.0d0 2.0d0 -2.0d0 1.0d0))
               (make-mat3 4.0d0 1.0d0 -2.0d0 4.0d0 7.0d0 -11.0d0 4.0d0 13.0d0 -20.0d0))
           "3D F32/F64 matrix product")))

(coalton-toplevel
  (declare test-17-3d-f32-f64-matrix-vector (Void -> Void))
  (define (test-17-3d-f32-f64-matrix-vector)
    (check (== (m* (make-mat3 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0)
                  (Vec3 2.0d0 3.0d0 4.0d0))
               (Vec3 20.0d0 47.0d0 74.0d0))
           "3D F32/F64 matrix-vector")))

(coalton-toplevel
  (declare test-18-3d-f32-f64-vector-matrix (Void -> Void))
  (define (test-18-3d-f32-f64-vector-matrix)
    (check (== (m* (Vec3 2.0d0 3.0d0 4.0d0)
                  (make-mat3 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0))
               (Vec3 20.0d0 47.0d0 74.0d0))
           "3D F32/F64 vector-matrix")))

(coalton-toplevel
  (declare test-19-3d-f64-f32-matrix-product (Void -> Void))
  (define (test-19-3d-f64-f32-matrix-product)
    (check (== (m* (make-mat3 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0)
                  (make-mat3 -2.0f0 1.0f0 -3.0f0 0.0f0 3.0f0 -1.0f0 2.0f0 -2.0f0 1.0f0))
               (make-mat3 4.0d0 1.0d0 -2.0d0 4.0d0 7.0d0 -11.0d0 4.0d0 13.0d0 -20.0d0))
           "3D F64/F32 matrix product")))

(coalton-toplevel
  (declare test-20-3d-f64-f32-matrix-vector (Void -> Void))
  (define (test-20-3d-f64-f32-matrix-vector)
    (check (== (m* (make-mat3 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0)
                  (Vec3 2.0f0 3.0f0 4.0f0))
               (Vec3 20.0d0 47.0d0 74.0d0))
           "3D F64/F32 matrix-vector")))

(coalton-toplevel
  (declare test-21-3d-f64-f32-vector-matrix (Void -> Void))
  (define (test-21-3d-f64-f32-vector-matrix)
    (check (== (m* (Vec3 2.0f0 3.0f0 4.0f0)
                  (make-mat3 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0))
               (Vec3 20.0d0 47.0d0 74.0d0))
           "3D F64/F32 vector-matrix")))

(coalton-toplevel
  (declare test-22-3d-f64-f64-matrix-product (Void -> Void))
  (define (test-22-3d-f64-f64-matrix-product)
    (check (== (m* (make-mat3 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0)
                  (make-mat3 -2.0d0 1.0d0 -3.0d0 0.0d0 3.0d0 -1.0d0 2.0d0 -2.0d0 1.0d0))
               (make-mat3 4.0d0 1.0d0 -2.0d0 4.0d0 7.0d0 -11.0d0 4.0d0 13.0d0 -20.0d0))
           "3D F64/F64 matrix product")))

(coalton-toplevel
  (declare test-23-3d-f64-f64-matrix-vector (Void -> Void))
  (define (test-23-3d-f64-f64-matrix-vector)
    (check (== (m* (make-mat3 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0)
                  (Vec3 2.0d0 3.0d0 4.0d0))
               (Vec3 20.0d0 47.0d0 74.0d0))
           "3D F64/F64 matrix-vector")))

(coalton-toplevel
  (declare test-24-3d-f64-f64-vector-matrix (Void -> Void))
  (define (test-24-3d-f64-f64-vector-matrix)
    (check (== (m* (Vec3 2.0d0 3.0d0 4.0d0)
                  (make-mat3 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0))
               (Vec3 20.0d0 47.0d0 74.0d0))
           "3D F64/F64 vector-matrix")))

(coalton-toplevel
  (declare test-25-4d-f32-f32-matrix-product (Void -> Void))
  (define (test-25-4d-f32-f32-matrix-product)
    (check (== (m* (make-mat4 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0 10.0f0 11.0f0 12.0f0 13.0f0 14.0f0 15.0f0 16.0f0)
                  (make-mat4 -2.0f0 1.0f0 -3.0f0 0.0f0 3.0f0 -1.0f0 2.0f0 -2.0f0 1.0f0 -3.0f0 0.0f0 3.0f0 -1.0f0 2.0f0 -2.0f0 1.0f0))
               (make-mat4 3.0f0 -2.0f0 -7.0f0 9.0f0 7.0f0 -6.0f0 -19.0f0 17.0f0 11.0f0 -10.0f0 -31.0f0 25.0f0 15.0f0 -14.0f0 -43.0f0 33.0f0))
           "4D F32/F32 matrix product")))

(coalton-toplevel
  (declare test-26-4d-f32-f32-matrix-vector (Void -> Void))
  (define (test-26-4d-f32-f32-matrix-vector)
    (check (== (m* (make-mat4 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0 10.0f0 11.0f0 12.0f0 13.0f0 14.0f0 15.0f0 16.0f0)
                  (Vec4 2.0f0 3.0f0 4.0f0 5.0f0))
               (Vec4 40.0f0 96.0f0 152.0f0 208.0f0))
           "4D F32/F32 matrix-vector")))

(coalton-toplevel
  (declare test-27-4d-f32-f32-vector-matrix (Void -> Void))
  (define (test-27-4d-f32-f32-vector-matrix)
    (check (== (m* (Vec4 2.0f0 3.0f0 4.0f0 5.0f0)
                  (make-mat4 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0 10.0f0 11.0f0 12.0f0 13.0f0 14.0f0 15.0f0 16.0f0))
               (Vec4 40.0f0 96.0f0 152.0f0 208.0f0))
           "4D F32/F32 vector-matrix")))

(coalton-toplevel
  (declare test-28-4d-f32-f64-matrix-product (Void -> Void))
  (define (test-28-4d-f32-f64-matrix-product)
    (check (== (m* (make-mat4 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0 10.0f0 11.0f0 12.0f0 13.0f0 14.0f0 15.0f0 16.0f0)
                  (make-mat4 -2.0d0 1.0d0 -3.0d0 0.0d0 3.0d0 -1.0d0 2.0d0 -2.0d0 1.0d0 -3.0d0 0.0d0 3.0d0 -1.0d0 2.0d0 -2.0d0 1.0d0))
               (make-mat4 3.0d0 -2.0d0 -7.0d0 9.0d0 7.0d0 -6.0d0 -19.0d0 17.0d0 11.0d0 -10.0d0 -31.0d0 25.0d0 15.0d0 -14.0d0 -43.0d0 33.0d0))
           "4D F32/F64 matrix product")))

(coalton-toplevel
  (declare test-29-4d-f32-f64-matrix-vector (Void -> Void))
  (define (test-29-4d-f32-f64-matrix-vector)
    (check (== (m* (make-mat4 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0 10.0f0 11.0f0 12.0f0 13.0f0 14.0f0 15.0f0 16.0f0)
                  (Vec4 2.0d0 3.0d0 4.0d0 5.0d0))
               (Vec4 40.0d0 96.0d0 152.0d0 208.0d0))
           "4D F32/F64 matrix-vector")))

(coalton-toplevel
  (declare test-30-4d-f32-f64-vector-matrix (Void -> Void))
  (define (test-30-4d-f32-f64-vector-matrix)
    (check (== (m* (Vec4 2.0d0 3.0d0 4.0d0 5.0d0)
                  (make-mat4 1.0f0 2.0f0 3.0f0 4.0f0 5.0f0 6.0f0 7.0f0 8.0f0 9.0f0 10.0f0 11.0f0 12.0f0 13.0f0 14.0f0 15.0f0 16.0f0))
               (Vec4 40.0d0 96.0d0 152.0d0 208.0d0))
           "4D F32/F64 vector-matrix")))

(coalton-toplevel
  (declare test-31-4d-f64-f32-matrix-product (Void -> Void))
  (define (test-31-4d-f64-f32-matrix-product)
    (check (== (m* (make-mat4 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0 10.0d0 11.0d0 12.0d0 13.0d0 14.0d0 15.0d0 16.0d0)
                  (make-mat4 -2.0f0 1.0f0 -3.0f0 0.0f0 3.0f0 -1.0f0 2.0f0 -2.0f0 1.0f0 -3.0f0 0.0f0 3.0f0 -1.0f0 2.0f0 -2.0f0 1.0f0))
               (make-mat4 3.0d0 -2.0d0 -7.0d0 9.0d0 7.0d0 -6.0d0 -19.0d0 17.0d0 11.0d0 -10.0d0 -31.0d0 25.0d0 15.0d0 -14.0d0 -43.0d0 33.0d0))
           "4D F64/F32 matrix product")))

(coalton-toplevel
  (declare test-32-4d-f64-f32-matrix-vector (Void -> Void))
  (define (test-32-4d-f64-f32-matrix-vector)
    (check (== (m* (make-mat4 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0 10.0d0 11.0d0 12.0d0 13.0d0 14.0d0 15.0d0 16.0d0)
                  (Vec4 2.0f0 3.0f0 4.0f0 5.0f0))
               (Vec4 40.0d0 96.0d0 152.0d0 208.0d0))
           "4D F64/F32 matrix-vector")))

(coalton-toplevel
  (declare test-33-4d-f64-f32-vector-matrix (Void -> Void))
  (define (test-33-4d-f64-f32-vector-matrix)
    (check (== (m* (Vec4 2.0f0 3.0f0 4.0f0 5.0f0)
                  (make-mat4 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0 10.0d0 11.0d0 12.0d0 13.0d0 14.0d0 15.0d0 16.0d0))
               (Vec4 40.0d0 96.0d0 152.0d0 208.0d0))
           "4D F64/F32 vector-matrix")))

(coalton-toplevel
  (declare test-34-4d-f64-f64-matrix-product (Void -> Void))
  (define (test-34-4d-f64-f64-matrix-product)
    (check (== (m* (make-mat4 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0 10.0d0 11.0d0 12.0d0 13.0d0 14.0d0 15.0d0 16.0d0)
                  (make-mat4 -2.0d0 1.0d0 -3.0d0 0.0d0 3.0d0 -1.0d0 2.0d0 -2.0d0 1.0d0 -3.0d0 0.0d0 3.0d0 -1.0d0 2.0d0 -2.0d0 1.0d0))
               (make-mat4 3.0d0 -2.0d0 -7.0d0 9.0d0 7.0d0 -6.0d0 -19.0d0 17.0d0 11.0d0 -10.0d0 -31.0d0 25.0d0 15.0d0 -14.0d0 -43.0d0 33.0d0))
           "4D F64/F64 matrix product")))

(coalton-toplevel
  (declare test-35-4d-f64-f64-matrix-vector (Void -> Void))
  (define (test-35-4d-f64-f64-matrix-vector)
    (check (== (m* (make-mat4 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0 10.0d0 11.0d0 12.0d0 13.0d0 14.0d0 15.0d0 16.0d0)
                  (Vec4 2.0d0 3.0d0 4.0d0 5.0d0))
               (Vec4 40.0d0 96.0d0 152.0d0 208.0d0))
           "4D F64/F64 matrix-vector")))

(coalton-toplevel
  (declare test-36-4d-f64-f64-vector-matrix (Void -> Void))
  (define (test-36-4d-f64-f64-vector-matrix)
    (check (== (m* (Vec4 2.0d0 3.0d0 4.0d0 5.0d0)
                  (make-mat4 1.0d0 2.0d0 3.0d0 4.0d0 5.0d0 6.0d0 7.0d0 8.0d0 9.0d0 10.0d0 11.0d0 12.0d0 13.0d0 14.0d0 15.0d0 16.0d0))
               (Vec4 40.0d0 96.0d0 152.0d0 208.0d0))
           "4D F64/F64 vector-matrix")))

(coalton-toplevel
  (declare test-37-rectangular-f32-f32 (Void -> Void))
  (define (test-37-rectangular-f32-f32)
    (check (== (m* (make-matn 2 3 (Cons 1.0f0 (Cons 2.0f0 (Cons 3.0f0 (Cons 4.0f0 (Cons 5.0f0 (Cons 6.0f0 Nil)))))))
                   (make-matn 3 2 (Cons 7.0f0 (Cons 8.0f0 (Cons 9.0f0 (Cons 10.0f0 (Cons 11.0f0 (Cons 12.0f0 Nil))))))))
                (make-matn 2 2 (Cons 58.0f0 (Cons 64.0f0 (Cons 139.0f0 (Cons 154.0f0 Nil))))))
           "Rectangular F32/F32")))

(coalton-toplevel
  (declare test-38-rectangular-f32-f64 (Void -> Void))
  (define (test-38-rectangular-f32-f64)
    (check (== (m* (make-matn 2 3 (Cons 1.0f0 (Cons 2.0f0 (Cons 3.0f0 (Cons 4.0f0 (Cons 5.0f0 (Cons 6.0f0 Nil)))))))
                   (make-matn 3 2 (Cons 7.0d0 (Cons 8.0d0 (Cons 9.0d0 (Cons 10.0d0 (Cons 11.0d0 (Cons 12.0d0 Nil))))))))
                (make-matn 2 2 (Cons 58.0d0 (Cons 64.0d0 (Cons 139.0d0 (Cons 154.0d0 Nil))))))
           "Rectangular F32/F64")))

(coalton-toplevel
  (declare test-39-rectangular-f64-f32 (Void -> Void))
  (define (test-39-rectangular-f64-f32)
    (check (== (m* (make-matn 2 3 (Cons 1.0d0 (Cons 2.0d0 (Cons 3.0d0 (Cons 4.0d0 (Cons 5.0d0 (Cons 6.0d0 Nil)))))))
                   (make-matn 3 2 (Cons 7.0f0 (Cons 8.0f0 (Cons 9.0f0 (Cons 10.0f0 (Cons 11.0f0 (Cons 12.0f0 Nil))))))))
                (make-matn 2 2 (Cons 58.0d0 (Cons 64.0d0 (Cons 139.0d0 (Cons 154.0d0 Nil))))))
           "Rectangular F64/F32")))

(coalton-toplevel
  (declare test-40-rectangular-f64-f64 (Void -> Void))
  (define (test-40-rectangular-f64-f64)
    (check (== (m* (make-matn 2 3 (Cons 1.0d0 (Cons 2.0d0 (Cons 3.0d0 (Cons 4.0d0 (Cons 5.0d0 (Cons 6.0d0 Nil)))))))
                   (make-matn 3 2 (Cons 7.0d0 (Cons 8.0d0 (Cons 9.0d0 (Cons 10.0d0 (Cons 11.0d0 (Cons 12.0d0 Nil))))))))
                (make-matn 2 2 (Cons 58.0d0 (Cons 64.0d0 (Cons 139.0d0 (Cons 154.0d0 Nil))))))
           "Rectangular F64/F64")))

(coalton-toplevel
  (declare test-41-empty-inner-dimension (Void -> Void))
  (define (test-41-empty-inner-dimension)
    (check (== (m* (make-matn 2 0 (the (List F64) Nil))
                   (make-matn 0 3 (the (List F64) Nil)))
                (make-matn 2 3 (Cons 0d0 (Cons 0d0 (Cons 0d0 (Cons 0d0 (Cons 0d0 (Cons 0d0 Nil))))))))
           "Empty inner dimension")))

(coalton-toplevel
  (declare test-42-chained-multiplication (Void -> Void))
  (define (test-42-chained-multiplication)
    (check (== (m* (m* (make-mat2 1d0 2d0 3d0 4d0)
                       (make-mat2 1d0 0d0 0d0 1d0))
                   (Vec2 5d0 7d0))
                (Vec2 19d0 43d0))
           "Chained multiplication")))

(coalton-toplevel
  (declare test-43-column-major-reference (Void -> Void))
  (define (test-43-column-major-reference)
    (check (== (mat3-ref (make-mat3 1d0 2d0 3d0 4d0 5d0 6d0 7d0 8d0 9d0)
                         1 2) 6d0)
           "Column-major reference")))

;; Exact rational arithmetic; no floating-point tolerance.
(coalton-toplevel
  (declare test-44-2d-fraction-matrix-product (Void -> Void))
  (define (test-44-2d-fraction-matrix-product)
    (check (== (m* (make-mat2 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3))
                  (make-mat2 (coalton/math/fraction:mkFraction -2 7) (coalton/math/fraction:mkFraction 1 7) (coalton/math/fraction:mkFraction -3 7) (coalton/math/fraction:mkFraction 0 7)))
               (make-mat2 (coalton/math/fraction:mkFraction -8 21) (coalton/math/fraction:mkFraction 1 21) (coalton/math/fraction:mkFraction -18 21) (coalton/math/fraction:mkFraction 3 21)))
           "2D Fraction matrix product")))

(coalton-toplevel
  (declare test-45-2d-fraction-matrix-vector (Void -> Void))
  (define (test-45-2d-fraction-matrix-vector)
    (check (== (m* (make-mat2 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3))
                  (Vec2 (coalton/math/fraction:mkFraction 2 5) (coalton/math/fraction:mkFraction -3 5)))
               (Vec2 (coalton/math/fraction:mkFraction -4 15) (coalton/math/fraction:mkFraction -6 15)))
           "2D Fraction matrix-vector")))

(coalton-toplevel
  (declare test-46-2d-fraction-vector-matrix (Void -> Void))
  (define (test-46-2d-fraction-vector-matrix)
    (check (== (m* (Vec2 (coalton/math/fraction:mkFraction 2 5) (coalton/math/fraction:mkFraction -3 5))
                  (make-mat2 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3)))
               (Vec2 (coalton/math/fraction:mkFraction -4 15) (coalton/math/fraction:mkFraction -6 15)))
           "2D Fraction vector-matrix")))

(coalton-toplevel
  (declare test-47-3d-fraction-matrix-product (Void -> Void))
  (define (test-47-3d-fraction-matrix-product)
    (check (== (m* (make-mat3 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3) (coalton/math/fraction:mkFraction 5 3) (coalton/math/fraction:mkFraction 6 3) (coalton/math/fraction:mkFraction 7 3) (coalton/math/fraction:mkFraction 8 3) (coalton/math/fraction:mkFraction 9 3))
                  (make-mat3 (coalton/math/fraction:mkFraction -2 7) (coalton/math/fraction:mkFraction 1 7) (coalton/math/fraction:mkFraction -3 7) (coalton/math/fraction:mkFraction 0 7) (coalton/math/fraction:mkFraction 3 7) (coalton/math/fraction:mkFraction -1 7) (coalton/math/fraction:mkFraction 2 7) (coalton/math/fraction:mkFraction -2 7) (coalton/math/fraction:mkFraction 1 7)))
               (make-mat3 (coalton/math/fraction:mkFraction 4 21) (coalton/math/fraction:mkFraction 1 21) (coalton/math/fraction:mkFraction -2 21) (coalton/math/fraction:mkFraction 4 21) (coalton/math/fraction:mkFraction 7 21) (coalton/math/fraction:mkFraction -11 21) (coalton/math/fraction:mkFraction 4 21) (coalton/math/fraction:mkFraction 13 21) (coalton/math/fraction:mkFraction -20 21)))
           "3D Fraction matrix product")))

(coalton-toplevel
  (declare test-48-3d-fraction-matrix-vector (Void -> Void))
  (define (test-48-3d-fraction-matrix-vector)
    (check (== (m* (make-mat3 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3) (coalton/math/fraction:mkFraction 5 3) (coalton/math/fraction:mkFraction 6 3) (coalton/math/fraction:mkFraction 7 3) (coalton/math/fraction:mkFraction 8 3) (coalton/math/fraction:mkFraction 9 3))
                  (Vec3 (coalton/math/fraction:mkFraction 2 5) (coalton/math/fraction:mkFraction -3 5) (coalton/math/fraction:mkFraction 4 5)))
               (Vec3 (coalton/math/fraction:mkFraction 8 15) (coalton/math/fraction:mkFraction 17 15) (coalton/math/fraction:mkFraction 26 15)))
           "3D Fraction matrix-vector")))

(coalton-toplevel
  (declare test-49-3d-fraction-vector-matrix (Void -> Void))
  (define (test-49-3d-fraction-vector-matrix)
    (check (== (m* (Vec3 (coalton/math/fraction:mkFraction 2 5) (coalton/math/fraction:mkFraction -3 5) (coalton/math/fraction:mkFraction 4 5))
                  (make-mat3 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3) (coalton/math/fraction:mkFraction 5 3) (coalton/math/fraction:mkFraction 6 3) (coalton/math/fraction:mkFraction 7 3) (coalton/math/fraction:mkFraction 8 3) (coalton/math/fraction:mkFraction 9 3)))
               (Vec3 (coalton/math/fraction:mkFraction 8 15) (coalton/math/fraction:mkFraction 17 15) (coalton/math/fraction:mkFraction 26 15)))
           "3D Fraction vector-matrix")))

(coalton-toplevel
  (declare test-50-4d-fraction-matrix-product (Void -> Void))
  (define (test-50-4d-fraction-matrix-product)
    (check (== (m* (make-mat4 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3) (coalton/math/fraction:mkFraction 5 3) (coalton/math/fraction:mkFraction 6 3) (coalton/math/fraction:mkFraction 7 3) (coalton/math/fraction:mkFraction 8 3) (coalton/math/fraction:mkFraction 9 3) (coalton/math/fraction:mkFraction 10 3) (coalton/math/fraction:mkFraction 11 3) (coalton/math/fraction:mkFraction 12 3) (coalton/math/fraction:mkFraction 13 3) (coalton/math/fraction:mkFraction 14 3) (coalton/math/fraction:mkFraction 15 3) (coalton/math/fraction:mkFraction 16 3))
                  (make-mat4 (coalton/math/fraction:mkFraction -2 7) (coalton/math/fraction:mkFraction 1 7) (coalton/math/fraction:mkFraction -3 7) (coalton/math/fraction:mkFraction 0 7) (coalton/math/fraction:mkFraction 3 7) (coalton/math/fraction:mkFraction -1 7) (coalton/math/fraction:mkFraction 2 7) (coalton/math/fraction:mkFraction -2 7) (coalton/math/fraction:mkFraction 1 7) (coalton/math/fraction:mkFraction -3 7) (coalton/math/fraction:mkFraction 0 7) (coalton/math/fraction:mkFraction 3 7) (coalton/math/fraction:mkFraction -1 7) (coalton/math/fraction:mkFraction 2 7) (coalton/math/fraction:mkFraction -2 7) (coalton/math/fraction:mkFraction 1 7)))
               (make-mat4 (coalton/math/fraction:mkFraction 3 21) (coalton/math/fraction:mkFraction -2 21) (coalton/math/fraction:mkFraction -7 21) (coalton/math/fraction:mkFraction 9 21) (coalton/math/fraction:mkFraction 7 21) (coalton/math/fraction:mkFraction -6 21) (coalton/math/fraction:mkFraction -19 21) (coalton/math/fraction:mkFraction 17 21) (coalton/math/fraction:mkFraction 11 21) (coalton/math/fraction:mkFraction -10 21) (coalton/math/fraction:mkFraction -31 21) (coalton/math/fraction:mkFraction 25 21) (coalton/math/fraction:mkFraction 15 21) (coalton/math/fraction:mkFraction -14 21) (coalton/math/fraction:mkFraction -43 21) (coalton/math/fraction:mkFraction 33 21)))
           "4D Fraction matrix product")))

(coalton-toplevel
  (declare test-51-4d-fraction-matrix-vector (Void -> Void))
  (define (test-51-4d-fraction-matrix-vector)
    (check (== (m* (make-mat4 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3) (coalton/math/fraction:mkFraction 5 3) (coalton/math/fraction:mkFraction 6 3) (coalton/math/fraction:mkFraction 7 3) (coalton/math/fraction:mkFraction 8 3) (coalton/math/fraction:mkFraction 9 3) (coalton/math/fraction:mkFraction 10 3) (coalton/math/fraction:mkFraction 11 3) (coalton/math/fraction:mkFraction 12 3) (coalton/math/fraction:mkFraction 13 3) (coalton/math/fraction:mkFraction 14 3) (coalton/math/fraction:mkFraction 15 3) (coalton/math/fraction:mkFraction 16 3))
                  (Vec4 (coalton/math/fraction:mkFraction 2 5) (coalton/math/fraction:mkFraction -3 5) (coalton/math/fraction:mkFraction 4 5) (coalton/math/fraction:mkFraction -5 5)))
               (Vec4 (coalton/math/fraction:mkFraction -12 15) (coalton/math/fraction:mkFraction -20 15) (coalton/math/fraction:mkFraction -28 15) (coalton/math/fraction:mkFraction -36 15)))
           "4D Fraction matrix-vector")))

(coalton-toplevel
  (declare test-52-4d-fraction-vector-matrix (Void -> Void))
  (define (test-52-4d-fraction-vector-matrix)
    (check (== (m* (Vec4 (coalton/math/fraction:mkFraction 2 5) (coalton/math/fraction:mkFraction -3 5) (coalton/math/fraction:mkFraction 4 5) (coalton/math/fraction:mkFraction -5 5))
                  (make-mat4 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3) (coalton/math/fraction:mkFraction 5 3) (coalton/math/fraction:mkFraction 6 3) (coalton/math/fraction:mkFraction 7 3) (coalton/math/fraction:mkFraction 8 3) (coalton/math/fraction:mkFraction 9 3) (coalton/math/fraction:mkFraction 10 3) (coalton/math/fraction:mkFraction 11 3) (coalton/math/fraction:mkFraction 12 3) (coalton/math/fraction:mkFraction 13 3) (coalton/math/fraction:mkFraction 14 3) (coalton/math/fraction:mkFraction 15 3) (coalton/math/fraction:mkFraction 16 3)))
               (Vec4 (coalton/math/fraction:mkFraction -12 15) (coalton/math/fraction:mkFraction -20 15) (coalton/math/fraction:mkFraction -28 15) (coalton/math/fraction:mkFraction -36 15)))
           "4D Fraction vector-matrix")))

(coalton-toplevel
  (declare test-53-rectangular-fraction-matrix-product (Void -> Void))
  (define (test-53-rectangular-fraction-matrix-product)
    (check (== (m* (make-matn 2 3 (Cons (coalton/math/fraction:mkFraction 1 3) (Cons (coalton/math/fraction:mkFraction 2 3) (Cons (coalton/math/fraction:mkFraction 3 3) (Cons (coalton/math/fraction:mkFraction 4 3) (Cons (coalton/math/fraction:mkFraction 5 3) (Cons (coalton/math/fraction:mkFraction 6 3) Nil)))))))
                   (make-matn 3 2 (Cons (coalton/math/fraction:mkFraction 7 7) (Cons (coalton/math/fraction:mkFraction 8 7) (Cons (coalton/math/fraction:mkFraction 9 7) (Cons (coalton/math/fraction:mkFraction 10 7) (Cons (coalton/math/fraction:mkFraction 11 7) (Cons (coalton/math/fraction:mkFraction 12 7) Nil))))))))
                (make-matn 2 2 (Cons (coalton/math/fraction:mkFraction 58 21) (Cons (coalton/math/fraction:mkFraction 64 21) (Cons (coalton/math/fraction:mkFraction 139 21) (Cons (coalton/math/fraction:mkFraction 154 21) Nil))))))
           "Rectangular Fraction matrix product")))

(coalton-toplevel
  (declare test-54-fraction-empty-inner-dimension (Void -> Void))
  (define (test-54-fraction-empty-inner-dimension)
    (check (== (m* (make-matn 2 0 (the (List Fraction) Nil))
                   (make-matn 0 3 (the (List Fraction) Nil)))
                (make-matn 2 3 (Cons (coalton/math/fraction:mkFraction 0 1) (Cons (coalton/math/fraction:mkFraction 0 1) (Cons (coalton/math/fraction:mkFraction 0 1) (Cons (coalton/math/fraction:mkFraction 0 1) (Cons (coalton/math/fraction:mkFraction 0 1) (Cons (coalton/math/fraction:mkFraction 0 1) Nil))))))))
           "Fraction empty inner dimension")))

(coalton-toplevel
  (declare test-55-fraction-chained-multiplication (Void -> Void))
  (define (test-55-fraction-chained-multiplication)
    (check (== (m* (m* (make-mat2 (coalton/math/fraction:mkFraction 1 3) (coalton/math/fraction:mkFraction 2 3) (coalton/math/fraction:mkFraction 3 3) (coalton/math/fraction:mkFraction 4 3))
                        (make-mat2 (coalton/math/fraction:mkFraction 1 7) (coalton/math/fraction:mkFraction 0 7) (coalton/math/fraction:mkFraction 0 7) (coalton/math/fraction:mkFraction 1 7)))
                    (Vec2 (coalton/math/fraction:mkFraction 5 5) (coalton/math/fraction:mkFraction 7 5)))
                (Vec2 (coalton/math/fraction:mkFraction 19 105) (coalton/math/fraction:mkFraction 43 105)))
           "Fraction chained multiplication")))

(coalton-toplevel
  (declare test-56-fraction-exact-cancellation-beyond-floating-point-precision (Void -> Void))
  (define (test-56-fraction-exact-cancellation-beyond-floating-point-precision)
    (check (== (matn-ref
                  (m* (make-matn 1 2 (Cons (coalton/math/fraction:mkFraction 1000000000000000000000000000001 3) (Cons (coalton/math/fraction:mkFraction -1000000000000000000000000000000 3) Nil)))
                      (make-matn 2 1 (Cons (coalton/math/fraction:mkFraction 1 7) (Cons (coalton/math/fraction:mkFraction 1 7) Nil))))
                  0 0)
                (coalton/math/fraction:mkFraction 1 21))
           "Fraction exact cancellation beyond floating-point precision")))

(coalton-toplevel
  (declare run-tests (Void -> Void))
  (define (run-tests)
    (progn
      (test-01-2d-f32-f32-matrix-product)
      (test-02-2d-f32-f32-matrix-vector)
      (test-03-2d-f32-f32-vector-matrix)
      (test-04-2d-f32-f64-matrix-product)
      (test-05-2d-f32-f64-matrix-vector)
      (test-06-2d-f32-f64-vector-matrix)
      (test-07-2d-f64-f32-matrix-product)
      (test-08-2d-f64-f32-matrix-vector)
      (test-09-2d-f64-f32-vector-matrix)
      (test-10-2d-f64-f64-matrix-product)
      (test-11-2d-f64-f64-matrix-vector)
      (test-12-2d-f64-f64-vector-matrix)
      (test-13-3d-f32-f32-matrix-product)
      (test-14-3d-f32-f32-matrix-vector)
      (test-15-3d-f32-f32-vector-matrix)
      (test-16-3d-f32-f64-matrix-product)
      (test-17-3d-f32-f64-matrix-vector)
      (test-18-3d-f32-f64-vector-matrix)
      (test-19-3d-f64-f32-matrix-product)
      (test-20-3d-f64-f32-matrix-vector)
      (test-21-3d-f64-f32-vector-matrix)
      (test-22-3d-f64-f64-matrix-product)
      (test-23-3d-f64-f64-matrix-vector)
      (test-24-3d-f64-f64-vector-matrix)
      (test-25-4d-f32-f32-matrix-product)
      (test-26-4d-f32-f32-matrix-vector)
      (test-27-4d-f32-f32-vector-matrix)
      (test-28-4d-f32-f64-matrix-product)
      (test-29-4d-f32-f64-matrix-vector)
      (test-30-4d-f32-f64-vector-matrix)
      (test-31-4d-f64-f32-matrix-product)
      (test-32-4d-f64-f32-matrix-vector)
      (test-33-4d-f64-f32-vector-matrix)
      (test-34-4d-f64-f64-matrix-product)
      (test-35-4d-f64-f64-matrix-vector)
      (test-36-4d-f64-f64-vector-matrix)
      (test-37-rectangular-f32-f32)
      (test-38-rectangular-f32-f64)
      (test-39-rectangular-f64-f32)
      (test-40-rectangular-f64-f64)
      (test-41-empty-inner-dimension)
      (test-42-chained-multiplication)
      (test-43-column-major-reference)
      (test-44-2d-fraction-matrix-product)
      (test-45-2d-fraction-matrix-vector)
      (test-46-2d-fraction-vector-matrix)
      (test-47-3d-fraction-matrix-product)
      (test-48-3d-fraction-matrix-vector)
      (test-49-3d-fraction-vector-matrix)
      (test-50-4d-fraction-matrix-product)
      (test-51-4d-fraction-matrix-vector)
      (test-52-4d-fraction-vector-matrix)
      (test-53-rectangular-fraction-matrix-product)
      (test-54-fraction-empty-inner-dimension)
      (test-55-fraction-chained-multiplication)
      (test-56-fraction-exact-cancellation-beyond-floating-point-precision)
      (values))))
