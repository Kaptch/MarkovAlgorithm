module Apply where
import Substitution
import Data.List
import Control.Monad.State

replaceOnce :: String -> String -> String -> String
replaceOnce _ _ [] = []
replaceOnce sb rplmt str@(x:xs) = if sb `isPrefixOf` str
    then rplmt ++ drop (length sb) str
    else x : replaceOnce sb rplmt xs

indexAndSub :: String -> [Substitution] -> Maybe (Substitution, Int)
indexAndSub el l = help el l 0
    where
        help a [] index = Nothing
        help a (x:xs) index = if isSubstr then Just (x, index) else help a xs (index+1)
            where
                isSubstr = left x `isInfixOf` a

runAlgo :: [Substitution] -> StateT String IO ()
runAlgo subs = do
    st <- get
    liftIO $ putStr st
    let sub = indexAndSub st subs in
        case sub of
            Nothing -> liftIO $ putStrLn " - no substitutions"
            Just (Final l r, i) -> liftIO $ putStrLn $ " ->. " ++ replaceOnce l r st ++ " (" ++ show i ++ ")"
            Just (Simple l r, i) -> liftIO (putStrLn $ " -> " ++ newSt ++ " (" ++ show i ++ ")")
                >> put newSt
                >> runAlgo subs
                where
                    newSt = replaceOnce l r st
