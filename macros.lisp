(in-package :3dm-def)

(defmacro defsetf* (name args values &body body)
  #-(or ccl abcl ecl)
  `(defsetf ,name ,args ,values ,@body)
  #+(or ccl abcl ecl) ;; Compiler bug workarounds, hooray.
  (let ((args (loop for arg in args
                    until (eql arg '&environment)
                    collect arg))
        (env (loop for arg = (pop args)
                   while arg
                   do (when (eql arg '&environment)
                        (return (pop args))))))
    `(defsetf ,name ,args ,values
       ,@(if env
             `((let (,env)
                 ,@body))
             body))))

(defun ensure-float-param (val env type)
  (if (constantp val env)
      (typecase val
        (real (coerce val type))
        (T `(load-time-value (coerce ,val ,type))))
      `(locally (declare (optimize (speed 1))) (coerce ,val ',type))))

#+NIL
(defmacro define-vecx-accessor (name rel type)
  `(progn
     (declaim (inline ,name))
     (declaim (ftype (function (,(intern "VEC" :3dm)) ,type) ,name))
     (defun ,name (3dm::vec) (,rel 3dm::vec))
     (defsetf* ,name (3dm::vec &environment 3dm::env) (3dm::value)
       `(setf (,',rel 3dm::vec) ,(ensure-float-param 3dm::value 3dm::env ',type)))))

(defmacro define-vec2-type (element-type)
  `(progn
     (declaim (inline ,(intern "%VEC2" *package*)))
     (defstruct (,(intern "VEC2" *package*) (:conc-name NIL)
	       (:constructor ,(intern "%VEC2" *package*) (,(intern "VX2" *package*) ,(intern "VY2" *package*)))
	       (:copier ,(intern "VCOPY2" *package*))
	       (:predicate ,(intern "VEC2-P" *package*)))
     (,(intern "VX2" *package*) (coerce 0 ',element-type) :type ,element-type)
     (,(intern "VY2" *package*) (coerce 0 ',element-type) :type ,element-type))))

(defmacro define-vec2-constructor (element-type)
  `(progn
     (declaim (inline ,(intern "VEC2" *package*)))
     (declaim (ftype (function (real real) ,(intern "VEC2" *package*)) ,(intern "VEC2" *package*)))
     (define-ofun ,(intern "VEC2" *package*) (3dm::x 3dm::y)
       (,(intern "%VEC2" *package*) (coerce 3dm::x ',element-type) (coerce 3dm::y ',element-type)))
     (define-compiler-macro ,(intern "VEC2" *package*) (&environment 3dm::env 3dm::x 3dm::y)
       `(,(intern "%VEC2" *package*)
	 ,(ensure-float-param 3dm::x 3dm::env ',element-type)
	 ,(ensure-float-param 3dm::y 3dm::env ',element-type)))))


(defmacro define-vec3-type (element-type)
  `(progn
     (declaim (inline ,(intern "%VEC3" *package*)))
     (defstruct (,(intern "VEC3" *package*) (:conc-name NIL)
		 (:constructor ,(intern "%VEC3" *package*)
		     (,(intern "VX3" *package*) ,(intern "VY3" *package*) ,(intern "VZ3" *package*)))
		 (:copier ,(intern "VCOPY3" *package*))
		 (:predicate ,(intern "VEC3-P" *package*)))
       (,(intern "VX3" *package*) (coerce 0 ',element-type) :type ,element-type)
       (,(intern "VY3" *package*) (coerce 0 ',element-type) :type ,element-type)
       (,(intern "VZ3" *package*) (coerce 0 ',element-type) :type ,element-type))))

(defmacro define-vec3-constructor (element-type)
  `(progn
     (declaim (inline ,(intern "VEC3" *package*)))
     (declaim (ftype (function (real real real) ,(intern "VEC3" *package*)) ,(intern "VEC3" *package*)))
     (define-ofun ,(intern "VEC3" *package*) (3dm::x 3dm::y 3dm::z)
       (,(intern "%VEC3" *package*)
	(coerce 3dm::x ',element-type)
	(coerce 3dm::y ',element-type)
	(coerce 3dm::z ',element-type)))     
     (define-compiler-macro ,(intern "VEC3" *package*) (&environment 3dm::env 3dm::x 3dm::y 3dm::z)
       `(,(intern "%VEC3" *package*)
	 ,(ensure-float-param 3dm::x 3dm::env ',element-type)
	 ,(ensure-float-param 3dm::y 3dm::env ',element-type)
	 ,(ensure-float-param 3dm::z 3dm::env ',element-type)))))

(defmacro define-vec4-type (element-type)
  `(progn
     (declaim (inline ,(intern "%VEC4" *package*)))
     (defstruct (,(intern "VEC4" *package*) (:conc-name NIL)
		 (:constructor ,(intern "%VEC4" *package*)
		     (,(intern "VX4" *package*) ,(intern "VY4" *package*)
		      ,(intern "VZ4" *package*) ,(intern "VW4" *package*)))
		 (:copier ,(intern "VCOPY4" *package*))
		 (:predicate ,(intern "VEC4-P" *package*)))
       (,(intern "VX4" *package*) (coerce 0 ',element-type) :type ,element-type)
       (,(intern "VY4" *package*) (coerce 0 ',element-type) :type ,element-type)
       (,(intern "VZ4" *package*) (coerce 0 ',element-type) :type ,element-type)
       (,(intern "VW4" *package*) (coerce 0 ',element-type) :type ,element-type))))

(defmacro define-vec4-constructor (element-type)
  `(progn
     (declaim (inline ,(intern "VEC4" *package*)))
     (declaim (ftype (function (real real real real) ,(intern "VEC4" *package*))
		     ,(intern "VEC4" *package*)))
     (define-ofun ,(intern "VEC4" *package*) (3dm::x 3dm::y 3dm::z 3dm::w)
       (,(intern "%VEC4" *package*)
	(coerce 3dm::x ',element-type)
	(coerce 3dm::y ',element-type)
	(coerce 3dm::z ',element-type)
	(coerce 3dm::w ',element-type)))
     
     (define-compiler-macro ,(intern "VEC4" *package*) (&environment 3dm::env 3dm::x 3dm::y 3dm::z 3dm::w)
       `(,(intern "%VEC4" *package*)
	 ,(ensure-float-param 3dm::x 3dm::env ',element-type)
	 ,(ensure-float-param 3dm::y 3dm::env ',element-type)
	 ,(ensure-float-param 3dm::z 3dm::env ',element-type)
	 ,(ensure-float-param 3dm::w 3dm::env ',element-type)))))

(defmacro %mka (&environment env size type &key (element 0) contents (coercion `#'(lambda (item)
										    (coerce item ',type))))
  (let ((arr (gensym "ARRAY")))
    `(let ((,arr (make-array ,size :element-type ',type
                                   :initial-element ,(ensure-float-param element env type))))
       ,(if contents
            `(map-into ,arr ,coercion ,contents)
            arr))))

(defmacro %proper-array (size elements type)
  `(etypecase ,elements
     (null (%mka ,size ,type))
     (real (%mka ,size ,type :element ,elements))
     (sequence (%mka ,size ,type :contents ,elements))))

(defun %proper-array-form (size elements type)
  (let ((el (gensym "ELEMENTS")))
    (cond ((null elements)
           `(%mka ,size ,type))
          ((numberp elements)
           `(%mka ,size ,type :element ,elements))
          ((or (typep elements 'vector)
               (and (typep elements 'list)
                    (eql (first elements) 'quote)
                    (listp (second elements))))
           `(%mka ,size ,type :contents (load-time-value
					 (map 'list #'(lambda (elt)
							(coerce elt ',type)) ,elements))
			      :coercion #'identity))
          ;; There's other cases but we can't really catch them because typep is not
          ;; actually useful. Ah well, this will have to be good enough for most.
          (T
           `(let ((,el ,elements))
              (%proper-array ,size ,el ,type))))))

(defmacro define-mat2-type (element-type)
  `(progn
     (declaim (inline ,(intern "%MAT2" *package*)))
     (defstruct (,(intern "MAT2" *package*) (:conc-name NIL)
                 (:constructor ,(intern "%MAT2" *package*) (,(intern "MARR2" *package*)))
                 (:copier NIL)
                 (:predicate ,(intern "MAT2-P" *package*)))
       (,(intern "MARR2" *package*) NIL :type (simple-array ,element-type (4))))))

(defmacro define-mat2-constructor (element-type)
  `(progn
     (declaim (ftype (function (&optional T) ,(intern "MAT2" *package*))
		     ,(intern "MAT2" *package*)))
     (define-ofun ,(intern "MAT2" *package*) (&optional 3dm::elements)
       (,(intern "%MAT2" *package*) (%proper-array 4 3dm::elements ,element-type)))
     (define-compiler-macro ,(intern "MAT2" *package*)
	 (&whole 3dm::whole &environment 3dm::env &optional 3dm::elements)
       (cond ((constantp 3dm::elements 3dm::env)
	      `(,(intern "%MAT2" *package*) ,(%proper-array-form 4 3dm::elements ',element-type)))
	     (T 3dm::whole)))))

(defmacro define-mat3-type (element-type)
  `(progn
     (declaim (inline ,(intern "%MAT3" *package*)))
     (defstruct (,(intern "MAT3" *package*) (:conc-name NIL)
		 (:constructor ,(intern "%MAT3" *package*) (,(intern "MARR3" *package*)))
		 (:copier NIL)
		 (:predicate ,(intern "MAT3-P" *package*)))
       (,(intern "MARR3" *package*) NIL :type (simple-array ,element-type (9))))))

(defmacro define-mat3-constructor (element-type)
  `(progn
     (declaim (ftype (function (&optional T) ,(intern "MAT3" *package*))
		     ,(intern "MAT3" *package*)))

     (define-ofun ,(intern "MAT3" *package*) (&optional 3dm::elements)
       (,(intern "%MAT3" *package*) (%proper-array 9 3dm::elements ,element-type)))
     (define-compiler-macro ,(intern "MAT3" *package*) (&whole 3dm::whole
							       &environment 3dm::env
							       &optional 3dm::elements)
       (cond ((constantp 3dm::elements 3dm::env)
              `(,(intern "%MAT3" *package*) ,(%proper-array-form 9 3dm::elements ',element-type)))
             (T 3dm::whole)))))

(defmacro define-mat4-type (element-type)
  `(progn
     (declaim (inline ,(intern "%MAT4" *package*)))
     (defstruct (,(intern "MAT4" *package*) (:conc-name NIL)
		      (:constructor ,(intern "%MAT4" *package*) (,(intern "MARR4" *package*)))
		      (:copier NIL)
		      (:predicate ,(intern "MAT4-P" *package*)))
       (,(intern "MARR4" *package*) NIL :type (simple-array ,element-type (16))))))

(defmacro define-mat4-constructor (element-type)
  `(progn
     (declaim (ftype (function (&optional T) ,(intern "MAT4" *package*))
		     ,(intern "MAT4" *package*)))
     (define-ofun ,(intern "MAT4" *package*) (&optional 3dm::elements)
       (,(intern "%MAT4" *package*) (%proper-array 16 3dm::elements ,element-type)))

     (define-compiler-macro ,(intern "MAT4" *package*)
	 (&whole 3dm::whole &environment 3dm::env &optional 3dm::elements)
       (cond ((constantp 3dm::elements 3dm::env)
              `(,(intern "%MAT4" *package*) ,(%proper-array-form 16 3dm::elements ',element-type)))
             (T 3dm::whole)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *matrix-limit* (min (floor (sqrt array-dimension-limit))
                              (floor (sqrt most-positive-fixnum)))))

(deftype mat-dim ()
  '(integer 0 #.(1- *matrix-limit*)))

(defstruct (3dm::%matn)
  (3dm::rows NIL :type mat-dim)
  (3dm::cols NIL :type mat-dim))  

(defmacro define-matn-type (element-type)
  `(defstruct (,(intern "MATN" *package*) (:conc-name NIL)
	       (:include 3dm::%matn)
	       (:constructor ,(intern "%MATN" *package*) (3dm::rows 3dm::cols ,(intern "MARRN" *package*)))
	       (:copier NIL)
	       (:predicate ,(intern "MATN-P" *package*)))
     (,(intern "MARRN" *package*) NIL :type (simple-array ,element-type))))

(defmacro define-matn-constructor (element-type)
  `(progn
     (define-ofun ,(intern "MATN" *package*) (3dm::r 3dm::c &optional 3dm::elements)
       (check-type 3dm::r mat-dim)
       (check-type 3dm::c mat-dim)
       (let ((arr (%proper-array (* 3dm::r 3dm::c) 3dm::elements ,element-type)))
	 (if (= 3dm::r 3dm::c)
             (case 3dm::r
               (2 (,(intern "%MAT2" *package*) arr))
               (3 (,(intern "%MAT3" *package*) arr))
               (4 (,(intern "%MAT4" *package*) arr))
               (T (,(intern "%MATN" *package*) 3dm::r 3dm::r arr)))
             (,(intern "%MATN" *package*) 3dm::r 3dm::c arr))))

     (define-compiler-macro ,(intern "MATN" *package*)
	 (&whole 3dm::whole &environment 3dm::env 3dm::r 3dm::c &optional 3dm::elements)
       (cond ((constantp 3dm::elements 3dm::env)
              (let ((arr (gensym "ARR")) (rows (gensym "ROWS")) (cols (gensym "COLS")))
		`(let ((,arr ,(%proper-array-form `(* ,3dm::c ,3dm::r) 3dm::elements ',element-type))
                       (,rows ,3dm::r) (,cols ,3dm::c))
		   (if (= ,rows ,cols)
                       (case ,rows
			 (2 (,(intern "%MAT2" *package*) ,arr))
			 (3 (,(intern "%MAT3" *package*) ,arr))
			 (4 (,(intern "%MAT4" *package*) ,arr))
			 (T (,(intern "%MATN" *package*) ,rows ,rows ,arr)))
                       (,(intern "%MATN" *package*) ,rows ,cols ,arr)))))
             (T 3dm::whole)))))

(defmacro define-quat-type (element-type)
  `(progn
     (declaim (inline, (intern "%QUAT" *package*)))
     (defstruct (,(intern "QUAT" *package*) (:conc-name NIL)
                 (:include ,(intern "VEC3" *package*))
                 (:constructor ,(intern "%QUAT" *package*)
		     (,(intern "VX3" *package*) ,(intern "VY3" *package*)
		      ,(intern "VZ3" *package*) 3dm::qw))
                 (:copier ,(intern "QCOPY" *package*))
                 (:predicate ,(intern "QUAT-P" *package*)))
       (,(intern "QW" *package*) (coerce 1 ',element-type) :type ,element-type))))

(defmacro define-dquat-type ()
  `(defstruct (,(intern "DQUAT" *package*) (:conc-name NIL)
	       (:constructor ,(intern "%DQUAT" *package*) (3dm::qreal 3dm::qdual))
	       (:copier ,(intern "DQCOPY" *package*))
	       (:predicate dquat-p))
     (3dm::qreal (,(intern "QUAT" *package*)) :type ,(intern "QUAT" *package*))
     (3dm::qdual (,(intern "QUAT" *package*)) :type ,(intern "QUAT" *package*))))

(defmacro defsealed (name lambda-list &body body)
  `(progn
     (defmethod ,name ,lambda-list
       ,@body)
     (fast-generic-functions:seal-domain #',name ',(mapcar #'(lambda (arg)
							       (if (second arg)
								   (second arg)
								   t)) lambda-list))))

(defmacro define-with-vec2-macro (element-type)
  `(defmacro ,(intern "WITH-VEC2" *package*) ((3dm::x 3dm::y) 3dm::val &body 3dm::body)
     (let ((valvar (gensym "VAL")))
       `(let ((,valvar ,3dm::val)
	      (,3dm::x ,'(load-time-value (coerce 0 ',element-type)))
	      (,3dm::y ,'(load-time-value (coerce 0 ',element-type))))
	  ,'(declare (type ,element-type 3dm::x 3dm::y))
	  (etypecase ,valvar
            (real (let ((,valvar ,'(coerce valvar ',element-type)))
                    ,'(declare (type ,element-type valvar))
                    (setf ,3dm::x ,valvar ,3dm::y ,valvar)))
            (,(intern "VEC2" *package*) (setf ,3dm::x (,(intern "VX2" *package*) ,valvar) ,3dm::y (,(intern "VY2" *package*) ,valvar))))
	  ,@3dm::body))))

(defmacro define-with-vec3-macro (element-type)
  `(defmacro ,(intern "WITH-VEC3" *package*) ((3dm::x 3dm::y 3dm::z) 3dm::val &body 3dm::body)
  (let ((valvar (gensym "VAL")))
    `(let ((,valvar ,3dm::val)
	   (,3dm::x ,'(load-time-value (coerce 0 ',element-type)))
	   (,3dm::y ,'(load-time-value (coerce 0 ',element-type)))
	   (,3dm::z ,'(load-time-value (coerce 0 ',element-type))))
       ,'(declare (type ,element-type 3dm::x 3dm::y 3dm::z))
       (etypecase ,valvar
         (real (let ((,valvar ,'(coerce valvar ',element-type)))
                 ,'(declare (type ,element-type valvar))
                 (setf ,3dm::x ,valvar ,3dm::y ,valvar ,3dm::z ,valvar)))
         (,(intern "VEC3" *package*) (setf ,3dm::x (,(intern "VX3" *package*) ,valvar)
					   ,3dm::y (,(intern "VY3" *package*) ,valvar)
					   ,3dm::z (,(intern "VZ3" *package*) ,valvar))))
       ,@3dm::body))))

(defmacro define-with-vec4-macro (element-type)
  `(defmacro ,(intern "WITH-VEC4" *package*) ((3dm::x 3dm::y 3dm::z 3dm::w) 3dm::val &body 3dm::body)
     (let ((valvar (gensym "VAL")))
       `(let ((,valvar ,3dm::val)
	      (,3dm::x ,'(load-time-value (coerce 0 ',element-type)))
	      (,3dm::y ,'(load-time-value (coerce 0 ',element-type)))
	      (,3dm::z ,'(load-time-value (coerce 0 ',element-type)))
	      (,3dm::w ,'(load-time-value (coerce 0 ',element-type))))
	  ,'(declare (type ,element-type 3dm::x 3dm::y 3dm::z 3dm::w))
	  (etypecase ,valvar
            (real (let ((,valvar ,'(coerce valvar ',element-type)))
                    ,'(declare (type ,element-type valvar))
                    (setf ,3dm::x ,valvar ,3dm::y ,valvar ,3dm::z ,valvar ,3dm::w ,valvar)))
            (,(intern "VEC4" *package*) (setf ,3dm::x (,(intern "VX4" *package*) ,valvar)
					      ,3dm::y (,(intern "VY4" *package*) ,valvar)
					      ,3dm::z (,(intern "VZ4" *package*) ,valvar)
					      ,3dm::w (,(intern "VW4" *package*) ,valvar))))
	  ,@3dm::body))))

(defmacro define-with-vec-macro (element-type)
  `(defmacro ,(intern "WITH-VEC" *package*) ((3dm::x 3dm::y &optional (3dm::z (gensym "Z")) (3dm::w (gensym "W"))) 3dm::val &body 3dm::body)
  (let ((valvar (gensym "VAL")))
    `(let ((,valvar ,3dm::val)
	   (,3dm::x ,'(load-time-value (coerce 0 ',element-type)))
	   (,3dm::y ,'(load-time-value (coerce 0 ',element-type)))
	   (,3dm::z ,'(load-time-value (coerce 0 ',element-type)))
	   (,3dm::w ,'(load-time-value (coerce 0 ',element-type))))
       ,'(declare (type ,element-type 3dm::x 3dm::y 3dm::z 3dm::w)
	  (ignorable 3dm::z 3dm::w))
       (etypecase ,valvar
         (real (let ((,valvar ,'(coerce valvar ',element-type)))
                 ,'(declare (type ,element-type valvar))
                 (setf ,3dm::x ,valvar ,3dm::y ,valvar ,3dm::z ,valvar ,3dm::w ,valvar)))
         (,(intern "VEC2" *package*) (setf ,3dm::x (,(intern "VX2" *package*) ,valvar)
					   ,3dm::y (,(intern "VY2" *package*) ,valvar)))
         (,(intern "VEC3" *package*) (setf ,3dm::x (,(intern "VX3" *package*) ,valvar)
					   ,3dm::y (,(intern "VY3" *package*) ,valvar)
					   ,3dm::z (,(intern "VZ3" *package*) ,valvar)))
         (,(intern "VEC4" *package*) (setf ,3dm::x (,(intern "VX4" *package*) ,valvar)
					   ,3dm::y (,(intern "VY4" *package*) ,valvar)
					   ,3dm::z (,(intern "VZ4" *package*) ,valvar)
					   ,3dm::w (,(intern "VW4" *package*) ,valvar))))
       ,@3dm::body))))

(defmacro define-binary-op-macro (element-type pkg a-pkg b-pkg)
  `(defmacro ,(intern "BINARY-OP" pkg) (3dm::a 3dm::b 3dm::combination 3dm::v2red &optional (3dm::v3red 3dm::v2red) (3dm::v4red 3dm::v2red))
     (let ((v2red (if (listp 3dm::v2red) 3dm::v2red (list 3dm::v2red)))
           (v3red (if (listp 3dm::v3red) 3dm::v3red (list 3dm::v3red)))
           (v4red (if (listp 3dm::v4red) 3dm::v4red (list 3dm::v4red)))
           (ag (gensym "A")) (bg (gensym "B")))
       `(etypecase ,3dm::a
	  (real (let ((,ag ,'(coerce 3dm::a ',element-type)))
		  (etypecase ,3dm::b
                    (,(intern "VEC4" ,b-pkg) (,@v4red (,3dm::combination ,ag (,(intern "VX4" ,b-pkg) ,3dm::b))
						     (,3dm::combination ,ag (,(intern "VY4" ,b-pkg) ,3dm::b))
						     (,3dm::combination ,ag (,(intern "VZ4" ,b-pkg) ,3dm::b))
						     (,3dm::combination ,ag (,(intern "VW4" ,b-pkg) ,3dm::b))))
                    (,(intern "VEC3" ,b-pkg) (,@v3red (,3dm::combination ,ag (,(intern "VX3" ,b-pkg) ,3dm::b))
						     (,3dm::combination ,ag (,(intern "VY3" ,b-pkg) ,3dm::b))
						     (,3dm::combination ,ag (,(intern "VZ3" ,b-pkg) ,3dm::b))))
                    (,(intern "VEC2" ,b-pkg) (,@v2red (,3dm::combination ,ag (,(intern "VX2" ,b-pkg) ,3dm::b))
						     (,3dm::combination ,ag (,(intern "VY2" ,b-pkg) ,3dm::b)))))))
	  (,(intern "VEC4" ,a-pkg) (etypecase ,3dm::b
				    (real (let ((,bg ,'(coerce 3dm::b ',element-type)))
					    (,@v4red (,3dm::combination (,(intern "VX4" ,a-pkg) ,3dm::a) ,bg)
						     (,3dm::combination (,(intern "VY4" ,a-pkg) ,3dm::a) ,bg)
						     (,3dm::combination (,(intern "VZ4" ,a-pkg) ,3dm::a) ,bg)
						     (,3dm::combination (,(intern "VW4" ,a-pkg) ,3dm::a) ,bg))))
				    (,(intern "VEC4" ,b-pkg) (,@v4red (,3dm::combination (,(intern "VX4" ,a-pkg) ,3dm::a) (,(intern "VX4" ,b-pkg) ,3dm::b))
								     (,3dm::combination (,(intern "VY4" ,a-pkg) ,3dm::a) (,(intern "VY4" ,b-pkg) ,3dm::b))
								     (,3dm::combination (,(intern "VZ4" ,a-pkg) ,3dm::a) (,(intern "VZ4" ,b-pkg) ,3dm::b))
								     (,3dm::combination (,(intern "VW4" ,a-pkg) ,3dm::a) (,(intern "VW4" ,b-pkg) ,3dm::b))))))
	  (,(intern "VEC3" ,a-pkg) (etypecase ,3dm::b
				    (real (let ((,bg ,'(coerce 3dm::b ',element-type)))
					    (,@v3red (,3dm::combination (,(intern "VX3" ,a-pkg) ,3dm::a) ,bg)
						     (,3dm::combination (,(intern "VY3" ,a-pkg) ,3dm::a) ,bg)
						     (,3dm::combination (,(intern "VZ3" ,a-pkg) ,3dm::a) ,bg))))
				    (,(intern "VEC3" ,b-pkg) (,@v3red (,3dm::combination (,(intern "VX3" ,a-pkg) ,3dm::a) (,(intern "VX3" ,b-pkg) ,3dm::b))
								     (,3dm::combination (,(intern "VY3" ,a-pkg) ,3dm::a) (,(intern "VY3" ,b-pkg) ,3dm::b))
								     (,3dm::combination (,(intern "VZ3" ,a-pkg) ,3dm::a) (,(intern "VZ3" ,b-pkg) ,3dm::b))))))
	  (,(intern "VEC2" ,a-pkg) (etypecase ,3dm::b
				    (real (let ((,bg ,'(coerce 3dm::b ',element-type)))
					    (,@v2red (,3dm::combination (,(intern "VX2" ,a-pkg) ,3dm::a) ,bg)
						     (,3dm::combination (,(intern "VY2" ,a-pkg) ,3dm::a) ,bg))))
				    (,(intern "VEC2" ,b-pkg) (,@v2red (,3dm::combination (,(intern "VX2" ,a-pkg) ,3dm::a) (,(intern "VX2" ,b-pkg) ,3dm::b))
								     (,3dm::combination (,(intern "VY2" ,a-pkg) ,3dm::a) (,(intern "VY2" ,b-pkg) ,3dm::b))))))))))

(defmacro define-ofun (3dm::name 3dm::args &body 3dm::body)
  `(progn
     #+sbcl (declaim (sb-ext:maybe-inline ,3dm::name))
     (defun ,3dm::name ,3dm::args
       (declare (optimize (compilation-speed 0) (debug 1) (safety 1) speed))
       ,@3dm::body)))


(defmacro define-define-veccomp-macro (pkg a-pkg b-pkg)
  `(defmacro ,(intern "DEFINE-VECCOMP" pkg) (3dm::name 3dm::op &optional (3dm::bundle 'and))
     (let ((2vec-name (intern (concatenate 'string "BINARY-" (symbol-name 3dm::name)) ,pkg)))
       `(progn
	  (declaim (ftype (function ((or ,(intern "VEC" ,a-pkg) real) (or ,(intern "VEC" ,b-pkg) real)) boolean) ,2vec-name))
	  (declaim (inline ,2vec-name))
	  (define-ofun ,2vec-name (3dm::a 3dm::b)
            (,(intern "BINARY-OP" ,pkg) 3dm::a 3dm::b ,3dm::op ,3dm::bundle ,3dm::bundle ,3dm::bundle))))))






(defmacro define-vsqrdistance-function (element-type)
  `(progn
     (declaim (inline ,(intern "VSQRDISTANCE" *package*)))
     (declaim (ftype (function (,(intern "VEC" *package*) ,(intern "VEC" *package*))
			       (,element-type ,(coerce 0 element-type)))
		     ,(intern "VSQRDISTANCE" *package*)))
     (define-ofun ,(intern "VSQRDISTANCE" *package*) (3dm::a 3dm::b)
       (etypecase 3dm::a
	 (,(intern "VEC2" *package*)
	  (etypecase 3dm::b
	    (,(intern "VEC2" *package*)
	     (+ (expt (- (,(intern "VX2" *package*) 3dm::a)
			 (,(intern "VX2" *package*) 3dm::b)) 2)
		(expt (- (,(intern "VY2" *package*) 3dm::a)
			 (,(intern "VY2" *package*) 3dm::b)) 2)))))
	 (,(intern "VEC3" *package*)
	  (etypecase 3dm::b
	    (,(intern "VEC3" *package*)
	     (+ (expt (- (,(intern "VX3" *package*) 3dm::a)
			 (,(intern "VX3" *package*) 3dm::b)) 2)
		(expt (- (,(intern "VY3" *package*) 3dm::a)
			 (,(intern "VY3" *package*) 3dm::b)) 2)
		(expt (- (,(intern "VZ3" *package*) 3dm::a)
			 (,(intern "VZ3" *package*) 3dm::b)) 2)))))
	 (,(intern "VEC4" *package*)
	  (etypecase 3dm::b
            (,(intern "VEC4" *package*)
	     (+ (expt (- (,(intern "VX4" *package*) 3dm::a)
			 (,(intern "VX4" *package*) 3dm::b)) 2)
		(expt (- (,(intern "VY4" *package*) 3dm::a)
			 (,(intern "VY4" *package*) 3dm::b)) 2)
		(expt (- (,(intern "VZ4" *package*) 3dm::a)
			 (,(intern "VZ4" *package*) 3dm::b)) 2)
		(expt (- (,(intern "VW4" *package*) 3dm::a)
			 (,(intern "VW4" *package*) 3dm::b)) 2)))))))))

(defmacro mycoerce (number type)
  `(ecase ,type
    (cl:single-float (coerce ,number 'cl:single-float))
    (cl:double-float (coerce ,number 'cl:double-float))
    (cl:rational (rationalize ,number))))

(defmacro define-vdistance-function (element-type)
  `(progn
     (declaim (inline ,(intern "VDISTANCE" *package*)))
     (declaim (ftype (function (,(intern "VEC" *package*) ,(intern "VEC" *package*))
			       (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VDISTANCE" *package*)))
     (define-ofun ,(intern "VDISTANCE" *package*) (3dm::a 3dm::b)
       (sqrt (,(intern "VSQRDISTANCE" *package*) 3dm::a 3dm::b)))))

(defmacro define-vec2-vsqrlength-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC2-VSQRLENGTH" *package*)))
     (declaim (ftype (function (,(intern "VEC2" *package*)) (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC2-VSQRLENGTH" *package*)))
     (define-ofun ,(intern "VEC2-VSQRLENGTH" *package*) (3dm::v)
       (+ (expt (,(intern "VX2" *package*) 3dm::v) 2)
	  (expt (,(intern "VY2" *package*) 3dm::v) 2)))))

(defmacro define-vec3-vsqrlength-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC3-VSQRLENGTH" *package*)))
     (declaim (ftype (function (,(intern "VEC3" *package*)) (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC3-VSQRLENGTH" *package*)))
     (define-ofun ,(intern "VEC3-VSQRLENGTH" *package*) (3dm::v)
       (+ (expt (,(intern "VX3" *package*) 3dm::v) 2)
	  (expt (,(intern "VY3" *package*) 3dm::v) 2)
	  (expt (,(intern "VZ3" *package*) 3dm::v) 2)))))

(defmacro define-vec4-vsqrlength-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC4-VSQRLENGTH" *package*)))
     (declaim (ftype (function (,(intern "VEC4" *package*)) (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC4-VSQRLENGTH" *package*)))
     (define-ofun ,(intern "VEC4-VSQRLENGTH" *package*) (3dm::v)
       (+ (expt (,(intern "VX4" *package*) 3dm::v) 2)
	  (expt (,(intern "VY4" *package*) 3dm::v) 2)
	  (expt (,(intern "VZ4" *package*) 3dm::v) 2)
	  (expt (,(intern "VW4" *package*) 3dm::v) 2)))))

(defmacro define-vec2-vlength-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC2-VLENGTH" *package*)))
     (declaim (ftype (function (,(intern "VEC2" *package*))
			       (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC2-VLENGTH" *package*)))
     (define-ofun ,(intern "VEC2-VLENGTH" *package*) (3dm::v)
       (sqrt (,(intern "VEC2-VSQRLENGTH" *package*) 3dm::v)))))

(defmacro define-vec3-vlength-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC3-VLENGTH" *package*)))
     (declaim (ftype (function (,(intern "VEC3" *package*))
			       (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC3-VLENGTH" *package*)))
     (define-ofun ,(intern "VEC3-VLENGTH" *package*) (3dm::v)
       (sqrt (,(intern "VEC3-VSQRLENGTH" *package*) 3dm::v)))))

(defmacro define-vec4-vlength-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC4-VLENGTH" *package*)))
     (declaim (ftype (function (,(intern "VEC4" *package*))
			       (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC4-VLENGTH" *package*)))
     (define-ofun ,(intern "VEC4-VLENGTH" *package*) (3dm::v)
       (sqrt (,(intern "VEC4-VSQRLENGTH" *package*) 3dm::v)))))

(defmacro define-vec2-v2norm-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC2-V2NORM" *package*)))
     (declaim (ftype (function (,(intern "VEC2" *package*))
			       (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC2-V2NORM" *package*)))
     (define-ofun ,(intern "VEC2-V2NORM" *package*) (3dm::v)
       (sqrt (+ (expt (,(intern "VX2" *package*) 3dm::v) 2)
		(expt (,(intern "VY2" *package*) 3dm::v) 2))))))

(defmacro define-vec3-v2norm-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC3-V2NORM" *package*)))
     (declaim (ftype (function (,(intern "VEC3" *package*))
			       (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC3-V2NORM" *package*)))
     (define-ofun ,(intern "VEC3-V2NORM" *package*) (3dm::v)
       (sqrt (+ (expt (,(intern "VX3" *package*) 3dm::v) 2)
		(expt (,(intern "VY3" *package*) 3dm::v) 2)
		(expt (,(intern "VZ3" *package*) 3dm::v) 2))))))

(defmacro define-vec4-v2norm-function (element-type)
  `(progn
     (declaim (inline ,(intern "VEC4-V2NORM" *package*)))
     (declaim (ftype (function (,(intern "VEC4" *package*))
			       (,element-type ,(mycoerce 0 element-type)))
		     ,(intern "VEC4-V2NORM" *package*)))
     (define-ofun ,(intern "VEC4-V2NORM" *package*) (3dm::v)
       (sqrt (+ (expt (,(intern "VX4" *package*) 3dm::v) 2)
		(expt (,(intern "VY4" *package*) 3dm::v) 2)
		(expt (,(intern "VZ4" *package*) 3dm::v) 2)
		(expt (,(intern "VW4" *package*) 3dm::v) 2))))))

