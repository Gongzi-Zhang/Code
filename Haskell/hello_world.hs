import Prelude	-- default module
import Data.List (nub, sort)	-- import only a few functions from a module
import Data.List hiding (nub)	-- import all functions except a few in a module
import qualified Data.Map	-- quolified import, so if there is same name funciton in more than one module, we have to add module name: Data.Map.filter for qualified import functions
import qualified Data.Map as M	-- alias, so that Data.Map.filter == M.filter
-- primitive type
:t x		-- type operator
True | False	-- Bool
1		-- Int
1.23 | 1.234_567 | -1.2e-5 | 1.2E+10 | 1.2e4   	-- Float
pi		-- Double
'a'		-- Char
"hello"		-- String: [Char]


-- list: homogenous data structure
"hello" == ['h', 'e', 'l', 'l', 'o']
--- list operation: ++, :
-- concat: ++
[1, 2, 3, 4] ++ [9, 10, 11, 12]
"hello" ++ " " ++ "world"
['w', 'o'] ++ ['o', 't']    -- "woot"
-- cons operator: :
'A':" SMALL CAT"    -- "A SMALL CAT"
[1, 2, 3] == 1:2:3:[]

-- index: !!
"Steve Buscemi" !! 0	-- 'S'

-- comparison
[3, 2, 1] > [2, 10, 100]
[3, 4, 2] > [3, 4]
[3, 4, 2] == [3, 4, 2]

let l = [5, 4, 3, 2, 1]
head l	-- 5
tail l	-- [4, 3, 2, 1]
last l	-- 1
init l	-- [5, 4, 3, 2]
head []	-- Error

length l
null [1, 2, 3]	-- False
null []		-- True
reverse l	-- [1, 2, 3, 4, 5]
take 3 l	-- [5, 4, 3]
take 5 [1, 2]	-- [1, 2]
take 0 l	-- []
drop 3 [8, 4, 2, 1, 5, 6]   -- [1, 5, 6]
drop 0 [1, 2, 3, 4] -- [1, 2, 3, 4]
drop 100 [1, 2, 3, 4]	-- []
take 10 (cycle [1, 2, 3])
repeat 5	-- [5, 5, ....]

minimum l
maximum l
sum l
product l

4 `elem` [3, 4, 5, 6]	-- True
10 `elem` [3, 4, 5, 6]	-- False

-- range
[1..20]
['a'..'z']
[1..]
[13, 26..24*13] == take 13 [13, 26..]
[2, 4..20]

-- list comprehension: {2*x | x≤10}
[x*2 | x <- [1..10], x*2 >= 12]
[if x < 10 then "BOOM!" else "BANG!" | x <- [1..10], odd x]
[x*y | x <- [2,5,10], y <- [8, 10, 11]]
length' xs = sum [1 | _ <- xs]
let xxs - [[1,3, 5,2, 4, 2, 2], [1, 2, 4, 5, 7, 2]]
[ [x | x <- xs, even x] | xs <- xxs]


-- tuple: unmutable list
-- pairs
fst (8, 11) -- 8
snd ("Wow", False)  -- False


-- expression
x /= 13	    -- not equal
succ 8	    -- successor
min 3.4 3.2
max 100 101
succ 9 + max 5 4 + 1
div 92 10   -- 9
92 `div` 10 -- 9
92 `mod` 10 -- 2

-- zip
zip [1..5] ["one", "two", "three", "four", "five"]  -- (1, "one"), (2, "two")...(5, "five")



-- functions
functionName :: Arg1Type -> Arg2Type -> ... -> ReturnType
-- curried function: every function in Haskell officially only takes one parameter
-- a function with multiple parameters can be regarded as the recursion of many function which has only one parameter and return a partially applied functions
f a b c = (f a b) c 
g = f a b

doubleMe x = x + x
doubleUs x y = x*2 + y*2

-- ' is a valid char for function name, usually used to named a stricter version of a fun
-- function can't begin with uppercase letters
doubleSmallerNumber' x = (if x > 100 then x else x*2) + 1
