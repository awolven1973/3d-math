;;;; Common Lisp compatibility interface to the Coalton-owned geometry types.
;;;; Geometry dispatch is on the Coalton classes; scalar selection is at the CL boundary.
(in-package :3dm)

(defun port-scalar-kind (x)
  (etypecase x (double-float :d) (single-float :f) (rational :r)))

(defun port-coerce (x kind)
  (ecase kind
    (:d (coerce x 'double-float))
    (:f (3dm-def::clampf x))
    (:r (rationalize x))
    (:fix (the fixnum (round x)))))

(defun port-element-type (kind)
  (ecase kind (:d 'double-float) (:f 'single-float) (:r 'rational) (:fix 'fixnum)))

(defun port-storage-kind (a)
  (case (array-element-type a)
    (double-float :d)
    (single-float :f)
    (otherwise
     (loop with kind = :r for i below (array-total-size a)
           for x = (row-major-aref a i)
           do (setf kind (case (port-scalar-kind x)
                           (:d :d) (:f (if (eq kind :d) :d :f)) (:r kind)))
           finally (return kind)))))

(defun port-geometry-name (v)
  (etypecase v
    (3dm.coalton:vec2 :vec2)
    (3dm.coalton:vec3 :vec3)
    (3dm.coalton:vec4 :vec4)
    (3dm.coalton:mat2 :mat2)
    (3dm.coalton:mat3 :mat3)
    (3dm.coalton:mat4 :mat4)
    (3dm.coalton:matn :matn)
    (3dm.coalton:quat :quat)
    (3dm.coalton:dquat :dquat)))

(defun port-components (v)
  (etypecase v
    (3dm.coalton:vec2 (list (3dm.coalton::vec2-component-0 v) (3dm.coalton::vec2-component-1 v)))
    (3dm.coalton:vec3 (list (3dm.coalton::vec3-component-0 v) (3dm.coalton::vec3-component-1 v) (3dm.coalton::vec3-component-2 v)))
    (3dm.coalton:vec4 (list (3dm.coalton::vec4-component-0 v) (3dm.coalton::vec4-component-1 v) (3dm.coalton::vec4-component-2 v) (3dm.coalton::vec4-component-3 v)))
    (3dm.coalton:quat (list (3dm.coalton::quat-component-0 v) (3dm.coalton::quat-component-1 v) (3dm.coalton::quat-component-2 v) (3dm.coalton::quat-component-3 v)))))

(defun port-storage (m)
  (etypecase m
    (3dm.coalton:mat2 (3dm.coalton::mat2-storage m))
    (3dm.coalton:mat3 (3dm.coalton::mat3-storage m))
    (3dm.coalton:mat4 (3dm.coalton::mat4-storage m))
    (3dm.coalton:matn (3dm.coalton::matn-storage m))))

(defun port-dimensions (m)
  (etypecase m
    (3dm.coalton:mat2 (values 2 2))
    (3dm.coalton:mat3 (values 3 3))
    (3dm.coalton:mat4 (values 4 4))
    (3dm.coalton:matn (values (3dm.coalton:matn-rows m) (3dm.coalton:matn-cols m)))))

(defun port-matrix-ref (m i j)
  (etypecase m
    (3dm.coalton:mat2 (3dm.coalton:mat2-ref m i j))
    (3dm.coalton:mat3 (3dm.coalton:mat3-ref m i j))
    (3dm.coalton:mat4 (3dm.coalton:mat4-ref m i j))
    (3dm.coalton:matn (3dm.coalton:matn-ref m i j))))

(defun (setf port-matrix-ref) (value m i j)
  (multiple-value-bind (rows cols) (port-dimensions m)
    (assert (and (<= 0 i) (< i rows) (<= 0 j) (< j cols)))
    (setf (aref (port-storage m)
                (if (typep m '3dm.coalton:matn) (+ (* i cols) j) (+ i (* j rows))))
          (port-coerce value (port-kind m)))))

(defun port-kind (v)
  (typecase v
    (real (port-scalar-kind v))
    (array (port-storage-kind v))
    ((or 3dm.coalton:mat2 3dm.coalton:mat3 3dm.coalton:mat4 3dm.coalton:matn)
     (port-storage-kind (port-storage v)))
    (3dm.coalton:dquat (port-kind (3dm.coalton::dquat-real v)))
    (otherwise (port-scalar-kind (first (port-components v))))))

(defun port-common-kind (&rest operands)
  (let ((kinds (mapcar #'port-kind operands)))
    (cond ((member :d kinds) :d) ((member :f kinds) :f) (t :r))))

(defun port-float-kind (&rest operands)
  (let ((kind (apply #'port-common-kind operands)))
    (if (eq kind :r) :f kind)))

(defun port-construct (name kind components)
  (let ((values (mapcar (lambda (x) (port-coerce x kind)) components)))
    (ecase name
      (:vec2 (apply #'3dm.coalton:vec2 values))
      (:vec3 (apply #'3dm.coalton:vec3 values))
      (:vec4 (apply #'3dm.coalton:vec4 values))
      (:quat (apply #'3dm.coalton:quat values)))))

(defun port-fixed-matrix (n kind elements)
  (let ((data (make-array (* n n) :element-type (port-element-type kind)
                         :initial-element (port-coerce 0 kind))))
    (when elements
      (unless (= (length elements) (* n n)) (error "Expected ~D matrix elements" (* n n)))
      (loop for x in elements for k from 0
            do (setf (aref data (+ (floor k n) (* (mod k n) n))) (port-coerce x kind))))
    (ecase n
      (2 (3dm.coalton::mat2data data))
      (3 (3dm.coalton::mat3data data))
      (4 (3dm.coalton::mat4data data)))))

(defun port-matn (rows cols kind elements &key column-major (fixed t))
  (check-type rows 3dm-def::mat-dim)
  (check-type cols 3dm-def::mat-dim)
  (when (and fixed (= rows cols) (member rows '(2 3 4)))
    (return-from port-matn (port-fixed-matrix rows kind (and elements (coerce elements 'list)))))
  (let* ((data (make-array (* rows cols) :element-type (port-element-type kind)
                           :initial-element (port-coerce 0 kind)))
         (values (typecase elements (null nil) (real (make-list (* rows cols) :initial-element elements))
                           (sequence (coerce elements 'list)))))
    (when values
      (loop for x in values for k below (length data)
            do (setf (aref data (if column-major (+ (* (mod k rows) cols) (floor k rows)) k))
                     (port-coerce x kind))))
    (3dm.coalton::matndata rows cols data)))

(defun port-matrix-elements (m)
  (multiple-value-bind (rows cols) (port-dimensions m)
    (loop for i below rows append (loop for j below cols collect (port-matrix-ref m i j)))))

(defun port-convert (v kind &optional copy)
  (when (and (not copy) (eq (port-kind v) kind)) (return-from port-convert v))
  (typecase v
    (real (port-coerce v kind))
    ((or 3dm.coalton:vec2 3dm.coalton:vec3 3dm.coalton:vec4 3dm.coalton:quat)
     (port-construct (port-geometry-name v) kind (port-components v)))
    ((or 3dm.coalton:mat2 3dm.coalton:mat3 3dm.coalton:mat4)
     (port-fixed-matrix (port-dimensions v) kind (port-matrix-elements v)))
    (3dm.coalton:matn
     (port-matn (3dm.coalton:matn-rows v) (3dm.coalton:matn-cols v)
                kind (port-matrix-elements v) :fixed nil))
    (3dm.coalton:dquat
     (3dm.coalton:dquat (port-convert (3dm.coalton::dquat-real v) kind copy)
                       (port-convert (3dm.coalton::dquat-dual v) kind copy)))))

(defun port-kernel (name kind &rest args)
  ;; A deliberately simple first bridge: resolve the concrete root at runtime.
  ;; All numerical kernels are statically typed and monomorphized in Coalton.
  (let ((sym (find-symbol (format nil "~A-~A" name (ecase kind (:d "D") (:f "F") (:r "R"))) :3dm.coalton)))
    (unless (and sym (fboundp sym)) (error "Missing Coalton kernel ~A/~A" name kind))
    (apply (symbol-function sym) args)))

(defun port-invoke (name kind &rest args)
  (apply #'port-kernel name kind (mapcar (lambda (x) (port-convert x kind)) args)))

(defun port-broadcast (name v kind)
  (if (realp v)
      (port-construct name kind (make-list (ecase name (:vec2 2) (:vec3 3) (:vec4 4))
                                         :initial-element v))
      (port-convert v kind)))

(defun port-vector-bin (name op a b)
  (let ((kind (port-common-kind a b)))
    (port-kernel op kind (port-broadcast name a kind) (port-broadcast name b kind))))

(defun port-vector-compare (name op relation a b &optional negate)
  ;; Preserve CL exact mixed-float/rational comparisons rather than rounding
  ;; a rational operand into the promoted floating-point type.
  (if (eq (port-kind a) (port-kind b))
      (port-vector-bin name op a b)
      (let* ((n (ecase name (:vec2 2) (:vec3 3) (:vec4 4)))
             (aa (if (realp a) (make-list n :initial-element a) (port-components a)))
             (bb (if (realp b) (make-list n :initial-element b) (port-components b))))
        (if negate (some relation aa bb) (every relation aa bb)))))

(defun port-precision-p (v name kind)
  (and (eq (port-geometry-name v) name)
       (case kind
         (:fix (typecase v
                 ((or 3dm.coalton:vec2 3dm.coalton:vec3 3dm.coalton:vec4)
                  (every (lambda (x) (typep x 'fixnum)) (port-components v)))
                 ((or 3dm.coalton:mat2 3dm.coalton:mat3 3dm.coalton:mat4 3dm.coalton:matn)
                  (eq (array-element-type (port-storage v)) (upgraded-array-element-type 'fixnum)))
                 (t nil)))
         (otherwise (eq (port-kind v) kind)))))

(defun port-array-matrix (a kind)
  (check-type a (array * (* *)))
  (port-matn (array-dimension a 0) (array-dimension a 1) kind
             (loop for i below (array-total-size a) collect (row-major-aref a i)) :fixed nil))

(defun port-dynamic-matrix (m kind)
  (typecase m
    (array (port-array-matrix m kind))
    (3dm.coalton:matn (port-convert m kind))
    (otherwise (multiple-value-bind (rows cols) (port-dimensions m)
                 (port-matn rows cols kind (port-matrix-elements m) :fixed nil)))))

(defun port-rank2-array (m kind)
  (multiple-value-bind (rows cols) (port-dimensions m)
    (make-array (list rows cols) :element-type (port-element-type kind)
                :initial-contents (loop for i below rows collect
                                       (loop for j below cols collect (port-matrix-ref m i j))))))

(defun port-replace-matrix (destination source)
  (replace (port-storage destination) (port-storage source))
  destination)

(defun port-eye (n kind)
  (port-matn n n kind (loop for i below n append
                           (loop for j below n collect (if (= i j) 1 0)))))

(defmethod vx ((v 3dm.coalton:vec2))
  (3dm.coalton::vec2-component-0 v))

(defmethod vy ((v 3dm.coalton:vec2))
  (3dm.coalton::vec2-component-1 v))

(defmethod binary-v+ ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-ADD" a b))

(defmethod binary-v+ ((a 3dm.coalton:vec2) (b real))
  (port-vector-bin :vec2 "VEC2-ADD" a b))

(defmethod binary-v+ ((a real) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-ADD" a b))

(defmethod binary-v- ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-SUB" a b))

(defmethod binary-v- ((a 3dm.coalton:vec2) (b real))
  (port-vector-bin :vec2 "VEC2-SUB" a b))

(defmethod binary-v- ((a real) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-SUB" a b))

(defmethod binary-v* ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-MUL" a b))

(defmethod binary-v* ((a 3dm.coalton:vec2) (b real))
  (port-vector-bin :vec2 "VEC2-MUL" a b))

(defmethod binary-v* ((a real) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-MUL" a b))

(defmethod binary-v/ ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-DIV" a b))

(defmethod binary-v/ ((a 3dm.coalton:vec2) (b real))
  (port-vector-bin :vec2 "VEC2-DIV" a b))

(defmethod binary-v/ ((a real) (b 3dm.coalton:vec2))
  (port-vector-bin :vec2 "VEC2-DIV" a b))

(defmethod binary-v= ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-EQ" #'= a b))

(defmethod binary-v= ((a 3dm.coalton:vec2) (b real))
  (port-vector-compare :vec2 "VEC2-EQ" #'= b a))

(defmethod binary-v= ((a real) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-EQ" #'= a b))

(defmethod binary-v/= ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-NE" #'/= a b t))

(defmethod binary-v/= ((a 3dm.coalton:vec2) (b real))
  (port-vector-compare :vec2 "VEC2-NE" #'/= b a t))

(defmethod binary-v/= ((a real) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-NE" #'/= a b t))

(defmethod binary-v< ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-LT" #'< a b))

(defmethod binary-v< ((a 3dm.coalton:vec2) (b real))
  (port-vector-compare :vec2 "VEC2-LT" #'< b a))

(defmethod binary-v< ((a real) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-LT" #'< a b))

(defmethod binary-v<= ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-LE" #'<= a b))

(defmethod binary-v<= ((a 3dm.coalton:vec2) (b real))
  (port-vector-compare :vec2 "VEC2-LE" #'<= b a))

(defmethod binary-v<= ((a real) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-LE" #'<= a b))

(defmethod binary-v> ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-GT" #'> a b))

(defmethod binary-v> ((a 3dm.coalton:vec2) (b real))
  (port-vector-compare :vec2 "VEC2-GT" #'> b a))

(defmethod binary-v> ((a real) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-GT" #'> a b))

(defmethod binary-v>= ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-GE" #'>= a b))

(defmethod binary-v>= ((a 3dm.coalton:vec2) (b real))
  (port-vector-compare :vec2 "VEC2-GE" #'>= b a))

(defmethod binary-v>= ((a real) (b 3dm.coalton:vec2))
  (port-vector-compare :vec2 "VEC2-GE" #'>= a b))

(defmethod v. ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-invoke "VEC2-DOT" (port-common-kind a b) a b))

(defmethod vsqrlength ((v 3dm.coalton:vec2))
  (port-invoke "VEC2-SQRLENGTH" (port-kind v) v))

(defmethod vlength ((v 3dm.coalton:vec2))
  (if (eq (port-kind v) :r) (sqrt (vsqrlength v)) (port-invoke "VEC2-LENGTH" (port-kind v) v)))

(defmethod v2norm ((v 3dm.coalton:vec2))
  (vlength v))

(defmethod vsqrdistance ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-invoke "VEC2-SQRDISTANCE" (port-common-kind a b) a b))

(defmethod vdistance ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (sqrt (vsqrdistance a b)))

(defmethod vunit ((v 3dm.coalton:vec2))
  (if (eq (port-kind v) :r) (binary-v/ v (vlength v)) (port-invoke "VEC2-UNIT" (port-kind v) v)))

(defmethod vangle ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2))
  (port-invoke "VEC2-ANGLE" (port-float-kind a b) a b))

(defmethod lerp ((a 3dm.coalton:vec2) (b 3dm.coalton:vec2) (s real))
  (port-invoke "VEC2-LERP" (port-common-kind a b s) a b s))

(defmethod vcopy ((v 3dm.coalton:vec2))
  (port-convert v (port-kind v) t))

(defmethod marr ((m 3dm.coalton:mat2))
  (port-storage m))

(defmethod mcopy ((m 3dm.coalton:mat2))
  (port-convert m (port-kind m) t))

(defmethod mtranspose ((m 3dm.coalton:mat2))
  (port-invoke "MAT2-TRANSPOSE" (port-kind m) m))

(defmethod mdet ((m 3dm.coalton:mat2))
  (port-invoke "MAT2-DET" (port-kind m) m))

(defmethod minv ((m 3dm.coalton:mat2))
  (port-invoke "MAT2-INVERSE" (port-kind m) m))

(defmethod mrow ((m 3dm.coalton:mat2) (i fixnum))
  (port-construct :vec2 (port-kind m) (loop for j below 2 collect (port-matrix-ref m i j))))

(defmethod mcol ((m 3dm.coalton:mat2) (i fixnum))
  (port-construct :vec2 (port-kind m) (loop for j below 2 collect (port-matrix-ref m j i))))

(defmethod (setf mrow) ((v 3dm.coalton:vec2) (m 3dm.coalton:mat2) (i fixnum))
  (loop for x in (port-components v) for j from 0 do (setf (port-matrix-ref m i j) x))
  v)

(defmethod (setf mcol) ((v 3dm.coalton:vec2) (m 3dm.coalton:mat2) (i fixnum))
  (loop for x in (port-components v) for j from 0 do (setf (port-matrix-ref m j i) x))
  v)

(defmethod binary-m* ((a 3dm.coalton:mat2) (b 3dm.coalton:mat2))
  (port-invoke "MAT2-MM" (port-common-kind a b) a b))

(defmethod binary-m* ((a 3dm.coalton:mat2) (b 3dm.coalton:vec2))
  (port-invoke "MAT2-MV" (port-common-kind a b) a b))

(defmethod binary-m* ((a 3dm.coalton:vec2) (b 3dm.coalton:mat2))
  (port-invoke "MAT2-MV" (port-common-kind a b) b a))

(defmethod vx ((v 3dm.coalton:vec3))
  (3dm.coalton::vec3-component-0 v))

(defmethod vy ((v 3dm.coalton:vec3))
  (3dm.coalton::vec3-component-1 v))

(defmethod vz ((v 3dm.coalton:vec3))
  (3dm.coalton::vec3-component-2 v))

(defmethod binary-v+ ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-ADD" a b))

(defmethod binary-v+ ((a 3dm.coalton:vec3) (b real))
  (port-vector-bin :vec3 "VEC3-ADD" a b))

(defmethod binary-v+ ((a real) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-ADD" a b))

(defmethod binary-v- ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-SUB" a b))

(defmethod binary-v- ((a 3dm.coalton:vec3) (b real))
  (port-vector-bin :vec3 "VEC3-SUB" a b))

(defmethod binary-v- ((a real) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-SUB" a b))

(defmethod binary-v* ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-MUL" a b))

(defmethod binary-v* ((a 3dm.coalton:vec3) (b real))
  (port-vector-bin :vec3 "VEC3-MUL" a b))

(defmethod binary-v* ((a real) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-MUL" a b))

(defmethod binary-v/ ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-DIV" a b))

(defmethod binary-v/ ((a 3dm.coalton:vec3) (b real))
  (port-vector-bin :vec3 "VEC3-DIV" a b))

(defmethod binary-v/ ((a real) (b 3dm.coalton:vec3))
  (port-vector-bin :vec3 "VEC3-DIV" a b))

(defmethod binary-v= ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-EQ" #'= a b))

(defmethod binary-v= ((a 3dm.coalton:vec3) (b real))
  (port-vector-compare :vec3 "VEC3-EQ" #'= b a))

(defmethod binary-v= ((a real) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-EQ" #'= a b))

(defmethod binary-v/= ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-NE" #'/= a b t))

(defmethod binary-v/= ((a 3dm.coalton:vec3) (b real))
  (port-vector-compare :vec3 "VEC3-NE" #'/= b a t))

(defmethod binary-v/= ((a real) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-NE" #'/= a b t))

(defmethod binary-v< ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-LT" #'< a b))

(defmethod binary-v< ((a 3dm.coalton:vec3) (b real))
  (port-vector-compare :vec3 "VEC3-LT" #'< b a))

(defmethod binary-v< ((a real) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-LT" #'< a b))

(defmethod binary-v<= ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-LE" #'<= a b))

(defmethod binary-v<= ((a 3dm.coalton:vec3) (b real))
  (port-vector-compare :vec3 "VEC3-LE" #'<= b a))

(defmethod binary-v<= ((a real) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-LE" #'<= a b))

(defmethod binary-v> ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-GT" #'> a b))

(defmethod binary-v> ((a 3dm.coalton:vec3) (b real))
  (port-vector-compare :vec3 "VEC3-GT" #'> b a))

(defmethod binary-v> ((a real) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-GT" #'> a b))

(defmethod binary-v>= ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-GE" #'>= a b))

(defmethod binary-v>= ((a 3dm.coalton:vec3) (b real))
  (port-vector-compare :vec3 "VEC3-GE" #'>= b a))

(defmethod binary-v>= ((a real) (b 3dm.coalton:vec3))
  (port-vector-compare :vec3 "VEC3-GE" #'>= a b))

(defmethod v. ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-invoke "VEC3-DOT" (port-common-kind a b) a b))

(defmethod vsqrlength ((v 3dm.coalton:vec3))
  (port-invoke "VEC3-SQRLENGTH" (port-kind v) v))

(defmethod vlength ((v 3dm.coalton:vec3))
  (if (eq (port-kind v) :r) (sqrt (vsqrlength v)) (port-invoke "VEC3-LENGTH" (port-kind v) v)))

(defmethod v2norm ((v 3dm.coalton:vec3))
  (vlength v))

(defmethod vsqrdistance ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-invoke "VEC3-SQRDISTANCE" (port-common-kind a b) a b))

(defmethod vdistance ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (sqrt (vsqrdistance a b)))

(defmethod vunit ((v 3dm.coalton:vec3))
  (if (eq (port-kind v) :r) (binary-v/ v (vlength v)) (port-invoke "VEC3-UNIT" (port-kind v) v)))

(defmethod vangle ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-invoke "VEC3-ANGLE" (port-float-kind a b) a b))

(defmethod lerp ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3) (s real))
  (port-invoke "VEC3-LERP" (port-common-kind a b s) a b s))

(defmethod vcopy ((v 3dm.coalton:vec3))
  (port-convert v (port-kind v) t))

(defmethod marr ((m 3dm.coalton:mat3))
  (port-storage m))

(defmethod mcopy ((m 3dm.coalton:mat3))
  (port-convert m (port-kind m) t))

(defmethod mtranspose ((m 3dm.coalton:mat3))
  (port-invoke "MAT3-TRANSPOSE" (port-kind m) m))

(defmethod mdet ((m 3dm.coalton:mat3))
  (port-invoke "MAT3-DET" (port-kind m) m))

(defmethod minv ((m 3dm.coalton:mat3))
  (port-invoke "MAT3-INVERSE" (port-kind m) m))

(defmethod mrow ((m 3dm.coalton:mat3) (i fixnum))
  (port-construct :vec3 (port-kind m) (loop for j below 3 collect (port-matrix-ref m i j))))

(defmethod mcol ((m 3dm.coalton:mat3) (i fixnum))
  (port-construct :vec3 (port-kind m) (loop for j below 3 collect (port-matrix-ref m j i))))

(defmethod (setf mrow) ((v 3dm.coalton:vec3) (m 3dm.coalton:mat3) (i fixnum))
  (loop for x in (port-components v) for j from 0 do (setf (port-matrix-ref m i j) x))
  v)

(defmethod (setf mcol) ((v 3dm.coalton:vec3) (m 3dm.coalton:mat3) (i fixnum))
  (loop for x in (port-components v) for j from 0 do (setf (port-matrix-ref m j i) x))
  v)

(defmethod binary-m* ((a 3dm.coalton:mat3) (b 3dm.coalton:mat3))
  (port-invoke "MAT3-MM" (port-common-kind a b) a b))

(defmethod binary-m* ((a 3dm.coalton:mat3) (b 3dm.coalton:vec3))
  (port-invoke "MAT3-MV" (port-common-kind a b) a b))

(defmethod binary-m* ((a 3dm.coalton:vec3) (b 3dm.coalton:mat3))
  (port-invoke "MAT3-MV" (port-common-kind a b) b a))

(defmethod vx ((v 3dm.coalton:vec4))
  (3dm.coalton::vec4-component-0 v))

(defmethod vy ((v 3dm.coalton:vec4))
  (3dm.coalton::vec4-component-1 v))

(defmethod vz ((v 3dm.coalton:vec4))
  (3dm.coalton::vec4-component-2 v))

(defmethod vw ((v 3dm.coalton:vec4))
  (3dm.coalton::vec4-component-3 v))

(defmethod binary-v+ ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-ADD" a b))

(defmethod binary-v+ ((a 3dm.coalton:vec4) (b real))
  (port-vector-bin :vec4 "VEC4-ADD" a b))

(defmethod binary-v+ ((a real) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-ADD" a b))

(defmethod binary-v- ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-SUB" a b))

(defmethod binary-v- ((a 3dm.coalton:vec4) (b real))
  (port-vector-bin :vec4 "VEC4-SUB" a b))

(defmethod binary-v- ((a real) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-SUB" a b))

(defmethod binary-v* ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-MUL" a b))

(defmethod binary-v* ((a 3dm.coalton:vec4) (b real))
  (port-vector-bin :vec4 "VEC4-MUL" a b))

(defmethod binary-v* ((a real) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-MUL" a b))

(defmethod binary-v/ ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-DIV" a b))

(defmethod binary-v/ ((a 3dm.coalton:vec4) (b real))
  (port-vector-bin :vec4 "VEC4-DIV" a b))

(defmethod binary-v/ ((a real) (b 3dm.coalton:vec4))
  (port-vector-bin :vec4 "VEC4-DIV" a b))

(defmethod binary-v= ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-EQ" #'= a b))

(defmethod binary-v= ((a 3dm.coalton:vec4) (b real))
  (port-vector-compare :vec4 "VEC4-EQ" #'= b a))

(defmethod binary-v= ((a real) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-EQ" #'= a b))

(defmethod binary-v/= ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-NE" #'/= a b t))

(defmethod binary-v/= ((a 3dm.coalton:vec4) (b real))
  (port-vector-compare :vec4 "VEC4-NE" #'/= b a t))

(defmethod binary-v/= ((a real) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-NE" #'/= a b t))

(defmethod binary-v< ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-LT" #'< a b))

(defmethod binary-v< ((a 3dm.coalton:vec4) (b real))
  (port-vector-compare :vec4 "VEC4-LT" #'< b a))

(defmethod binary-v< ((a real) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-LT" #'< a b))

(defmethod binary-v<= ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-LE" #'<= a b))

(defmethod binary-v<= ((a 3dm.coalton:vec4) (b real))
  (port-vector-compare :vec4 "VEC4-LE" #'<= b a))

(defmethod binary-v<= ((a real) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-LE" #'<= a b))

(defmethod binary-v> ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-GT" #'> a b))

(defmethod binary-v> ((a 3dm.coalton:vec4) (b real))
  (port-vector-compare :vec4 "VEC4-GT" #'> b a))

(defmethod binary-v> ((a real) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-GT" #'> a b))

(defmethod binary-v>= ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-GE" #'>= a b))

(defmethod binary-v>= ((a 3dm.coalton:vec4) (b real))
  (port-vector-compare :vec4 "VEC4-GE" #'>= b a))

(defmethod binary-v>= ((a real) (b 3dm.coalton:vec4))
  (port-vector-compare :vec4 "VEC4-GE" #'>= a b))

(defmethod v. ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-invoke "VEC4-DOT" (port-common-kind a b) a b))

(defmethod vsqrlength ((v 3dm.coalton:vec4))
  (port-invoke "VEC4-SQRLENGTH" (port-kind v) v))

(defmethod vlength ((v 3dm.coalton:vec4))
  (if (eq (port-kind v) :r) (sqrt (vsqrlength v)) (port-invoke "VEC4-LENGTH" (port-kind v) v)))

(defmethod v2norm ((v 3dm.coalton:vec4))
  (vlength v))

(defmethod vsqrdistance ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-invoke "VEC4-SQRDISTANCE" (port-common-kind a b) a b))

(defmethod vdistance ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (sqrt (vsqrdistance a b)))

(defmethod vunit ((v 3dm.coalton:vec4))
  (if (eq (port-kind v) :r) (binary-v/ v (vlength v)) (port-invoke "VEC4-UNIT" (port-kind v) v)))

(defmethod vangle ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4))
  (port-invoke "VEC4-ANGLE" (port-float-kind a b) a b))

(defmethod lerp ((a 3dm.coalton:vec4) (b 3dm.coalton:vec4) (s real))
  (port-invoke "VEC4-LERP" (port-common-kind a b s) a b s))

(defmethod vcopy ((v 3dm.coalton:vec4))
  (port-convert v (port-kind v) t))

(defmethod marr ((m 3dm.coalton:mat4))
  (port-storage m))

(defmethod mcopy ((m 3dm.coalton:mat4))
  (port-convert m (port-kind m) t))

(defmethod mtranspose ((m 3dm.coalton:mat4))
  (port-invoke "MAT4-TRANSPOSE" (port-kind m) m))

(defmethod mdet ((m 3dm.coalton:mat4))
  (port-invoke "MAT4-DET" (port-kind m) m))

(defmethod minv ((m 3dm.coalton:mat4))
  (port-invoke "MAT4-INVERSE" (port-kind m) m))

(defmethod mrow ((m 3dm.coalton:mat4) (i fixnum))
  (port-construct :vec4 (port-kind m) (loop for j below 4 collect (port-matrix-ref m i j))))

(defmethod mcol ((m 3dm.coalton:mat4) (i fixnum))
  (port-construct :vec4 (port-kind m) (loop for j below 4 collect (port-matrix-ref m j i))))

(defmethod (setf mrow) ((v 3dm.coalton:vec4) (m 3dm.coalton:mat4) (i fixnum))
  (loop for x in (port-components v) for j from 0 do (setf (port-matrix-ref m i j) x))
  v)

(defmethod (setf mcol) ((v 3dm.coalton:vec4) (m 3dm.coalton:mat4) (i fixnum))
  (loop for x in (port-components v) for j from 0 do (setf (port-matrix-ref m j i) x))
  v)

(defmethod binary-m* ((a 3dm.coalton:mat4) (b 3dm.coalton:mat4))
  (port-invoke "MAT4-MM" (port-common-kind a b) a b))

(defmethod binary-m* ((a 3dm.coalton:mat4) (b 3dm.coalton:vec4))
  (port-invoke "MAT4-MV" (port-common-kind a b) a b))

(defmethod binary-m* ((a 3dm.coalton:vec4) (b 3dm.coalton:mat4))
  (port-invoke "MAT4-MV" (port-common-kind a b) b a))

(defmethod vx ((v vector))
  (aref v 0))

(defmethod vx ((v list))
  (nth 0 v))

(defmethod qx ((v vector))
  (aref v 0))

(defmethod qx ((v list))
  (nth 0 v))

(defmethod qx ((q 3dm.coalton:quat))
  (3dm.coalton::quat-component-0 q))

(defmethod vy ((v vector))
  (aref v 1))

(defmethod vy ((v list))
  (nth 1 v))

(defmethod qy ((v vector))
  (aref v 1))

(defmethod qy ((v list))
  (nth 1 v))

(defmethod qy ((q 3dm.coalton:quat))
  (3dm.coalton::quat-component-1 q))

(defmethod vz ((v vector))
  (aref v 2))

(defmethod vz ((v list))
  (nth 2 v))

(defmethod qz ((v vector))
  (aref v 2))

(defmethod qz ((v list))
  (nth 2 v))

(defmethod qz ((q 3dm.coalton:quat))
  (3dm.coalton::quat-component-2 q))

(defmethod vw ((v vector))
  (aref v 3))

(defmethod vw ((v list))
  (nth 3 v))

(defmethod qw ((v vector))
  (aref v 3))

(defmethod qw ((v list))
  (nth 3 v))

(defmethod qw ((q 3dm.coalton:quat))
  (3dm.coalton::quat-component-3 q))

(defmethod binary-v+ ((a real) (b real))
  (+ a b))

(defmethod binary-v- ((a real) (b real))
  (- a b))

(defmethod binary-v* ((a real) (b real))
  (* a b))

(defmethod binary-v/ ((a real) (b real))
  (/ a b))

(defmethod binary-v= ((a real) (b real))
  (= a b))

(defmethod binary-v/= ((a real) (b real))
  (/= a b))

(defmethod binary-v< ((a real) (b real))
  (< a b))

(defmethod binary-v<= ((a real) (b real))
  (<= a b))

(defmethod binary-v> ((a real) (b real))
  (> a b))

(defmethod binary-v>= ((a real) (b real))
  (>= a b))

(defmethod vc ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (port-invoke "VEC3-CROSS" (port-common-kind a b) a b))

(defmethod orthogonalize ((a 3dm.coalton:vec3) (b 3dm.coalton:vec3))
  (vc (vc a b) a))

(defmethod coerce-to-double-float ((v 3dm.coalton:vec2))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:vec2))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v 3dm.coalton:vec3))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:vec3))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v 3dm.coalton:vec4))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:vec4))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v 3dm.coalton:mat2))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:mat2))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v 3dm.coalton:mat3))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:mat3))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v 3dm.coalton:mat4))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:mat4))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v 3dm.coalton:matn))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:matn))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v 3dm.coalton:quat))
  (port-convert v :d))

(defmethod coerce-to-single-float ((v 3dm.coalton:quat))
  (port-convert v :f))

(defmethod coerce-to-double-float ((v real))
  (port-coerce v :d))

(defmethod coerce-to-single-float ((v real))
  (port-coerce v :f))

(defmethod lerp ((a list) (b list) (s real))
  (mapcar (lambda (x y) (+ (* (- 1 s) x) (* s y))) a b))

(defmethod lerp ((a vector) (b vector) (s real))
  (map 'vector (lambda (x y) (+ (* (- 1 s) x) (* s y))) a b))

(defmethod qconjugate ((q 3dm.coalton:quat))
  (port-invoke "QUAT-CONJUGATE" (port-kind q) q))

(defmethod binary-q* ((a 3dm.coalton:quat) (b 3dm.coalton:quat))
  (port-invoke "QUAT-MUL" (port-common-kind a b) a b))

(defmethod lerp ((a 3dm.coalton:quat) (b 3dm.coalton:quat) (s real))
  (port-invoke "QUAT-LERP" (port-common-kind a b s) a b s))

(defmethod qrotation ((v 3dm.coalton:vec3) (theta real))
  (port-invoke "QUAT-ROTATION" (if (and (eq (port-kind v) :f) (typep theta 'single-float)) :f :d) v theta))

(defmethod quaternion-from-to ((u 3dm.coalton:vec3) (v 3dm.coalton:vec3))
  (let ((kind (port-common-kind u v))) (port-invoke "QUAT-FROM-TO" (if (eq kind :r) :d kind) u v)))

(defmethod rotate-vector ((v 3dm.coalton:vec3) (q 3dm.coalton:quat))
  (port-invoke "QUAT-ROTATE-VECTOR" (port-common-kind v q) v q))

(defmethod quaternion-x-axis ((q 3dm.coalton:quat))
  (port-invoke "QUAT-X-AXIS" (port-float-kind q) q))

(defmethod quaternion-y-axis ((q 3dm.coalton:quat))
  (port-invoke "QUAT-Y-AXIS" (port-float-kind q) q))

(defmethod quaternion-z-axis ((q 3dm.coalton:quat))
  (port-invoke "QUAT-Z-AXIS" (port-float-kind q) q))

(defmethod matrix-from-quaternion ((q 3dm.coalton:quat))
  (port-invoke "QUAT-MATRIX" (port-kind q) q))

(defmethod mlookat ((eye 3dm.coalton:vec3) (target 3dm.coalton:vec3) (up 3dm.coalton:vec3))
  (port-invoke "LOOKAT" (port-float-kind eye target up) eye target up))

(defmethod nmtranslate ((m 3dm.coalton:mat4) (v 3dm.coalton:vec3))
  (port-replace-matrix m (port-invoke "MAT4-TRANSLATE" (port-kind m) m v)))

(defmethod nmscale ((m 3dm.coalton:mat4) (v 3dm.coalton:vec3))
  (port-replace-matrix m (port-invoke "MAT4-SCALE" (port-kind m) m v)))

(defmethod mrotate ((m 3dm.coalton:mat4) (v 3dm.coalton:vec3) (angle real))
  (let ((kind (port-float-kind m)))
    (binary-m* m (matrix-from-quaternion (port-invoke "QUAT-ROTATION" kind v angle)))))

(defmethod marr ((m 3dm.coalton:matn))
  ;; Legacy accessor returns column-major storage; MatN's own storage is row-major.
  (multiple-value-bind (rows cols) (port-dimensions m)
    (make-array (* rows cols) :element-type (port-element-type (port-kind m))
                :initial-contents (loop for j below cols append
                                     (loop for i below rows collect (port-matrix-ref m i j))))))

(defmethod mcopy ((m 3dm.coalton:matn))
  (port-convert m (port-kind m) t))

(defmethod mtranspose ((m 3dm.coalton:matn))
  (multiple-value-bind (rows cols) (port-dimensions m)
    (port-matn cols rows (port-kind m) (loop for j below cols append (loop for i below rows collect (port-matrix-ref m i j))) :fixed nil)))

(defmethod binary-m* ((a 3dm.coalton:matn) (b 3dm.coalton:matn))
  (let ((kind (port-common-kind a b)))
    (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind))))

(defmethod binary-m* ((a 3dm.coalton:matn) (b 3dm.coalton:mat2))
  (let ((kind (port-common-kind a b)))
    (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind))))

(defmethod binary-m* ((a 3dm.coalton:mat2) (b 3dm.coalton:matn))
  (let ((kind (port-common-kind a b)))
    (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind))))

(defmethod binary-m* ((a 3dm.coalton:matn) (b 3dm.coalton:mat3))
  (let ((kind (port-common-kind a b)))
    (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind))))

(defmethod binary-m* ((a 3dm.coalton:mat3) (b 3dm.coalton:matn))
  (let ((kind (port-common-kind a b)))
    (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind))))

(defmethod binary-m* ((a 3dm.coalton:matn) (b 3dm.coalton:mat4))
  (let ((kind (port-common-kind a b)))
    (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind))))

(defmethod binary-m* ((a 3dm.coalton:mat4) (b 3dm.coalton:matn))
  (let ((kind (port-common-kind a b)))
    (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind))))

(defmethod binary-m* ((a array) (b array))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-array-matrix a kind) (port-array-matrix b kind)) kind)))

(defmethod binary-m* ((a 3dm.coalton:mat2) (b array))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defmethod binary-m* ((a array) (b 3dm.coalton:mat2))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defmethod binary-m* ((a 3dm.coalton:mat3) (b array))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defmethod binary-m* ((a array) (b 3dm.coalton:mat3))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defmethod binary-m* ((a 3dm.coalton:mat4) (b array))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defmethod binary-m* ((a array) (b 3dm.coalton:mat4))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defmethod binary-m* ((a 3dm.coalton:matn) (b array))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defmethod binary-m* ((a array) (b 3dm.coalton:matn))
  (let ((kind (port-common-kind a b)))
    (port-rank2-array (port-kernel "MATN-MM" kind (port-dynamic-matrix a kind) (port-dynamic-matrix b kind)) kind)))

(defun v+ (val &rest vals)
  (if vals (reduce #'binary-v+ vals :initial-value val) val))

(define-compiler-macro v+ (val &rest vals)
  (if vals (reduce (lambda (a b) (list 'binary-v+ a b)) vals :initial-value val)
      val))

(defun v- (val &rest vals)
  (if vals (reduce #'binary-v- vals :initial-value val) (binary-v* -1 val)))

(define-compiler-macro v- (val &rest vals)
  (if vals (reduce (lambda (a b) (list 'binary-v- a b)) vals :initial-value val)
      (list 'binary-v* -1 val)))

(defun v* (val &rest vals)
  (if vals (reduce #'binary-v* vals :initial-value val) val))

(define-compiler-macro v* (val &rest vals)
  (if vals (reduce (lambda (a b) (list 'binary-v* a b)) vals :initial-value val)
      val))

(defun v/ (val &rest vals)
  (if vals (reduce #'binary-v/ vals :initial-value val) (binary-v/ 1 val)))

(define-compiler-macro v/ (val &rest vals)
  (if vals (reduce (lambda (a b) (list 'binary-v/ a b)) vals :initial-value val)
      (list 'binary-v/ 1 val)))

(defun m* (val &rest vals)
  (if vals (reduce #'binary-m* vals :initial-value val) val))

(define-compiler-macro m* (val &rest vals)
  (if vals (reduce (lambda (a b) (list 'binary-m* a b)) vals :initial-value val)
      val))

(defun q* (val &rest vals)
  (if vals (reduce #'binary-q* vals :initial-value val) val))

(define-compiler-macro q* (val &rest vals)
  (if vals (reduce (lambda (a b) (list 'binary-q* a b)) vals :initial-value val)
      val))

(defun v= (val &rest vals)
  (loop for prev = val then next for next in vals always (binary-v= prev next)))

(defun v/= (val &rest vals)
  (loop for prev = val then next for next in vals always (binary-v/= prev next)))

(defun v< (val &rest vals)
  (loop for prev = val then next for next in vals always (binary-v< prev next)))

(defun v<= (val &rest vals)
  (loop for prev = val then next for next in vals always (binary-v<= prev next)))

(defun v> (val &rest vals)
  (loop for prev = val then next for next in vals always (binary-v> prev next)))

(defun v>= (val &rest vals)
  (loop for prev = val then next for next in vals always (binary-v>= prev next)))

(defun mcopy-mat4-to-single-float (m)
  (etypecase m
    (null (port-eye 4 :f))
    (3dm.coalton:mat4 (port-convert m :f t))
    (array (assert (equal (array-dimensions m) '(4 4)))
           (port-fixed-matrix 4 :f (loop for i below 16 collect (row-major-aref m i))))))

(defun binary-m*-mat4-mat4-to-single-float-mat4 (a b)
  (let ((aa (if (arrayp a) (mcopy-mat4-to-single-float a) a))
        (bb (if (arrayp b) (mcopy-mat4-to-single-float b) b)))
    (mcopy-mat4-to-single-float (binary-m* aa bb))))

(defmethod make-load-form ((v 3dm.coalton:vec2) &optional environment)
  (declare (ignore environment))
  (cons '3dm.coalton:vec2 (port-components v)))

(defmethod make-load-form ((v 3dm.coalton:vec3) &optional environment)
  (declare (ignore environment))
  (cons '3dm.coalton:vec3 (port-components v)))

(defmethod make-load-form ((v 3dm.coalton:vec4) &optional environment)
  (declare (ignore environment))
  (cons '3dm.coalton:vec4 (port-components v)))

(defmethod make-load-form ((v 3dm.coalton:quat) &optional environment)
  (declare (ignore environment))
  (cons '3dm.coalton:quat (port-components v)))

(defmethod make-load-form ((m 3dm.coalton:mat2) &optional environment)
  (declare (ignore environment))
  (list '3dm.coalton::mat2data (list 'quote (port-storage m))))

(defmethod make-load-form ((m 3dm.coalton:mat3) &optional environment)
  (declare (ignore environment))
  (list '3dm.coalton::mat3data (list 'quote (port-storage m))))

(defmethod make-load-form ((m 3dm.coalton:mat4) &optional environment)
  (declare (ignore environment))
  (list '3dm.coalton::mat4data (list 'quote (port-storage m))))

(defmethod make-load-form ((m 3dm.coalton:matn) &optional environment)
  (declare (ignore environment))
  (list '3dm.coalton::matndata (3dm.coalton:matn-rows m) (3dm.coalton:matn-cols m) (list 'quote (port-storage m))))

(defmethod make-load-form ((q 3dm.coalton:dquat) &optional environment)
  (declare (ignore environment))
  (list '3dm.coalton:dquat (list 'quote (3dm.coalton::dquat-real q)) (list 'quote (3dm.coalton::dquat-dual q))))

(defmethod print-object ((v 3dm.coalton:vec2) stream)
  (if *print-readably* (call-next-method)
      (format stream "(VEC2~{ ~A~})" (port-components v)))
  v)

(defmethod print-object ((v 3dm.coalton:vec3) stream)
  (if *print-readably* (call-next-method)
      (format stream "(VEC3~{ ~A~})" (port-components v)))
  v)

(defmethod print-object ((v 3dm.coalton:vec4) stream)
  (if *print-readably* (call-next-method)
      (format stream "(VEC4~{ ~A~})" (port-components v)))
  v)

(defmethod print-object ((v 3dm.coalton:quat) stream)
  (if *print-readably* (call-next-method)
      (format stream "(QUAT~{ ~A~})" (port-components v)))
  v)
