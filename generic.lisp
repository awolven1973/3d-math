(in-package :3dm)

(defgeneric vx (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vy (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vz (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vw (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qx (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qy (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qz (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qw (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v= (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v/= (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v< (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v<= (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v> (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v>= (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vsqrlength (v)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vlength (v)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vunit (v)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric v2norm (v)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric v. (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vc (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vangle (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v+ (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v- (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v* (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v/ (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric marr (m)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mcol (m i)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric (setf mcol) (vec m i)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mrow (m i)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric (setf mrow) (vec m i)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-m* (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mdet (mat)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric minv (mat)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mlookat (eye target up)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vcopy (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mcopy (mat)
  (:generic-function-class fast-generic-functions:fast-generic-function))
