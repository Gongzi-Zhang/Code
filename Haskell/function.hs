-- operator as function
the equality operator, == is a function. So are +, *, -, / and pretty much all operators. If a function is comprised only of special characters, it's considered an infix function by default. If we want to examine its type, pass it to another function or call it as a prefix function, we have to surround it in parentheses.

:t (==)
(==) :: (Eq a) => a -> a -> Bool
