module KatamariHaskacy where

main :: IO ()
main = do
    cmd <- getLine
    putStrLn ("Your input was: " ++ cmd)
    case cmd of 
        "look"  -> putStrLn ("You are trying to look.")
        "quit"  -> putStrLn ("Noooooo don't go don't leave")
        _       -> putStrLn ("Unrecognized input.")             -- catch all statement