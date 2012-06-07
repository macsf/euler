-- > runhaskell 001.hs
-- or compile with ghc

main = do
  print euler001

euler001 = sum [ x | x <- [1..1000-1], x `mod` 3 == 0 || x `mod` 5 == 0 ]
