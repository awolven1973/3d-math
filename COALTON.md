# Pure Coalton multiplication experiment

This is an independent numerical library expressed in Coalton. The original 3d-math sources remain unchanged. The optional system depends on Coalton, not on the original CL implementation. No handwritten CL numerical code or `lisp` expressions are used.

```lisp
(asdf:load-system "3d-math/coalton")
(coalton:coalton
  (3dm.coalton:m*
    (3dm.coalton:make-mat2 1d0 2d0 3d0 4d0)
    (3dm.coalton:Vec2 5d0 7d0)))
;; Vec2 with values 19d0 and 43d0

(asdf:test-system "3d-math/coalton")
```

## Representation and dispatch

- `Vec2`, `Vec3`, `Vec4` are parametric algebraic data types. Their scalar fields may be boxed; no claim is made that polymorphic ADT fields have the same layout as the original specialized CL structs.
- `Mat2`, `Mat3`, `Mat4` are Coalton-defined nominal types holding `coalton/lisparray:LispArray` values. This standard library abstraction supports specialized arrays (including F32/F64 where the host supports them), with dedicated specialized make, aref and set! functions. Fixed matrices retain the original column-major layout and row-major constructor argument order. The raw data constructors are not exported.
- `MatN` is a Coalton-defined rectangular matrix with runtime dimensions and row-major storage, replacing the original rank-two CL array operand. `make-matn` accepts a list in row-major order and validates the length. Dimensions must have a product representable as UFix and supported by the host's array limits.
- `ScalarProduct` uses a functional dependency to determine the result scalar from the two operand types. Concrete same-type instances for F32, F64, Fraction, IFix and Integer, together with two mixed F32/F64 instances, avoid a functional-dependency solver failure on nonlinear instance heads in the tested Coalton version. Mixed precision promotes to F64 before multiplication. The multiplication algorithms remain generic over ScalarProduct. Fraction/Fraction operations are exact and never convert to a float. Mixed Fraction/float multiplication is intentionally not defined; callers must choose an explicit conversion policy.
- `Multipliable` uses another functional dependency to infer the result matrix/vector type. Same-size multiplication is unrolled, with shared dot2/dot3/dot4 functions. Rectangular multiplication uses typed loops. Vector-times-matrix deliberately means matrix-times-column-vector, as in original 3d-math. Additional mixed-precision and Mat3 matrix-matrix combinations become available through the generic instances.
- `m*` is binary, with static dispatch. Write `(m* (m* a b) c)` for heterogeneous chains rather than a CL variadic rest list. This is a deliberate idiomatic Coalton interface change, not a drop-in CL API replacement.

Tests cover all four float precision combinations and exact Fraction arithmetic for fixed matrix-matrix, matrix-vector and vector-matrix products at every size, rectangular products, empty inner dimension, chaining, and coordinate indexing. Fraction tests include signed values, nontrivial denominators, and exact cancellation of integers beyond floating-point precision. Expected results are calculated independently from integer-valued fixtures rather than invoking original CL methods. This is a readability and language-design experiment; disassembly and allocation measurements are still required to evaluate representation specialization, dictionary elimination, and performance against the original CL baseline.

The code uses the current Coalton APIs documented in [define-type](https://github.com/coalton-lang/coalton/blob/main/docs/manual/site/operators/define-type.md), [define-class](https://github.com/coalton-lang/coalton/blob/main/docs/manual/site/operators/define-class.md), [define-instance](https://github.com/coalton-lang/coalton/blob/main/docs/manual/site/operators/define-instance.md), and [LispArray](https://github.com/coalton-lang/coalton/blob/main/library/lisparray.ct). The user has successfully loaded the integrated branch; numerical and performance validation remains in progress.

## Exact rational multiplication

`Fraction` implements both `Num` and `RuntimeRepr` in Coalton, so the concrete Fraction `ScalarProduct` instance and generic `Multipliable` instances support exact arithmetic. Construct fractional values with `coalton/math/fraction:mkFraction` (two Integer arguments). `LispArray Fraction` uses the host's representation of `rational`, subject to its array element type upgrading rules; no unboxed rational storage is assumed.

```lisp
(coalton:coalton
  (3dm.coalton:m*
    (3dm.coalton:make-mat2
      (coalton/math/fraction:mkFraction 1 2)
      (coalton/math/fraction:mkFraction 1 3)
      (coalton/math/fraction:mkFraction 2 3)
      (coalton/math/fraction:mkFraction 3 4))
    (3dm.coalton:Vec2
      (coalton/math/fraction:mkFraction 2 1)
      (coalton/math/fraction:mkFraction 3 1))))
;; Vec2 Fraction: 2 and 43/12
```

## Original CLOS dispatch with Coalton-generated method bodies

The branch now also integrates the typed arithmetic with the original Common Lisp system. Loading `3d-math` depends on the pure Coalton system and compiles the same sealed `binary-m*` methods; their fixed-size bodies use `coalton-matrix-matrix` or `coalton-matrix-vector`. The five homogeneous/mixed float and rational array paths use `coalton-simple-array-multiply`. General numeric arrays retain the original fallback, and private KRMA-specific multiplication macros remain unchanged. Original CL matrix/vector representations, variadic API, compiler macro, and dispatch signatures are preserved. No conversion to Coalton matrix values occurs.

`coalton-method-kernels.lisp` defines concrete inline `(monomorphize)` entry points for the shared pure Coalton dot products and multiply-accumulate operations. The method macros emit ordinary Common Lisp calls to those concrete, unconstrained Coalton functions, with explicit host CL scalar type annotations. This preserves lexical bindings and local macros in the calling environment instead of sending gensyms through Coalton's expression reader. Coalton's `(inline)` attribute emits a CL inline proclamation, allowing the host compiler to inline the already specialized arithmetic. Actual generated code, dictionary elimination and boxing must be verified, not presumed. The pure Coalton system remains independently loadable. A new Lisp image is needed because the original methods are sealed.

This integration adds Coalton as a dependency of the branch's main system. The integrated branch loaded successfully before the lexical bridge fix; the revised bridge requires a fresh compilation and runtime testing. The source changes intentionally retain the original fixed-size dispatch coverage and general-array fallback rather than adding new CLOS methods for every combination possible in the pure Coalton API.
