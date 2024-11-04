(in-package :3dm)

(defgeneric vx (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vy (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vz (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vw (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qx (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qy (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qz (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qw (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v= (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v/= (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v< (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v<= (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v> (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v>= (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vsqrdistance (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vdistance (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vsqrlength (v)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vlength (v)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vunit (v)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric v2norm (v)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric v. (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vc (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vangle (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v+ (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v- (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v* (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-v/ (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric marr (m)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mcol (m i)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric (setf mcol) (vec m i)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mrow (m i)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric (setf mrow) (vec m i)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-m* (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mdet (mat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric minv (mat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mlookat (eye target up)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vcopy (vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mcopy (mat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mtranspose (mat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric nmtranslate (mat4 vec3)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric nmscale (mat4 vec3)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric mrotate (mat4 vec3 angle)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric orthogonalize (u v)
  (:documentation "Given two different vectors, compute the vector orthogonal
to the first vector while still in the plane made by the first
vector and second vector, in the general direction of the second
vector.")
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric lerp (a b param)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qconjugate (q)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-q* (a b)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qrotation (vec3 theta)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-from-to (u-vec v-ish-vec)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric rotate-vector (vec3 quat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-x-axis (quat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-y-axis (quat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-z-axis (quat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric matrix-from-quaternion (quat)
  #+SBCL
  (:generic-function-class fast-generic-functions:fast-generic-function))
  


