module Main


data Vector : Nat -> Type -> Type where
    Nil : Vector Z a
    (::) : a -> Vector k a -> Vector (S k) a

{-
interface Functor (f : Type -> Type) where
    fmap : (a -> b) -> (f a -> f b)
-}
implementation Functor (Vector Z) where
    map f = const Nil

implementation Functor (Vector n) => Functor (Vector (S n)) where
    map f (x :: xs) = f x :: map f xs
    
    
implementation Applicative (Vector Z) where
    pure _ = Nil
    (<*>) v = const Nil
    
implementation Applicative (Vector n) => Applicative (Vector (S n)) where
    pure a = a :: pure a
    (<*>) (f :: fs) (a :: as) = f a :: (fs <*> as)

tail : Vector n a -> Vector (pred n) a
tail (x :: xs) = xs
    
length : ( xs : Vector n a ) -> Nat
length Nil = 0
length x = succ . Main.length . Main.tail $ x

main : IO ()
main = print $ Main.length (0::1::2::3::4::5::Nil)
