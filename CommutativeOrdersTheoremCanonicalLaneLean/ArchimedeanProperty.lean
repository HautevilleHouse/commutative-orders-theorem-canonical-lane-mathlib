import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure ArchimedeanOrderedMonoid where
  carrier : Type u
  add : carrier → carrier → carrier
  zero : carrier
  le : carrier → carrier → Prop
  monoidAxioms : ∀ a b c : carrier, add (add a b) c = add a (add b c) ∧ add zero a = a ∧ add a zero = a ∧ add a b = add b a
  partialOrder : ∀ a : carrier, le a a ∧ (∀ b c : carrier, le a b → le b c → le a c) ∧ (∀ b : carrier, le a b → le b a → a = b)
  archimedean : ∀ a b : carrier, le zero a → le zero b → (∃ n : ℕ, le b (add a (add a (⋯ (n times) ⋯)))) → le a zero ∨ le b zero

-- We define a more formal version using iteration

structure ArchimedeanOrderedMonoidEvidence (M : ArchimedeanOrderedMonoid) where
  monoidAxiomsClosed : ∀ a b c : M.carrier, M.add (M.add a b) c = M.add a (M.add b c) ∧ M.add M.zero a = a ∧ M.add a M.zero = a ∧ M.add a b = M.add b a
  partialOrderClosed : ∀ a : M.carrier, M.le a a ∧ (∀ b c : M.carrier, M.le a b → M.le b c → M.le a c) ∧ (∀ b : M.carrier, M.le a b → M.le b a → a = b)
  archimedeanClosed : ∀ a b : M.carrier, M.le M.zero a → M.le M.zero b → (∃ n : ℕ, M.le b (Nat.iterate (λ x => M.add a x) n M.zero)) → M.le a M.zero ∨ M.le b M.zero

def ArchimedeanOrderedMonoidClosed (M : ArchimedeanOrderedMonoid) : Prop :=
  (∀ a b c : M.carrier, M.add (M.add a b) c = M.add a (M.add b c) ∧ M.add M.zero a = a ∧ M.add a M.zero = a ∧ M.add a b = M.add b a) ∧
  (∀ a : M.carrier, M.le a a ∧ (∀ b c : M.carrier, M.le a b → M.le b c → M.le a c) ∧ (∀ b : M.carrier, M.le a b → M.le b a → a = b)) ∧
  (∀ a b : M.carrier, M.le M.zero a → M.le M.zero b → (∃ n : ℕ, M.le b (Nat.iterate (λ x => M.add a x) n M.zero)) → M.le a M.zero ∨ M.le b M.zero)

theorem archimedean_ordered_monoid_closed_from_evidence (M : ArchimedeanOrderedMonoid)
    (E : ArchimedeanOrderedMonoidEvidence M) : ArchimedeanOrderedMonoidClosed M :=
  by
    exact And.intro E.monoidAxiomsClosed
      (And.intro E.partialOrderClosed E.archimedeanClosed)

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse