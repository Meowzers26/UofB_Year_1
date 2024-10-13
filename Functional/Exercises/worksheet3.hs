import Data.List
import Control.Monad (sequence)
import GHC.Base (TrName)

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
data RPS    = Rock | Paper | Scissors   deriving (Eq, Show)

shoot :: RPS -> RPS -> Bool
-- shoot x y
--     | x == y                        = False
--     | x == Rock && y == Paper       = False
--     | x == Paper && y == Scissors   = False
--     | x == Scissors && y == Rock    = False
--     | otherwise                     = True

shoot x y               
    | x == y            = False
shoot Rock Paper        = False
shoot Paper Scissors    = False
shoot Scissors Rock     = False
shoot _ _               = True


-- 3.3                                  erm i need answers bc these are theory questions and idk what they want tbh,,,i'm cooked😨😭😭
instance Ord RPS where
    player1 <= player2                  = True



-- 4
data Suit = Hearts | Diamonds | Clubs | Spades  deriving (Show, Eq)
type Pip = Int
type Rank = Either Pip Court
data Card = Joker | Card Suit Rank              deriving Show

-- 4.1
data Court = Ace | Jack | Queen | King          deriving (Show, Eq, Ord)

-- 4.2
instance Eq Card where
    Joker == Joker                              = True
    (Card _ rank1) == (Card _ rank2)            = rank1 == rank2

-- 4.3
snap :: Card -> Card -> String                  -- To call: snap (Card [suit name] (Left [int])) () OR snap (Card [suit] (Right [court]))
snap x y
    | x == y        = "SNAP"
    | otherwise     = "..."

-- 4.4
instance Ord Card where
    -- -- sets joker as the largest card
    -- Joker > (Card _ _)          = True

    -- -- orders the suits (is there a way to make it less redundant?)
    -- (Card Spades _) > (Card Hearts _)           = True
    -- (Card Spades _) > (Card Diamonds _)         = True
    -- (Card Spades _) > (Card Clubs _)            = True
    -- (Card Hearts _) > (Card Diamonds _)         = True
    -- (Card Hearts _) > (Card Clubs _)            = True

    -- -- suits already ordered, now orders according to rank
    -- (Card _ (Right court1)) > (Card _ (Right court2)) = court1 > court2
    -- (Card _ (Left _)) > (Card _ (Right Ace))    = True
    -- (Card _ (Right _)) > (Card _ (Left _))      = True
    -- (Card _ (Left pip1)) > (Card _ (Left pip2)) = pip1 > pip2

    -- -- all other orderings are false
    -- (Card _ _) > (Card _ _)                     = False


    -- sets joker as the largest card
    Joker `compare` (Card _ _)          = GT
    (Card _ _) `compare` Joker          = LT

    -- orders the suits (is there a way to make it less redundant?)
    (Card Spades _) `compare` (Card Hearts _)           = GT
    (Card Spades _) `compare` (Card Diamonds _)         = GT
    (Card Spades _) `compare` (Card Clubs _)            = GT
    (Card Hearts _) `compare` (Card Diamonds _)         = GT
    (Card Hearts _) `compare` (Card Clubs _)            = GT

    (Card Hearts _) `compare` (Card Spades _)           = LT
    (Card Diamonds _) `compare` (Card Spades _)         = LT
    (Card Clubs _) `compare` (Card Spades _)            = LT
    (Card Diamonds _) `compare` (Card Hearts _)         = LT
    (Card Clubs _) `compare` (Card Hearts _)            = LT

    -- suits already ordered, now orders according to rank
    (Card _ (Right court1)) `compare` (Card _ (Right court2))   = court1 `compare` court2
    (Card _ (Left pip1)) `compare` (Card _ (Left pip2))         = pip1 `compare` pip2
    (Card _ (Left _)) `compare` (Card _ (Right Ace))            = GT
    (Card _ (Right _)) `compare` (Card _ (Left _))              = GT

    -- all other orderings are false
    (Card _ _) `compare` (Card _ _)                     = LT



-- 4.5
play :: [Card] -> Card -> Maybe Card
play [] _       = Nothing
play (x:xs) y
    | x > y     = Just x
    | otherwise = play xs y