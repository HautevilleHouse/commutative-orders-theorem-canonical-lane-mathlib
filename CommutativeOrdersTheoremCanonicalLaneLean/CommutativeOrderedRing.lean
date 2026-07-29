import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure CommutativeOrderedRing where
  carrier : Type u
  add : carrier → carrier → carrier
  zero : carrier
  mul : carrier → carrier → carrier
  one : carrier
  neg : carrier → carrier
  le : carrier → carrier → Prop
  ringAxioms : ∀ a b c : carrier, add (add a b) c = add a (add b c) ∧ add zero a = a ∧ add a zero = a ∧ add a (neg a) = zero ∧ add a b = add b a ∧ mul (mul a b) c = mul a (mul b c) ∧ mul one a = a ∧ mul a one = a ∧ mul a (add b c) = add (mul a b) (mul a c) ∧ mul (add a b) c = add (mul a c) (mul b c) ∧ mul a b = mul b a
  partialOrder : ∀ a : carrier, le a a ∧ (∀ b c : carrier, le a b → le b c → le a c) ∧ (∀ b : carrier, le a b → le b a → a = b)
  orderCompat : ∀ a b c : carrier, le a b → le (add a c) (add b c) ∧ (le zero a → le zero b → le zero (mul a b))

structure CommutativeOrderedRingEvidence (R : CommutativeOrderedRing) where
  ringAxiomsClosed : ∀ a b c : R.carrier, R.add (R.add a b) c = R.add a (R.add b c) ∧ R.add R.zero a = a ∧ R.add a R.zero = a ∧ R.add a (R.neg a) = R.zero ∧ R.add a b = R.add b a ∧ R.mul (R.mul a b) c = R.mul a (R.mul b c) ∧ R.mul R.one a = a ∧ R.mul a R.one = a ∧ R.mul a (R.add b c) = R.add (R.mul a b) (R.mul a c) ∧ R.mul (R.add a b) c = R.add (R.mul a c) (R.mul b c) ∧ R.mul a b = R.mul b a
  partialOrderClosed : ∀ a : R.carrier, R.le a a ∧ (∀ b c : R.carrier, R.le a b → R.le b c → R.le a c) ∧ (∀ b : R.carrier, R.le a b → R.le b a → a = b)
  orderCompatClosed : ∀ a b c : R.carrier, R.le a b → R.le (R.add a c) (R.add b c) ∧ (R.le R.zero a → R.le R.zero b → R.le R.zero (R.mul a b))

def CommutativeOrderedRingClosed (R : CommutativeOrderedRing) : Prop :=
  (∀ a b c : R.carrier, R.add (R.add a b) c = R.add a (R.add b c) ∧ R.add R.zero a = a ∧ R.add a R.zero = a ∧ R.add a (R.neg a) = R.zero ∧ R.add a b = R.add b a ∧ R.mul (R.mul a b) c = R.mul a (R.mul b c) ∧ R.mul R.one a = a ∧ R.mul a R.one = a ∧ R.mul a (R.add b c) = R.add (R.mul a b) (R.mul a c) ∧ R.mul (R.add a b) c = R.add (R.mul a c) (R.mul b c) ∧ R.mul a b = R.mul b a) ∧
  (∀ a : R.carrier, R.le a a ∧ (∀ b c : R.carrier, R.le a b → R.le b c → R.le a c) ∧ (∀ b : R.carrier, R.le a b → R.le b a → a = b)) ∧
  (∀ a b c : R.carrier, R.le a b → R.le (R.add a c) (R.add b c) ∧ (R.le R.zero a → R.le R.zero b → R.le R.zero (R.mul a b)))

theorem commutative_ordered_ring_closed_from_evidence (R : CommutativeOrderedRing)
    (E : CommutativeOrderedRingEvidence R) : CommutativeOrderedRingClosed R :=
  by
    exact And.intro E.ringAxiomsClosed
      (And.intro E.partialOrderClosed E.orderCompatClosed)

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse