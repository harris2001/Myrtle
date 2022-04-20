
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
        -- let ttlFiles = uniq (processingQuery expression)
        -- let rdf_parsed = rdf_parses ttlFiles
        -- -- Tuple (filename,TTLGraph)

        -- print(fst(head(rdf_parsed)))
        -- do 
        --    out <- snd (head (rdf_parsed ))
        --    print(printerTTLGraph out)
        toWrite <- processQuery expression
        print toWrite
        

---------------------------------------------------------------------------------
-------------------------------- Helper functions -------------------------------
---------------------------------------------------------------------------------


processQuery :: Query -> IO ()
processQuery (NewQuery q) = (processQwithF q)
processQuery (WhereQuery q createVars) = (processQwithF q)

processQwithF :: QueryWithFile -> IO ()
processQwithF (FuncStack f s) = (processFunc f s)
processQwithF (FuncStackSeq f s q) = do processFunc f s
                                        print "\n"
                                        processSimpleQ q s

processSimpleQ :: SimpleQuery -> String -> IO ()
processSimpleQ (FuncStackB f) outFile = (processFunc f outFile)
processSimpleQ (FuncStackBSeq f q) outFile = do processFunc f outFile
                                                print "\n"
                                                processSimpleQ q outFile

processFunc :: Func -> String -> IO ()
processFunc (Union slist) outFile = do y<-print_rdf (uniq (processingSlist slist))
                                       writeFile outFile y
                               

print_rdf :: [String] -> IO String
print_rdf [] = return ""
print_rdf (x:xs) = do graph <-parsing x
                      do let y=printerTTLGraph graph
                         ys<-print_rdf xs
                         return (y++"\n"++ys)


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

processingQuery :: Query -> String
processingQuery (NewQuery q) = (processingQwithF q)
processingQuery (WhereQuery q createVars) = (processingQwithF q)

processingQwithF :: QueryWithFile -> String
processingQwithF (FuncStack f s) = (processingFunc f)++s++"#"
processingQwithF (FuncStackSeq f s q) = (processingFunc f)++s++"#"++(processingSimpleQ q)

processingSimpleQ :: SimpleQuery -> String
processingSimpleQ (FuncStackB f) = (processingFunc f)
processingSimpleQ (FuncStackBSeq f q) = (processingFunc f)++(processingSimpleQ q)

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

processingFunc :: Func -> String
processingFunc (Map cond) = ""
processingFunc (Union slist) = (processingSlist slist)
processingFunc (NormalJoin node1 node2 slist) = (processingSlist slist)
processingFunc (Join option node1 node2 slist) = (processingSlist slist)
processingFunc (Filter filter1 filter2 literal) = ""

------------------------------------ END --------------------------------------
-------------------------------------------------------------------------------