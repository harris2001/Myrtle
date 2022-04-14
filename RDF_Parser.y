{ 
module RDF_Parser where 
import RDF_Lexer 
import System.IO
import System.Environment
}

%name parserTurtle 
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

%left "," ";" "."
%% 

TTLGraph : Subject PredicateObject                    { Triplet $1 $2 }
    | base Url                                   { Base $2 }
    | prefix variable ":" Url                    { Prefix $2 $4 }
    | TTLGraph "." TTLGraph                                { Seq $1 $3 }
    | TTLGraph "."                                    { $1 }

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

data TTLGraph = Triplet Subject PredicateObject
         | Base Url
         | Prefix String Url
         | Seq TTLGraph TTLGraph
      deriving Show

-- Returns the string value of the Url datatype
getUrl ::  Url -> String
getUrl (FinalUrl u) = u
getUrl (BaseNeededUrl u) = u
getUrl (PrefixNeededUrl u) = u

-- Takes a Url, the base url and the list of prefixes and return the reformed url
rebaseUrl :: Url -> TTLGraph -> [TTLGraph] -> Url
rebaseUrl (FinalUrl url) _ _ = FinalUrl url
rebaseUrl (BaseNeededUrl url) (Base (FinalUrl base)) _ = FinalUrl ("<"++tail (takeWhile('>'/=) base)++(tail (dropWhile(':'/=)url)))
rebaseUrl (PrefixNeededUrl url) _ [] = error "No more prefixes found to unpack"
rebaseUrl u@(PrefixNeededUrl url) b@(Base (FinalUrl base)) ps@((Prefix prefix (FinalUrl mapping)):p@prefixes) | prefix == (tail(takeWhile(':'/=) url)) = FinalUrl ("<"++tail (takeWhile('>'/=)mapping)++(tail (dropWhile(':'/=)url)))
                                                                                                              | otherwise = rebaseUrl u b p
rebaseUrl u b ps = error "(getUrl u)"
--f = rebaseUrl (PrefixNeededUrl "p:asgasg") (Base (FinalUrl "https://test/t/")) [Prefix "p" (FinalUrl "<http://www.cw.org/qprefix/>")]

-- Replaces all the occurences of Url in an TTLGraph datatype
modify :: TTLGraph -> TTLGraph -> [TTLGraph] -> (TTLGraph, TTLGraph, [TTLGraph])
modify (Base base) b ps = (Base base, Base base, ps)
modify pref@(Prefix s u@(FinalUrl url)) b ps = ((Prefix s u), b, (ps++[pref]))
modify pref@(Prefix s url) b ps = ((Prefix s uu), b, (ps++[Prefix s uu]))
    where uu = (rebaseUrl url b ps)
modify (Triplet (Sbj subj) predObj) b ps = ((Triplet (Sbj (rebaseUrl subj b ps)) (modifyPredObj predObj b ps)), b, ps)
modify (Seq exp1 exp2) b ps = ((Seq exp11 exp22), base2, prefixes2)
            where e1 = getExp (modify exp1 b ps)
                  exp11 = head (e1 1)
                  base1 = head (e1 2)
                  prefixes1 = e1 3
                  e2 = (getExp (modify exp2 base1 prefixes1))
                  exp22 = head (e2 1)
                  base2 = head (e2 2)
                  prefixes2 = e2 3
-- modify exp p ps = exp p ps

getExp :: (TTLGraph, TTLGraph, [TTLGraph]) -> Int -> [TTLGraph]
getExp (exp, base, prefixes) option | option==1 = [exp]
                                    | option==2 = [base]
                                    | option==3 = prefixes
                                    | otherwise = error "Invalid option"

-- Applies the modify function to PredicateObject datatype
modifyPredObj :: PredicateObject -> TTLGraph -> [TTLGraph] -> PredicateObject
modifyPredObj (PredObj (Pred p) obj) b ps = (PredObj(Pred(rebaseUrl p b ps))(modifyObj obj b ps))
modifyPredObj (PredObjList p1 p2) b ps = (PredObjList (modifyPredObj p1 b ps) (modifyPredObj p2 b ps))


-- Rebases Objects (only changes urlObj)
modifyObj :: Object -> TTLGraph -> [TTLGraph] -> Object
modifyObj (ObjList obj1 obj2) b ps = (ObjList (modifyObj obj1 b ps)(modifyObj obj2 b ps))
modifyObj (UrlObj url) b ps = (UrlObj (rebaseUrl url b ps))
modifyObj u b ps = u


main :: IO()
main = do 
        contents <- readFile "foo.ttl"
        let tokens = alexScanTokens contents
        -- print(tokens)
        let expression = parserTurtle tokens
        -- print(expression)
        print(head(getExp (modify expression (Base(FinalUrl "")) []) 1))
} 