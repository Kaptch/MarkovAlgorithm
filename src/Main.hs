module Main where
import System.Environment
import Parser
import Apply
import Substitution
import Text.ParserCombinators.Parsec
import Control.Monad.State

usage :: IO ()
usage = do
    putStrLn "usage: <filename> <input word>"
    putStrLn "  substitution file should consist of lines: <left>->[.]<right>"

emptyWord :: String
emptyWord = "//"

makeEmptyStr :: String -> String
makeEmptyStr s = if s == emptyWord then "" else s

makeEmptySub :: Substitution -> Substitution
makeEmptySub (Simple l r) = Simple (makeEmptyStr l) (makeEmptyStr r)
makeEmptySub (Final l r) = Final (makeEmptyStr l) (makeEmptyStr r)

makeEmptyList :: [Substitution] -> [Substitution]
makeEmptyList = map makeEmptySub

main :: IO ()
main = do args <- getArgs
          case args of
              [] -> usage
              [x] -> usage
              (fname:word:_) -> do
                fileCont <- readFile fname
                let trySubs = parseSubstitutions fname fileCont in
                    case trySubs of
                        Left err -> putStr $ show err
                        Right subs -> evalStateT (runAlgo (makeEmptyList subs)) word
