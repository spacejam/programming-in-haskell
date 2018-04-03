module Exercises05 where

import Data.Char

-- 1. use a list comprehension to sum the square of the first 100 integers

sqSum :: Int
sqSum = sum [x * x | x <- [1..100]]

-- 2. generate an (x, y) pair for every point in a grid of size m x n
grid :: Int -> Int -> [(Int, Int)]
grid m n = [(x, y) | x <- [0..m], y <- [0..n]]

-- 3. generate a square coordinate grid filtering where x == y
square :: Int -> [(Int, Int)]
square n = [(x, y) | x <- [0..n], y <- [0..n], x /= y]

-- 4. define replicate using a list comprehension
replicate' :: Int -> a -> [a]
replicate' n a = [a | _ <- [1..n]]

-- 5. write a function that generates all pythagorean triplets <= a given Int
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1..n],
                       y <- [1..n],
                       z <- [1..n],
                       x * x + y * y == z * z]

-- 6. write a function that returns a list of all perfect numbers up to a limit
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n + 1], x == sum (factors x) - x]

-- 7. show how to rewrite a function with a comprehension with two generators
-- as a function with two comprehensions of one generator each
orig = [(x, y) | x <- [1,2], y <- [3,4]]

new = concat [[(1, x) | x <- [3,4]], [(2, x) | x <- [3,4]]]

-- 8. redefine positions using the function find
positions :: Eq a => a -> [a] -> [Int]
positions x xs = []

-- 10. write a caesar cipher that accepts upper and lowercase chars
shift :: Int -> Char -> Char
shift n c | isLower c = chr (((ord c - ord 'a' + n) `mod` 26) + ord 'a')
          | isUpper c = chr (((ord c - ord 'A' + n) `mod` 26) + ord 'A')
          | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

decode :: Int -> String -> String
decode n = encode (n `mod` 26)
