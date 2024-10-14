import System.Environment
import System.Random


main :: IO ()
main = do
    echoArgs


-- 1.1
helloWorld :: IO ()
helloWorld = putStrLn "Hello, World!"

-- 1.2
greet :: IO ()
greet = do
    name <- getLine
    putStrLn ("hello " ++ show name)

-- 1.3
greetFormally :: IO ()
greetFormally = do
    putStrLn "What is your name?"
    name <- getLine
    putStrLn ("\nHello " ++ show name)

-- 1.4
getInt :: IO Int
getInt = do
    num <- getLine
    pure (read num :: Int)


-- 2.1
addLineStart :: [String] -> [String]
addLineStart []         = []
addLineStart  (x:xs)    = ["> " ++ x] ++ addLineStart xs

-- 2.2
addLineStartToContents :: String -> String
addLineStartToContents contents = 
    unlines $ addLineStart $ lines contents

-- 2.3
hsToLhs :: FilePath -> FilePath -> IO ()
hsToLhs read write = do
    oriContents <- readFile read
    writeFile write (addLineStartToContents oriContents)


-- 3.2
echoArgs :: IO ()
echoArgs = do
    args <- getArgs
    print $ unwords args


-- 4.1
playRound :: Int -> IO ()
playRound num = do
    putStrLn "Enter a guess: "
    guess <- getInt

    if (guess == num) then putStrLn "Wahoo! You got it right!"
    else if (guess < num) then do
        putStrLn "Too low. Try again."
        playRound num
    else do
        putStrLn "Too high. Try again."
        playRound num

-- 4.2
dice :: Int -> IO Int
dice n = do
    random <- randomIO
    pure (mod random n)

-- 4.3
game :: Int -> IO ()
game difficulty = do
    n <- dice difficulty
    playRound n