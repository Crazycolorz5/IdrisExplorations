import Data.Vect

containsWord : {- LogMessage -} String -> Bool
containsWord = const True

stringToList : String -> List Char
stringToList "" = []
stringToList s = strHead s :: stringToList (strTail s)

listToVector : (s : List a) -> Vect (length s) a
listToVector [] = Nil
listToVector (l::ls) = l :: listToVector (ls)

stringToVector : (s : String) -> Vect (length (stringToList s)) Char
stringToVector s = listToVector $ stringToList s


breakOffWord : Vect (S (a + b)) Char -> (Vect a Char, Vect b Char)
breakOffWord (s :: st) = if s == ' ' 
    then (Nil, st) 
    else let (a, b) = breakOffWord st in (s :: a, b)
