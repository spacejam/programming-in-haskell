4. define last in a new way

```
last' :: [a] -> a                                                                                                                                                                                                                                                                                                                                                                              
last' xs = xs !! ((length xs) - 1)
```

5. define init in two different ways
```
init' :: [a] -> [a]
init' xs = take (length xs - 1) xs

init'' :: [a] -> [a]
init'' xs = reverse (tail (reverse xs))
```
