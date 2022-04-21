{ 
module RDF_Parser where 
import RDF_Lexer 
import System.IO
import System.Environment
}

%name parserTurtle 
%tokentype { Token } 
%error { parseError }
%token 
  '.'           {TokenDot _ }
  ':'           {TokenColon _ }
  ','           {TokenComa _ }
  ';'           {TokenSemiColon _ }
  string        {TokenString _ $$ }
  url           {TokenUrl _ $$ }
  unbasedUrl    {TokenUnbasedUrl _ $$ }
  unprefixedUrl {TokenUnprefixedUrl _ $$ }
  true          {TokenTrue _ }
  false         {TokenFalse _ }
  prefix        {TokenPrefix _ }
  base          {TokenBase _ }
  number        {TokenNumber _ $$}
  var           { TokenVar _ $$ }

%left ',' ';' '.'
%% 

TTLGraph : TTLTriplet                                    { GraphTriplet $1 }
         | base Url                                      { Base $2 }
         | prefix var ':' Url                            { Prefix $2 $4 }
         | TTLGraph '.' TTLGraph                         { Seq $1 $3 }
         | TTLGraph '.'                                  { $1 }

TTLTriplet : TTLSubject PredicateObject                  { Triplet $1 $2 }

TTLSubject : Url                                    { Sbj $1 }

TTLPredicate : Url                                  { TTLPred $1 }

PredicateObject: TTLPredicate TTLObject                           { PredObj $1 $2 }
               | PredicateObject ';' PredicateObject           { PredObjList $1 $3 }    

TTLObject : Url                         { UrlObj $1 }
       | number                         { IntObj $1 }
       | true                           { TTLBoolObj True }
       | false                          { TTLBoolObj False }
       | string                         { StrObj $1 }
       | TTLObject ',' TTLObject        { ObjList $1 $3 }


Url : url                               { FinalUrl $1 }
    | unbasedUrl                        { BaseNeededUrl ("<@base:"++(tail $1))}
    | unprefixedUrl                     { PrefixNeededUrl ("<"++$1++">") }


