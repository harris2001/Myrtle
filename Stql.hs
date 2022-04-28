
import RDF_Parser
import MyrtleLexer
import MyrtleParser

import System.Environment
import Control.Exception
import System.IO

import Data.List
import Data.Ord

import Eval
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
        print(expression)
        evalQuery expression
        
---------------------------------------------------------------------------------
-------------------------------- Helper datatypes -------------------------------
---------------------------------------------------------------------------------
-- Now defined in EvalBool

-- data Assignment = IntVarAss IntExp | BoolVarAss BoolExp | StringVarAss StringExp

-- type Env = (String,Assignment)

---------------------------------------------------------------------------------
-------------------------------- Helper functions -------------------------------
---------------------------------------------------------------------------------

-- Print query result or write it in file
evalQuery :: Query -> IO ()
evalQuery (OutputQuery inp q) = do graph <- (return_rdf (uniq (processingSlist (StrListSingle inp))))
                                   triplets <-(evalFilteredQ q (head graph))
                                   putStr (printerTTLGraph (sortTriplets triplets))
evalQuery (WriteQuery inp q f) = do graph <- (return_rdf (uniq (processingSlist (StrListSingle inp))))
                                    triplets <-(evalFilteredQ q (head graph))
                                    writeFile f (nub(printerTTLGraph(sortTriplets triplets)))

--If there are any environment variables in the query, they are passed in the query before it's executed
evalFilteredQ :: FilteredQuery -> [TTLTriplet] -> IO ([TTLTriplet])
evalFilteredQ (NewQuery q) graph = evalSimpleQ q graph []
evalFilteredQ (WhereQuery q w) graph = do let envs = assign_vars w []
                                          printAssignments envs (IntObj 2)
                                          evalSimpleQ q graph envs

printAssignments :: [Env] -> TTLObject -> IO ()
printAssignments [] _ = putStr ""
printAssignments ((str,IntVarAss intexp):env) obj = do putStr (str++": ")
                                                       print intexp
                                                       printAssignments env obj
                                                       
printAssignments ((str,BoolVarAss boolexp):env) obj = do putStr (str++": ")
                                                         if boolexp == True 
                                                            then
                                                                 putStr "true\n"
                                                            else
                                                                 putStr "false\n"
                                                         printAssignments env obj
printAssignments ((str,StringVarAss strexp):env) obj = do putStr (str++": ")
                                                          print strexp
                                                          printAssignments env obj

printAssignments ((str,UrlVarAss url):env) obj = do putStr (str++": ")
                                                    print $ evalUrl url []
                                                    printAssignments env obj

-- printAssignments ((str,StringVarAss str):env) = do print "("++str++","++evalString(str)++")"

-- Evaluates each query and returns the Final result in the form of list of triplets
evalSimpleQ :: BasicQuery -> [TTLTriplet] -> [Env] -> IO ([TTLTriplet])
evalSimpleQ (FuncStack f) tri env = (evalFunc f tri env)
evalSimpleQ (FuncStackSeq f q) tri env = do result <- (evalFunc f tri env)
                                            evalSimpleQ q result env

-- Evaluates all functions that are supported by our language
evalFunc :: Func -> [TTLTriplet] -> [Env] -> IO ([TTLTriplet])
evalFunc (Union slist) tri _ = do graphs <- (return_rdf (uniq (processingSlist slist)))
                                  return (union_backend ([tri]++graphs))
evalFunc (Filter(TTLComb filterSubj filterPred list)) tri env = return (filterBackend tri env (filterSubj, filterPred, list))
evalFunc (Filter(TTLCombs(SingleFilter filterSubj filterPred list))) tri env = return (filterBackend tri env (filterSubj, filterPred, list))
evalFunc (Filter(TTLCombs(FilterSeq filterSubj filterPred list combs))) tri env = do t1 <- evalFunc (Filter(TTLCombs (SingleFilter filterSubj filterPred list))) tri env
                                                                                     t2 <- evalFunc (Filter(TTLCombs combs)) tri env
                                                                                     return (t1++t2)

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
return_rdf (x:xs) = do graph <- (parsing x)
                       do let y=returnTTLGraph graph
                          ys<-return_rdf xs
                          return ([y]++ys)

-- Returns a list of environment variables and their values
assign_vars :: CreateVars -> [Env] -> [Env]
assign_vars (UVarEnv var) envs = assign_var var envs
assign_vars (VarEnv var vars) envs = assign_vars vars (newVar) 
        where newVar = assign_var var envs

assign_var :: CreateVar -> [Env] -> [Env]
assign_var (IntVar str intexp) envs | elem str $ map fst envs = error ("Multiple declarations of "++show str)
                                    | otherwise = envs ++ [(str,IntVarAss (evalInt intexp envs))]
assign_var (BoolVar str boolexp) envs| elem str $map fst envs = error ("Multiple declarations of "++show str)
                                     | otherwise = envs ++ [(str,BoolVarAss (evalSimpleBool boolexp envs))]
