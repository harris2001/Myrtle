{ 
module LangGrammar where 
import LangTokens
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
  DEQ            { TokenDEQ _ }
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
  and            { TokenAnd _ }
  or             { TokenOr _ }
  var            { TokenVar _ $$ }

%left '='
%left '+' '-' or
%left '*' '/' and
%left '^'
%left NEG 
%left DEQ
%% 

-- DONE
-- A query has the following syntax:
-- fun1 "input.ttl" where var = ...
-- or
-- fun1 "input.ttl" | fun2 | fun3 where var = ...
Query : QueryWithFile                                       { NewQuery $1 }
     --  | QueryWithFile where CreateVars                      { WhereQuery $1 $3 }

-- DONE
-- This is a separate rule because the input file is only put at the beginning
QueryWithFile : Func StringExp                              { FuncStack $1 $2}
              | Func StringExp '|' SimpleQuery              { FuncStackSeq $1 $2 $4}

-- The following functions don't requrie an input file
-- (unless the function is used to handle multiple files) 
SimpleQuery : Func                                          { FuncStackB $1 }              
            | Func '|' SimpleQuery                          { FuncStackBSeq $1 $3 }

--DONE
-- Create variables
-- Extra rule used to remove shift/reduce conflict
CreateVars : CreateVars  CreateVars                         { VarEnv $1 $2 }
           | CreateVar                                      { UVarEnv $1 }

--DONE
CreateVar : var '=' IntExp                                  { IntVar $1 $3 }
          | var '=' StringExp                               { StringVar $1 $3 }
          | var '=' BoolExp                                 { BoolVar $1 $3 }
          -- | var '=' IntOp                              { IntOpVar $1 $3 }

-- DONE
-- Functions that return RDF Graphs are listed here
-- Func : filter '('FilterEl',' FilterEl',' Literal')'    { Filter $3 $5 $7 }
--      | map '('Cond')'                                  { Map $3 }
Func : union SList                                          { Union $2 }
     -- | join JoinOption '('Node',' Node')' SList        { Join $2 $4 $6 $8 }

-- DONE
IntExp : int                                                { QInt $1 }

-- DONE
BoolExp : true                                              { QTrue }
        | false                                             { QFalse }

-- -- The parameters allowed in the filter function
-- FilterEl : '_'                                         { Any }
--          | List                                        { $1 }

-- -- The options of a join
-- JoinOption : '-r' '-l'                                 { BidirectJoin }
--            | '-l' '-r'                                 { BidirectJoin }
--            | '-l'                                      { LeftJoin }
--            | '-r'                                      { RightJoin }

-- DONE
-- List of strings
SList : '[' SListElem ']'                                   { StrList $2 }
     --  | StringExp                                           { StrListSingle $1 }

-- DONE
SListElem : StringExp                                       { SListEl $1 }
          | StringExp ',' SListElem                         { SListSeq $1 $3 }            

-- -- List of any type. Note that the list can hold multiple types.
-- List : '[' ListElem ']'                                { $2 }
--      | Literal1                                        { $1 }

-- ListElem : Literal1                                    { ListEl $1 }
--          | Literal1 ',' ListElem                       { ListEls $1 $3 }

-- -- Conditions are used for the map function
-- Cond : Action                                         { $1 }
--      | '('BoolExp')''?' Cond':'Cond                   { If $2 $5 $7 }

-- -- Actions are executed when conditions are satisfied
-- Action : subj '=' StringExp                           { AssignSubj $3 }
--        | pred '=' StringExp                           { AssignPred $3 }
--        | obj '=' String                               { AssignObjStr $3 }
--        | obj '=' IntExp                               { AssignObjInt $3 }
--        | obj '=' BoolExp                              { AssignObjBool $3 }
--        | obj '=' IntOp                                { AssignObjOp $3 }
--        | obj '=' var                                  { AssignObjVar $3 }

-- -- Literal includes strings, integers, booleans, and the wildcard any (_)
-- Literal : Literal1                                    { $1 }
--         | '_'                                         { Any }

-- -- Literal1 only includes strings, integers and booleans
-- Literal1 : IntExp                                     { $1 }
--          | BoolExp                                    { $1 }
--          | StringExp                                  { $1 }

-- -- Integer Expression
-- IntExp : IntExp '+' IntExp                   { Plus $1 $3 } 
--        | var '+' IntExp                      { Plus $1 $3 }
--        | IntExp '+' var                      { Plus $1 $3 }
--        | IntExp '-' IntExp                   { Minus $1 $3 }
--        | var '-' IntExp                      { Minus $1 $3 }
--        | IntExp '-' var                      { Minus $1 $3 }
--        | IntExp '*' IntExp                   { Times $1 $3 }
--        | var '*' IntExp                      { Times $1 $3 }
--        | IntExp '*' var                      { Times $1 $3 }
--        | IntExp '/' IntExp                   { Div $1 $3 }
--        | var '/' IntExp                      { Div $1 $3 }
--        | IntExp '/' var                      { Div $1 $3 } 
--        | IntExp '^' IntExp                   { Expo $1 $3 }
--        | var '^' IntExp                      { Expo $1 $3 }
--        | IntExp '^' var                      { Expo $1 $3 }
--        | '(' IntExp ')'                      { $2 } 
--        | '-' IntExp %prec NEG                { Negate $2 } 
--        | int                                 { QInt $1 }

-- -- Integer Operation on an Object
-- IntOp : IntOp '+' IntOp                      { ObPlus $1 $3 }
--       | var '+' IntOp                        { ObPlus $1 $3 }
--       | IntOp '+' var                        { ObPlus $1 $3 }
--       | IntExp '+' IntOp                     { ObPlus $1 $3 }
--       | IntOp '+' IntExp                     { ObPlus $1 $3 }
--       | IntOp '-' IntOp                      { ObMinus $1 $3 }
--       | var '-' IntOp                        { ObMinus $1 $3 }
--       | IntOp '-' var                        { ObMinus $1 $3 }
--       | IntExp '-' IntOp                     { ObMinus $1 $3 }
--       | IntOp '-' IntExp                     { ObMinus $1 $3 }
--       | IntOp '*' IntOp                      { ObTimes $1 $3 }
--       | var '*' IntOp                        { ObTimes $1 $3 }
--       | IntOp '*' var                        { ObTimes $1 $3 }
--       | IntExp '*' IntOp                     { ObTimes $1 $3 }
--       | IntOp '*' IntExp                     { ObTimes $1 $3 } 
--       | IntOp '/' IntOp                      { ObDiv $1 $3 } 
--       | var '/' IntOp                        { ObDiv $1 $3 } 
--       | IntOp '/' var                        { ObDiv $1 $3 }
--       | IntExp '/' IntOp                     { ObDiv $1 $3 }
--       | IntOp '/' IntExp                     { ObDiv $1 $3 }
--       | IntOp '^' IntOp                      { ObExpo $1 $3 }
--       | var '^' IntOp                        { ObExpo $1 $3 }
--       | IntOp '^' var                        { ObExpo $1 $3 }
--       | IntExp '^' IntOp                     { ObExpo $1 $3 }
--       | IntOp '^' IntExp                     { ObExpo $1 $3 }
--       | '(' IntOp ')'                        { $2 } 
--       | '-' IntOp %prec NEG                  { Negate $2 }
--       | obj                                           { $1 }

-- -- Boolean Expression
-- BoolExp : BoolExp and BoolExp                         { And $1 $3 }
--         | var and BoolExp                             { And $1 $3 }
--         | BoolExp and var                             { And $1 $3 }
--         | BoolExp or BoolExp                          { Or $1 $3 }
--         | var or BoolExp                              { Or $1 $3 }
--         | BoolExp or var                              { Or $1 $3 }
--         | IntExp deq IntExp                           { EQ $1 $3 }
--         | var deq IntExp                              { EQ $1 $3 }
--         | IntExp deq var                              { EQ $1 $3 }
--         | IntExp '<' IntExp                           { LT $1 $3 }
--         | IntExp '>' IntExp                           { GT $1 $3 }
--         | IntExp '<' obj                              { GT $1 Obj }
--         | obj '<' IntExp                              { GT Obj $3 }
--         | StringExp deq StringExp                     { EQ $1 $3 }
--         | StringExp deq subj                          { EQ $1 Subj }
--         | subj deq StringExp                          { EQ Subj $3 }
--         | StringExp deq pred                          { EQ $1 Pred }
--         | pred deq StringExp                          { EQ Pred $3 }
--         | StringExp deq obj                           { EQ $1 Obj }
--         | obj deq StringExp                           { EQ Obj $3 }
--         | '(' BoolExp ')'                             { $2 }
--         | true                                        { QTrue }
--         | false                                       { QFalse }

-- DONE
-- String Expression
StringExp : string                                    { QString $1 }

-- DONE
-- String Expression including the wildcard any (_)
StringExp1 : StringExp                                { SpecifiedStr $1 }
           | '_'                                      { Any }

-- DONE
-- Types of nodes: Subject (subj), Predicate (pred), Object (obj)
Node : subj                                           { Subj } 
     | pred                                           { Pred } 
     | obj                                            { Obj }


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


printing x y = "Issue in row: "++show x ++ ", column:" ++ show y

data Node = Subj | Pred | Obj
     deriving Show
     
data StringExp = QString String
     deriving Show
     
data StringExp1 = SpecifiedStr StringExp | Any
     deriving Show
     
data IntExp = QInt Int
     deriving Show
     
data BoolExp = QTrue | QFalse
     deriving Show
     
data SList = StrList SListElem | StrListSingle StringExp
     deriving Show
     
data SListElem = SListEl StringExp | SListSeq StringExp SListElem
     deriving Show
     
data Func = Union SList
     deriving Show
     
data CreateVar = IntVar String IntExp | BoolVar String BoolExp | StringVar String StringExp
     deriving Show
     
data CreateVars = UVarEnv CreateVar | VarEnv CreateVars CreateVars
     deriving Show
     
data Query = NewQuery QueryWithFile 
     deriving Show
     
data QueryWithFile = FuncStack Func StringExp | FuncStackSeq Func StringExp SimpleQuery
     deriving Show
     
data SimpleQuery = FuncStackB Func | FuncStackBSeq Func SimpleQuery
     deriving Show
     
main :: IO()

main = do 
        contents <- readFile "script.q"
        let tokens = alexScanTokens contents
        print(tokens)
        let expression = parseQuery tokens
        print(expression)
} 