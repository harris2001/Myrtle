{ 
module MyrtleParser where
import MyrtleLexer
import System.IO
import System.Environment

import Data.List
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
  ';'            { TokenSemiColon _ }
  filter         { TokenFilter _ }
  map            { TokenMap _ }
  union          { TokenUnion _ }
  join           { TokenJoin _ }
  where          { TokenWhere _ }
  and            { TokenAnd _ }
  or             { TokenOr _ }
  var            { TokenVar _ $$ }
  url            { TokenUrl _ $$ }
  add            { TokenAdd _ }
  length         { TokenLength _ }
  startsWith     { TokenStarts _ }

%left ';'
%right var
%left '='
%left '+' '-' or
%left '*' '/' and
%left '^'
%left NEG 
%left deq
%right '>'
%% 

-- DONE --
-- Is the entry point of the myrtle script
-- The user can choose to either print the output of his/her query or save it in a file
Query : filename '|' FilteredQuery '>''>' filename          { WriteQuery $1 $3 $6 }
      | filename '|' FilteredQuery                          { OutputQuery $1 $3 }
      | Query ';' Query                                     { QuerySeq $1 $3 }

-- DONE --
-- Is a basic query with an optional where clause
FilteredQuery : BasicQuery                                  { NewQuery $1 }
              | BasicQuery where CreateVars                 { WhereQuery $1 $3 }

-- DONE --
-- The following functions don't requrie an input file (unless the function is used to handle multiple files) 
BasicQuery : Func                                           { FuncStack $1 }              
           | Func '|' BasicQuery                            { FuncStackSeq $1 $3 }

-- DONE --
-- Create variables - Extra rule used to remove shift/reduce conflict
CreateVars : CreateVar                                      { UVarEnv $1 }
           | CreateVar  CreateVars                          { VarEnv $1 $2 }

-- DONE --
CreateVar : var '=' IntExp                                  { IntVar $1 $3 }
          | var '=' StringExp                               { StringVar $1 $3 }
          | var '=' BoolExp                                 { BoolVar $1 $3 }
          | var '=' Url                                     { UrlVar $1 $3 }
-- Functions that return RDF Graphs are listed here
Func : filter Combinations                                  { Filter $2 }
     | map '('Cond')'                                       { Map $3}
     | union SList                                          { Union $2 }
     | join JoinOption '('Node',' Node')' SList             { Join $2 $4 $6 $8 }
     | add '(' Url ',' Url ',' Literal ')'                  { AddTripSPO $3 $5 $7 }
     
Combinations : '(' FilterEl ',' FilterEl ',' LiteralList ')'   { TTLComb $2 $4 $6 }
             | '['CombinationLst']'                            { TTLCombs $2 }

CombinationLst : '(' FilterEl ',' FilterEl ',' LiteralList ')'                       { SingleFilter $2 $4 $6 }
               | '(' FilterEl ',' FilterEl ',' LiteralList ')' ',' CombinationLst    { FilterSeq $2 $4 $6 $9 }

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
SListElem : filename                                        { SListEl $1 }
          | filename ',' SListElem                          { SListSeq $1 $3 }     

-- Done
-- Conditions are used for the map function
Cond : Action                                               { Always $1 }
     | Action ',' Cond                                      { ActionSeq $1 $3 }
     | '('BoolExp')''?' Cond':'Cond                         { If $2 $5 $7 }

--DONE
-- Actions are executed when conditions are satisfied
Action : Subject '=' Url                                    { AssignSubj $1 $3 }
       | Predicate '=' Url                                  { AssignPred $1 $3 }
       | Object '=' Url                                     { AssignObjUrl $1 $3 }
       | Object '=' StringExp                               { AssignObjStr $1 $3 }
       | Object '=' IntExp                                  { AssignObjInt $1 $3 }
       | Object '=' BoolExp                                 { AssignObjBool $1 $3 }
       | add '(' Url ',' Url ',' Literal ')'                { AddSPO $3 $5 $7 }
       | add '(' subj ',' Url ',' Literal ')'               { AddPO $5 $7 }
       | add '(' Url ',' pred ',' Literal ')'               { AddSO $3 $7 }
       | add '(' Url ',' Url ',' obj ')'                    { AddSP $3 $5 }
       | add '(' Url ',' pred ',' obj ')'                   { AddS $3 }
       | add '(' subj ',' Url ',' obj ')'                   { AddP $5 }
       | add '(' subj ',' pred ',' Literal ')'              { AddO $7 }
       | add '(' subj ',' pred ',' obj ')'                  { Add }
       | '(' Action ')'                                     { $2 }

-- Literal includes strings, integers, booleans, and the wildcard any (_)
Literal : IntExp                                        { IntLit $1 }
        | BoolExp                                       { BoolLit $1 }
        | StringExp                                     { StrLit $1 }
        | Url                                           { UrlLit $1 }

LiteralList : '_'                                       { AnyLit }
            | '[' LiteralElems ']'                      { LiteralLst $2 }

LiteralElems : Literal                                  { SingleLit $1 }
             | Literal ',' LiteralElems                 { LiteralSeq $1 $3 }

-- DONE --
-- Integer Expression
IntExp : IntExp '+' IntExp                   { PlusII $1 $3 }
       | Object '+' IntExp                   { PlusOI $1 $3 } 
       | IntExp '+' Object                   { PlusIO $1 $3 } 
       | Object '+' Object                   { PlusOO $1 $3 }
       | var '+' Object                      { PlusVO $1 $3 }
       | Object '+' var                      { PlusOV $1 $3 }
       | var '+' IntExp                      { PlusVI $1 $3 }
       | IntExp '+' var                      { PlusIV $1 $3 }
       | var '+' var                         { PlusVV $1 $3 }
       
       | IntExp '-' IntExp                   { MinusII $1 $3 }
       | Object '-' IntExp                   { MinusOI $1 $3 }
       | IntExp '-' Object                   { MinusIO $1 $3 }
       | Object '-' Object                   { MinusOO $1 $3 }
       | var '-' Object                      { MinusVO $1 $3 }
       | Object '-' var                      { MinusOV $1 $3 }
       | var '-' IntExp                      { MinusVI $1 $3 }
       | IntExp '-' var                      { MinusIV $1 $3 }
       | var '-' var                         { MinusVV $1 $3 }
       
       | IntExp '*' IntExp                   { TimesII $1 $3 }
       | Object '*' IntExp                   { TimesOI $1 $3 }
       | IntExp '*' Object                   { TimesIO $1 $3 }
       | Object '*' Object                   { TimesOO $1 $3 }
       | var '*' Object                      { TimesVO $1 $3 }
       | Object '*' var                      { TimesOV $1 $3 }
       | var '*' IntExp                      { TimesVI $1 $3 }
       | IntExp '*' var                      { TimesIV $1 $3 }
       | var '*' var                         { TimesVV $1 $3 }

       | IntExp '/' IntExp                   { DivII $1 $3 }
       | Object '/' IntExp                   { DivOI $1 $3 }
       | IntExp '/' Object                   { DivIO $1 $3 }
       | Object '/' Object                   { DivOO $1 $3 }
       | var '/' Object                      { DivVO $1 $3 }
       | Object '/' var                      { DivOV $1 $3 }
       | var '/' IntExp                      { DivVI $1 $3 }
       | IntExp '/' var                      { DivIV $1 $3 }
       | var '/' var                         { DivVV $1 $3 }

       | IntExp '^' IntExp                   { ExpoII $1 $3 }
       | Object '^' IntExp                   { ExpoOI $1 $3 }
       | IntExp '^' Object                   { ExpoIO $1 $3 }
       | Object '^' Object                   { ExpoOO $1 $3 }
       | var '^' Object                      { ExpoVO $1 $3 }
       | Object '^' var                      { ExpoOV $1 $3 }
       | var '^' IntExp                      { ExpoVI $1 $3 }
       | IntExp '^' var                      { ExpoIV $1 $3 }
       | var '^' var                         { ExpoVV $1 $3 }

       | '(' IntExp ')'                      { $2 } 
       
       | '-' IntExp %prec NEG                { NegateI $2 } 
       | '-' Object %prec NEG                { NegateO $2 } 
       | '-' var %prec NEG                   { NegateV $2 }

       | int                                 { QInt $1 }

       | length '(' string ')'               { Length $3 }
       | length '(' Object ')'               { LengthObj }
       
-- DONE --
-- Boolean Expression
BoolExp : BoolExp and BoolExp                         { And $1 $3 }
        | BoolExp and Object                          { AndIO $1 $3 }
        | Object and BoolExp                          { AndOI $1 $3 }
        | var and Object                              { AndVO $1 $3 }
        | Object and var                              { AndOV $1 $3 }
        | var and BoolExp                             { AndVB $1 $3 }
        | BoolExp and var                             { AndBV $1 $3 }
        | var and var                                 { AndVV $1 $3 }
        
        | BoolExp or BoolExp                          { Or $1 $3 }
        | BoolExp or Object                           { OrIO $1 $3 }
        | Object or BoolExp                           { OrOI $1 $3 }
        | var or Object                               { OrVO $1 $3 }
        | Object or var                               { OrOV $1 $3 }
        | var or BoolExp                              { OrVB $1 $3 }
        | BoolExp or var                              { OrBV $1 $3 }
        | var or var                                  { OrVV $1 $3 }
        
        | IntExp '>' IntExp                           { GTII $1 $3 }
        | IntExp '>' Object                           { GTIO $1 $3 }
        | Object '>' IntExp                           { GTOI $1 $3 }
        | var '>' Object                              { GTVO $1 $3 }
        | Object '>' var                              { GTOV $1 $3 }
        | var '>' IntExp                              { GTVI $1 $3 }
        | IntExp '>' var                              { GTIV $1 $3 }
        | var '>' var                                 { GTVV $1 $3 }

        | IntExp '<' IntExp                           { LTII $1 $3 }
        | IntExp '<' Object                           { LTIO $1 $3 }
        | Object '<' IntExp                           { LTOI $1 $3 }
        | var '<' Object                              { LTVO $1 $3 }
        | Object '<' var                              { LTOV $1 $3 }
        | var '<' IntExp                              { LTVI $1 $3 }
        | IntExp '<' var                              { LTIV $1 $3 }
        | var '<' var                                 { LTVV $1 $3 }

        | IntExp deq IntExp                           { EQII $1 $3 }
        | BoolExp deq BoolExp                         { EQBB $1 $3 }
        | StringExp deq StringExp                     { EQSS $1 $3 }
        | Url deq Url                                 { EQUU $1 $3 }

        | Object deq IntExp                           { EQOI $1 $3 }
        | IntExp deq Object                           { EQIO $1 $3 }
        
        | Object deq BoolExp                          { EQOB $1 $3 }
        | BoolExp deq Object                          { EQBO $1 $3 }

        | Object deq StringExp                        { EQOS $1 $3 }
        | StringExp deq Object                        { EQSO $1 $3 }

        | Subject deq Url                             { EQSU $3 }
        | Url deq Subject                             { EQUS $1 }
        | Predicate deq Url                           { EQPU $3 } 
        | Url deq Predicate                           { EQUP $1 } 
        | Object deq Url                              { EQOU $3 } 
        | Url deq Object                              { EQUO $1 } 

        
        | Object deq var                              { EQOV $1 $3 }
        | IntExp deq var                              { EQIV $1 $3 }
        | BoolExp deq var                             { EQBV $1 $3 }
        | StringExp deq var                           { EQSV $1 $3 }
        | Url deq var                                 { EQUV $1 $3 }
        
        | var deq Object                              { EQVO $1 $3 }
        | var deq IntExp                              { EQVI $1 $3 }
        | var deq BoolExp                             { EQVB $1 $3 }
        | var deq StringExp                           { EQVS $1 $3 }
        | var deq Url                                 { EQVU $1 $3 }
        | var deq var                                 { EQVV $1 $3 }

        | '(' BoolExp ')'                             { $2 }
        
        | true                                        { QTrue }
        | false                                       { QFalse }

        | startsWith '(' string ',' string ')'        { StartsWithStr $3 $5 }
        | startsWith '(' string ',' Url ')'           { StartsWithUrl $3 $5 }
        | startsWith '(' string ',' Object ')'        { StartsWithObj $3 }

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
parseError ((TokenOr (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenVar (AlexPn _ l c) _ )  : xs) = error (printing l c)
parseError ((TokenAdd (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenUrl (AlexPn _ l c) _ )  : xs) = error (printing l c)
parseError ((TokenFilename (AlexPn _ l c) _ )  : xs) = error (printing l c)
parseError ((TokenLength (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenStarts (AlexPn _ l c))  : xs) = error (printing l c)

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
              Length String | LengthObj |
              NegateI IntExp |  NegateO Object | NegateV String |
              -- The following rules allow variables ^^ to perform operations on integer expressions
              PlusVO String Object | PlusOV Object String | PlusVI String IntExp | PlusIV IntExp String | PlusVV String String |
              MinusVO String Object | MinusOV Object String | MinusVI String IntExp | MinusIV IntExp String | MinusVV String String |
              TimesVO String Object | TimesOV Object String | TimesVI String IntExp | TimesIV IntExp String | TimesVV String String |
              DivVO String Object | DivOV Object String | DivVI String IntExp | DivIV IntExp String | DivVV String String |
              ExpoVO String Object | ExpoOV Object String | ExpoVI String IntExp | ExpoIV IntExp String | ExpoVV String String  
     deriving Show
     
-- TODO change Nodes in doc
data BoolExp = And BoolExp BoolExp | AndIO BoolExp Object | AndOI Object BoolExp
             | Or BoolExp BoolExp | OrIO BoolExp Object | OrOI Object BoolExp
             | GTII IntExp IntExp | GTIO IntExp Object | GTOI Object IntExp 
             | LTII IntExp IntExp | LTIO IntExp Object | LTOI Object IntExp
             | EQII IntExp IntExp | EQOI Object IntExp | EQIO IntExp Object
             | EQBB BoolExp BoolExp | EQSS StringExp StringExp | EQUU Url Url
             | EQOS Object StringExp | EQSO StringExp Object
             | EQOB Object BoolExp | EQBO BoolExp Object
             | QTrue | QFalse
             | StartsWithObj String | StartsWithStr String String | StartsWithUrl String Url
             -- Needed for doing boolean operations with variables
             | AndVO String Object | AndOV Object String | AndVB String BoolExp | AndBV BoolExp String | AndVV String String
             | OrVO String Object | OrOV Object String | OrVB String BoolExp | OrBV BoolExp String | OrVV String String
             | GTVO String Object | GTOV Object String | GTVI String IntExp | GTIV IntExp String | GTVV String String 
             | LTVO String Object | LTOV Object String | LTVI String IntExp | LTIV IntExp String | LTVV String String 
             | EQVV String String 
             | EQOV Object String | EQIV IntExp String | EQBV BoolExp String | EQSV StringExp String | EQUV Url String
             | EQVO String Object | EQVI String IntExp | EQVB String BoolExp | EQVS String StringExp  | EQVU String Url
             -- Condition for map function
             | EQSU Url | EQUS Url | EQPU Url | EQUP Url | EQOU Url | EQUO Url
     deriving Show


data SList = StrList SListElem | StrListSingle String
     deriving Show
     
data SListElem = SListEl String | SListSeq String SListElem
     deriving Show
     
data CreateVar = IntVar String IntExp | BoolVar String BoolExp | StringVar String StringExp | UrlVar String Url
     deriving Show
     
data CreateVars = UVarEnv CreateVar | VarEnv CreateVar CreateVars
     deriving Show
     
data Query = OutputQuery String FilteredQuery | WriteQuery String FilteredQuery String | QuerySeq Query Query
     deriving Show

data FilteredQuery = NewQuery BasicQuery | WhereQuery BasicQuery CreateVars
     deriving Show
     
data BasicQuery = FuncStack Func | FuncStackSeq Func BasicQuery
     deriving Show

data Cond = Always Action | ActionSeq Action Cond | If BoolExp Cond Cond
     deriving Show

data Action = AssignSubj Subject Url | AssignPred Predicate Url | AssignObjUrl Object Url 
            | AssignObjStr Object StringExp | AssignObjInt Object IntExp | AssignObjBool Object BoolExp | AddSPO Url Url Literal | AddPO Url Literal | AddSO Url Literal | AddSP Url Url | AddS Url | AddP Url | AddO Literal | Add
     deriving Show
     
data JoinOption = BidirectJoin | LeftJoin | RightJoin
     deriving Show

data Url = NewUrl String
     deriving (Show,Eq)

data UrlList = SimpleUrl Url | UrlSeq Url UrlList
     deriving Show

data FilterEl = Any | FilteredList UrlList
     deriving Show

-- Add readme
data Combinations = TTLComb FilterEl FilterEl LiteralList | TTLCombs CombinationLst
     deriving Show

-- Add readme
data CombinationLst = SingleFilter FilterEl FilterEl LiteralList | FilterSeq FilterEl FilterEl LiteralList CombinationLst
     deriving Show

data Literal = IntLit IntExp | BoolLit BoolExp | StrLit StringExp | UrlLit Url  
     deriving Show

data LiteralList = LiteralLst LiteralElems | AnyLit
     deriving Show

data LiteralElems = LiteralSeq Literal LiteralElems | SingleLit Literal 
     deriving Show

-- Readme changes:
--   a) Change Filter
data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter Combinations | AddTripSPO Url Url Literal
     deriving Show     


------------------------------------------------------------------------------------------------------
--                                      Helper Functions                                            --
------------------------------------------------------------------------------------------------------

filterToList :: FilterEl -> [String]
filterToList Any = []
filterToList (FilteredList urlList) = urltoList urlList

urltoList :: UrlList -> [String]
urltoList (SimpleUrl (NewUrl url)) = [url]
urltoList (UrlSeq (NewUrl url) urls) = [url] ++ urltoList urls

}