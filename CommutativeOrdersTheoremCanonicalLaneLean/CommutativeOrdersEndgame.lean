import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CommutativeOrdersTheoremCanonicalLaneLean.LatticeOrderedGroup
import HautevilleHouse.CommutativeOrdersTheoremCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CommutativeOrdersTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

def ConstrainedCommutativeOrdersClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_commutative_orders_endgame (A : AdmissibleClass) :
    ConstrainedCommutativeOrdersClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse