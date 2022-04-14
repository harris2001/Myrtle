{ 
module MyrtleParser where
import MyrtleLexer
import System.IO
import System.Environment
}

%name parseQuery
%tokentype { LangToken } 
%error { parseError }
%token 
  ','            { TokenComma _ }
  int            { TokenInt _ $$ }
  subj           { TokenSubj _ }
  pred           { TokenPred _ }
  obj            { TokenObj _ }
  true           { TokenTrue _ }
  false          { TokenFalse _ }
  '-l'           { TokenLJoin _ }
  '-r'           { TokenRJoin _ }
  '<'            { TokenLT _ }
  '>'            { TokenGT _ }
  deq            { TokenDEQ _ }
  '='            { TokenEQ _ }
  '+'            { TokenPlus _ }
  '-'            { TokenMinus _ }
  '*'            { TokenTimes _ }
  '/'            { TokenDiv _ }
  '^'            { TokenExp _ }
  '('            { TokenLParen _ }
  ')'            { TokenRParen _ }
  '['            { TokenLBrack _ }
  ']'            { TokenRBrack _ }
  string         { TokenString _ $$ }
  filename       { TokenFilename _ $$ }
  '|'            { TokenPipe _ }
  '?'            { TokenQuestion _ }
  ':'            { TokenColon _ }
  '_'            { TokenAll _ }
  filter         { TokenFilter _ }
  map            { TokenMap _ }
  union          { TokenUnion _ }
  join           { TokenJoin _ }
  where          { TokenWhere _ }
  and            { TokenAnd _ }
  or             { TokenOr _ }
  var            { TokenVar _ $$ }
  --
  '.'            {TokenDot _ }
  ';'            {TokenSemiColon _ }
  url            {TokenUrl _ $$ }
  unbasedUrl     {TokenUnbasedUrl _ $$ }
  unprefixedUrl  {TokenUnprefixedUrl _ $$ }
  prefix         {TokenPrefix _ }
  base           {TokenBase _ }
--   number        {TokenNumber _ $$}

%left "," ";" "."
%left '='
%left '+' '-' or
%left '*' '/' and
%left '^'
%left NEG 
%left deq
%% 

-- DONE --
-- A query has the following syntax:
-- fun1 "input.ttl" where var = ...
-- or
-- fun1 "input.ttl" | fun2 | fun3 where var = ...
Query : QueryWithFile                                       { NewQuery $1 }
      | QueryWithFile where CreateVars                      { WhereQuery $1 $3 }

-- DONE --
-- This is a separate rule because the input file is only put at the beginning
QueryWithFile : Func filename                              { FuncStack $1 $2}
              | Func filename '|' SimpleQuery              { FuncStackSeq $1 $2 $4}

-- DONE --
-- The following functions don't requrie an input file (unless the function is used to handle multiple files) 
SimpleQuery : Func                                          { FuncStackB $1 }              
            | Func '|' SimpleQuery                          { FuncStackBSeq $1 $3 }

-- DONE --
-- Create variables - Extra rule used to remove shift/reduce conflict
CreateVars : CreateVar                                      { UVarEnv $1 }
           | CreateVar  CreateVars                          { VarEnv $1 $2 }

-- DONE --
CreateVar : var '=' IntExp                                  { IntVar $1 $3 }
          | var '=' StringExp                               { StringVar $1 $3 }
          | var '=' BoolExp                                 { BoolVar $1 $3 }

-- Functions that return RDF Graphs are listed here
Func : filter '(' FilterEl ',' FilterEl ',' Literal ')'     { Filter $3 $5 $7 }
     | map '('Cond')'                                       { Map $3 }
     | union SList                                          { Union $2 }
     | join '('Node',' Node')' SList                        { NormalJoin $3 $5 $7 }
     | join JoinOption '('Node',' Node')' SList             { Join $2 $4 $6 $8 }
     
-- DONE
-- The parameters allowed in the filter function
FilterEl : '_'                                              { Any }
         | '[' UrlList ']'                                  { FilteredList $2 }

-- DONE
-- List of Url requested
UrlList : Url                                               { SimpleUrl $1 }
        | Url ',' UrlList                                   { UrlSeq $1 $3}

-- DONE --
-- The options of a join
JoinOption : '-r' '-l'                                      { BidirectJoin }
           | '-l' '-r'                                      { BidirectJoin }
           | '-l'                                           { LeftJoin }
           | '-r'                                           { RightJoin }

-- DONE --
-- List of strings
SList : '[' SListElem ']'                                   { StrList $2 }
      | filename                                            { StrListSingle $1 }

