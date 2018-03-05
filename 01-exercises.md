1. another way of calculating `double(double 2)`:
```
double(double 2)
double(2 + 2)
(2 + 2) + (2 + 2)
4 + memoised 4
8
```

2. show that sum [x] = x for any number x
```
sum[]     = 0
sum[x:xs] = x + sum xs

sum [x] = x + sum []
sum [x] = x + 0
sum [x] = x
```

3. define product s.t. product [2, 3, 4] = 24
```
product []     = 1
product [x:xs] = x * product xs

product [2, 3, 4] = 2 * product [3, 4]
product [2, 3, 4] = 2 * 3 * product [4]
product [2, 3, 4] = 2 * 3 * 4 * product []
product [2, 3, 4] = 2 * 3 * 4 * 1
product [2, 3, 4] = 2 * 3 * 4
product [2, 3, 4] = 2 * 12
product [2, 3, 4] = 24
```

4. reverse qsort
```
qsort []     = []
qsort [x:xs] = qsort gt ++ [x] ++ qsort lte 
               where
                   lte = [a | a <- xs, a <= x]
                   gt  = [b | b <- xs, b > x]
```

5. the result of replacing <= with < in one of the qsort guards would
be to implicitly deduplicate the sequence, because we would drop any
items in the tail of the input whose value equals the value of the head.
