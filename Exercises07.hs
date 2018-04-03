module Exercises07 where

-- 1. rewrite [f x | x <- xs, p x] can be done with map and filter
filterMap :: (a -> b) -> (a -> Bool) -> [a] -> [b]
filterMap f p xs = do
  let filtered = filter p xs
  map f filtered

-- 2.a. rewrite all
all' :: (a -> Bool) -> [a] -> Bool
all' p = foldl (\acc e -> acc && p e) True

-- 2.b. rewrite any
any' :: (a -> Bool) -> [a] -> Bool
any' p = foldl (\acc e -> acc || p e) False

-- 2.c. rewrite takeWhile
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p [] = []
takeWhile' p (x:xs) | p x       = x : takeWhile' p xs
                    | otherwise = []

-- 2.d. rewrite dropWhile
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' p [] = []
dropWhile' p (x:xs) | p x       = dropWhile' p xs
                    | otherwise = xs

-- 3. redefine map f and filter p using foldr
map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f xs = foldr (\e acc -> f e : acc) [] xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f xs = foldr (\e acc -> if f e then e : acc else acc) [] xs

-- 4. convert a list of decimals into a number
dec2int :: [Int] -> Int
dec2int = foldl (\acc e -> acc * 10 + e) 0

-- 5. implement curry and uncurry
curry' :: ((a,  b) -> c) -> a -> b -> c
curry' f a b = f (a, b)

uncurry' :: (a -> b -> c) -> ((a, b) -> c)
uncurry' f (a, b) = f a b

-- 6. redefine chop8 and map f, and iterate f, using unfold below
unfold p h t x | p x       = []
               | otherwise = h x : unfold p h t (t x)

type Bit = Int

chop8 :: [Bit] -> [[Bit]]
chop8 []   = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

chop8' = unfold (const False) (take 8) (drop 8)

map'' :: (a -> b) -> [a] -> [b]
map'' f = unfold (const False) (f . head) tail

iterate' :: (a -> a) -> a -> [a]
iterate' = unfold (const False) id
