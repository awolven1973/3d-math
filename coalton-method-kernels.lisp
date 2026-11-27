;;;; Concrete Coalton roots used by existing Common Lisp sealed methods.
;;;; No conversion of the original matrices or vectors into Coalton objects.
(cl:in-package #:3dm.coalton)

(coalton-toplevel
  (inline)
  (monomorphize)
  (declare dot2-ff (F32 * F32 * F32 * F32 -> F32))
  (define (dot2-ff a0 a1 b0 b1)
    (dot2 a0 a1 b0 b1))

  (inline)
  (monomorphize)
  (declare dot3-ff (F32 * F32 * F32 * F32 * F32 * F32 -> F32))
  (define (dot3-ff a0 a1 a2 b0 b1 b2)
    (dot3 a0 a1 a2 b0 b1 b2))

  (inline)
  (monomorphize)
  (declare dot4-ff (F32 * F32 * F32 * F32 * F32 * F32 * F32 * F32 -> F32))
  (define (dot4-ff a0 a1 a2 a3 b0 b1 b2 b3)
    (dot4 a0 a1 a2 a3 b0 b1 b2 b3))

  (inline)
  (monomorphize)
  (declare accumulate-ff (F32 * F32 * F32 -> F32))
  (define (accumulate-ff acc a b)
    (+ acc (scalar-product a b)))

  (inline)
  (monomorphize)
  (declare dot2-fd (F32 * F32 * F64 * F64 -> F64))
  (define (dot2-fd a0 a1 b0 b1)
    (dot2 a0 a1 b0 b1))

  (inline)
  (monomorphize)
  (declare dot3-fd (F32 * F32 * F32 * F64 * F64 * F64 -> F64))
  (define (dot3-fd a0 a1 a2 b0 b1 b2)
    (dot3 a0 a1 a2 b0 b1 b2))

  (inline)
  (monomorphize)
  (declare dot4-fd (F32 * F32 * F32 * F32 * F64 * F64 * F64 * F64 -> F64))
  (define (dot4-fd a0 a1 a2 a3 b0 b1 b2 b3)
    (dot4 a0 a1 a2 a3 b0 b1 b2 b3))

  (inline)
  (monomorphize)
  (declare accumulate-fd (F64 * F32 * F64 -> F64))
  (define (accumulate-fd acc a b)
    (+ acc (scalar-product a b)))

  (inline)
  (monomorphize)
  (declare dot2-df (F64 * F64 * F32 * F32 -> F64))
  (define (dot2-df a0 a1 b0 b1)
    (dot2 a0 a1 b0 b1))

  (inline)
  (monomorphize)
  (declare dot3-df (F64 * F64 * F64 * F32 * F32 * F32 -> F64))
  (define (dot3-df a0 a1 a2 b0 b1 b2)
    (dot3 a0 a1 a2 b0 b1 b2))

  (inline)
  (monomorphize)
  (declare dot4-df (F64 * F64 * F64 * F64 * F32 * F32 * F32 * F32 -> F64))
  (define (dot4-df a0 a1 a2 a3 b0 b1 b2 b3)
    (dot4 a0 a1 a2 a3 b0 b1 b2 b3))

  (inline)
  (monomorphize)
  (declare accumulate-df (F64 * F64 * F32 -> F64))
  (define (accumulate-df acc a b)
    (+ acc (scalar-product a b)))

  (inline)
  (monomorphize)
  (declare dot2-dd (F64 * F64 * F64 * F64 -> F64))
  (define (dot2-dd a0 a1 b0 b1)
    (dot2 a0 a1 b0 b1))

  (inline)
  (monomorphize)
  (declare dot3-dd (F64 * F64 * F64 * F64 * F64 * F64 -> F64))
  (define (dot3-dd a0 a1 a2 b0 b1 b2)
    (dot3 a0 a1 a2 b0 b1 b2))

  (inline)
  (monomorphize)
  (declare dot4-dd (F64 * F64 * F64 * F64 * F64 * F64 * F64 * F64 -> F64))
  (define (dot4-dd a0 a1 a2 a3 b0 b1 b2 b3)
    (dot4 a0 a1 a2 a3 b0 b1 b2 b3))

  (inline)
  (monomorphize)
  (declare accumulate-dd (F64 * F64 * F64 -> F64))
  (define (accumulate-dd acc a b)
    (+ acc (scalar-product a b)))

  (inline)
  (monomorphize)
  (declare dot2-rr (Fraction * Fraction * Fraction * Fraction -> Fraction))
  (define (dot2-rr a0 a1 b0 b1)
    (dot2 a0 a1 b0 b1))

  (inline)
  (monomorphize)
  (declare dot3-rr (Fraction * Fraction * Fraction * Fraction * Fraction * Fraction -> Fraction))
  (define (dot3-rr a0 a1 a2 b0 b1 b2)
    (dot3 a0 a1 a2 b0 b1 b2))

  (inline)
  (monomorphize)
  (declare dot4-rr (Fraction * Fraction * Fraction * Fraction * Fraction * Fraction * Fraction * Fraction -> Fraction))
  (define (dot4-rr a0 a1 a2 a3 b0 b1 b2 b3)
    (dot4 a0 a1 a2 a3 b0 b1 b2 b3))

  (inline)
  (monomorphize)
  (declare accumulate-rr (Fraction * Fraction * Fraction -> Fraction))
  (define (accumulate-rr acc a b)
    (+ acc (scalar-product a b)))

)

(cl:in-package #:3dm-def)

;; These helpers run at macroexpansion time, not during multiplication.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun coalton-precision (type)
    (ecase type
      (single-float "F")
      (double-float "D")
      (rational "R")))

  (defun coalton-package-element-type (package)
    (let ((name (package-name (find-package package))))
      (cond ((string= name "3DM.F") 'single-float)
            ((string= name "3DM.D") 'double-float)
            ((string= name "3DM.RAT") 'rational)
            (t (error "Unsupported numeric package ~A" package)))))

  ;; The concrete Coalton roots have ordinary Common Lisp entrypoints.
  ;; Keep argument forms in the original Lisp lexical environment:
  ;; reparsing them inside COALTON would recreate uninterned symbols.
  (defun coalton-argument (type form)
    `(the ,type ,form))

  (defun coalton-result-type (a b)
    (cond ((and (eq a 'rational) (eq b 'rational)) 'rational)
          ((or (eq a 'double-float) (eq b 'double-float)) 'double-float)
          (t 'single-float)))

  (defun coalton-dot-form (a-type b-type a-forms b-forms)
    (let* ((n (length a-forms))
           (name (format nil "DOT~D-~A~A" n
                         (coalton-precision a-type)
                         (coalton-precision b-type)))
           (fn (or (find-symbol name :3dm.coalton)
                   (error "Missing Coalton kernel ~A" name))))
      `(the ,(coalton-result-type a-type b-type)
         (,fn ,@(mapcar (lambda (form) (coalton-argument a-type form)) a-forms)
              ,@(mapcar (lambda (form) (coalton-argument b-type form)) b-forms)))))

  (defun coalton-accumulate-form (a-type b-type c-type acc a b)
    (let* ((name (format nil "ACCUMULATE-~A~A"
                         (coalton-precision a-type)
                         (coalton-precision b-type)))
           (fn (or (find-symbol name :3dm.coalton)
                   (error "Missing Coalton kernel ~A" name))))
      `(the ,c-type
         (,fn ,(coalton-argument c-type acc)
              ,(coalton-argument a-type a)
              ,(coalton-argument b-type b))))))

(defmacro coalton-matrix-matrix (a b n a-pkg b-pkg c-pkg)
  (let* ((a-var (gensym "A")) (b-var (gensym "B")) (c-var (gensym "C"))
         (a-type (coalton-package-element-type a-pkg))
         (b-type (coalton-package-element-type b-pkg))
         (e (gensym "E")) (f (gensym "F")) (g (gensym "G")))
    `(let ((,a-var ,a)
           (,b-var ,b)
           (,c-var (,(intern (format nil "%MAT~D" n) c-pkg))))
       (,(intern "WITH-FAST-MATREF" a-pkg) (,e ,a-var ,n)
         (,(intern "WITH-FAST-MATREF" b-pkg) (,f ,b-var ,n)
           (,(intern "WITH-FAST-MATREF" c-pkg) (,g ,c-var ,n)
             ,@(loop for i below n append
                     (loop for j below n collect
                           `(setf (,g ,i ,j)
                                  ,(coalton-dot-form
                                    a-type b-type
                                    (loop for k below n collect `(,e ,i ,k))
                                    (loop for k below n collect `(,f ,k ,j)))))))))
       ,c-var)))

(defmacro coalton-matrix-vector (a b n a-pkg b-pkg c-pkg)
  (let* ((a-var (gensym "MAT")) (b-var (gensym "VEC"))
         (a-type (coalton-package-element-type a-pkg))
         (b-type (coalton-package-element-type b-pkg))
         (e (gensym "E"))
         (components (loop for k below n collect
                           `(,(intern (format nil "V~A~D" (char "XYZW" k) n) b-pkg)
                             ,b-var))))
    `(let ((,a-var ,a) (,b-var ,b))
       (,(intern "WITH-FAST-MATREF" a-pkg) (,e ,a-var ,n)
         (,(intern (format nil "%VEC~D" n) c-pkg)
           ,@(loop for i below n collect
                   (coalton-dot-form
                    b-type a-type components
                    (loop for k below n collect `(,e ,i ,k)))))))))

(defmacro coalton-simple-array-multiply (a b a-type b-type c-type)
  (let ((av (gensym "A")) (bv (gensym "B")))
    `(let ((,av ,a) (,bv ,b))
       (declare (type (simple-array ,a-type (* *)) ,av)
                (type (simple-array ,b-type (* *)) ,bv))
       (let ((m (array-dimension ,av 0))
             (n (array-dimension ,av 1))
             (p (array-dimension ,bv 1)))
         (declare (type (integer 0 #.most-positive-fixnum) m n p))
         (assert (= n (array-dimension ,bv 0)))
         (let ((result (make-array (list m p) :element-type ',c-type)))
           (declare (type (simple-array ,c-type (* *)) result))
           (dotimes (i m result)
             (dotimes (j p)
               (setf (aref result i j)
                     (let ((sum ,(coerce 0 c-type)))
                       (declare (type ,c-type sum))
                       (dotimes (k n sum)
                         (setf sum
                               ,(coalton-accumulate-form
                                 a-type b-type c-type 'sum
                                 `(aref ,av i k)
                                 `(aref ,bv k j)))))))))))))
