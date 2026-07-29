import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativeOrdersTheoremCanonicalLaneLean

structure PartiallyOrderedSet (α : Type u) where
  le : α → α → Prop
  le_refl : ∀ a : α, le a a
  le_trans : ∀ a b c : α, le a b → le b c → le a c
  le_antisymm : ∀ a b : α, le a b → le b a → a = b

structure TotallyOrderedSet (α : Type u) extends PartiallyOrderedSet α where
  total : ∀ a b : α, le a b ∨ le b a

structure CommutativeOrderedSemiring (α : Type u) where
  plus : α → α → α
  times : α → α → α
  zero : α
  one : α
  order : PartiallyOrderedSet α
  plus_comm : ∀ a b : α, plus a b = plus b a
  times_comm : ∀ a b : α, times a b = times b a
  plus_order_compat : ∀ a b c : α, order.le a b → order.le (plus a c) (plus b c)
  times_order_compat : ∀ a b c : α, order.le a b → order.le (times a c) (times b c)
  zero_one_distinct : zero ≠ one

end CommutativeOrdersTheoremCanonicalLaneLean
end HautevilleHouse