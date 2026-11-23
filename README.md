# Roy's strong six exponentials theorem and Roy's rank bound for matrices of logarithms

A Lean 4 and Mathlib proof of roy's strong six exponentials theorem, prepared for the [Palomar
registry](https://palomar-registry.org/). It is a self-contained extract of the library
[carlok/diaz-modulus-lean](https://github.com/carlok/diaz-modulus-lean), which is the canonical
home of the proofs.

## Results

- `StrongSixExponentials.strong_six_exponentials`: **Roy's strong six exponentials theorem**
  (Roy 1992, Corollary 2; Waldschmidt 2000, Corollary 11.16). If `x₁, x₂` and `y₁, y₂, y₃` are
  each linearly independent over the algebraic numbers `Q̄`, then one of the six products `xᵢ yⱼ`
  lies outside `ℒ̃`, the `Q̄`-span of `1` and the logarithms of algebraic numbers. Source: Roy
  1992, Corollary 2; Waldschmidt 2000, Corollary 11.16, via Theorem 11.21.
- `StrongSixExponentials.roy_rank_bound`: **Roy's rank bound** (Roy 1992, Corollary 1;
  Waldschmidt 2000, Theorem 12.20 and Corollary 12.21). For a `d × l` matrix `M` with entries in
  `ℒ̃`, there are invertible algebraic matrices `P`, `Q` and sizes `0 < d' ≤ d`, `l' ≤ l` such
  that `PMQ` has a zero `d' × (l − l')` block and `d l' ≤ rank(M) (d' + l')`. Source: Roy 1992,
  Corollary 1; Waldschmidt 2000, Theorem 12.20 and Corollary 12.21.

## Layout

- `Challenge.lean`: the statements, with deliberate `sorry`, importing Mathlib only.
- `Solution.lean`: the same statements, proved by the library theorems.
- `Diaz/`: the 120 library modules the proofs need, copied from diaz-modulus-lean at
  `465147a3ec8b` and changed only for the Lean module system (`module`, `public import`,
  `@[expose] public section`). Paths and namespaces are the library's.
- `comparator.json`, `formalization.yaml`: the Palomar submission metadata.

## Build

```bash
lake exe cache get && lake build
```

Lean 4.36.0, Mathlib v4.36.0. `scripts/verify-comparator.sh` runs the toolchain's
`lake comparator` the way Palomar does.

## Related

- The six exponentials theorem from the same library is registered separately as
  [PALOMAR-2026-11-22-000020](https://palomar-registry.org/entry?id=PALOMAR-2026-11-22-000020&version=1).
- Submissions go to https://submit.palomar-registry.org/.

## Authorship

Claude agents (Anthropic) wrote the Lean statements and proofs under Carlo Perassi's direction;
see `formalization.yaml` and the library's `docs/method.md`. Licence: Apache-2.0.
