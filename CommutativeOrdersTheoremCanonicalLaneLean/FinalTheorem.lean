import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

def ConstrainedCommutativeOrderClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_commutative_order_endgame (A : AdmissibleClass) :
    ConstrainedCommutativeOrderClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse