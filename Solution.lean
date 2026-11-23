module

public import Mathlib
public import Diaz.Mirror.roy_rank_bound
public import Diaz.StrongSixExponentials

public section

/-!
# Proved solution

The proved counterparts of the declarations stated in `Challenge.lean`. Comparator checks that
each has the same name and type as its counterpart there and depends on no axiom beyond
`propext`, `Quot.sound` and `Classical.choice`. Each is the library theorem named beside it,
whose statement is the same up to unfolding the library's abbreviations.

* `StrongSixExponentials.strong_six_exponentials`: `Diaz.strongSixExponentials`
* `StrongSixExponentials.roy_rank_bound`: `Diaz.roy_rank_bound`
-/

namespace StrongSixExponentials

theorem strong_six_exponentials :
    ∀ (x : Fin 2 → ℂ) (y : Fin 3 → ℂ),
      LinearIndependent (↥(algebraicClosure ℚ ℂ).toSubfield) x →
      LinearIndependent (↥(algebraicClosure ℚ ℂ).toSubfield) y →
      ¬ (∀ i j, x i * y j ∈ Submodule.span (algebraicClosure ℚ ℂ).toSubfield
        (insert 1 {u : ℂ | IsAlgebraic ℚ (Complex.exp u)})) :=
  Diaz.strongSixExponentials

theorem roy_rank_bound {d l : ℕ} (M : Matrix (Fin d) (Fin l) ℂ)
    (hM : ∀ i j, M i j ∈ Submodule.span (algebraicClosure ℚ ℂ).toSubfield
      (insert 1 {u : ℂ | IsAlgebraic ℚ (Complex.exp u)}))
    (hd : 0 < d) :
    ∃ (d' l' : ℕ) (P : Matrix (Fin d) (Fin d) ℂ) (Q : Matrix (Fin l) (Fin l) ℂ),
      0 < d' ∧ d' ≤ d ∧ l' ≤ l ∧ IsUnit P.det ∧ IsUnit Q.det ∧
      (∀ i j, P i j ∈ (algebraicClosure ℚ ℂ).toSubfield) ∧
      (∀ i j, Q i j ∈ (algebraicClosure ℚ ℂ).toSubfield) ∧
      (∀ (i : Fin d) (j : Fin l), i.val < d' → l' ≤ j.val → (P * M * Q) i j = 0) ∧
      d * l' ≤ M.rank * (d' + l') :=
  Diaz.roy_rank_bound M hM hd

end StrongSixExponentials
