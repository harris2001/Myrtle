
import RDF_Parser
import MyrtleLexer
import MyrtleParser

import System.Environment
import Control.Exception
import System.IO

import Data.List
import Data.Ord
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
                               putStr (printerTTLGraph (sortTriplets triplets))
evalQuery (WriteQuery q f) = do triplets <-(evalFilteredQ q)
                                writeFile f (nub(printerTTLGraph(sortTriplets triplets)))

--If there are any environment variables in the query, they are passed in the query before it's executed
evalFilteredQ :: FilteredQuery -> IO ([TTLTriplet])
evalFilteredQ (NewQuery q) = evalSimpleQ q [] []
evalFilteredQ (WhereQuery q w) = do let env = assign_vars w
                                    evalSimpleQ q [] env

-- Evaluates each query and returns the Final result in the form of list of triplets
evalSimpleQ :: BasicQuery -> [TTLTriplet] -> [Env] -> IO ([TTLTriplet])
evalSimpleQ (FuncStack f) tri env = (evalFunc f tri env)
evalSimpleQ (FuncStackSeq f q) tri env = do result <- (evalFunc f tri env)
                                            evalSimpleQ q result env

-- Evaluates all functions that are supported by our language
evalFunc :: Func -> [TTLTriplet] -> [Env] -> IO ([TTLTriplet])
evalFunc (Union slist) tri _ = do graphs <- (return_rdf (uniq (processingSlist slist)))
                                  return (union_backend ([tri]++graphs))
                               
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