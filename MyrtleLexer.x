{ 
module MyrtleLexer where 
import System.IO
import System.Environment
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
$white+       ; 
  "--".*        ; 
  $digit+        { tok (\p s -> TokenInt p (read s)) }
  subj           { tok (\p s -> TokenSubj p) }
  pred           { tok (\p s -> TokenPred p) }
  obj            { tok (\p s -> TokenObj p) }
  true           { tok (\p s -> TokenTrue p) }
  false          { tok (\p s -> TokenFalse p) }
  "-l"           { tok (\p s -> TokenLJoin p) }
  "-r"           { tok (\p s -> TokenRJoin p) }
  \,             { tok (\p s -> TokenComma p) }
  \<             { tok (\p s -> TokenLT p) }
  \>             { tok (\p s -> TokenGT p) }
  "=="           { tok (\p s -> TokenDEQ p) }
  "="            { tok (\p s -> TokenEQ p) }
  \+             { tok (\p s -> TokenPlus p) }
  \-             { tok (\p s -> TokenMinus p) }
  \*             { tok (\p s -> TokenTimes p) }
  \/             { tok (\p s -> TokenDiv p) }
  \^             { tok (\p s -> TokenExp p) }
  \(             { tok (\p s -> TokenLParen p) }
  \)             { tok (\p s -> TokenRParen p) }
  \[             { tok (\p s -> TokenLBrack p) }
  \]             { tok (\p s -> TokenRBrack p) }
  \|             { tok (\p s -> TokenPipe p) }
  \?             { tok (\p s -> TokenQuestion p) }
  \:             { tok (\p s -> TokenColon p) }
  \_             { tok (\p s -> TokenAll p) }
  filter         { tok (\p s -> TokenFilter p) }
  map            { tok (\p s -> TokenMap p) }
  union          { tok (\p s -> TokenUnion p) }
  join           { tok (\p s -> TokenJoin p) }
  where          { tok (\p s -> TokenWhere p) }
  and            { tok (\p s -> TokenAnd p) }
  or             { tok (\p s -> TokenOr p) }
  add            { tok (\p s -> TokenAdd p) }
  \" [$printable # \"]+.ttl\"                                { tok (\p s -> TokenFilename p (removeQuot s)) }
  \' [$printable # \']+.ttl\'                                { tok (\p s -> TokenFilename p (removeQuot s)) }
  $alpha [$alpha $digit \_ \’]*                              { \p s -> TokenVar p s }
  \" [$printable # \"]+ \"                                   { tok (\p s -> TokenString p (removeQuot s)) }
  \' [$printable # \']+ \'                                   { tok (\p s -> TokenString p (removeQuot s)) }
--
  "."                                                        { \p s -> TokenDot p }
  ";"                                                        { \p s -> TokenSemiColon p }
  "<"(http\:\/\/|https\:\/\/)[\. \/ \# $alpha $digit]*">"    { \p s -> TokenUrl p s }
  "<"[\. \/ \# $alpha $digit]*">"                            { \p s -> TokenUnbasedUrl p s }
  $alpha[$alpha $digit]*:[$alpha $digit]+                    { \p s -> TokenUnprefixedUrl p s }
  $alpha+                                                    { \p s -> TokenVariable p s }
  "@prefix"                                                  { \p s -> TokenPrefix p }
  "@base"                                                    { \p s -> TokenBase p }
--   "-"?$digit+                                               { tok (\p s -> TokenNumber p (read s))}
  
{ 
-- Each action has type :: AlexPosn -> String -> LangToken 

-- Helper function
tok f p s = f p s

removeQuot :: String -> String
removeQuot = tail . init

-- The token type: 
data LangToken = 
  TokenInt AlexPosn Int              | 
  TokenTrue AlexPosn                 |
  TokenFalse AlexPosn                |
  TokenSubj AlexPosn                 |
  TokenPred AlexPosn                 |
  TokenObj AlexPosn                  |
  TokenLJoin AlexPosn                |
  TokenRJoin AlexPosn                |
  TokenLT AlexPosn                   |
  TokenGT AlexPosn                   |
  TokenDEQ AlexPosn                  |
  TokenEQ AlexPosn                   |
  TokenPlus AlexPosn                 |
  TokenMinus AlexPosn                |
  TokenTimes AlexPosn                |
  TokenDiv AlexPosn                  |
  TokenExp AlexPosn                  |
  TokenLParen AlexPosn               |
  TokenRParen AlexPosn               |
  TokenLBrack AlexPosn               |
  TokenRBrack AlexPosn               |
  TokenComma AlexPosn                |
  TokenPipe AlexPosn                 |
  TokenQuestion AlexPosn             |
  TokenColon AlexPosn                |
  TokenAll AlexPosn                  |
  TokenFilter AlexPosn               |
  TokenMap AlexPosn                  |
  TokenUnion AlexPosn                |
  TokenJoin AlexPosn                 |
  TokenWhere AlexPosn                |
  TokenAnd AlexPosn                  |
  TokenOr AlexPosn                   |
  TokenVar AlexPosn String           |
  TokenDot AlexPosn                  |
  TokenSemiColon AlexPosn            |
  TokenString AlexPosn String        |
  TokenFilename AlexPosn String      |
  TokenUrl AlexPosn String           |
  TokenUnbasedUrl AlexPosn String    |
  TokenUnprefixedUrl AlexPosn String |
  TokenVariable AlexPosn String      |
  TokenPrefix AlexPosn               |
  TokenBase AlexPosn                 |
  TokenAdd AlexPosn                  
    deriving (Eq,Show) 

tokenPosn :: LangToken -> String
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSubj  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPred  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenObj  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLJoin  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRJoin  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLT  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGT  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDEQ  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEQ  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTimes (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDiv (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenExp (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLBrack (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRBrack (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPipe (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenQuestion (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAll (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFilter (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMap (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenUnion (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenJoin(AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhere(AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenString (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFilename (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)

tokenPosn (TokenAdd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDot (AlexPn a l c) ) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemiColon (AlexPn a l c) ) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenUrl (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenUnbasedUrl (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenUnprefixedUrl (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVariable (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrefix (AlexPn a l c) ) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBase (AlexPn a l c) ) = show(l) ++ ":" ++ show(c)

-- main :: IO()
-- main = do 
--         contents <- readFile "script.q"
--         let tokens = alexScanTokens contents
--         print(tokens)

}