-- DONE --
SListElem : filename                                       { SListEl $1 }
          | filename ',' SListElem                         { SListSeq $1 $3 }     

-- Done
-- Conditions are used for the map function
Cond : Action                                                    { Always $1 }
     | Action ',' Action                                         { ActionSeq $1 $3 }
     | '('BoolExp')''?' Cond':'Cond                              { If $2 $5 $7 }

--DONE
-- Actions are executed when conditions are satisfied
Action : Subject '=' Url                                    { AssignSubj $1 $3 }
       | Predicate '=' Url                                  { AssignPred $1 $3 }
       | Object '=' Url                                     { AssignObjUrl $1 $3 }
       | Object '=' StringExp                               { AssignObjStr $1 $3 }
       | Object '=' IntExp                                  { AssignObjInt $1 $3 }
       | Object '=' BoolExp                                 { AssignObjBool $1 $3 }

-- Literal includes strings, integers, booleans, and the wildcard any (_)
Literal : '_'                                               { AnyLit }
        | IntExp                                            { IntLit $1 }
        | BoolExp                                           { BoolLit $1 }
        | StringExp                                         { StrLit $1 }

-- DONE --
-- Integer Expression
IntExp : IntExp '+' IntExp                   { PlusII $1 $3 }
       | Object '+' IntExp                   { PlusOI $1 $3 } 
       | IntExp '+' Object                   { PlusIO $1 $3 } 
       | Object '+' Object                   { PlusOO $1 $3 } 
       
       | IntExp '-' IntExp                   { MinusII $1 $3 }
       | Object '-' IntExp                   { MinusOI $1 $3 }
       | IntExp '-' Object                   { MinusIO $1 $3 }
       | Object '-' Object                   { MinusOO $1 $3 }
       
       | IntExp '*' IntExp                   { TimesII $1 $3 }
       | Object '*' IntExp                   { TimesOI $1 $3 }
       | IntExp '*' Object                   { TimesIO $1 $3 }
       | Object '*' Object                   { TimesOO $1 $3 }

       | IntExp '/' IntExp                   { DivII $1 $3 }
       | Object '/' IntExp                   { DivOI $1 $3 }
       | IntExp '/' Object                   { DivIO $1 $3 }
       | Object '/' Object                   { DivOO $1 $3 }

       | IntExp '^' IntExp                   { ExpoII $1 $3 }
       | Object '^' IntExp                   { ExpoOI $1 $3 }
       | IntExp '^' Object                   { ExpoIO $1 $3 }
       | Object '^' Object                   { ExpoOO $1 $3 }

       | '(' IntExp ')'                      { $2 } 
     --   | '(' Object ')'                      { $2 } 
       
       | '-' IntExp %prec NEG                { NegateI $2 } 
       | '-' Object %prec NEG                { NegateO $2 } 

       | int                                 { QInt $1 }
       | var                                 { IntVariable $1 }
       
-- DONE --
-- Boolean Expression
BoolExp : BoolExp and BoolExp                         { And $1 $3 }
        | BoolExp and Object                          { AndIO $1 $3 }
        | Object and BoolExp                          { AndOI $1 $3 }
        
        | BoolExp or BoolExp                          { Or $1 $3 }
        | BoolExp or Object                           { OrIO $1 $3 }
        | Object or BoolExp                           { OrOI $1 $3 }

        | IntExp '>' IntExp                           { GTII $1 $3 }
        | IntExp '>' Object                           { GTIO $1 $3 }
        | Object '>' IntExp                           { GTOI $1 $3 }

        | IntExp '<' IntExp                           { LTII $1 $3 }
        | IntExp '<' Object                           { LTIO $1 $3 }
        | Object '<' IntExp                           { LTOI $1 $3 }

        | IntExp deq IntExp                           { EQII $1 $3 }
        | BoolExp deq BoolExp                         { EQBB $1 $3 }
        | StringExp deq StringExp                     { EQSS $1 $3 }
        | Url deq Url                                 { EQUU $1 $3 }

        | Object deq IntExp                           { EQOI $1 $3 }
        | IntExp deq Object                           { EQIO $1 $3 }
        
        | Object deq StringExp                        { EQOS $1 $3 }
        | StringExp deq Object                        { EQSO $1 $3 }

        | Object deq BoolExp                          { EQOB $1 $3 }
        | BoolExp deq Object                          { EQBO $1 $3 }

        | Subject deq Url                             { EQSU $1 $3 }
        | Url deq Subject                             { EQUS $1 $3 }
        | Predicate deq Url                           { EQPU $1 $3 } 
        | Url deq Predicate                           { EQUP $1 $3 } 
        | Object deq Url                              { EQOU $1 $3 } 
        | Url deq Object                              { EQUO $1 $3 } 

        | '(' BoolExp ')'                             { $2 }
        
        | true                                        { QTrue }
        | false                                       { QFalse }

