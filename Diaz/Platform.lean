/-
# Platform vocabulary not otherwise present in the library

The Prove2Me mission preamble names two propositions differently from, or in addition
to, the library. Mirrored proofs are stated in the platform's names, so they are
supplied here. `HermiteLindemann` is definitionally the library's
`HermiteLindemannProp`, so the two are interchangeable.
-/
-- Origin: `Diaz/Platform.lean` in https://github.com/carlok/diaz-modulus-lean at 59d5a598c292
-- (Apache-2.0), unchanged except for what the Lean module system needs.
module

public import Mathlib
public import Diaz.Multipliers
public import Diaz.SFE
public import Diaz.HermiteLindemann

@[expose] public section

open scoped Cardinal

namespace Diaz

/-- The platform's name for `HermiteLindemannProp`. -/
abbrev HermiteLindemann : Prop := HermiteLindemannProp

/-- **Schanuel's conjecture**, as the platform states it. -/
def SchanuelConjecture : Prop :=
  ∀ (n : ℕ) (x : Fin n → ℂ), LinearIndependent ℚ x →
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i => Complex.exp (x i))))

end Diaz
