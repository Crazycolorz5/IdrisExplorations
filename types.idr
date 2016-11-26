module Main

if' : (x : Bool) -> a -> b -> (if x then a else b)
if' True a b = a
if' False a b = b

theAnswer : Nat
theAnswer = 42

myFunc : (x : Bool) -> (if x then Nat else String)
myFunc input = if' input theAnswer "The Answer"

main : IO ()
main = print (myFunc True)
--Output: 42
