import Prelude hiding (length, sum, product, zip, take, repeat, cycle, (++))


-- 1.1
headOrZero :: [Int] -> Int
headOrZero []               = 0
headOrZero (x : xs)         = x


-- 1.2
length :: [Int] -> Int
length []                   = 0
length (x : xs)            = 1 + length xs

------------------------------------------------------

-- length [1,2,3]
-- x = 1   xs = [2, 3]
-- length(1 : [2, 3])         = 1 + length [2,3]


-- length [2,3]
-- x = [2]    xs = [3]
-- length (2 : [3])             = 1 + length [3] 

-- length [3]
-- x = [3]     xs = []
-- length (3 : [])             = 1 + length []


-- length []
--           = 0


-- length [1,2,3]      = 1 + length [2,3]
--                     = 1 + 1 + length [3]
--                     = 1 + 1 + 1 + length []
--                     = 1 + 1 + 1 + 0
--                     = 3

-------------------------------------------------------

-- 1.3
sum :: [Int] -> Int
sum []                      = 0
sum (x : xs)                = x + sum xs


-- 1.4
product :: [Int] -> Int
product []                  = 1
product (x : xs)            = x * product xs


-- 1.5
snoc :: Int -> [Int] -> [Int]
snoc n []                   = [n]
snoc n (x : xs)             = x : snoc n xs


-- 1.6
take :: Int -> [Int] -> [Int]
take 0 xs                   = []
take n (x : xs)             = x : take (n - 1) xs


-- 1.7
insert :: Int -> [Int] -> [Int]
insert n (x : xs)
  | n < x                   = n : x : xs
  | otherwise               = x : insert n xs


-- 1.8
isort :: [Int] -> [Int]
isort []                    = []
isort (x : xs)              = insert x (isort xs)