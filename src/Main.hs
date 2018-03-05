module Main where
import System.Environment
import Parser
import Apply

main :: IO ()
main = do fname <- getArgs
          case fname of
              [] -> error "meh"
              x:[] -> error "meh"
              fname:word:[] -> putStrLn (fname ++ " " ++ word)
                               {-
                               scheme <- parseFromFile parseScheme fname
                               
                               -}
