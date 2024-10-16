-- comments🤯
-- /= is 'does not equal'
-- div 10 2 produces the same result as 10 `div` 2
-- whitespace doesn't generally matter <3
-- if ..... then ...... else ......     -->     must have else statement
--      | (condition) -> in this case... (replaces if and else if)
--      = -> replaces then
--      | otherwise -> replaces else
-- variables are immutable


-- Higher Order (HO) functions take other functions as parameters
    -- for abstraction
    -- modular, less cognitive load
-- 


-- :l load new file         (one argument)
-- :r reload                (no arguments)
-- :t check type
-- fst [tuple]              takes the first component
-- snd [tuple]              takes the second component
-- _                        a hole for placeholder, don't care about the value
-- lowercase types (a0)     type doesn't matter / is ambiguous
-- functions                argument -> argument -> return
-- import [library] hiding [function]
-- Show                     turns output into String
-- error " "                retruns an error, use rarely
-- main ::                  entrypoint to program
-- ghc [file name]          compiles file
-- :: IO ()                 needed if function interacts with console/computer


-- ⚠️RECURSION⚠️
-- induction...start with a base case and work backwards


-- types:
-- Int(eger) (diff sizes)   -> the type of integers
-- String                   -> text (double quotation marks)
-- Bool                     -> booleans
-- Char                     -> single character (single quotation marks)
-- tuples                   = (Integer, String) -> format for typing tuples
-- lists                    = [1, 2, 3]
-- a                        -> any one type
-- Maybe                    -> for error handling
--                          -> data Maybe a = Just a | Nothing 
                            

-- type classes:    (can create your own)
-- Num a                    -> any numeric type
-- Eq a                     -> to compare things (not functions)
-- Ord a                    -> comparison wherein order is important
-- (Num a) =>               -> for any type Num a, (type class) when creating a function
-- creating custom type     -> type [name] = [type]
-- creating data type       -> data [name] = [constructor (capital letter strart)] [types]      (can use constructor for pattern matching)
    -- egUser' = MkUser' 20 "Greg"
    -- getAge (MkUser' age name) = age

    -- data Bool = True | False

-- type error when expected type and actual type do not match
-- data constructors can determine type 
    -- data [name] = [constructor] [types] | [constructor] [types]
    -- data User = MkUser Int String | Anon Cookie


-- thingy thing things
-- (:)                      prepends first argument a to second argument [a]
-- (++)                     concatenates two lists [a] to [a]
--                          True : (False : [])     =   True : False : []   ->      [True, False]
-- (.)                      function composition
-- putStrLn ""              prints string to console
--                          only works for function of type IO ()
--                          only prints characters in string w/o quotation marks
--                          String -> IO ()
-- print                    converts to string, and prints that 
--                          putStrLn $ Show " "
--                          Show a => a -> IO ()
--  (<-)                    assign variable
-- getLine                  take input from console
-- [function] = do          execute code sequentially
-- case [variable] of       try case statement
--      "  " -> [action]
-- [variable] <- IO [type]  take out the type from the IO type   
-- \x y -> [function]       function without name that takes in input x and y
                            don't case arguments when pattern matching, just take out variables
-- (+2)                     shorthand for (\x -> x + 2)
-- (,)                      shorthand for (\x y -> (x, y))
-- map                      maps x from a list to f(x) in another list



-- HO Function example:

filter :: (a -> Bool) -> [a] -> [a]
filter p [] = []
filter p (x:xs)
  | p x         = x : filter xs
  | otherwise   = filter xs

filterOdd :: [Int] -> [Int]
filterOdd xs    = filter odd xs

onlyA :: [Char] -> [Char]
onlyA xs        = filter isA xs
  where
    isA :: Char -> Bool
    isA x       = x == 'A'

onlyA' xs = filter (\x -> x == 'A') xs          -- anon functions / lambda

onlyA'' xs = filter (== 'A') xs



map :: (a -> b) -> [a] -> [b]
map f []        = []
map f (x:xs)    = f x : map xs

mapPlusTwo :: [Int] -> [Int]
mapPlusTwo xs = map (+2) xs

mapShow :: [Char] -> [Char]
mapShow xs = map show xs