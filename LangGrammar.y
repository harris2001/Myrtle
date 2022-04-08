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
  String         { TokenString _ $$ }
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
%% 

-- A query has the following syntax:
-- fun1 "input.ttl" where var = ...
-- or
-- fun1 "input.ttl" | fun2 | fun3 where var = ...
Query : Query1                                         { Query $1 Empty }
      | Query1 where CreateVars                        { Query $1 $3 }

-- This is a separate rule because the input file is only put at the beginning
Query1 : Func StringExp                                { FuncStackB $1 }
       | Func StringExp '|' Query2                     { FuncStackB $3 $1 }

-- The following functions don't requrie an input file
-- (unless the function is used to handle multiple files) 
Query2 : Func                                          { FuncStackB $1 }              
       | Func '|' Query2                               { FuncStack $3 $1 }

-- Create variables
-- Extra rule used to remove shift/reduce conflict
CreateVars : CreateVar CreateVars                      { VarEnv $1 $2 }
           | CreateVar                                 { UVarEnv $1 }

CreateVar : var '=' IntExp                             { IntVar $1 $3 }
          | var '=' StringExp                          { StringVar $1 $3 }
          | var '=' BoolExp                            { BoolVar $1 $3 }
          | var '=' IntOp                              { IntOpVar $1 $3 }

-- Functions that return RDF Graphs are listed here
Func : filter '('FilterEl',' FilterEl',' Literal')'    { Filter $3 $5 $7 }
     | map '('Cond')'                                  { Map $3 }
     | union SList                                     { Union $2 }
     | join JoinOption '('Node',' Node')' SList        { Join $2 $4 $6 $8 }

-- The parameters allowed in the filter function
FilterEl : '_'                                         { Any }
         | List                                        { $1 }

-- The options of a join
JoinOption : '-r' '-l'                                 { BidirectJoin }
           | '-l' '-r'                                 { BidirectJoin }
           | '-l'                                      { LeftJoin }
           | '-r'                                      { RightJoin }

-- List of strings
SList : '[' SListElem ']'                              { $2 }
      | StringExp1                                     { $1 }

SListElem : StringExp1                                 { SListEl $1 }
          | StringExp1 ',' SListElem                   { SListEls $1 $3 }            

-- List of any type. Note that the list can hold multiple types.
List : '[' ListElem ']'                                { $2 }
     | Literal1                                        { $1 }

ListElem : Literal1                                    { ListEl $1 }
         | Literal1 ',' ListElem                       { ListEls $1 $3 }

-- Conditions are used for the map function
Cond : Action                                         { $1 }
     | '('BoolExp')''?' Cond':'Cond                   { If $2 $5 $7 }

-- Actions are executed when conditions are satisfied
Action : subj '=' StringExp                           { AssignSubj $3 }
       | pred '=' StringExp                           { AssignPred $3 }
       | obj '=' String                               { AssignObjStr $3 }
       | obj '=' IntExp                               { AssignObjInt $3 }
       | obj '=' BoolExp                              { AssignObjBool $3 }
       | obj '=' IntOp                                { AssignObjOp $3 }
       | obj '=' var                                  { AssignObjVar $3 }

-- Literal includes strings, integers, booleans, and the wildcard any (_)
Literal : Literal1                                    { $1 }
        | '_'                                         { Any }

-- Literal1 only includes strings, integers and booleans
Literal1 : IntExp                                     { $1 }
         | BoolExp                                    { $1 }
         | StringExp                                  { $1 }

-- Integer Expression
IntExp : IntExp '+' IntExp %prec '+'                  { Plus $1 $3 } 
       | var '+' IntExp %prec '+'                     { Plus $1 $3 }
       | IntExp '+' var %prec '+'                     { Plus $1 $3 }
       | IntExp '-' IntExp %prec '-'                  { Minus $1 $3 }
       | var '-' IntExp %prec '-'                     { Minus $1 $3 }
       | IntExp '-' var %prec '-'                     { Minus $1 $3 }
       | IntExp '*' IntExp %prec '*'                  { Times $1 $3 }
       | var '*' IntExp %prec '*'                     { Times $1 $3 }
       | IntExp '*' var %prec '*'                     { Times $1 $3 }
       | IntExp '/' IntExp %prec '/'                  { Div $1 $3 }
       | var '/' IntExp %prec '/'                     { Div $1 $3 }
       | IntExp '/' var %prec '/'                     { Div $1 $3 } 
       | IntExp '^' IntExp %prec '^'                  { Expo $1 $3 }
       | var '^' IntExp %prec '^'                     { Expo $1 $3 }
       | IntExp '^' var  %prec '^'                    { Expo $1 $3 }
       | '(' IntExp ')'                               { $2 } 
       | '-' IntExp %prec NEG                         { Negate $2 } 
       | int                                          { QInt $1 }

