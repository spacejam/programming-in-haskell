module Exercises04 where

-- 1. define a function that splits a list in half
halve :: [a] -> ([a], [a])
halve xs = do
  let len = length xs
  let half = len `div` 2
  (take half xs, drop half xs)

-- 2. define a function that takes the third element of a list
-- 2.a using head and tail
third :: [a] -> a
third = head . tail . tail

-- 2.b using !!
third' :: [a] -> a
third' xs = xs !! 2

-- 2.c using pattern matching
third'' :: [a] -> a
third'' (_ : _ : x : xs) = x

-- 3. define safetail s.t. it doesn't explode when given an empty list
-- 3.a. using a conditional
safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

-- 3.b. using guards
safetail' :: [a] -> [a]
safetail' xs | null xs = []
             | otherwise = tail xs

-- 3.c. using pattern matching
safetail'' :: [a] -> [a]
safetail'' []     = []
safetail'' (_:xs) = xs

-- 4. define || in 4 ways using pattern matching
or' :: Bool -> Bool -> Bool
or' False False = False
or' True False = True
or' False True = True
or' True True  = True

or'' :: Bool -> Bool -> Bool
or'' False x = x
or'' x False = x
or'' _ _     = True

or''' :: Bool -> Bool -> Bool
or''' True _ = True
or''' _ True = True
or''' _ _    = False

or'''' :: Bool -> Bool -> Bool
or'''' x y | x == y = x
           | otherwise = True

-- 5. write && with nested if statements
and' :: Bool -> Bool -> Bool
and' x y = if not x then False else
              if not y then False else
              True

-- 6. repeat 5 for an alternate implementation of &&
and'' :: Bool -> Bool -> Bool
and'' x y = if x then y else False

-- 7. formalize this with lambdas: mult x y z = x*y*z
mult' :: Num a => a  -> a  -> a  -> a
mult' =           \x -> \y -> \z -> x * y * z

-- 8. implement luhn credit card digit checking functions
luhnDouble :: Int -> Int
luhnDouble x | x > 4 = x * 2
             | otherwise = (x * 2) - 9

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0
