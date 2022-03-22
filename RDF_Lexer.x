{ 
module PDF_Lexer where 
import System.IO
import System.Environment   
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]
-- alphabetic characters


tokens :-
$white+       ; 
  "."                     { \p s -> TokenDot p }
  ":"                     { \p s -> TokenColon p }
  ","                     { \p s -> TokenComa p }
  ";"                     { \p s -> TokenSemiColon p }
  \"$alpha+\"             { \p s -> TokenString p s }
  "<"("http://"|"https://")?[\. \/ \# $alpha $digit]*">"    { \p s -> TokenUrl p s }
  "true"                    { \p s -> TokenTrue p }
  "false"                   { \p s -> TokenFalse p }
  "@prefix"               { \p s -> TokenPrefix p }
  [\+\-]?$digit+          { \p s -> TokenNumber p (read s) }
{
-- Each action has type ::  AlexPosn -> String -> Token 
-- The token type: 

data Token = 
      TokenDot AlexPosn               |
      TokenColon AlexPosn             |
      TokenComa AlexPosn              |
      TokenSemiColon AlexPosn         |
      TokenString AlexPosn String     |
      TokenUrl AlexPosn String        |
      TokenTrue AlexPosn              |
      TokenFalse AlexPosn             |
      TokenPrefix AlexPosn            |
      TokenNumber AlexPosn Int
  deriving (Eq,Show) 

-- BNF GRAMMAR --
-- forward n | backward n | left | right | obstacle n | otherwise
main :: IO()
main = do 
        contents <- readFile "game.txt"
        let tokens = alexScanTokens contents
        print(tokens)
} 
