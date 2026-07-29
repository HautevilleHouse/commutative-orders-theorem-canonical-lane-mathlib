import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure PartialOrderPackage where
  carrier : Type u
  le : carrier → carrier → Prop
  le_refl : ∀ a : carrier, le a a
  le_trans : ∀ a b c : carrier, le a b → le b c → le a c
  le_antisymm : ∀ a b : carrier, le a b → le b a → a = b

structure PartialOrderEvidence (P : PartialOrderPackage) where
  le_refl_closed : P.le_refl
  le_trans_closed : P.le_trans
  le_antisymm_closed : P.le_antisymm

def PartialOrderClosed (P : PartialOrderPackage) : Prop :=
  P.le_refl ∧ P.le_trans ∧ P.le_antisymm

theorem partial_order_closed_from_evidence (P : PartialOrderPackage) (E : PartialOrderEvidence P) : PartialOrderClosed P := by
  exact And.intro E.le_refl_closed (And.intro E.le_trans_closed E.le_antisymm_closed)

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse