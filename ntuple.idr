
data Zuple : Type where
    Empty : Zuple    
data Monople : Type -> Type where
    Single : a -> Monople a
data Duple : Type -> Type -> Type where
    Dup : a -> b -> Duple a b 

append : Duple a b -> c -> Duple (Duple a b) c
append = Dup

--succTup : Duple a b -> Type -> Type
--succTup d t = Duple (Duple a b) t

{-
data NTuple : (n : Nat) -> Type where
    Empty : NTuple 0
    --Singple : (t : Type) -> (x : t) -> NTuple 1
    NTup : NTuple n -> (t : Type) -> (x : t) -> NTuple (S n)
  
  
implementation Show (NTuple n) where
    show Empty = "()"
    show (NTup first thist elem) = (Prelude.Strings.++) (show elem) (show first)
-}
{-
implementation Show (NTuple 0) where
    show Empty = "()"

implementation (Show (NTuple n)) => Show (NTuple (S n)) where
    show (NTup first thist elem) = (Prelude.Strings.++) (show elem) (show first)
-}
{-
interface IsTuple (t : Nat -> Type) where
    nextType : t -> (n : Nat) -> t (S n)

implementation IsTuple (
-}    

ntypes : (n : Nat) -> Type
ntypes Z = Type
ntypes (S n) = Type -> ntypes n

-- uncurry : (n : Nat) -> ntypes n -> Vector n Type
-- uncurry 2 f 

ntuple : (n : Nat) -> ntypes n
ntuple Z = Zuple
ntuple (S Z) = \a => Monople a
ntuple (S (S Z)) = \a => \b => Duple a b
\a => \b => \c => Duple (Duple a b) c
ntuple (S n) = \c => Duple 

layerTup : Type -> Type -> Type
layerTup a b = Duple a b

layer2Tup : Type -> Type -> Type -> Type
layer2Tup a b t = Duple (Duple a b) t

layer3Tup : Type -> Type -> Type -> Type -> Type
layer3Tup a b t1 = Duple (layer2Tup a b t1)

layerNTup : (n : Nat) -> ntypes (S n)
layerNTup (S n) = Duple (layerNTup n)