{
-- ParseError function is used (mostly) for debugging purposes
-- Indicates the row/colum where an error occurs
parseError :: [Token] -> a
parseError ((TokenDot (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenColon (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenUnbasedUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenUnprefixedUrl (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenTrue (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenFalse (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenPrefix (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenBase (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenNumber (AlexPn _ x y) _ ) : xs) = error (printing x y)

parseError ((TokenComa (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenSemiColon (AlexPn _ x y)) : xs) = error (printing x y)
parseError ((TokenString (AlexPn _ x y) _ ) : xs) = error (printing x y)
parseError ((TokenVar (AlexPn _ x y) _ ) : xs) = error (printing x y)

printing x y = "Issue in row: "++show x ++ ", column:" ++ show y


-- A url datatype holds all three possible types of urls
-- Final, BaseNeeded and PrefixNeeded Url
data Url =  FinalUrl String | BaseNeededUrl String | PrefixNeededUrl String
    deriving Show

data TTLSubject = Sbj Url
    deriving Show

data TTLPredicate = TTLPred Url
    deriving Show

data TTLObject = UrlObj Url | IntObj Int | TTLBoolObj Bool | StrObj String | ObjList TTLObject TTLObject
    deriving Show

data PredicateObject = PredObj TTLPredicate TTLObject | PredObjList PredicateObject PredicateObject
    deriving Show

data TTLGraph = GraphTriplet TTLTriplet
         | Base Url
         | Prefix String Url
         | Seq TTLGraph TTLGraph
      deriving Show

data TTLTriplet = Triplet TTLSubject PredicateObject
    deriving Show

-- Returns the string value of the Url datatype
getUrl ::  Url -> String
getUrl (FinalUrl u) = u
getUrl (BaseNeededUrl u) = u
getUrl (PrefixNeededUrl u) = u

-- Takes a Url, the base url and the list of prefixes and return the reformed url
rebaseUrl :: Url -> TTLGraph -> [TTLGraph] -> Url
rebaseUrl (FinalUrl url) _ _ = FinalUrl url
rebaseUrl (BaseNeededUrl url) (Base (FinalUrl base)) _ = FinalUrl ("<"++tail (takeWhile('>'/=) base)++(tail (dropWhile(':'/=)url)))
rebaseUrl (PrefixNeededUrl url) _ [] = error "No more prefixes found to unpack"
rebaseUrl u@(PrefixNeededUrl url) b@(Base (FinalUrl base)) ps@((Prefix prefix (FinalUrl mapping)):p@prefixes) | prefix == (tail(takeWhile(':'/=) url)) = FinalUrl ("<"++tail (takeWhile('>'/=)mapping)++(tail (dropWhile(':'/=)url)))
                                                                                                              | otherwise = rebaseUrl u b p
rebaseUrl u b ps = error "(getUrl u)"
--f = rebaseUrl (PrefixNeededUrl "p:asgasg") (Base (FinalUrl "https://test/t/")) [Prefix "p" (FinalUrl "<http://www.cw.org/qprefix/>")]

-- Replaces all the occurences of Url in an TTLGraph datatype
modify :: TTLGraph -> TTLGraph -> [TTLGraph] -> (TTLGraph, TTLGraph, [TTLGraph])
modify (Base base) b ps = (Base base, Base base, ps)
modify pref@(Prefix s u@(FinalUrl url)) b ps = ((Prefix s u), b, (ps++[pref]))
modify pref@(Prefix s url) b ps = ((Prefix s uu), b, (ps++[Prefix s uu]))
    where uu = (rebaseUrl url b ps)
modify (GraphTriplet(Triplet (Sbj subj) predObj)) b ps = (GraphTriplet(Triplet (Sbj (rebaseUrl subj b ps)) (modifyPredObj predObj b ps)), b, ps)
modify (Seq exp1 exp2) b ps = ((Seq exp11 exp22), base2, prefixes2)
            where e1 = getExp (modify exp1 b ps)
                  exp11 = head (e1 1)
                  base1 = head (e1 2)
                  prefixes1 = e1 3
                  e2 = (getExp (modify exp2 base1 prefixes1))
                  exp22 = head (e2 1)
                  base2 = head (e2 2)
                  prefixes2 = e2 3
-- modify exp p ps = exp p ps

getExp :: (TTLGraph, TTLGraph, [TTLGraph]) -> Int -> [TTLGraph]
getExp (exp, base, prefixes) option | option==1 = [exp]
                                    | option==2 = [base]
                                    | option==3 = prefixes
                                    | otherwise = error "Invalid option"

-- Applies the modify function to PredicateObject datatype
modifyPredObj :: PredicateObject -> TTLGraph -> [TTLGraph] -> PredicateObject
modifyPredObj (PredObj (TTLPred p) obj) b ps = (PredObj(TTLPred(rebaseUrl p b ps))(modifyObj obj b ps))
modifyPredObj (PredObjList p1 p2) b ps = (PredObjList (modifyPredObj p1 b ps) (modifyPredObj p2 b ps))


-- Rebases Objects (only changes urlObj)
modifyObj :: TTLObject -> TTLGraph -> [TTLGraph] -> TTLObject
modifyObj (ObjList obj1 obj2) b ps = (ObjList (modifyObj obj1 b ps)(modifyObj obj2 b ps))
modifyObj (UrlObj url) b ps = (UrlObj (rebaseUrl url b ps))
modifyObj u b ps = u

-- Gets the filename and returns the parsed graph
parsing :: String -> IO(TTLGraph)
parsing str = do 
                 contents <- readFile str
                 let tokens = alexScanTokens contents
                 -- print(tokens)
                 let expression = parserTurtle tokens
                --  print(expression)
                 return (head(getExp (modify expression (Base(FinalUrl "")) []) 1))

-------------------------------------
-- Prints ttl file as readable text--

printerUrl :: Url -> String
printerUrl (FinalUrl url) = (url++" ")
printerUrl (BaseNeededUrl url) = (url++" ")
printerUrl (PrefixNeededUrl url) = (url++" ")

printerTTLSubject :: TTLSubject -> String
printerTTLSubject  (Sbj url) = printerUrl url

printerTTLPredicate :: TTLPredicate -> String
printerTTLPredicate  (TTLPred url) = printerUrl url

printerTTLObject :: TTLObject -> String
printerTTLObject (UrlObj url) = printerUrl url 
printerTTLObject (IntObj int) = (show int++" ") 
printerTTLObject (TTLBoolObj True) = "true "
printerTTLObject (TTLBoolObj False) = "false "
printerTTLObject (StrObj str) = (str++" ") 
printerTTLObject (ObjList obj1 obj2) = (printerTTLObject obj1)++", "++(printerTTLObject obj2)

printerPredicateObject :: PredicateObject -> String
printerPredicateObject (PredObj pred obj) = (printerTTLPredicate pred)++(printerTTLObject obj)
printerPredicateObject (PredObjList predobj1 predobj2) = (printerPredicateObject predobj1)++"; "++printerPredicateObject predobj2

-- printerTTLGraph :: TTLGraph -> String
-- printerTTLGraph  (GraphTriplet(Triplet subj predobj)) = (printerTTLSubject subj)++(printerPredicateObject predobj)++"."

-- printerTTLGraph (Base url) = ""
-- printerTTLGraph (Prefix str url) = ""
-- printerTTLGraph (Seq graph1 graph2) = if x2 == ""
--                                         then
--                                             x1++x2 
--                                         else
--                                             x1++"\n"++x2                                        
--     where x1 = printerTTLGraph graph1
--           x2 = printerTTLGraph graph2


printerTTLGraph :: [TTLTriplet] -> String
printerTTLGraph [] = ""
printerTTLGraph ((Triplet subj predobj) : triplets) = (printerTTLSubject subj)++(printerPredicateObject predobj)
                                                      ++".\n"
                                                      ++printerTTLGraph triplets
          
----------------------------------------------------------------------------------------------------------------------------------
-- Returns a ttl graph as a list of triplets (better for mapping functions on triplets rather than traversing the TTLGraph tree)

returnTTLGraph :: TTLGraph -> [TTLTriplet]
returnTTLGraph (Base _) = []
returnTTLGraph (Prefix _ _) = []
returnTTLGraph (Seq graph1 graph2) = (returnTTLGraph graph1) ++ (returnTTLGraph graph2)
returnTTLGraph (GraphTriplet tr@(Triplet subj predobj)) = returnTTLTriplet tr

--Splits a complex triplet to a list of simple triplets
returnTTLTriplet :: TTLTriplet -> [TTLTriplet]
returnTTLTriplet (Triplet s predObj) = [Triplet s pObj |pObj <-returnTTLPredObj predObj]

--Splits an PredObjectList to a list of PredicateObjects
returnTTLPredObj :: PredicateObject -> [PredicateObject]
returnTTLPredObj (PredObj pred object) = [PredObj pred obj | obj<-returnTTLObj object]
returnTTLPredObj (PredObjList predObj1 predObj2) = (returnTTLPredObj predObj1)++(returnTTLPredObj predObj2) 

-- Splits an ObjectList to a list of Objects
returnTTLObj :: TTLObject -> [TTLObject]
returnTTLObj (ObjList obj1 obj2) = (returnTTLObj obj1)++(returnTTLObj obj2)
returnTTLObj obj = [obj]

}