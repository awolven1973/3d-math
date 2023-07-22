(in-package :3dm)

(defgeneric vx (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vy (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vz (vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vw (vec)
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