-- DONE --
-- String Expression
StringExp : string                                    { QString $1 }

-- DONE --
-- Types of nodes: Subject (subj), Predicate (pred), Object (obj)
Node : Subject                                        { S $1 } 
     | Predicate                                      { P $1 } 
     | Object                                         { O $1 }

-- DONE --
Subject : subj                                        { Subj }

-- DONE --
Predicate : pred                                      { Pred }

-- DONE --
Object : obj                                          { Obj }

-- DONE --
-- Creates a url data object
-- Url : url                                             { NewUrl $1 }










TTLGraph : TTLSubject PredicateObject               { Triplet $1 $2 }
    | base Url                                      { Base $2 }
    | prefix var ':' Url                            { Prefix $2 $4 }
    | TTLGraph '.' TTLGraph                         { Seq $1 $3 }
    | TTLGraph '.'                                  { $1 }

TTLSubject : Url                                    { Sbj $1 }

TTLPredicate : Url                                  { TTLPred $1 }

PredicateObject: TTLPredicate TTLObject                           { PredObj $1 $2 }
               | PredicateObject ';' PredicateObject           { PredObjList $1 $3 }    

TTLObject : Url                         { UrlObj $1 }
       | int                            { IntObj $1 }
       | '-' int                        { IntObj (-$2) }
       | true                           { TTLBoolObj True }
       | false                          { TTLBoolObj False }
       | string                         { StrObj $1 }
       | TTLObject ',' TTLObject        { ObjList $1 $3 }


Url : url                               { FinalUrl $1 }
    | unbasedUrl                        { BaseNeededUrl ("<@base:"++(tail $1))}
    | unprefixedUrl                     { PrefixNeededUrl ("<"++$1++">") }






