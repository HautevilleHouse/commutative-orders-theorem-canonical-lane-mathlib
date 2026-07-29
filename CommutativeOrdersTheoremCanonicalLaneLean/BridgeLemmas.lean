import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CommutativeOrderWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse