
import RDF_Parser
import MyrtleLexer
import MyrtleParser

import System.Environment
import Control.Exception
import System.IO

import Data.List

---------------------------------------------------------------------------------
-------------------------------------- Main -------------------------------------
---------------------------------------------------------------------------------

main :: IO ()
main = do 
        file <- getArgs
        contents <- readFile (head file)
        let tokens = alexScanTokens contents
        -- print(tokens)
        let expression = parseQuery tokens
        -- print(expression)
        evalQuery expression
        
---------------------------------------------------------------------------------
-------------------------------- Helper datatypes -------------------------------
---------------------------------------------------------------------------------

data Assignment = IntVarAss IntExp | BoolVarAss BoolExp | StringVarAss StringExp

type Env = (String,Assignment)

---------------------------------------------------------------------------------
-------------------------------- Helper functions -------------------------------
---------------------------------------------------------------------------------

-- Print query result or write it in file
evalQuery :: Query -> IO ()
evalQuery (OutputQuery q) = do triplets <-(evalFilteredQ q)
                               putStr (sortTriplets triplets)
evalQuery (WriteQuery q f) = do triplets <-(evalFilteredQ q)
                                writeFile f (sortTriplets triplets)

evalFilteredQ :: FilteredQuery -> IO ([TTLTriplet])
evalFilteredQ (NewQuery q) = evalSimpleQ q [] []
evalFilteredQ (WhereQuery q w) = do let env = assign_vars w
                                    evalSimpleQ q [] env

-- Eval loop
evalSimpleQ :: BasicQuery -> [TTLTriplet] -> [Env] -> IO ([TTLTriplet])
evalSimpleQ (FuncStack f) tri env = (evalFunc f tri env)
evalSimpleQ (FuncStackSeq f q) tri env = do result <- (evalFunc f tri env)
                                            evalSimpleQ q result env

evalFunc :: Func -> [TTLTriplet] -> [Env] -> IO ([TTLTriplet])
evalFunc (Union slist) tri _ = do graphs <- (return_rdf (uniq (processingSlist slist)))
                                  return (union_backend ([tri]++graphs))

-- processFunc (Map cnd)
                               
-- Takes a list of turtle files and prints them
print_rdf :: [String] -> IO String
print_rdf [] = return ""
print_rdf (x:xs) = do graph <-parsing x
                      do let y=printerTTLGraph (returnTTLGraph graph)
                         ys<-print_rdf xs
                         return (y++"\n"++ys)

-- Takes a list of turtle files and returns a list of graphs in the form of triplet lists
return_rdf :: [String] -> IO ([[TTLTriplet]])
return_rdf [] = return [[]]
-- return_rdf (x:xs) = return [[Triplet (Sbj (FinalUrl "s"))(TTLPred (FinalUrl "p"))(UrlObj (FinalUrl "o"))]]
return_rdf (x:xs) = do graph <- (parsing x)
                       do let y=returnTTLGraph graph
                          ys<-return_rdf xs
                          return ([y]++ys)
                --        return [[Triplet (Sbj (FinalUrl "s"))(PredObj (TTLPred (FinalUrl "p"))(UrlObj (FinalUrl "o")))]]

assign_vars :: CreateVars -> [Env]
assign_vars (UVarEnv var) = [assign_var var]
assign_vars (VarEnv var vars) = [assign_var var] ++ assign_vars vars

assign_var :: CreateVar -> Env
assign_var (IntVar str int) = (str,IntVarAss int)
assign_var (BoolVar str bool) = (str,BoolVarAss bool)
assign_var (StringVar str str2) = (str,StringVarAss str2)

-- Union_Backend: Combines [[TTLTriplet]] together to a single [Triplet]
union_backend :: [[TTLTriplet]] -> [TTLTriplet]
union_backend [] = error "Slist is empty"
union_backend [[]] = []
union_backend (x:xs) = x++union_backend xs



sortTriplets :: [TTLTriplet]-> String
sortTriplets graph = printerTTLGraph graph --unzipSList(sort(map returnTTLGraph graph))



-- Takes a character and a string (and an empty list) and returns the string as
-- a list splitted on character given  
splitOn ::  Char -> String -> [String] -> [String]
splitOn c "" res = res
splitOn c (x:xs) res | x==c = res++(splitOn c xs [""])
                     | otherwise = splitOn c xs (((head res)++[x]):(tail res))

-- Takes a list of hashtag splitted string and
-- returns a list of unique strings
uniq :: String -> [String]
uniq str = nub (splitOn '#' (reverse(tail(reverse(str)))) [""])

-- Takes a list of turtle files and returns a list of (filename, parsed_rdf_graph)
rdf_parses :: [String] -> [(String, IO TTLGraph)]
rdf_parses (x:xs) = [(x,parsing x)]++rdf_parses xs

unzipSList :: [String] -> String
unzipSList (x:xs) = x++"\n"++(unzipSList xs)
-------------------------------------------------------------------------------
------------------------------------ START ------------------------------------
-- Series of functions that parse the query and find all rdf files in it


-- processingGraph (Subj) = ""
-- processingGraph (Pred) = ""
-- processingGraph (Obj) = ""
-- processingGraph (S subj) = ""
-- processingGraph (P pred) = ""
-- processingGraph (O obj) = ""
-- processingGraph (QString str) = ""

