import CommutativeOrdersTheoremCanonicalLaneLean.OrderStructures

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

theorem commutative_order_principle (α : Type u) [CommutativeOrderedSemiring α] (a b : α) :
  a = b ∨ (order.le a b ∧ ¬ order.le b a) ∨ (order.le b a ∧ ¬ order.le a b) := by
  sorry

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse