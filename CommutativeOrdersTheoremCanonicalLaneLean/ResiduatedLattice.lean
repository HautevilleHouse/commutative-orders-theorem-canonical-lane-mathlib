import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure ResiduatedLatticePackage where
  carrier : Type u
  le : carrier → carrier → Prop
  top : carrier
  bot : carrier
  sup : carrier → carrier → carrier
  inf : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  one : carrier
  residual : carrier → carrier → carrier
  poset : PartialOrderPackage carrier le
  lattice : LatticePackage carrier le top bot sup inf
  monoid : CommutativeMonoidPackage carrier mul one
  residuation : ∀ a b c : carrier, le (mul a b) c ↔ le a (residual b c)
  
structure ResiduatedLatticeEvidence (R : ResiduatedLatticePackage) where
  poset_closed : PartialOrderClosed R.poset
  lattice_closed : LatticeClosed R.lattice
  monoid_closed : CommutativeMonoidClosed R.monoid
  residuation_closed : R.residuation

def ResiduatedLatticeClosed (R : ResiduatedLatticePackage) : Prop :=
  PartialOrderClosed R.poset ∧ LatticeClosed R.lattice ∧ CommutativeMonoidClosed R.monoid ∧ R.residuation

theorem residuated_lattice_closed_from_evidence (R : ResiduatedLatticePackage) (E : ResiduatedLatticeEvidence R) : ResiduatedLatticeClosed R := by
  exact And.intro E.poset_closed (And.intro E.lattice_closed (And.intro E.monoid_closed E.residuation_closed))

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse