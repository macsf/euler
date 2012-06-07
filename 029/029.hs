import Data.List

main = do
  print (length (nub [ a^b | a <- [2..100], b <- [2..100] ]))

-- nub (from Data.List) to sort out duplicate items

--9183
--real  0m1.019s
--user  0m0.995s
--sys 0m0.008s