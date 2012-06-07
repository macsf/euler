main = do
	print (sumFib 4000000)

fibonacci :: Int -> Integer
fibonacci n = fibs (1, 1) !! n
			where fibs (a, b) = a : fibs (b, a + b)
			
sumFib n = sum (takeWhile (<n) [ f | x <- [1..], let f = fibonacci x, mod f 2 == 0 ])

--4613732
--real	0m0.014s
--user	0m0.002s
--sys	0m0.007s