# Experimental Coalton matrix multiplication

This branch adds an optional ASDF system. The base 3d-math system and its sealed methods, compiler macro, and private KRMA helpers remain unchanged. No changes to upstream or PR are made here.

```lisp
(asdf:load-system "3d-math/coalton")
(3dm.coalton:m* (3dm.d:mat4) (3dm.d:mat4))
(asdf:test-system "3d-math/coalton")
(asdf:load-system "3d-math/coalton/tests")
(3dm.coalton:benchmark)
```

Use a current Coalton checkout with the F32/F64, UFix, native-representation and functional-dependency interfaces documented in the [manual](https://coalton-lang.github.io/manual/). Coalton and 3d-math's existing dependencies must be discoverable by ASDF. For speed comparisons use COALTON_ENV=release and ensure no development-mode cached Coalton FASLs are used.

## Design

- Coalton `Multipliable :left :right :result (:left :right -> :result)` maps operand types to result type. It has one instance per existing fixed-size sealed binary-m* method (27 instances); fixed-size arithmetic is expressed in Coalton with shared Num-constrained dot2/dot3/dot4 and explicit F32-to-F64 widening. Existing column-major matrices and vector structs are mapped by repr :native. CL bridges perform access, allocation and stores only. No new representation or copies of input matrices/vectors.
- Both orders of matrix/vector arguments preserve the original matrix-times-column-vector behavior. Existing unsupported fixed-size precision combinations are not silently extended. Floating point array products (all four precision pairs) use typed Coalton accumulation and traversal; non-float/general arrays use the original CL implementation, as do other existing or downstream methods. Specialized private KRMA clamping helpers are untouched.
- The CL-facing 3dm.coalton:m* uses a separate generic function, a left fold and compiler macro. Original 3dm:m* remains usable for A/B comparisons, and no sealed method is overwritten. Statically typed Coalton code can call 3dm.coalton.kernel:multiply for fixed-size operands. The CL adapter invokes unconstrained typed entry points after CLOS dispatch or array checks. Those entry points assume the declared native type contract.
- Tests cover every existing fixed-size signature, signed/nonsymmetric values, nonmutation, result representation, mixed precision, argument order, rectangular/empty arrays, incompatible dimensions and chained calls. The legacy mat2 constructor writes e01 twice; fixtures use native storage directly and do not change that preexisting issue.
- Benchmarks are preliminary, not a claim of improved performance. The baseline uses fast-generic-functions sealed methods, the experimental CL wrapper ordinary CLOS dispatch. Compare direct typed entry points as well, inspect disassembly, and measure allocation before deciding whether to integrate the Coalton methods into original sealed dispatch. Array recursion needs testing on the target compiler, including large dimensions.

This is an uncompiled first implementation: the repository editing environment does not provide a configured SBCL/Coalton runtime. Run ASDF tests before using the experimental code in production. Coalton API version compatibility, compiler acceptance and numerical/runtime equivalence have not yet been established.
