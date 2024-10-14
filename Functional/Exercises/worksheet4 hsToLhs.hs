import System.Environment


main :: IO()
main = do
    args <- getArgs
    hsToLhs (args!!0) (args!!1)


-- 1.1
helloWorld :: IO()
helloWorld = putStrLn "Hello, World!"

-- 1.2
greet :: IO()
greet = do
    name <- getLine
    putStrLn ("hello " ++ show name)

-- 1.3
greetFormally :: IO()
greetFormally = do
    putStrLn "What is your name?"
    name <- getLine
    putStrLn ("\nHello " ++ show name)

-- 1.4
getInt :: IO Int
getInt = do
    num <- getLine
    pure (read num :: Int)


-- 2.1          to fix
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