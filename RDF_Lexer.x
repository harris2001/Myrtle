{ 
module PDF_Lexer where 
import System.IO
import System.Environment   
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [\+\-]?    
-- alphabetic characters

tokens :-
$white+       ; 
  "--".*        ; 
  "forward"       { \p s -> TokenForward p}
  "backward"      { \p s -> TokenBackward p }
  "left"          { \p s -> TokenLeft p }
  "right"         { \p s -> TokenRight p }
  "obstacle"      { \p s -> TokenObstacle p}
  "otherwise"     { \p s -> TokenOtherwise p}
  $digit+         { \p s -> TokenSteps p (read s) }
{
-- Each action has type ::  AlexPosn -> String -> Token 
-- The token type: 

data Token = 
    TokenForward AlexPosn        |
    TokenBackward AlexPosn       |
    TokenLeft AlexPosn           |
    TokenRight AlexPosn          |
    TokenObstacle AlexPosn       |
    TokenOtherwise AlexPosn      |
    TokenSteps AlexPosn Int
  deriving (Eq,Show) 

-- BNF GRAMMAR --
-- forward n | backward n | left | right | obstacle n | otherwise
main :: IO()
main = do 
        contents <- readFile "game.txt"
        let tokens = alexScanTokens contents
        print(tokens)
} 