{
parseError :: [LangToken] -> a

parseError ((TokenComma  (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenInt  (AlexPn _ l c) _ ) : xs) = error (printing l c)
parseError ((TokenSubj  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenPred  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenObj  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenTrue  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenFalse  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLJoin  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenRJoin  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLT  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenGT  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenDEQ  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenEQ  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenPlus (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenMinus (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenTimes (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenDiv (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenExp (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLParen (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenRParen (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLBrack (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenRBrack (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenString (AlexPn _ l c) _ ) : xs) = error (printing l c)
parseError ((TokenPipe (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenQuestion (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenColon (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenAll (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenFilter (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenMap (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenUnion(AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenJoin(AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenWhere (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenAnd (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenOr (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenVar (AlexPn _ l c) _ )  : xs) = error (printing l c)
--
parseError ((TokenDot (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenSemiColon (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenUnbasedUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenUnprefixedUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenTrue (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenFalse (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenPrefix (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenBase (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenNumber (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenFilename (AlexPn _ x y) _ ) : xs) = error (printing x y)

parseError [] = error "Missing output file"

printing x y = "Issue in row: "++show x ++ ", column:" ++ show y


-- A url datatype holds all three possible types of urls
-- Final, BaseNeeded and PrefixNeeded Url
data Url =  FinalUrl String | BaseNeededUrl String | PrefixNeededUrl String
    deriving Show

data TTLSubject = Sbj Url
    deriving Show

data TTLPredicate = TTLPred Url
    deriving Show

data TTLObject = UrlObj Url | IntObj Int | TTLBoolObj Bool | StrObj String | ObjList TTLObject TTLObject
    deriving Show

data PredicateObject = PredObj TTLPredicate TTLObject | PredObjList PredicateObject PredicateObject
    deriving Show

-- data Boolean = BTrue | BFalse
--     deriving Show

data TTLGraph = Triplet TTLSubject PredicateObject
         | Base Url
         | Prefix String Url
         | Seq TTLGraph TTLGraph
      deriving Show







data Subject = Subj
     deriving Show

data Predicate = Pred
     deriving Show

data Object =  Obj 
     deriving Show

data Node = S Subject | P Predicate | O Object
     deriving Show

data StringExp = QString String
     deriving Show
     
-- TODO: add IntVariable & IntObj to doc
data IntExp = PlusII IntExp IntExp | PlusOI Object IntExp | PlusIO IntExp Object | PlusOO Object Object |
              MinusII IntExp IntExp | MinusOI Object IntExp | MinusIO IntExp Object | MinusOO Object Object |
              TimesII IntExp IntExp | TimesOI Object IntExp | TimesIO IntExp Object | TimesOO Object Object |
              DivII IntExp IntExp | DivOI Object IntExp | DivIO IntExp Object | DivOO Object Object |
              ExpoII IntExp IntExp | ExpoOI Object IntExp | ExpoIO IntExp Object | ExpoOO Object Object |
              QInt Int |
              NegateI IntExp | NegateO Object |
              IntVariable String
     deriving Show
     
-- TODO change Nodes in doc
data BoolExp = And BoolExp BoolExp | AndIO BoolExp Object | AndOI Object BoolExp
             | Or BoolExp BoolExp | OrIO BoolExp Object | OrOI Object BoolExp
             | GTII IntExp IntExp | GTIO IntExp Object | GTOI Object IntExp 
             | LTII IntExp IntExp | LTIO IntExp Object | LTOI Object IntExp
             | EQII IntExp IntExp | EQBB BoolExp BoolExp | EQSS StringExp StringExp | EQUU Url Url
             | EQOS Object StringExp | EQSO StringExp Object
             | EQOI Object IntExp | EQIO IntExp Object
             | EQOB Object BoolExp | EQBO BoolExp Object
             | EQSU Subject Url | EQUS Url Subject
             | EQPU Predicate Url | EQUP Url Predicate
             | EQOU Object Url | EQUO Url Object
             | BoolVariable BoolExp | BoolObj Object
             | QTrue | QFalse
     deriving Show
     
data SList = StrList SListElem | StrListSingle String
     deriving Show
     
data SListElem = SListEl String | SListSeq String SListElem
     deriving Show
     
data CreateVar = IntVar String IntExp | BoolVar String BoolExp | StringVar String StringExp
     deriving Show
     
data CreateVars = UVarEnv CreateVar | VarEnv CreateVar CreateVars
     deriving Show
     
data Query = NewQuery QueryWithFile | WhereQuery QueryWithFile CreateVars
     deriving Show
     
data QueryWithFile = FuncStack Func String | FuncStackSeq Func String SimpleQuery
     deriving Show
     
data SimpleQuery = FuncStackB Func | FuncStackBSeq Func SimpleQuery
     deriving Show

data Cond = Always Action | ActionSeq Action Action | If BoolExp Cond Cond
     deriving Show

data Action = AssignSubj Subject Url | AssignPred Predicate Url | AssignObjUrl Object Url 
            | AssignObjStr Object StringExp | AssignObjInt Object IntExp | AssignObjBool Object BoolExp
     deriving Show
     
data JoinOption = BidirectJoin | LeftJoin | RightJoin
     deriving Show

-- data Url = NewUrl String
--      deriving Show

data UrlList = SimpleUrl Url | UrlSeq Url UrlList
     deriving Show

data FilterEl = Any | FilteredList UrlList
     deriving Show

data Literal = IntLit IntExp | BoolLit BoolExp | StrLit StringExp | AnyLit
     deriving Show

data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter FilterEl FilterEl Literal
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
modifyPredObj (PredObj (TTLPred p) obj) b ps = (PredObj(TTLPred(rebaseUrl p b ps))(modifyObj obj b ps))
modifyPredObj (PredObjList p1 p2) b ps = (PredObjList (modifyPredObj p1 b ps) (modifyPredObj p2 b ps))


-- Rebases Objects (only changes urlObj)
modifyObj :: TTLObject -> TTLGraph -> [TTLGraph] -> TTLObject
modifyObj (ObjList obj1 obj2) b ps = (ObjList (modifyObj obj1 b ps)(modifyObj obj2 b ps))
modifyObj (UrlObj url) b ps = (UrlObj (rebaseUrl url b ps))
modifyObj u b ps = u


main :: IO()
main = do 
        file <- getArgs
        contents <- readFile (head file)
        let tokens = alexScanTokens contents
        print(tokens)
        let expression = parseQuery tokens
        print(expression)
        parseGraph(expression)
}

-- parseGraph :: Query -> String

-- parseGraph


-- main :: IO()
-- main = do 
--         contents <- readFile "foo.ttl"
--         let tokens = alexScanTokens contents
--         print(tokens)
--         let expression = parseQuery tokens
--         print(expression)
        -- print(head(getExp (modify expression (Base(FinalUrl "")) []) 1))
-- } 
------------------------------------------------------------------------------------------
