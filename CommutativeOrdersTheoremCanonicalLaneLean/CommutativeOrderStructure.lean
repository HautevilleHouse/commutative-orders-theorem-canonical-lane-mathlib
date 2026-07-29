import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

/-!
# Commutative Order Structure Package

Defines the basic structure of a commutative order: a set with a transitive,
reflexive, antisymmetric, and commutative binary operation that respects the order.
-/

structure CommutativeOrderSet where
  carrier : Type u
  le : carrier → carrier → Prop
  mul : carrier → carrier → carrier
  le_refl : ∀ a, le a a
  le_trans : ∀ a b c, le a b → le b c → le a c
  le_antisymm : ∀ a b, le a b → le b a → a = b
  mul_comm : ∀ a b, mul a b = mul b a
  mul_mono : ∀ a b c, le a b → le (mul a c) (mul b c)

structure CommutativeOrderEvidence (C : CommutativeOrderSet) where
  le_refl_closed : C.le_refl
  le_trans_closed : C.le_trans
  le_antisymm_closed : C.le_antisymm
  mul_comm_closed : C.mul_comm
  mul_mono_closed : C.mul_mono

def CommutativeOrderClosed (C : CommutativeOrderSet) : Prop :=
  C.le_refl ∧ C.le_trans ∧ C.le_antisymm ∧ C.mul_comm ∧ C.mul_mono

theorem commutative_order_closed_from_evidence (C : CommutativeOrderSet)
    (E : CommutativeOrderEvidence C) : CommutativeOrderClosed C := by
  exact And.intro E.le_refl_closed
    (And.intro E.le_trans_closed
      (And.intro E.le_antisymm_closed
        (And.intro E.mul_comm_closed E.mul_mono_closed)))

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse