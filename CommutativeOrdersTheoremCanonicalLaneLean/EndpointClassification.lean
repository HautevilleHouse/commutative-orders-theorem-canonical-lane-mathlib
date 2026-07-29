import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure EndpointClassificationPackage {G : PartiallyOrderedGroup}
    (E : ExtensionPackage G) where
  totalOrderConstructed : Prop
  strongOrderConstructed : Prop
  uniqueness : Prop

structure EndpointClassificationEvidence {G : PartiallyOrderedGroup}
    {E : ExtensionPackage G} (Epkg : EndpointClassificationPackage E) where
  totalOrderConstructedClosed : Epkg.totalOrderConstructed
  strongOrderConstructedClosed : Epkg.strongOrderConstructed
  uniquenessClosed : Epkg.uniqueness

def EndpointClassificationClosed {G : PartiallyOrderedGroup}
    {E : ExtensionPackage G} (Epkg : EndpointClassificationPackage E) : Prop :=
  Epkg.totalOrderConstructed ∧ Epkg.strongOrderConstructed ∧ Epkg.uniqueness

theorem endpoint_classification_closed_from_evidence
    {G : PartiallyOrderedGroup} {E : ExtensionPackage G}
    (Epkg : EndpointClassificationPackage E) (Ev : EndpointClassificationEvidence Epkg) :
    EndpointClassificationClosed Epkg := by
  exact And.intro Ev.totalOrderConstructedClosed
    (And.intro Ev.strongOrderConstructedClosed Ev.uniquenessClosed)

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse