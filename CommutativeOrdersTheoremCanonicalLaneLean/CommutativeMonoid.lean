import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure CommutativeMonoidPackage where
  carrier : Type u
  mul : carrier → carrier → carrier
  one : carrier
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : carrier, mul one a = a
  mul_one : ∀ a : carrier, mul a one = a
  mul_comm : ∀ a b : carrier, mul a b = mul b a

structure CommutativeMonoidEvidence (M : CommutativeMonoidPackage) where
  mul_assoc_closed : M.mul_assoc
  one_mul_closed : M.one_mul
  mul_one_closed : M.mul_one
  mul_comm_closed : M.mul_comm

def CommutativeMonoidClosed (M : CommutativeMonoidPackage) : Prop :=
  M.mul_assoc ∧ M.one_mul ∧ M.mul_one ∧ M.mul_comm

theorem commutative_monoid_closed_from_evidence (M : CommutativeMonoidPackage) (E : CommutativeMonoidEvidence M) : CommutativeMonoidClosed M := by
  exact And.intro E.mul_assoc_closed (And.intro E.one_mul_closed (And.intro E.mul_one_closed E.mul_comm_closed))

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse