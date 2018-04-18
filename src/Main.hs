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
                        Right subs -> evalStateT (runAlgo subs) word
