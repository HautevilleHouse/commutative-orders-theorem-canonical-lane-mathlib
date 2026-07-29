import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure PartiallyOrderedMonoid where
  carrier : Type u
  mul : carrier → carrier → carrier
  one : carrier
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : carrier, mul one a = a
  mul_one : ∀ a : carrier, mul a one = a
  le : carrier → carrier → Prop
  le_refl : ∀ a : carrier, le a a
  le_trans : ∀ a b c : carrier, le a b → le b c → le a c
  le_antisymm : ∀ a b : carrier, le a b → le b a → a = b
  mul_le_mul : ∀ a b c d : carrier, le a b → le c d → le (mul a c) (mul b d)

structure PartiallyOrderedMonoidEvidence (M : PartiallyOrderedMonoid) where
  mul_assocClosed : ∀ a b c : M.carrier, M.mul (M.mul a b) c = M.mul a (M.mul b c)
  one_mulClosed : ∀ a : M.carrier, M.mul M.one a = a
  mul_oneClosed : ∀ a : M.carrier, M.mul a M.one = a
  le_reflClosed : ∀ a : M.carrier, M.le a a
  le_transClosed : ∀ a b c : M.carrier, M.le a b → M.le b c → M.le a c
  le_antisymmClosed : ∀ a b : M.carrier, M.le a b → M.le b a → a = b
  mul_le_mulClosed : ∀ a b c d : M.carrier, M.le a b → M.le c d → M.le (M.mul a c) (M.mul b d)

def PartiallyOrderedMonoidClosed (M : PartiallyOrderedMonoid) : Prop :=
  (∀ a b c : M.carrier, M.mul (M.mul a b) c = M.mul a (M.mul b c)) ∧
  (∀ a : M.carrier, M.mul M.one a = a) ∧
  (∀ a : M.carrier, M.mul a M.one = a) ∧
  (∀ a : M.carrier, M.le a a) ∧
  (∀ a b c : M.carrier, M.le a b → M.le b c → M.le a c) ∧
  (∀ a b : M.carrier, M.le a b → M.le b a → a = b) ∧
  (∀ a b c d : M.carrier, M.le a b → M.le c d → M.le (M.mul a c) (M.mul b d))

theorem partially_ordered_monoid_closed_from_evidence (M : PartiallyOrderedMonoid)
    (E : PartiallyOrderedMonoidEvidence M) : PartiallyOrderedMonoidClosed M :=
  by
    exact And.intro E.mul_assocClosed
      (And.intro E.one_mulClosed
        (And.intro E.mul_oneClosed
          (And.intro E.le_reflClosed
            (And.intro E.le_transClosed
              (And.intro E.le_antisymmClosed E.mul_le_mulClosed)))))

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse