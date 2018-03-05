module Parser where
import Text.ParserCombinators.Parsec

{-
Grammar:
    <left>->[.]<right>

    ab\to a,\\
    b\to\varepsilon,\\
    a\to b;

    ab\to a,\\
    b\tof\varepsilon,\\
    a\to b;

Output example:
    0 \xtod{(ж)} a0 \xtod{(г)}0a \xtod{(е)}0b\xtod{(а)}1\\
-}

eol :: GenParser Char st String
eol = string ";" <|> string ",\\"

word :: GenParser Char st String
word = many $ noneOf "->."
{-
substitutionType :: GenParser Char st String
substitutionType = try

substitution :: GenParser Char st [[String]]
substitution = do result <- many line
                  eof
                  return result

line :: GenParser Char st [String]
line = do left <- word

          right <- word
-}
