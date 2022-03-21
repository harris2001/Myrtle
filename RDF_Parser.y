{ 
module PDF_Parser where 
import PDF_Lexer 
import System.IO
import System.Environment
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
  forward       { TokenForward p}
  backward      { TokenBackward p }
  left          { TokenLeft p }
  right         { TokenRight p }
  obstacle      { TokenObstacle p }
  otherwise     { TokenOtherwise p }
  steps         { TokenSteps p $$ }

%% 
Exp : obstacle steps Exp otherwise Exp        { Obstacle $2 $3 $5} 
    | forward steps Exp                       { Go_Forward $2 $3 }
    | backward steps Exp                      { Go_Backward $2 $3 }
    | right Exp                               { Turn_Right $2 }
    | left Exp                                { Turn_Left $2 }
    | FinalExp                                { FinalExp $1}
    
FinalExp :  forward steps                     { Go_Forward_Stop $2 }
          | backward steps                    { Go_Backward_Stop $2 }
          | right                             { Turn_Right_Stop }
          | left                              { Turn_Left_Stop }
{ 
parseError :: [Token] -> a
parseError ((TokenForward (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenBackward (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenLeft (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenRight (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenObstacle (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenOtherwise (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenSteps (AlexPn _ x y) _ ) : xs) = error (printing x y)

printing x y = "Issue in row: "++show x ++ ", column:" ++ show y

data AST = Obstacle Int AST AST
         | Go_Forward Int AST 
         | Go_Backward Int AST
         | Turn_Right AST
         | Turn_Left AST
         | FinalExp AST
         | Go_Forward_Stop Int 
         | Go_Backward_Stop Int
         | Turn_Right_Stop
         | Turn_Left_Stop
         deriving Show 

main :: IO()
main = do 
        contents <- readFile "game.txt"
        let tokens = alexScanTokens contents
        let expression = parseCalc tokens
        print(expression)
} 