import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure PartiallyOrderedGroup where
  carrier : Type u
  mul : carrier → carrier → carrier
  inv : carrier → carrier
  one : carrier
  mulAssoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : carrier, mul one a = a
  mulInv : ∀ a : carrier, mul a (inv a) = one
  mulComm : ∀ a b : carrier, mul a b = mul b a
  le : carrier → carrier → Prop
  le_refl : ∀ a : carrier, le a a
  le_trans : ∀ a b c : carrier, le a b → le b c → le a c
  le_antisymm : ∀ a b : carrier, le a b → le b a → a = b
  mul_le_mul : ∀ a b c d : carrier, le a b → le c d → le (mul a c) (mul b d)

structure PartiallyOrderedGroupEvidence (G : PartiallyOrderedGroup) where
  mulAssocClosed : G.mulAssoc
  oneMulClosed : G.oneMul
  mulInvClosed : G.mulInv
  mulCommClosed : G.mulComm
  le_reflClosed : G.le_refl
  le_transClosed : G.le_trans
  le_antisymmClosed : G.le_antisymm
  mul_le_mulClosed : G.mul_le_mul

def PartiallyOrderedGroupClosed (G : PartiallyOrderedGroup) : Prop :=
  G.mulAssoc ∧ G.oneMul ∧ G.mulInv ∧ G.mulComm ∧ G.le_refl ∧ G.le_trans ∧ G.le_antisymm ∧ G.mul_le_mul

theorem partially_ordered_group_closed_from_evidence (G : PartiallyOrderedGroup)
    (E : PartiallyOrderedGroupEvidence G) : PartiallyOrderedGroupClosed G := by
  exact And.intro E.mulAssocClosed (And.intro E.oneMulClosed (And.intro E.mulInvClosed
    (And.intro E.mulCommClosed (And.intro E.le_reflClosed (And.intro E.le_transClosed
      (And.intro E.le_antisymmClosed E.mul_le_mulClosed))))))

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse