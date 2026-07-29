import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure CommutativeMonoidOrder where
  carrier : Type
  addition : carrier → carrier → carrier
  zero : carrier
  totalPreorder : carrier → carrier → Prop
  additionCompatible : ∀ a b c, totalPreorder a b → totalPreorder (addition a c) (addition b c)
  zeroMinimal : ∀ a, totalPreorder zero a

def CommutativeMonoidOrderClosed (O : CommutativeMonoidOrder) : Prop :=
  ∀ a b, O.totalPreorder a b ∨ O.totalPreorder b a

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse