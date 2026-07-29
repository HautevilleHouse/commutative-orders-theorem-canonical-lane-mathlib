import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure CommutativeOrderAdmittedObject where
  space : Type u
  partialOrder : PartiallyOrderedGroup
  totalOrderExtension : Prop
  strongOrderExtension : Prop
  conclusion : totalOrderExtension ∧ strongOrderExtension

def CommutativeOrderWitnessClosed (O : CommutativeOrderAdmittedObject) : Prop :=
  O.totalOrderExtension ∧ O.strongOrderExtension

structure ExtensionPackage (G : PartiallyOrderedGroup) where
  totalOrder : Prop
  strongOrder : Prop

def ExtensionClosed {G : PartiallyOrderedGroup} (E : ExtensionPackage G) : Prop :=
  E.totalOrder ∧ E.strongOrder

theorem extension_closed (G : PartiallyOrderedGroup) (E : ExtensionPackage G)
    (hTotal : E.totalOrder) (hStrong : E.strongOrder) : ExtensionClosed E := by
  exact And.intro hTotal hStrong

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse