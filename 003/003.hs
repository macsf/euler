main = do
    print (maximum (primeFactors 600851475143))

--6857
--real    0m0.007s
--user    0m0.002s
--sys 0m0.004s

--primeFactors = [ p | p <- (factors 600851475143), isPrime p]

-- factors
--factors :: Integer -> [Integer]
--factors x = [ z | z <- [1..x-1], mod x z == 0 ]

-- http://www.haskell.org/haskellwiki/99_questions/Solutions/35
primeFactors n = factor primes n
  where
    factor ps@(p:pt) n | p*p > n      = [n]
                       | rem n p == 0 = p : factor ps (quot n p)
                       | otherwise    =     factor pt n
    -- primes = 2 : filter (\n-> n==head(factor primes n)) [3,5..]
    -- primes = 2 : filter isPrime [3,5..]      -- isPrime of Q.31
    primes = primesTME

-- http://www.haskell.org/haskellwiki/99_questions/Solutions/31
{-# OPTIONS_GHC -O2 -fno-cse #-}
-- tree-merging Eratosthenes sieve
--  producing infinite list of all prime numbers
primesTME = 2 : gaps 3 (join [[p*p,p*p+2*p..] | p <- primes'])
  where
    primes' = 3 : gaps 5 (join [[p*p,p*p+2*p..] | p <- primes'])
    join  ((x:xs):t)        = x : union xs (join (pairs t))
    pairs ((x:xs):ys:t)     = (x : union xs ys) : pairs t
    gaps k xs@(x:t) | k==x  = gaps (k+2) t
                    | True  = k : gaps (k+2) xs

-- duplicates-removing union of two ordered increasing lists
union (x:xs) (y:ys) = case (compare x y) of
           LT -> x : union  xs  (y:ys)
           EQ -> x : union  xs     ys
           GT -> y : union (x:xs)  ys