-- processingGraph (PlusII int1 int2) = "" 
-- processingGraph (PlusOI obj1 int2) = "" 
-- processingGraph (PlusIO int1 obj2) = "" 
-- processingGraph (PlusOO obj1 obj2) = "" 
-- processingGraph (MinusII int1 int2) = "" 
-- processingGraph (MinusOI obj1 int2) = "" 
-- processingGraph (MinusIO int1 obj2) = "" 
-- processingGraph (MinusOO obj1 obj2) = "" 
-- processingGraph (TimesII int1 int2) = "" 
-- processingGraph (TimesOI obj1 int2) = "" 
-- processingGraph (TimesIO int1 obj2) = "" 
-- processingGraph (TimesOO obj1 obj2) = "" 
-- processingGraph (DivII int1 int2) = "" 
-- processingGraph (DivOI obj1 int2) = "" 
-- processingGraph (DivIO int1 obj2) = "" 
-- processingGraph (DivOO obj1 obj2) = "" 
-- processingGraph (ExpoII int1 int2) = "" 
-- processingGraph (ExpoOI obj1 int2) = "" 
-- processingGraph (ExpoIO int1 obj2) = "" 
-- processingGraph (ExpoOO obj1 obj2) = "" 
-- processingGraph (QInt int1) = ""
-- processingGraph (NegateI int1) = ""
-- processingGraph (NegateO obj1) = ""
-- processingGraph (IntVariable str1) = ""

-- processingGraph (And bool1 bool2) = ""
-- processingGraph (AndIO int1 obj2) = ""
-- processingGraph (AndOI obj1 int2) = ""
-- processingGraph (Or bool1 bool2) = ""
-- processingGraph (OrIO int1 obj2) = ""
-- processingGraph (OrOI obj1 int2) = ""
-- processingGraph (GTII int1 int2) = ""
-- processingGraph (GTIO int1 obj2) = ""
-- processingGraph (GTOI obj1 int2) = ""
-- processingGraph (LTII int1 int2) = ""
-- processingGraph (LTIO int1 obj2) = ""
-- processingGraph (LTOI obj1 int2) = ""
-- processingGraph (EQII int1 int2) = ""
-- processingGraph (EQBB bool1 bool2) = ""
-- processingGraph (EQSS str1 str2) = ""
-- processingGraph (EQUU url1 url2) = ""
-- processingGraph (EQOS obj1 str2) = ""
-- processingGraph (EQSO str1 obj2) = ""
-- processingGraph (EQOI obj1 int2) = ""
-- processingGraph (EQIO int1 obj2) = ""
-- processingGraph (EQOB obj1 bool2) = ""
-- processingGraph (EQBO bool1 obj2) = ""
-- processingGraph (EQSU str1 url2) = ""
-- processingGraph (EQUS url1 str2) = ""
-- processingGraph (EQPU pred1 url2) = ""
-- processingGraph (EQUP url1 pred2) = ""
-- processingGraph (EQOU obj1 url2) = ""
-- processingGraph (EQUO url1 obj2) = ""
-- processingGraph (QTrue) = ""
-- processingGraph (QFalse) = ""

processingSlist :: SList -> String
processingSlist (StrList sListElem) = (processingSlistElem sListElem)
processingSlist (StrListSingle str) = str++"#"

processingSlistElem :: SListElem -> String
processingSlistElem(SListEl str) = str++"#"
processingSlistElem(SListSeq str elems) = str++"#"++(processingSlistElem elems)

-- processingGraph (IntVar str expr) = ""
-- processingGraph (BoolVar str expr) = ""
-- processingGraph (StringVar str expr) = ""

-- processingGraph (UVarEnv createVar) = ""
-- processingGraph (VarEnv createVar createVars) = ""

                                        
-------------------------------- Beginning

                        -- processingQuery :: Query -> String
                        -- processingQuery (NewQuery q) = (processingFilteredQ q)
                        -- processingQuery (WhereQuery q createVars) = (processingFilteredQ q)
                        -- 
                        -- processingFilteredQ :: FilteredQuery -> String
                        -- processingFilteredQ (NewQuery q) = (processingFunc f)++s++"#"
                        -- processingFilteredQ (WhereQuery q w) = (processingFunc f)++s++"#"++(processingBasicQ q)
                        -- 
                        -- processingBasicQ :: BasicQuery -> String
                        -- processingBasicQ (FuncStack f) = (processingFunc f)
                        -- processingBasicQ (FuncStackSeq f q) = (processingFunc f)++(processingBasicQ q)

-- processingGraph (Always act) = ""
-- processingGraph (ActionSeq act1 act2) = ""
-- processingGraph (If b cond1 cond2) = ""

-- processingGraph (AssignSubj subj url) = ""
-- processingGraph (AssignPred pred url) = ""
-- processingGraph (AssignObjUrl obj url) = ""
-- processingGraph (AssignObjStr obj str) = ""
-- processingGraph (AssignObjInt obj int) = ""
-- processingGraph (AssignObjBool obj bool) = ""

-- processingGraph (BidirectJoin) = ""
-- processingGraph (LeftJoin) = ""
-- processingGraph (RightJoin) = ""

-- processingGraph (SimpleUrl url) = ""
-- processingGraph (UrlSeq url urlList) = ""

-- processingGraph (Any) = ""
-- processingGraph (FilteredList urlList) = "" 

-- processingGraph (IntLit exp) = ""
-- processingGraph (BoolLit exp) = ""
-- processingGraph (StrLit exp) = ""
-- processingGraph (AnyLit) = ""

                        -- processingFunc :: Func -> String
                        -- processingFunc (Map cond) = ""
                        -- processingFunc (Union slist) = (processingSlist slist)
                        -- processingFunc (NormalJoin node1 node2 slist) = (processingSlist slist)
                        -- processingFunc (Join option node1 node2 slist) = (processingSlist slist)
                        -- processingFunc (Filter filter1 filter2 literal) = ""

------------------------------------ END --------------------------------------
-------------------------------------------------------------------------------