-- Integer Operation on an Object
IntOp : IntOp '+' IntOp                               { ObPlus $1 $3 }
      | var '+' IntOp %prec '+'                       { ObPlus $1 $3 }
      | IntOp '+' var %prec '+'                       { ObPlus $1 $3 }
      | IntExp '+' IntOp %prec '+'                    { ObPlus $1 $3 }
      | IntOp '+' IntExp %prec '+'                    { ObPlus $1 $3 }
      | IntOp '-' IntOp %prec '-'                     { ObMinus $1 $3 }
      | var '-' IntOp %prec '-'                       { ObMinus $1 $3 }
      | IntOp '-' var %prec '-'                       { ObMinus $1 $3 }
      | IntExp '-' IntOp %prec '-'                    { ObMinus $1 $3 }
      | IntOp '-' IntExp %prec '-'                    { ObMinus $1 $3 }
      | IntOp '*' IntOp %prec '*'                     { ObTimes $1 $3 }
      | var '*' IntOp %prec '*'                       { ObTimes $1 $3 }
      | IntOp '*' var %prec '*'                       { ObTimes $1 $3 }
      | IntExp '*' IntOp %prec '*'                    { ObTimes $1 $3 }
      | IntOp '*' IntExp %prec '*'                    { ObTimes $1 $3 } 
      | IntOp '/' IntOp %prec '/'                     { ObDiv $1 $3 } 
      | var '/' IntOp %prec '/'                       { ObDiv $1 $3 } 
      | IntOp '/' var %prec '/'                       { ObDiv $1 $3 }
      | IntExp '/' IntOp %prec '/'                    { ObDiv $1 $3 }
      | IntOp '/' IntExp %prec '/'                    { ObDiv $1 $3 }
      | IntOp '^' IntOp %prec '^'                     { ObExpo $1 $3 }
      | var '^' IntOp %prec '^'                       { ObExpo $1 $3 }
      | IntOp '^' var %prec '^'                       { ObExpo $1 $3 }
      | IntExp '^' IntOp %prec '^'                    { ObExpo $1 $3 }
      | IntOp '^' IntExp %prec '^'                    { ObExpo $1 $3 }
      | '(' IntOp ')'                                 { $2 } 
      | '-' IntOp %prec NEG                           { Negate $2 }
      | obj                                           { $1 }

-- Boolean Expression
BoolExp : BoolExp and BoolExp %prec and               { And $1 $3 }
        | var and BoolExp %prec and                   { And $1 $3 }
        | BoolExp and var %prec and                   { And $1 $3 }
        | BoolExp or BoolExp %prec or                 { Or $1 $3 }
        | var or BoolExp %prec or                     { Or $1 $3 }
        | BoolExp or var %prec or                     { Or $1 $3 }
        | IntExp deq IntExp %prec '='                 { EQ $1 $3 }
        | var deq IntExp %prec '='                    { EQ $1 $3 }
        | IntExp deq var %prec '='                    { EQ $1 $3 }
        | IntExp '<' IntExp                           { LT $1 $3 }
        | IntExp '>' IntExp                           { GT $1 $3 }
        | IntExp '<' obj                              { GT $1 Obj }
        | obj '<' IntExp                              { GT Obj $3 }
        | StringExp deq StringExp %prec '='           { EQ $1 $3 }
        | StringExp deq subj %prec '='                { EQ $1 Subj }
        | subj deq StringExp %prec '='                { EQ Subj $3 }
        | StringExp deq pred %prec '='                { EQ $1 Pred }
        | pred deq StringExp %prec '='                { EQ Pred $3 }
        | StringExp deq obj  %prec '='                { EQ $1 Obj }
        | obj deq StringExp  %prec '='                { EQ Obj $3 }
        | '(' BoolExp ')'                             { $2 }
        | true                                        { QTrue }
        | false                                       { QFalse }

-- String Expression
StringExp : String                                    { QString $1 }
          | var                                       { Var $1 }

-- String Expression including the wildcard any (_)
StringExp1 : StringExp                                { $1 }
           | '_'                                      { Any }

-- DONE --
-- Types of nodes: Subject (subj), Predicate (pred), Object (obj)
Node : subj                                           { Subj } 
     | pred                                           { Pred } 
     | obj                                            { Obj }


{ 
parseError :: [LangToken] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data ToyType = TyInt | TyBool | TyUnit | TyPair ToyType ToyType | TyFun ToyType ToyType
   deriving (Show,Eq)

type Environment = [ (String,Expr) ]

data Expr = TmInt Int | TmTrue | TmFalse | TmUnit | TmCompare Expr Expr 
            | TmPair Expr Expr | TmAdd Expr Expr | TmVar String 
            | TmFst Expr | TmSnd Expr
            | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr
            | TmLambda String ToyType Expr | TmApp Expr Expr 
            | Cl String ToyType Expr Environment
    deriving (Show,Eq)
} 