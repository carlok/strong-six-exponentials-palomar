module

public import Mathlib

public section

/-!
# Roy's strong six exponentials theorem and Roy's rank bound for matrices of logarithms

The statements below are the results this repository registers. Each is stated with Mathlib's
own notions and nothing defined here; each `sorry` is deliberate, and `Solution.lean` proves
the same statement from the library under `Diaz/`.

## `StrongSixExponentials.strong_six_exponentials`

**Roy's strong six exponentials theorem** (Roy 1992, Corollary 2; Waldschmidt 2000, Corollary
11.16). If `x₁, x₂` and `y₁, y₂, y₃` are each linearly independent over the algebraic numbers
`Q̄`, then one of the six products `xᵢ yⱼ` lies outside `ℒ̃`, the `Q̄`-span of `1` and the
logarithms of algebraic numbers.

* `(algebraicClosure ℚ ℂ).toSubfield` is `Q̄`, the algebraic numbers as a subfield of `ℂ`.
* `Submodule.span Q̄ (insert 1 {u | IsAlgebraic ℚ (exp u)})` is `ℒ̃`.
* The statement is unconditional: no hypothesis stands in for the multiplicity estimate.
* Source: Roy 1992, Corollary 2; Waldschmidt 2000, Corollary 11.16, via Theorem 11.21.

## `StrongSixExponentials.roy_rank_bound`

**Roy's rank bound** (Roy 1992, Corollary 1; Waldschmidt 2000, Theorem 12.20 and Corollary
12.21). For a `d × l` matrix `M` with entries in `ℒ̃`, there are invertible algebraic matrices
`P`, `Q` and sizes `0 < d' ≤ d`, `l' ≤ l` such that `PMQ` has a zero `d' × (l − l')` block and
`d l' ≤ rank(M) (d' + l')`.

* The zero block is the entries `(P * M * Q) i j` with `i < d'` and `j ≥ l'`.
* `M.rank` is Mathlib's rank over `ℂ`; `P`, `Q` have entries in `Q̄` and unit determinant.
* Source: Roy 1992, Corollary 1; Waldschmidt 2000, Theorem 12.20 and Corollary 12.21.
-/

namespace StrongSixExponentials

/-- **Roy's strong six exponentials theorem** (Roy 1992, Corollary 2; Waldschmidt 2000, Corollary
11.16). If `x₁, x₂` and `y₁, y₂, y₃` are each linearly independent over the algebraic numbers
`Q̄`, then one of the six products `xᵢ yⱼ` lies outside `ℒ̃`, the `Q̄`-span of `1` and the
logarithms of algebraic numbers. -/
theorem strong_six_exponentials :
    ∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ),
      LinearIndependent (↥(algebraicClosure ℚ ℂ).toSubfield) x →
      LinearIndependent (↥(algebraicClosure ℚ ℂ).toSubfield) y →
      ¬ (∀ i j, x i * y j ∈ Submodule.span (algebraicClosure ℚ ℂ).toSubfield
        (insert 1 {u : ℂ | IsAlgebraic ℚ (Complex.exp u)})) := by
  sorry

/-- **Roy's rank bound** (Roy 1992, Corollary 1; Waldschmidt 2000, Theorem 12.20 and Corollary
12.21). For a `d × l` matrix `M` with entries in `ℒ̃`, there are invertible algebraic matrices
`P`, `Q` and sizes `0 < d' ≤ d`, `l' ≤ l` such that `PMQ` has a zero `d' × (l − l')` block and
`d l' ≤ rank(M) (d' + l')`. -/
theorem roy_rank_bound {d l : ℕ} (M : Matrix (Fin d) (Fin l) ℂ)
    (hM : ∀ i j, M i j ∈ Submodule.span (algebraicClosure ℚ ℂ).toSubfield
      (insert 1 {u : ℂ | IsAlgebraic ℚ (Complex.exp u)}))
    (hd : 0 < d) :
    ∃ (d' l' : ℕ) (P : Matrix (Fin d) (Fin d) ℂ) (Q : Matrix (Fin l) (Fin l) ℂ),
      0 < d' ∧ d' ≤ d ∧ l' ≤ l ∧ IsUnit P.det ∧ IsUnit Q.det ∧
      (∀ i j, P i j ∈ (algebraicClosure ℚ ℂ).toSubfield) ∧
      (∀ i j, Q i j ∈ (algebraicClosure ℚ ℂ).toSubfield) ∧
      (∀ (i : Fin d) (j : Fin l), i.val < d' → l' ≤ j.val → (P * M * Q) i j = 0) ∧
      d * l' ≤ M.rank * (d' + l') := by
  sorry

end StrongSixExponentials