assign_var (StringVar str val) envs | elem str $map fst envs = error ("Multiple declarations of "++show str)
                                    | otherwise = envs ++ [(str,StringVarAss (evalSimpleStr val envs))]
assign_var (UrlVar str val) envs | elem str $map fst envs = error ("Multiple declarations of "++show str)
                                 | otherwise = envs ++ [(str,UrlVarAss val)]

------------------------------------------------------------------------------------------------------------------
--                                             Functions Backend                                                --
------------------------------------------------------------------------------------------------------------------
-- Combines [[TTLTriplet]] together to a single [Triplet]

-- Union_Backend:
union_backend :: [[TTLTriplet]] -> [TTLTriplet]
union_backend [] = error "Empty list detected"
union_backend [[]] = []
union_backend (x:xs) = x++union_backend xs

-- Filter_Backend: 
filterBackend :: [TTLTriplet] -> [Env] -> (FilterEl, FilterEl, LiteralList) -> [TTLTriplet]
filterBackend [] env (_,_,_)= [] --error "Query GET needs to be passed a file to execute \n Specify file by SELECT FROM \"$filename.ttl\""
filterBackend (tri@(Triplet (Sbj subj)(PredObj (TTLPred pred) obj)):xs) env (s,p,o) | ( ((anything s) || (elem (getUrl subj) (filterToList s))) && ((anything p) || (elem (getUrl pred) (filterToList p))) && ((anythinglit o) || (filterObjectList obj o env)))  = [tri]++(filterBackend xs env (s,p,o))
                                                                                    | otherwise = filterBackend xs env (s,p,o)

filterObjectList :: TTLObject -> LiteralList -> [Env] -> Bool
filterObjectList obj (LiteralLst(LiteralSeq lit lits)) env = (filterObject obj lit env ) || (filterObjectList obj (LiteralLst lits) env)
filterObjectList obj (LiteralLst(SingleLit lit)) env = filterObject obj lit env

filterObject :: TTLObject -> Literal -> [Env] -> Bool
filterObject obj(BoolLit boolexp) env = (evalBoolObj boolexp env) obj 
filterObject _ _ _ = False

--Returns true if all subjects/objects are allowed ('_')
anything :: FilterEl -> Bool
anything Any = True
anything _ = False

--Returns true if all objects is allowed ('_')
anythinglit :: LiteralList -> Bool
anythinglit AnyLit = True
anythinglit _ = False

------------------------------------------------------------------------------------------------------------------


-- Sorting triplets in the following order:
-- 1) Sort subj pred alphabetically
-- 2) If subj pred is the same =>
--    Sort based on object in the following order
--    a) Compare similar types
--    b) Different types have the following priorities: Url > Int > Bool > Str

sortTriplets :: [TTLTriplet]-> [TTLTriplet]
sortTriplets graph = (sortBy subjectSort graph)

subjectSort :: TTLTriplet -> TTLTriplet -> Ordering
subjectSort (Triplet (Sbj url1) predObj1 ) (Triplet (Sbj url2) predObj2 ) | printerUrl url1 > printerUrl url2 = GT
                                                                          | printerUrl url1 == printerUrl url2 = predObjSort predObj1 predObj2
                                                                          | otherwise = LT

predObjSort :: PredicateObject -> PredicateObject -> Ordering
predObjSort (PredObj (TTLPred pred1) obj1) (PredObj (TTLPred pred2) obj2) | printerUrl pred1 > printerUrl pred2 = GT
                                                                          | printerUrl pred1 == printerUrl pred2 = objSort obj1 obj2
                                                                          | otherwise = LT

objSort :: TTLObject -> TTLObject -> Ordering
objSort (UrlObj url1) (UrlObj url2) = compare (printerUrl url1) (printerUrl url2)
objSort (IntObj obj1) (IntObj obj2) = compare obj1 obj2
objSort (TTLBoolObj obj1) (TTLBoolObj obj2) = compare obj1 obj2
objSort (StrObj obj1) (StrObj obj2) = compare obj1 obj2
objSort (UrlObj url1) (IntObj url2) = GT
objSort (UrlObj url1) (TTLBoolObj obj2) = GT
objSort (UrlObj url1) (StrObj obj2) = GT
objSort (IntObj obj1) (TTLBoolObj obj2) = GT
objSort (IntObj obj1) (StrObj obj2) = GT
objSort (TTLBoolObj obj1) (StrObj obj2) = GT
objSort x y = LT



unzipSList :: [String] -> String
unzipSList (x:xs) = x++"\n"++(unzipSList xs)


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


-- Creates a string with all the files in an slist, separated by hashtags
processingSlist :: SList -> String
processingSlist (StrList sListElem) = (processingSlistElem sListElem)
processingSlist (StrListSingle str) = str++"#"

processingSlistElem :: SListElem -> String
processingSlistElem(SListEl str) = str++"#"
processingSlistElem(SListSeq str elems) = str++"#"++(processingSlistElem elems)