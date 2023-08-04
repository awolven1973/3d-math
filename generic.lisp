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

(defgeneric vsqrdistance (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric vdistance (a b)
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

(defgeneric mtranspose (mat)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric nmtranslate (mat4 vec3)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric nmscale (mat4 vec3)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric nmrotate (mat4 vec3 angle)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric orthogonalize (u v)
  (:documentation "Given two different vectors, compute the vector orthogonal
to the first vector while still in the plane made by the first
vector and second vector, in the general direction of the second
vector.")
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric lerp (a b param)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qconjugate (q)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric binary-q* (a b)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric qrotation (vec3 theta)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-from-to (u-vec v-ish-vec)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric rotate-vector (vec3 quat)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-x-axis (quat)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-y-axis (quat)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric quaternion-z-axis (quat)
  (:generic-function-class fast-generic-functions:fast-generic-function))

(defgeneric matrix-from-quaternion (quat)
  (:generic-function-class fast-generic-functions:fast-generic-function))
  


