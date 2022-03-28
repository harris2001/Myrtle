{ 
module RDF_Parser where 
import RDF_Lexer 
import System.IO
import System.Environment
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
  "."           {TokenDot _ }
  ":"           {TokenColon _ }
  ","           {TokenComa _ }
  ";"           {TokenSemiColon _ }
  string        {TokenString _ $$ }
  variable      {TokenVariable _ $$ }
  url           {TokenUrl _ $$ }
  unbasedUrl    {TokenUnbasedUrl _ $$ }
  unprefixedUrl {TokenUnprefixedUrl _ $$ }
  true          {TokenTrue _ }
  false         {TokenFalse _ }
  prefix        {TokenPrefix _ }
  base          {TokenBase _ }
  number        {TokenNumber _ $$}

%% 

Exp : Subject PredicateObject                    { Triplet $1 $2 }
    | base Url                                   { Base $2 }
    | prefix variable ":" Url                    { Prefix $2 $4 }
    | Exp "." Exp                                { Seq $1 $3 }

Subject : Url                                    { Sbj $1 }

Predicate : Url                                  { Pred $1 }

PredicateObject: Predicate Object                                 { PredObj $1 $2 }
               | PredicateObject ";" PredicateObject        { PredObjList $1 $3 }    

Object : Url                            { UrlObj $1 }
       | number                         { IntObj $1 }
       | Boolean                        { BoolObj $1 }
       | string                         { StrObj $1 }
       | Object "," Object              { ObjList $1 $3 }

Boolean : true                          { BTrue }
        | false                         { BFalse }

Url : url                               { FinalUrl $1 }
    | unbasedUrl                        { BaseNeededUrl ("<@base:"++(tail $1))}
    | unprefixedUrl                     { PrefixNeededUrl ("<"++$1++">") }

{
-- ParseError function is used (mostly) for debugging purposes
-- Indicates the row/colum where an error occurs
parseError :: [Token] -> a
parseError ((TokenDot (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenColon (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenComa (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenSemiColon (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenString (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenVariable (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenUnbasedUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenUnprefixedUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenTrue (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenFalse (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenPrefix (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenBase (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenNumber (AlexPn _ x y) _ ) : xs) = error (printing x y)

printing x y = "Issue in row: "++show x ++ ", column:" ++ show y


-- A url datatype holds all three possible types of urls
-- Final, BaseNeeded and PrefixNeeded Url
data Url =  FinalUrl String | BaseNeededUrl String | PrefixNeededUrl String
    deriving Show

data Subject = Sbj Url
    deriving Show

data Predicate = Pred Url
    deriving Show

data Object = UrlObj Url | IntObj Int | BoolObj Boolean | StrObj String | ObjList Object Object
    deriving Show

data PredicateObject = PredObj Predicate Object | PredObjList PredicateObject PredicateObject
    deriving Show

data Boolean = BTrue | BFalse
    deriving Show

data Exp = Triplet Subject PredicateObject
         | Base Url
         | Prefix String Url
         | Seq Exp Exp
      deriving Show

-- Takes a Url, the base url and the list of prefixes and return the reformed url
-- modify :: Url Base [Prefix] -> Url
-- modify (Triplet:exp) = 

main :: IO()
main = do 
        contents <- readFile "game.txt"
        let tokens = alexScanTokens contents
        -- print(tokens)
        let expression = parseCalc tokens
        print(expression)
} 