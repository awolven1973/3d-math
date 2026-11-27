# Coalton port experiment

This branch is based on the working coalton-multiplication branch at 4728380f4c8c9cb1fff885ee69bca22817b4b9e7. The main ASDF system loads shared Coalton types, generic numerical algorithms, and a Common Lisp compatibility interface. The legacy implementation files are retained in git for comparison but are not loaded.

## Build and tests

Use a fresh Lisp image and remove stale FASLs or force a rebuild:

```lisp
(asdf:load-system :3d-math :force t)
(asdf:test-system "3d-math/port-tests")
(asdf:test-system "3d-math/coalton")
```

The first smoke suite exercises the Lisp-facing constructors, dispatch, mixed precision, exact rational inverse, quaternion rotation, rank-two arrays, and explicitly destructive transforms. The inherited Coalton suite checks the standalone multiplication interface. Neither has been executed in this environment.

## Representation and API

- Vec2/3/4, Mat2/3/4/N, Quat and DQuat are parameterized Coalton types with `(repr :lisp)`. Their classes are the CLOS specializers in both modes. No precision-specific structs are loaded. For example, migrate method specializers from `3dm.d:vec3` and `3dm.f:vec3` to `3dm.coalton:vec3`; consolidate duplicate methods. Old precision-specific type names are compatibility DEFTYPEs and are not class specializers.
- Precision-specific public and common private constructors forward to Coalton constructors after the original conversions: CLAMPF (unchanged source), COERCE to double-float, RATIONALIZE, or ROUND for fixnum. The public constructors and operation names remain in their original packages.
- Fixed matrices retain specialized column-major arrays on this first port, deliberately preserving MARR, WITH-FAST-MATREF and destructive NMTRANSLATE/NMSCALE/row/column setters. MatN uses row-major internal storage; its legacy MARR accessor packs a column-major copy. Field-based matrices are a subsequent experiment. Original explicit destructive operations are not removed. Other operations produce new values.
- Ordinary CLOS methods select an F32/F64/Fraction numerical root at the CL boundary. Mixed operands are converted to the common precision (double > single > rational); exact mixed comparisons use CL's numeric comparison. This is an intentionally simple runtime bridge, not an assertion of optimal allocation or dispatch. Fixnum-valued vectors and integer-valued Fraction vectors are indistinguishable at runtime; arithmetic currently uses Fraction for rational/integer values. Matrix storage may retain fixnum element type on construction.
- Numerical algorithms live in `coalton-numerics.lisp`: componentwise arithmetic, comparison, dot/cross, lengths, normalization, distances, interpolation, matrix multiplication, transpose, determinant, inverse, quaternion operations and transformations. Functions are polymorphic; concrete roots request monomorphization. Rational transcendental operations promote to floating point where needed. CLOS accessors, copying, variadic wrappers, boundary conversion, storage handling, and exact cross-type comparison remain CL.
- Matrix determinant/inverse uses expanded cofactors; quaternion rotation/matrix rotation and lookup use typed Coalton arithmetic. Exact floating-point evaluation order may differ. The port corrects some evident legacy anomalies (mat2 constructor, duplicate mcopy definitions, quaternion vector qw reader) rather than preserving their bugs. Validate these against downstream behavior.

## Known gaps

This is an uncompiled first experimental port, not a validated drop-in release. Existing private helper/macro names not in the compatibility files may be missing. Review direct uses of old struct internals, specializers, setters and compiler macros in dependent libraries. Complex/non-real rank-two numeric arrays are not currently supported by the new path. Precision-specific class identity, fixnum distinctions, bit-for-bit mixed-precision behavior, rational square roots, zero-length normalization, singular matrices and allocation performance need verification. The old private code and API remain available in the base branch for comparison. No changes to the multiplication branch or other repositories.
