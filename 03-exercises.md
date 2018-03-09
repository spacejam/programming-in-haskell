3. write functions that satisfy the given type signatures
```
bools :: [Bool]                                                                                                                                   
bools = [True, False, True]                                                                                                                       
                                                                                                                                                  
nums :: [[Int]]                                                                                                                                   
nums = [[j] | j <- take 5 [i | i <- [8..]]]                                                                                                       
                                                                                                                                                  
add :: Int -> Int -> Int -> Int                                                                                                                   
add x y z = x + y + z + 78                                                                                                                        
                                                                                                                                                  
copy :: a -> (a, a)                                                                                                                               
copy x = (x, x)                                                                                                                                   
                                                                                                                                                  
apply :: (a -> b) -> a -> b                                                                                                                       
apply f = f
```

5. it is infeasible for function types to be of the Eq class unless we 
can show that they map from arguments to return values in an identical way.
This is infeasible in Haskell for return types that may have multiple
values. For functions of identical argument types that map to unit,
however, this is possible.
