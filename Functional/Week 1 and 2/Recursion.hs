-- 5! = 5 * 4 * 3 * 2 * 1

fac5 = 5 * 4 * 3 * 2 * 1
fac5' = 5 * fac4
fac4 = 4 * fac3
fac3 = 3 * fac2
fac2 = 2 * fac1
fac1 = 1

fac n
  = if n < 1
    then error "input was negative!"
    else if n /= 1
    then n * fac (n - 1)
    else 1


fac' n
  = if n >= 1
    then n * fac' (n - 1)
    else 1

fac'' n
  | n < 1     = error "input was negative!"
  | n /= 1    = n * fac'' (n - 1)
  | otherwise = 1

-- fac'' 3
-- = 3 * fac'' (3 - 1)
-- = 3 * fac'' 2
-- = 3 * (2 * fac'' (2 - 1))
-- = 3 * (2 * fac'' 1)
-- = 3 * (2 * 1)
