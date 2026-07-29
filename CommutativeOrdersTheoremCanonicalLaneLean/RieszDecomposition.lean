import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CommutativeOrdersTheoremCanonicalLaneLean.OrderedAbelianGroup

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

/-!
# Riesz Decomposition Package

Encodes the Riesz decomposition property for ordered abelian groups:
if 0 ≤ x ≤ y + z with y,z ≥ 0, then x = y' + z' with 0 ≤ y' ≤ y and 0 ≤ z' ≤ z.
-/

structure RieszDecompositionProperty {C : CommutativeOrderSet}
    (G : OrderedAbelianGroup C) where
  decomposes : ∀ x y z, C.le G.zero x → C.le x (G.add y z) →
    C.le G.zero y → C.le G.zero z →
    ∃ y' z', C.le G.zero y' ∧ C.le y' y ∧ C.le G.zero z' ∧ C.le z' z ∧
      G.add y' z' = x

structure RieszDecompositionEvidence {C : CommutativeOrderSet}
    {G : OrderedAbelianGroup C} (R : RieszDecompositionProperty G) where
  decomposes_closed : R.decomposes

def RieszDecompositionClosed {C : CommutativeOrderSet}
    {G : OrderedAbelianGroup C} (R : RieszDecompositionProperty G) : Prop :=
  R.decomposes

theorem riesz_decomposition_closed_from_evidence {C : CommutativeOrderSet}
    {G : OrderedAbelianGroup C} (R : RieszDecompositionProperty G)
    (E : RieszDecompositionEvidence R) : RieszDecompositionClosed R :=
  E.decomposes_closed

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse