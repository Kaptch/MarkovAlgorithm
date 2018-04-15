module Main where
import System.Environment
import Parser
import Apply
import Substitution
import Text.ParserCombinators.Parsec

main :: IO ()
main = do fname <- getArgs
          case fname of
              [] -> error "meh"
              [x] -> error "meh"
              [fname, word] -> print $ parseSubstitutions "dfdg->fdf\naaa->.dfdf\n"
                               {-
                               scheme <- parseFromFile parseScheme fname
                               -}
