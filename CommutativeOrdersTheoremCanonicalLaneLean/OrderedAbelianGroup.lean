import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CommutativeOrdersTheoremCanonicalLaneLean.CommutativeOrderStructure

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

/-!
# Ordered Abelian Group Package

Extends the commutative order structure with group operations: identity,
inverses, and compatibility with the order.
-/

structure OrderedAbelianGroup (C : CommutativeOrderSet) where
  zero : C.carrier
  add : C.carrier → C.carrier → C.carrier
  neg : C.carrier → C.carrier
  add_assoc : ∀ a b c, add (add a b) c = add a (add b c)
  add_comm : ∀ a b, add a b = add b a
  add_zero : ∀ a, add a zero = a
  add_left_neg : ∀ a, add (neg a) a = zero
  add_mono : ∀ a b c, C.le a b → C.le (add a c) (add b c)

structure OrderedAbelianGroupEvidence {C : CommutativeOrderSet}
    (G : OrderedAbelianGroup C) where
  add_assoc_closed : G.add_assoc
  add_comm_closed : G.add_comm
  add_zero_closed : G.add_zero
  add_left_neg_closed : G.add_left_neg
  add_mono_closed : G.add_mono

def OrderedAbelianGroupClosed {C : CommutativeOrderSet}
    (G : OrderedAbelianGroup C) : Prop :=
  G.add_assoc ∧ G.add_comm ∧ G.add_zero ∧ G.add_left_neg ∧ G.add_mono

theorem ordered_abelian_group_closed_from_evidence {C : CommutativeOrderSet}
    (G : OrderedAbelianGroup C) (E : OrderedAbelianGroupEvidence G) :
    OrderedAbelianGroupClosed G := by
  exact And.intro E.add_assoc_closed
    (And.intro E.add_comm_closed
      (And.intro E.add_zero_closed
        (And.intro E.add_left_neg_closed E.add_mono_closed)))

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse