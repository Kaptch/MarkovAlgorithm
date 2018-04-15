module Apply where
import Substitution
import Control.Monad.State
import Data.List

replaceOnce :: String -> String -> String -> String
replaceOnce _ _ [] = []
replaceOnce sb rplmt str@(x:xs) = if sb `isPrefixOf` str
    then rplmt ++ drop (length sb) str
    else x : replaceOnce sb rplmt xs

findSubs :: [Substitution] -> String -> Substitution
findSubs (x:xs) str = undefined

apply :: [Substitution] -> StateT String IO ()
apply l =
    do st <- get
       liftIO $ print st

       return ()
