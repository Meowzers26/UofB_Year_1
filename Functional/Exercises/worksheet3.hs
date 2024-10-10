import Data.List
import Control.Monad (sequence)

-- 1.1
isJust :: Maybe a -> Bool
isJust (Just _)         = True
isJust (Nothing)        = False

-- 1.2
fromMaybe :: a -> Maybe a -> a
fromMaybe x (Just y)    = y
fromMaybe x (Nothing)   = x

-- 1.3  returns Nothing if it's a string, returns Just a if type a
forget :: Either String a -> Maybe a
forget (Left _)         = Nothing
forget (Right x)        = Just x

-- 1.4
-- Just (Right True) :: Maybe (Either a Bool)

-- 1.5
-- a)
safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0             = Nothing
safeDiv x y             = Just (x `div` y)

-- b)
safeDiv' :: Int -> Int -> Either String Int
safeDiv' _ 0            = Left "Division by zero is not possible"
safeDiv' x y            = Right (x `div` y)

-- c)
checkForErrors  :: [Either String a] -> Either String [a]
checkForErrors                  = checkForErrors' []

checkForErrors' :: [a] -> [Either String a] -> Either String [a]
checkForErrors' y []               = Right y
checkForErrors' y (Left x : xs)    = Left x
checkForErrors' y (Right x : xs)   = checkForErrors' (y ++ [x]) xs


-- 2.1
data Expr = Lit Int 
            | Add Expr Expr 
            | Mul Expr Expr
            | Sub Expr Expr

-- a)
size :: Expr -> Int
size (Lit x)        = 0
size (Add x y)      = 1 + (size x) + (size y)
size (Mul x y)      = 1 + (size x) + (size y)
size (Sub x y)      = 1 + (size x) + (size y)

-- b)
eval :: Expr -> Int
eval (Lit x)        = x
eval (Add x y)      = (eval x) + (eval y)
eval (Mul x y)      = (eval x) * (eval y)
eval (Sub x y)      = (eval x) - (eval y)

-- c)
pretty :: Expr -> String
pretty (Lit x)      = show x
pretty (Add x y)    = pretty (x) ++ " + " ++ pretty (y)
pretty (Mul x y)    = pretty (x) ++ " * " ++ pretty (y)
pretty (Sub x y)    = pretty (x) ++ " - " ++ pretty (y)


-- 3.1
addTwo :: Num a => a -> a
addTwo x = x + 2

-- 3.2
-- a)
data choices    = Rock | Paper | Scissors