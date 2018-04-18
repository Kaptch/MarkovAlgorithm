module Main where
import System.Environment
import Parser
import Apply
import Substitution
import Text.ParserCombinators.Parsec
import Control.Monad.State

main :: IO ()
main = do args <- getArgs
          case args of
              [] -> error "meh"
              [x] -> error "meh"
              (fname:word:_) -> do
                fileCont <- readFile fname
                let trySubs = parseSubstitutions fname fileCont in
                    case trySubs of
                        Left err -> putStr $ show err
                        Right subs -> evalStateT (runAlgo subs) word
