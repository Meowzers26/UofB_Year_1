-- 3.1
calcTip c
    | c <= 10 = 0.1 * c
    | otherwise = 0.15 * c

-- 3.2
mysterious m
    | m `mod` 2 == 0  =  div m 2
    | otherwise = (3 * m) + 1

-- 3.3
grade g
    | g < 40 =      "Fail"
    | g < 50 =      "Third class"
    | g < 60 =      "Second class, second division"
    | g < 70 =      "Second class, first division"
    | otherwise =   "First class"

-- 3.4
clamp lower upper num = max lower (min num upper)

-- 3.5
function
    | happiness > 10 = "Hello!"  
    | otherwise = goodbye
    where
        happiness = 10
        goodbye = "Goodbye!"



-- 4.1
factorial n 
    | n == 1    = 1
    | otherwise = n * factorial (n - 1)

-- 4.2
fibonacci n
    | n <= 2    = 1
    | otherwise = fibonacci (n - 2) + fibonacci (n - 1)


-- 4.3
divisor n m = (n `mod` m == 0)

anyDivisors n m
    | m <= 1    = False
    | otherwise = divisor n m || anyDivisors n (m - 1)

prime n
    | anyDivisors n (n - 1) == True = False
    | otherwise = True


-- 4.4
helper n m 
    | m * m >= n    = m
    | otherwise     = helper n (m + 1)

root n      = helper n 1


-- 4.5
