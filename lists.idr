
mySum : (Num a) => List a -> a
mySum [] = 0
mySum (x::xs) = x + sum xs


main : IO ()
main = print (mySum [0..10000]) >>= \x => putStrLn ""
