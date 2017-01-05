module Main

if' : (x : Bool) -> a -> b -> (if x then a else b)
if' True a b = a
if' False a b = b

theAnswer : Nat
theAnswer = 42

myFunc : (x : Bool) -> (if x then Nat else String)
myFunc input = if' input theAnswer "The Answer"

double : Nat -> Nat
double x = 2*x

main : IO ()
main = print (double $ myFunc True)
--This also works:
--main = print ("Hi" ++ myFunc False)
--Output: 84
--The following type errors:
--main = print ("Hi" ++ myFunc True)
