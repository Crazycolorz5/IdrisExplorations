data Natural = Zero | S Natural

eval : Natural -> Int
eval Zero = 0
eval (S n) = succ (eval n)

fromInt : Int -> Natural
fromInt n = case n <= 0 of
  True      => Zero
  otherwise => S (fromInt (pred n))
