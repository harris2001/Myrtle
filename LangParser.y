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
  ljoin          { TokenLJoin _ }
  rjoin          { TokenRJoin _ }
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


%left arr
%right let
%right in
%nonassoc if
%nonassoc then
%nonassoc else
%left fst snd
%nonassoc '<'
%left '+'
%left ','
%nonassoc int true false var '(' ')'
%left lam
%left APP

%% 

Query : Func StringExp                                         { Query $1 Empty }
      | Func StringExp "|" Query2
      | Querry where CreateVar                         { Query $1 $3 }

qUERY -> Query where ... -> Query where ... where ...


-- filter (_,pred1,_)  | filter (_,pred2,_) | map (act)
--   where pred1 = ...
--         pred2 = ...
--         act = (obj == 4)? true : false

Query2 : Func                                          { FuncStackB $1 }              
       | Query2 '|' Query2                             { FuncStack $3 $1 }

map () "foo" | filter () | uniq |uniq | uniq  where

CreateVar : var "=" Literal1                          { BVarEnv $1 }
          | CreateVar CreateVar                       { VarEnv $1 $2 }

Func : filter (StringExp, StringExp, Literal)         { Filter $3 $5 $7 }
     | filter ("_", StringExp, Literal)               { Filter Any $5 $7 }
     | filter (StringExp, "_", Literal)               { Filter $3 Any $7 }
     | filter ("_", "_", Literal)                     { Filter Any Any $7 }
     | map (Cond)                                     { Map $3 }
     | union SList                                    { Union $2 }
     | join JoinOption (Node, Node) SList             { Join $2 $4 $6 $8 }

--Done
JoinOption : "-r" "-l"                 { BidirectJoin }
           | "-l" "-r"                 { BidirectJoin }
           | "-l"                      { LeftJoin }
           | "-r"                      { RightJoin }

--Done
SList : "[" SList "]"                  { $2 }
      | SList "," SList                { StrSeq $1 $3}
      | StringExp                      { StrVal $1 }           

List : "[" List "]"                    { $2 }
     | Literal                         { ListEl $1 }
     | Literal "," List                   { ListEls $1 $3 }

Cond : Action
     | (BoolExp)? Cond : Cond        {If $2 $5 $7}

--Done
Action : subj "=" StringExp           { AssignSubj $1 $3 }
       | pred "=" StringExp           { AssignPred $1 $3 }
       | obj "=" StringExp            { AssignObjStr $1 $3 }
       | obj "=" IntExp               { AssignObjInt $1 $3 }
       | obj "=" BoolExp              { AssignObjBool $1 $3 }

--Done
Literal : Literal1                    { $1 }
        | "_"                         { Any }

Literal1 : IntExp                     { Integer $1 }
         | BoolExp                    { Boolean $1 }
         | StringExp                  { Str $1 }
        
--Done 
IntExp : IntExp '+' IntExp            { Plus $1 $3 } 
       | IntExp '-' IntExp            { Minus $1 $3 } 
       | IntExp '*' IntExp            { Times $1 $3 } 
       | IntExp '/' IntExp            { Div $1 $3 } 
       | IntExp '^' IntExp            { Expo $1 $3 }
       | '(' IntExp ')'               { $2 } 
       | '-' IntExp %prec NEG         { Negate $2 } 
       | int                          { QInt $1 }
          -- | var                       { Var $1 }

--Done
BoolExp : BoolExp and BoolExp         { And $1 $3 }
        | BoolExp or BoolExp          { Or $1 $3 }
        | IntExp '<' IntExp           { LTII $1 $3 }
        | IntExp '>' IntExp           { GTII $1 $3 }
        | IntExp '<' obj              { GTIO $1 $3 }
        | obj '<' IntExp              { GTOI $1 $3 }
        | BoolExp '=''=' BoolExp      { EQBB $1 $4 }
        | IntExp '=''=' IntExp        { EQII $1 $4 }
        | StringExp '=''=' StringExp  { EQSS $1 $4 }
        | StringExp '=''=' Node       { EQSN $1 $4 }
        | Node '=''=' StringExp       { EQNS $1 $4 }
        | '(' BoolExp ')'             { $2 }
        | true                        { QTrue }
        | false                       { QFalse }
          -- | var                       { Var $1 }

--Done
StringExp : String                    { StrVal $1 }
          -- | var                       { StrVal $1 }

--Done
Node : subj                                     { Subj } 
     | pred                                     { Pred } 
     | obj                                      { Obj }


{ 
parseError :: [ToyToken] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data ToyType = TyInt | TyBool | TyUnit | TyPair ToyType ToyType | TyFun ToyType ToyType
   deriving (Show,Eq)

type Environment = [ (String,Expr) ]

--Turtle triplet format
data Node = Subj | Pred | Obj

-- Integer Expressions
data IntExp = Plus IntExp IntExp | Minus IntExp IntExp 
            | Times IntExp IntExp | Div IntExp IntExp | Expo IntExp IntExp
            | Negate IntExp | QInt IntExp

-- Boolean Expressions
data BoolExp = And BoolExp BoolExp
              | Or BoolExp BoolExp
              
              | EQBB BoolExp BoolExp
              | EQII IntExp IntExp
              | EQSS String String

              | EQNS IntExp Node
              | EQSN Node IntExp
              
              | LTII IntExp IntExp
              | LTIO IntExp Node
              | LTOI Node IntExp
              
              | GTII IntExp IntExp
              | GTIO IntExp Node
              | GTOI Node IntExp
              
              | QTrue
              | QFalse

data StringExp = StrVal String

-- Accumulates all literals in a single datatype
data Literal = Integer IntExp | Boolean BoolExp | Str StringExp

-- List of Strings
data SList = StrVal StringExp | StrSeq SList SList

-- Possible assign actions on nodes
data Action = AssignSubj Node String | AssignPred Node String 
            | AssignObjStr Node String 
            | AssignObjInt Node Int
            | AssignObjBool Node Bool

--Join options
data JoinOption = LeftJoin | RightJoin | BidirectJoin

data Expr = TmInt Int | TmTrue | TmFalse | TmUnit | TmCompare Expr Expr 
            | TmPair Expr Expr | TmAdd Expr Expr | TmVar String 
            | TmFst Expr | TmSnd Expr
            | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr
            | TmLambda String ToyType Expr | TmApp Expr Expr 
            | Cl String ToyType Expr Environment
    deriving (Show,Eq)



main :: IO()
main = do 
        contents <- readFile "script.q"
        let tokens = alexScanTokens contents
        let expression = parseCalc tokens
        let turtle = (head(getExp (modify expression (Base(FinalUrl "")) []) 1))

} 