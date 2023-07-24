(in-package :3dm)

(3dm-def:defsealed qx ((quat 3dm.d::quat))
  (3dm.d::qx quat))

(3dm-def:defsealed qx ((quat 3dm.f::quat))
  (3dm.f::qx quat))

(3dm-def:defsealed qx ((quat 3dm.rat::quat))
  (3dm.rat::qx quat))

(3dm-def:defsealed qy ((quat 3dm.d::quat))
  (3dm.d::qy quat))

(3dm-def:defsealed qy ((quat 3dm.f::quat))
  (3dm.f::qy quat))

(3dm-def:defsealed qy ((quat 3dm.rat::quat))
  (3dm.rat::qy quat))

(3dm-def:defsealed qz ((quat 3dm.d::quat))
  (3dm.d::qz quat))

(3dm-def:defsealed qz ((quat 3dm.f::quat))
  (3dm.f::qz quat))

(3dm-def:defsealed qz ((quat 3dm.rat::quat))
  (3dm.rat::qz quat))

(3dm-def:defsealed qw ((quat 3dm.d::quat))
  (3dm.d::qw quat))

(3dm-def:defsealed qw ((quat 3dm.f::quat))
  (3dm.f::qw quat))

(3dm-def:defsealed qw ((quat 3dm.rat::quat))
  (3dm.rat::qw quat))
