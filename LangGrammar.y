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
      | Query1 where CreateVars                         { Query $1 $3 }

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
FilterEl : '_'                        { Any }
         | List                       { $1 }

-- The options of a join
JoinOption : '-r' '-l'                { BidirectJoin }
           | '-l' '-r'                { BidirectJoin }
           | '-l'                     { LeftJoin }
           | '-r'                     { RightJoin }

-- List of strings
SList : '[' SListElem ']'             { $2 }
      | StringExp1                    { $1 }

SListElem : StringExp1                { SListEl $1 }
          | StringExp1 ',' SListElem  { SListEls $1 $3 }            

-- List of any type. Note that the list can hold multiple types.
List : '[' ListElem ']'               { $2 }
     | Literal1                       { $1 }

ListElem : Literal1                   { ListEl $1 }
         | Literal1 ',' ListElem      { ListEls $1 $3 }

-- Conditions are used for the map function
Cond : Action                         { $1 }
     | '('BoolExp')''?' Cond':'Cond   { If $2 $5 $7 }

-- Actions are executed when conditions are satisfied
Action : subj '=' StringExp           { AssignSubj $3 }
       | pred '=' StringExp           { AssignPred $3 }
       | obj '=' StringExp            { AssignObjStr $3 }
       | obj '=' IntExp               { AssignObjInt $3 }
       | obj '=' BoolExp              { AssignObjBool $3 }
       | obj '=' IntOp                { AssignObjOp $3 }

-- Literal includes strings, integers, booleans, and the wildcard any (_)
Literal : Literal1                    { $1 }
        | '_'                         { Any }

-- Literal1 only includes strings, integers and booleans
Literal1 : IntExp                     { $1 }
         | BoolExp                    { $1 }
         | StringExp                  { $1 }

-- Integer Expression
IntExp : IntExp '+' IntExp            { Plus $1 $3 } 
       | IntExp '-' IntExp            { Minus $1 $3 } 
       | IntExp '*' IntExp            { Times $1 $3 } 
       | IntExp '/' IntExp            { Div $1 $3 } 
       | IntExp '^' IntExp            { Expo $1 $3 }
       | '(' IntExp ')'               { $2 } 
       | '-' IntExp %prec NEG         { Negate $2 } 
       | int                          { QInt $1 } 
       | var                          { Var $1 }

-- Integer Operation on an Object
IntOp : IntOp '+' IntOp               { ObPlus $1 $3 }
      | IntExp '+' IntOp              { ObPlus $1 $3 }
      | IntOp '+' IntExp              { ObPlus $1 $3 }
      | IntOp '-' IntOp               { ObMinus $1 $3 }
      | IntExp '-' IntOp              { ObMinus $1 $3 }
      | IntOp '-' IntExp              { ObMinus $1 $3 }
      | IntOp '*' IntOp               { ObTimes $1 $3 }
      | IntExp '*' IntOp              { ObTimes $1 $3 }
      | IntOp '*' IntExp              { ObTimes $1 $3 } 
      | IntOp '/' IntOp               { ObDiv $1 $3 }
      | IntExp '/' IntOp              { ObDiv $1 $3 }
      | IntOp '/' IntExp              { ObDiv $1 $3 }
      | IntOp '^' IntOp               { ObExpo $1 $3 }
      | IntExp '^' IntOp              { ObExpo $1 $3 }
      | IntOp '^' IntExp              { ObExpo $1 $3 }
      | '(' IntOp ')'                 { $2 } 
      | '-' IntOp %prec NEG           { Negate $2 }
      | obj                           { $1 }

-- Boolean Expression
BoolExp : BoolExp and BoolExp         { And $1 $3 }
        | BoolExp or BoolExp          { Or $1 $3 }
        | IntExp '=''=' IntExp        { EQ $1 $4 }
        | IntExp '<' IntExp           { LT $1 $3 }
        | IntExp '>' IntExp           { GT $1 $3 }
        | IntExp '<' obj              { GT $1 Obj }
        | obj '<' IntExp              { GT Obj $3 }
        | StringExp '=''=' StringExp  { EQ $1 $4 }
        | StringExp '=''=' subj       { EQ $1 Subj }
        | subj '=''=' StringExp       { EQ Subj $4 }
        | StringExp '=''=' pred       { EQ $1 Pred }
        | pred '=''=' StringExp       { EQ Pred $4 }
        | StringExp '=''=' obj        { EQ $1 Obj }
        | obj '=''=' StringExp        { EQ Obj $4 }
        | '(' BoolExp ')'             { $2 }
        | true                        { QTrue }
        | false                       { QFalse }
        | var                         { Var $1 }

-- String Expression
StringExp : String                    { QString $1 }
          | var                       { Var $1 }

-- String Expression including the wildcard any (_)
StringExp1 : StringExp                { $1 }
           | '_'                      { Any }

-- Types of nodes: Subject (subj), Predicate (pred), Object (obj)
Node : subj                           { Subj } 
     | pred                           { Pred } 
     | obj                            { Obj }


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