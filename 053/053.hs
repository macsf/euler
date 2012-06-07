-- Problem 053
-- How many values of C(n,r), for 1 ≤ n ≤ 100, exceed one-million?

-- calculate factorial
factorial :: Integer -> Integer
factorial n = if n > 0 then n * factorial (n - 1) else 1

ncr n r = (factorial n) `div` ((factorial (n - r)) * (factorial r))

main = do
    print (length (euler053 100))

euler053 x = [ (n, r) | n <- [1..x], r <- [1..n], (ncr n r) > 1000000 ]

--4075
--real    0m0.063s
--user    0m0.056s
--sys     0m0.005s