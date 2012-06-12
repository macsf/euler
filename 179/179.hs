-- Problem 179

-- Consecutive positive divisors

-- Find the number of integers 1 < n < 10^7, for which n and n + 1 have the same
-- number of positive divisors. For example, 14 has the positive divisors
-- 1, 2, 7, 14 while 15 has 1, 3, 5, 15.

import Math.NumberTheory.Primes.Factorisation

--main = print (length [ n | n <- [1..10^7], tau n == tau (n+1) ])

--986262
--
--real  1m42.872s
--user  1m42.456s
--sys   0m0.331s
