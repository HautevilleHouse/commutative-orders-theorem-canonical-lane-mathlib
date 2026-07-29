import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : CommutativeOrderAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CommutativeOrderWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse