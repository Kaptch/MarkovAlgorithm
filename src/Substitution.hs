module Substitution where
data Substitution = Simple { left :: String, right :: String }
                       | Final  { left :: String, right :: String }
                       deriving Show
