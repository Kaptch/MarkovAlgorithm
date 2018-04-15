module Parser where
import Text.ParserCombinators.Parsec

data Substitution = Simple { left :: String, right :: String }
                       | Final  { left :: String, right :: String }

{-
Grammar:
    <left> ->[.] <right>
-}

eol :: GenParser Char st Char
eol = char '\n'

substitutionFile :: GenParser Char st [Substitution]
substitutionFile =
    do result <- many line
       eof
       return result

simpleSubstitution :: GenParser Char st Substitution
simpleSubstitution =
    do lt <- many $ noneOf "-"
       arr <- string "->"
       rt <- many $ noneOf ",\n"
       eol
       return $ Simple lt rt

finalSubstitution :: GenParser Char st Substitution
finalSubstitution =
    do lt <- many $ noneOf "-"
       arr <- string "->."
       rt <- many $ noneOf ",\n"
       eol
       return $ Final lt rt

line :: GenParser Char st Substitution
line = try finalSubstitution <|> simpleSubstitution

parseSubstitutions :: String -> Either ParseError [Substitution]
parseSubstitutions = parse substitutionFile "(unknown)"
