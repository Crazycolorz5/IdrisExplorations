makeId : (a : Type) -> (a -> a)
makeId t = (\x : t => x)

pairwiseApply : (b : Type, c : Type) -> ((a : Type) -> a -> a) -> (b, c) -> (b, c)
pairwiseApply t1 t2 typeFun (b, c) = (typeFun t1 b, typeFun t2 c)

generalizedApply : (b : Type) -> (c : Type) -> (d : Type) -> (e : Type) -> ((a : Type) -> (a' : Type) -> a -> a') -> (b, c) -> (d, e)
generalizedApply tb tc td te tF (vB, vC) = (tF tb td vB, tF tc te vC)




ShowBox : Type
ShowBox = (b : Type) -> ((a : Type) -> ((Show a) => a -> b )) -> b

makeShowBox : (a : Type) -> (Show a) => a -> ShowBox
makeShowBox t a = \b => \f => f t a

applyShowBox : (b : Type) -> ((a : Type) -> ((Show a) => a -> b )) -> ShowBox -> b
applyShowBox b f box = box b f

fShow : (a : Type) -> ((Show a) => a -> String)
fShow t a = show a

implementation Show ShowBox where
    show box = box String fShow
    
a : ShowBox
a = makeShowBox Int 5

b : ShowBox
b = makeShowBox String "Hello, world!"

c : ShowBox
c = makeShowBox ShowBox (makeShowBox String "Box within a box!")

d : List ShowBox
d = [a, b, c]

e : ShowBox
e = makeShowBox (List ShowBox) d

main : IO ()
main = print e

doubleShow : (a : Type) -> (Show a) => a -> String
doubleShow t a = fShow t a ++ fShow t a

