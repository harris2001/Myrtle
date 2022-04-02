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
Query : Query1                                         { Query $1 Empty }
      | Query1 where CreateVar                         { Query $1 $3 }

Query1 : Func StringExp                                { FuncStackB $1 }
       | Func StringExp '|' Query2                     { FuncStackB $3 $1 }

Query2 : Func                                          { FuncStackB $1 }              
       | Func '|' Query1                               { FuncStack $3 $1 }

CreateVar : var '=' Literal1                           { BVarEnv $1 }
          | var '=' Literal1 '|' CreateVar             { VarEnv $1 $3 }

Func : filter '('FilterEl',' FilterEl',' Literal')'    { Filter $3 $5 $7 }
     | map '('Cond')'                                  { Map $3 }
     | union SList                                     { Union $2 }
     | join JoinOption '('Node',' Node')' SList        { Join $2 $4 $6 $8 }

FilterEl : '_'                        { Any }
         | List                       { $1 }


JoinOption : '-l' '-r'                { BiDirJoin }
           | '-r' '-l'                { BiDirJoin }
           | '-l'                     { LeftJoin }
           | '-r'                     { RightJoin }

SList : '[' SListElem ']'             { $2 }
      | StringExp1                    { $1 }

SListElem : StringExp1                { SListEl $1 }
          | StringExp1 ',' SListElem  { SListEls $1 $3 }            

List : '[' ListElem ']'               { $2 }
     | Literal1                       { $1 }

ListElem : Literal1                   { ListEl $1 }
         | Literal1 ',' ListElem      { ListEls $1 $3 }

Cond : Action                         { $1 }
     | '('BoolExp')''?' Cond':'Cond   { If $2 $5 $7 }

Action : subj '=' StringExp           { AssignSubj $3 }
       | pred '=' StringExp           { AssignPred $3 }
       | obj '=' IntExp               { AssignObj $3 }
       | obj '=' BoolExp              { AssignObj $3 }
       | obj '=' StringExp            { AssignObj $3 }

Literal : Literal1                    { $1 }
        | '_'                         { Any }

Literal1 : IntExp                     { $1 }
         | BoolExp                    { $1 }
         | StringExp                  { $1 }

IntExp : IntExp '+' IntExp            { Plus $1 $3 } 
       | IntExp '-' IntExp            { Minus $1 $3 } 
       | IntExp '*' IntExp            { Times $1 $3 } 
       | IntExp '/' IntExp            { Div $1 $3 } 
       | IntExp '^' IntExp            { Expo $1 $3 }
       | '(' IntExp ')'               { $2 } 
       | '-' IntExp %prec NEG         { Negate $2 } 
       | int                          { QInt $1 } 
       | var                          { Var $1 }

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

StringExp : String                    { QString $1 }
          | var                       { Var $1 }

StringExp1 : StringExp                { $1 }
           | '_'                      { Any }

Node : subj                           { Subj } 
     | pred                           { Pred } 
     | obj                            { Obj }


{ 
parseError :: [ToyToken] -> a
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