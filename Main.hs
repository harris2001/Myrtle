
import RDF_Parser
import MyrtleLexer
import MyrtleParser

import System.Environment
import Control.Exception
import System.IO

import Data.List
import Data.Ord

import EvalBool
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
evalQuery (OutputQuery q) = do triplets <-(evalFilteredQ q)
                               putStr (printerTTLGraph (sortTriplets triplets))
evalQuery (WriteQuery q f) = do triplets <-(evalFilteredQ q)
                                writeFile f (nub(printerTTLGraph(sortTriplets triplets)))

--If there are any environment variables in the query, they are passed in the query before it's executed
evalFilteredQ :: FilteredQuery -> IO ([TTLTriplet])
evalFilteredQ (NewQuery q) = evalSimpleQ q [] []
evalFilteredQ (WhereQuery q w) = do let envs = assign_vars w []
                                    printAssignments envs (IntObj 2)
                                    evalSimpleQ q [] envs

printAssignments :: [Env] -> TTLObject -> IO ()
printAssignments [] _ = print ""
printAssignments ((str,IntVarAss intexp):env) obj = do print ("("++str++",")
                                                       print intexp
                                                       print ")"
                                                       printAssignments env obj
                                                       
printAssignments ((str,BoolVarAss boolexp):env) obj = do print ("("++str++",")
                                                         if boolexp == True 
                                                            then
                                                                 print "True"
                                                            else
                                                                 print "False"
                                                         print ")"
printAssignments _ _ = print "Testing"
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
evalFunc (Get filterSubj filterPred list) tri env = return (filterBackend tri (filterSubj, filterPred, list))

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
assign_vars (VarEnv var vars) envs = newVar ++ assign_vars vars (envs++newVar) 
        where newVar = assign_var var envs

assign_var :: CreateVar -> [Env] -> [Env]
assign_var (IntVar str intexp) envs = envs ++ [(str,IntVarAss (evalInt intexp envs))]
assign_var (BoolVar str boolexp) envs = envs ++ [(str,BoolVarAss (evalSimpleBool boolexp envs))]
assign_var (StringVar str val) envs = envs ++ [(str,StringVarAss (evalSimpleStr val envs))]

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
filterBackend :: [TTLTriplet] -> (FilterEl, FilterEl, LiteralList) -> [TTLTriplet]
filterBackend [] (_,_,_)= [] --error "Query GET needs to be passed a file to execute \n Specify file by SELECT FROM \"$filename.ttl\""
filterBackend (tri@(Triplet (Sbj subj)(PredObj (TTLPred pred) obj)):xs) (s,p,o) | (((elem (getUrl subj) (filterToList s)) || (anything s)) && ((elem (getUrl pred) (filterToList p)) || (anything p)) && ((filterObjectList obj o) || (anything p)))  = [tri]++(filterBackend xs (s,p,o))
                                                                                | otherwise = filterBackend xs (s,p,o)
                                                                      
filterObjectList :: TTLObject -> LiteralList -> Bool
-- filterObjectList _ _ = True
filterObjectList obj (LiteralLst(LiteralSeq lit lits)) = (filterObject obj lit) || (filterObjectList obj (LiteralLst lits))
filterObjectList obj (LiteralLst(SingleLit lit)) = filterObject obj lit

filterObject :: TTLObject -> Literal -> Bool
filterObject _ AnyLit = True
filterObject (UrlObj (FinalUrl url)) (UrlLit (NewUrl url2)) = url==url2
filterObject obj@(IntObj int) (BoolLit boolexp) = (evalBoolObj boolexp[]) obj 
filterObject obj@(TTLBoolObj bool) (BoolLit boolexp) = (evalBoolObj boolexp[]) obj
filterObject obj@(StrObj str) (StrLit str2)= str == (evalSimpleStr str2 []) 
filterObject _ _ = False

--Returns true if every subject is allowed ('_')
anything :: FilterEl -> Bool
anything Any = True
anything _ = False

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