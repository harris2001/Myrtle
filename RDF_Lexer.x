{ 
module RDF_Lexer where 
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
  "+"                     ; --Maybe we need to create a token for this / We'll se later
  \"[$alpha $digit]+\"             { \p s -> TokenString p s }
  "<"(http\:\/\/|https\:\/\/)[\. \/ \# $alpha $digit]*">"    { \p s -> TokenUrl p s }
  "<"[\. \/ \# $alpha $digit]*">"    { \p s -> TokenUnbasedUrl p s }
  $alpha[$alpha $digit]*:[$alpha $digit]+    { \p s -> TokenUnprefixedUrl p s }
  "true"                  { \p s -> TokenTrue p }
  "false"                 { \p s -> TokenFalse p }
  $alpha+                 { \p s -> TokenVariable p s }
  "@prefix"               { \p s -> TokenPrefix p }
  "@base"                 { \p s -> TokenBase p }
  "-"?$digit+             { \p s -> TokenNumber p (read s)}
{
-- Each action has type ::  AlexPosn -> String -> Token 
-- The token type: 

data Token =    
      TokenDot AlexPosn                  |
      TokenColon AlexPosn                |
      TokenComa AlexPosn                 |
      TokenSemiColon AlexPosn            |
      TokenString AlexPosn String        |
      TokenVariable AlexPosn String      |
      TokenUrl AlexPosn String           |
      TokenUnbasedUrl AlexPosn String    |
      TokenUnprefixedUrl AlexPosn String |
      TokenTrue AlexPosn                 |
      TokenFalse AlexPosn                |
      TokenPrefix AlexPosn               |
      TokenBase AlexPosn                 |
      TokenNumber AlexPosn Int
  deriving (Eq,Show) 

-- main :: IO()
-- main = do 
--         contents <- readFile "game.txt"
--         let tokens = alexScanTokens contents
--         print(tokens)
-- } 