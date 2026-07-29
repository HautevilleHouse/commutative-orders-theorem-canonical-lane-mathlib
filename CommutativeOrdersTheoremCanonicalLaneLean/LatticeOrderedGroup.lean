import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure LatticeOrderedGroup where
  carrier : Type u
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier
  le : carrier → carrier → Prop
  sup : carrier → carrier → carrier
  inf : carrier → carrier → carrier
  groupAxioms : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c) ∧ mul one a = a ∧ mul a one = a ∧ mul a (inv a) = one ∧ mul (inv a) a = one
  partialOrder : ∀ a : carrier, le a a ∧ (∀ b c : carrier, le a b → le b c → le a c) ∧ (∀ b : carrier, le a b → le b a → a = b)
  latticeOps : ∀ a b : carrier, le a (sup a b) ∧ le b (sup a b) ∧ le (inf a b) a ∧ le (inf a b) b ∧ (∀ c : carrier, le a c → le b c → le (sup a b) c) ∧ (∀ c : carrier, le c a → le c b → le c (inf a b))
  mulCompatibility : ∀ a b c d : carrier, le a b → le c d → le (mul a c) (mul b d)

structure LatticeOrderedGroupEvidence (G : LatticeOrderedGroup) where
  groupAxiomsClosed : ∀ a b c : G.carrier, G.mul (G.mul a b) c = G.mul a (G.mul b c) ∧ G.mul G.one a = a ∧ G.mul a G.one = a ∧ G.mul a (G.inv a) = G.one ∧ G.mul (G.inv a) a = G.one
  partialOrderClosed : ∀ a : G.carrier, G.le a a ∧ (∀ b c : G.carrier, G.le a b → G.le b c → G.le a c) ∧ (∀ b : G.carrier, G.le a b → G.le b a → a = b)
  latticeOpsClosed : ∀ a b : G.carrier, G.le a (G.sup a b) ∧ G.le b (G.sup a b) ∧ G.le (G.inf a b) a ∧ G.le (G.inf a b) b ∧ (∀ c : G.carrier, G.le a c → G.le b c → G.le (G.sup a b) c) ∧ (∀ c : G.carrier, G.le c a → G.le c b → G.le c (G.inf a b))
  mulCompatibilityClosed : ∀ a b c d : G.carrier, G.le a b → G.le c d → G.le (G.mul a c) (G.mul b d)

def LatticeOrderedGroupClosed (G : LatticeOrderedGroup) : Prop :=
  (∀ a b c : G.carrier, G.mul (G.mul a b) c = G.mul a (G.mul b c) ∧ G.mul G.one a = a ∧ G.mul a G.one = a ∧ G.mul a (G.inv a) = G.one ∧ G.mul (G.inv a) a = G.one) ∧
  (∀ a : G.carrier, G.le a a ∧ (∀ b c : G.carrier, G.le a b → G.le b c → G.le a c) ∧ (∀ b : G.carrier, G.le a b → G.le b a → a = b)) ∧
  (∀ a b : G.carrier, G.le a (G.sup a b) ∧ G.le b (G.sup a b) ∧ G.le (G.inf a b) a ∧ G.le (G.inf a b) b ∧ (∀ c : G.carrier, G.le a c → G.le b c → G.le (G.sup a b) c) ∧ (∀ c : G.carrier, G.le c a → G.le c b → G.le c (G.inf a b))) ∧
  (∀ a b c d : G.carrier, G.le a b → G.le c d → G.le (G.mul a c) (G.mul b d))

theorem lattice_ordered_group_closed_from_evidence (G : LatticeOrderedGroup)
    (E : LatticeOrderedGroupEvidence G) : LatticeOrderedGroupClosed G :=
  by
    exact And.intro E.groupAxiomsClosed
      (And.intro E.partialOrderClosed
        (And.intro E.latticeOpsClosed E.mulCompatibilityClosed))

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse