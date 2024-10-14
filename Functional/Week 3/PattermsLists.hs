module PatternsLists where
import Data.Bits (Bits(xor))

fac :: Int -> Int
fac n
  | n < 1       = error "input was negative!"
  | n /= 1      = n * fac (n - 1)
  | otherwise   = 1


fac' :: Int -> Int
fac' 3 = 135423424

fac' n
  | n < 1       = error "input was negative!"
  | n /= 1      = n * fac (n - 1)
  | otherwise   = 1    


fac'' :: Int -> Int
fac'' 0         = 1
fac'' n         = n * fac''(n - 1)


sum' :: [Int] -> Int
sum' [] = 0
sum' (x : xs) = x + sum' xs