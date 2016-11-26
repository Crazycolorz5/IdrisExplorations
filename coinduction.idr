
codata HList : Type -> Type where
    Nil : HList a
    Cons : a -> HList a -> HList a


countdown : Nat -> HList Nat
countdown Z = Nil
countdown (S n) = Cons n (countdown n)

countup : Nat -> HList Nat
countup n = Cons n (countup (S n))

take : Nat -> HList a -> HList a
take _ Nil = Nil
take Z _ = Nil
take (S n) (Cons a as) = Cons a (take n as)

toList : HList a -> List a
toList Nil = Nil
toList (Cons a as) = a :: toList as

everyOther : HList a -> HList a
everyOther Nil = Nil
everyOther (Cons a Nil) = Cons a Nil
everyOther (Cons a (Cons b xs)) = Cons a (everyOther xs)
