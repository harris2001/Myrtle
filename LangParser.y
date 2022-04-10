{ 
module LangGrammar where 
import LangTokens

-- import RDF_Lexer
import RDF_Parser

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
  '|'            { TokenPipe _ }
  '?'            { TokenQuestion _ }
  ':'            { TokenColon _ }
  '_'            { TokenAll _ }
  filter         { TokenFilter _ }
  map            { TokenMap _ }
  union          { TokenUnion _ }
  join           { TokenJoin _ }
  where          { TokenWhere _ }
  url            { TokenUrl _ $$ }
  and            { TokenAnd _ }
  or             { TokenOr _ }
  var            { TokenVar _ $$ }

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
QueryWithFile : Func StringExp                              { FuncStack $1 $2}
              | Func StringExp '|' SimpleQuery              { FuncStackSeq $1 $2 $4}

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
      | StringExp                                           { StrListSingle $1 }

-- DONE --
SListElem : StringExp                                       { SListEl $1 }
          | StringExp ',' SListElem                         { SListSeq $1 $3 }     

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
     -- TODO: ADD VAR IN BOOL EXP
     --    | var                                         { BoolVariable }
     --    | Object                                      { BoolObj }

-- DONE --
-- String Expression
StringExp : string                                    { QString $1 }
          -- TODO: ADD VAR IN STRING EXP
          -- | var                                       { StrVariable }

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
Url : url                                             { NewUrl $1 }



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
parseError ((TokenUrl (AlexPn _ l c)_) : xs) = error (printing l c)
parseError ((TokenOr (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenVar (AlexPn _ l c) _ )  : xs) = error (printing l c)

parseError [] = error "Missing output file"


printing x y = "Issue in row: "++show x ++ ", column:" ++ show y

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
     
data SList = StrList SListElem | StrListSingle StringExp
     deriving Show
     
data SListElem = SListEl StringExp | SListSeq StringExp SListElem
     deriving Show
     
data CreateVar = IntVar String IntExp | BoolVar String BoolExp | StringVar String StringExp
     deriving Show
     
data CreateVars = UVarEnv CreateVar | VarEnv CreateVar CreateVars
     deriving Show
     
data Query = NewQuery QueryWithFile | WhereQuery QueryWithFile CreateVars
     deriving Show
     
data QueryWithFile = FuncStack Func StringExp | FuncStackSeq Func StringExp SimpleQuery
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

data Url = NewUrl String
     deriving Show

data UrlList = SimpleUrl Url | UrlSeq Url UrlList
     deriving Show

data FilterEl = Any | FilteredList UrlList
     deriving Show

data Literal = IntLit IntExp | BoolLit BoolExp | StrLit StringExp | AnyLit
     deriving Show

data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter FilterEl FilterEl Literal
     deriving Show     


main :: IO()

main = do 
        file <- getArgs
        contents <- readFile (head file)
        let tokens = alexScanTokens contents
     --    print(tokens)
        let expression = parseQuery tokens
        print(expression)
} 