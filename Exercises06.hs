module Exercises06 where

-- 1.a. how does a naive recursive factorial function respond to a negative arg?
--   it blows up with a stack overflow because it never hits the base case
-- 1.b. redefine it using a guard to prevent this
fac :: Int -> Int
fac 0 = 1
fac n | n > 0     = n * fac (n - 1)
      | otherwise = 0

-- 2. define a function that sums from a number down to 0
sumDown :: Int -> Int
sumDown 0 = 0
sumDown n = n + sumDown (n - 1)

-- 3. define an exponentiation function
exp' :: Int -> Int -> Int
exp' n 0   = 1
exp' n pow = n * exp' n (pow - 1)

-- 4. define euclid's algorithm
euclid :: Int -> Int -> Int
euclid a b | a == b     = a
           | a > b      = euclid (a - b) b
           | otherwise  = euclid a (b - a)

-- 6. define the following with recursion
-- 6.a. all logical values in a list are True
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) | x         = and' xs
            | otherwise = False

-- 6.b. concatenate a list of lists
concat' :: [[a]] -> [a]
concat' []     = []
concat' (x:xs) = x ++ concat' xs

-- 6.c. produce a list with n identical elements
replicate' :: Int -> a -> [a]
replicate' 0 a = []
replicate' n a = a : replicate' (n - 1) a

-- 6.d select the nth element of a list
(!!!) :: [a] -> Int -> a
(!!!) (x:xs) 0 = x
(!!!) (x:xs) n = xs !!! (n - 1)

-- 6.e decide if a value is an element of a list
elem' :: Eq a => a -> [a] -> Bool
elem' e []    = False
elem' e (x:xs)
  | e == x    = True
  | otherwise = elem' e xs

-- 7. merge two sorted lists into a single sorted list
merge :: Ord a => [a] -> [a] -> [a]
merge xs []   = xs
merge [] ys   = ys
merge (x:xs) (y:ys)
  | x < y     = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

-- 8. write mergesort
msort :: Ord a => [a] -> [a]
msort []  = []
msort [x] = [x]
msort xs  = do
  let pivot    = length xs `div` 2
  let (as, bs) = splitAt pivot xs

  merge (msort as) (msort bs)

-- 9.a. sum a list of numbers
sum' :: [Int] -> Int
sum' []     = 0
sum' (x:xs) = x + sum' xs

-- 9.b. take a given number of elements from the start of a list
take' :: Int -> [a] -> [a]
take' 0 _      = []
take' n (x:xs) = x : take' (n - 1) xs

-- 9.c. select the last element of a non-empty list
select' :: [a] -> a
select' [x]    = x
select' (x:xs) = select' xs

