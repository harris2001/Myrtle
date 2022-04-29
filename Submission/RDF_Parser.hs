{-# OPTIONS_GHC -w #-}
module RDF_Parser where 
import RDF_Lexer 
import System.IO
import System.Environment
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,54) ([32768,51,1792,0,0,7168,0,0,0,0,0,0,0,4,0,256,3584,0,0,128,0,1648,61440,19,16,0,0,1792,16384,0,0,0,0,0,0,0,0,0,0,0,7,0,0,638,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parserTurtle","TTLGraph","TTLTriplet","TTLSubject","TTLPredicate","PredicateObject","TTLObject","Url","'.'","':'","','","';'","string","url","unbasedUrl","unprefixedUrl","true","false","prefix","base","number","var","%eof"]
        bit_start = st Prelude.* 25
        bit_end = (st Prelude.+ 1) Prelude.* 25
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..24]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (16) = happyShift action_5
action_0 (17) = happyShift action_6
action_0 (18) = happyShift action_7
action_0 (21) = happyShift action_9
action_0 (22) = happyShift action_10
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (10) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_5
action_1 (17) = happyShift action_6
action_1 (18) = happyShift action_7
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (10) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (16) = happyShift action_5
action_3 (17) = happyShift action_6
action_3 (18) = happyShift action_7
action_3 (7) = happyGoto action_14
action_3 (8) = happyGoto action_15
action_3 (10) = happyGoto action_16
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_7

action_5 _ = happyReduce_17

action_6 _ = happyReduce_18

action_7 _ = happyReduce_19

action_8 (11) = happyShift action_13
action_8 (25) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (24) = happyShift action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (16) = happyShift action_5
action_10 (17) = happyShift action_6
action_10 (18) = happyShift action_7
action_10 (10) = happyGoto action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_2

action_12 (12) = happyShift action_25
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (16) = happyShift action_5
action_13 (17) = happyShift action_6
action_13 (18) = happyShift action_7
action_13 (21) = happyShift action_9
action_13 (22) = happyShift action_10
action_13 (4) = happyGoto action_24
action_13 (5) = happyGoto action_2
action_13 (6) = happyGoto action_3
action_13 (10) = happyGoto action_4
action_13 _ = happyReduce_5

action_14 (15) = happyShift action_20
action_14 (16) = happyShift action_5
action_14 (17) = happyShift action_6
action_14 (18) = happyShift action_7
action_14 (19) = happyShift action_21
action_14 (20) = happyShift action_22
action_14 (23) = happyShift action_23
action_14 (9) = happyGoto action_18
action_14 (10) = happyGoto action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (14) = happyShift action_17
action_15 _ = happyReduce_6

action_16 _ = happyReduce_8

action_17 (16) = happyShift action_5
action_17 (17) = happyShift action_6
action_17 (18) = happyShift action_7
action_17 (7) = happyGoto action_14
action_17 (8) = happyGoto action_28
action_17 (10) = happyGoto action_16
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (13) = happyShift action_27
action_18 _ = happyReduce_9

action_19 _ = happyReduce_11

action_20 _ = happyReduce_15

action_21 _ = happyReduce_13

action_22 _ = happyReduce_14

action_23 _ = happyReduce_12

action_24 _ = happyReduce_4

action_25 (16) = happyShift action_5
action_25 (17) = happyShift action_6
action_25 (18) = happyShift action_7
action_25 (10) = happyGoto action_26
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_3

action_27 (15) = happyShift action_20
action_27 (16) = happyShift action_5
action_27 (17) = happyShift action_6
action_27 (18) = happyShift action_7
action_27 (19) = happyShift action_21
action_27 (20) = happyShift action_22
action_27 (23) = happyShift action_23
action_27 (9) = happyGoto action_29
action_27 (10) = happyGoto action_19
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_10

action_29 _ = happyReduce_16

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (GraphTriplet happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Base happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 4 happyReduction_3
happyReduction_3 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Prefix happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Seq happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Triplet happy_var_1 happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (Sbj happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn7
		 (TTLPred happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  8 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (PredObj happy_var_1 happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (PredObjList happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (UrlObj happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyTerminal (TokenNumber _ happy_var_1))
	 =  HappyAbsSyn9
		 (IntObj happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn9
		 (TTLBoolObj True
	)

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn9
		 (TTLBoolObj False
	)

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn9
		 (StrObj happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  9 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ObjList happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn10
		 (FinalUrl happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal (TokenUnbasedUrl _ happy_var_1))
	 =  HappyAbsSyn10
		 (BaseNeededUrl ("<@base:"++(tail happy_var_1))
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyTerminal (TokenUnprefixedUrl _ happy_var_1))
	 =  HappyAbsSyn10
		 (PrefixNeededUrl ("<"++happy_var_1++">")
	)
happyReduction_19 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 25 25 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenDot _ -> cont 11;
	TokenColon _ -> cont 12;
	TokenComa _ -> cont 13;
	TokenSemiColon _ -> cont 14;
	TokenString _ happy_dollar_dollar -> cont 15;
	TokenUrl _ happy_dollar_dollar -> cont 16;
	TokenUnbasedUrl _ happy_dollar_dollar -> cont 17;
	TokenUnprefixedUrl _ happy_dollar_dollar -> cont 18;
	TokenTrue _ -> cont 19;
	TokenFalse _ -> cont 20;
	TokenPrefix _ -> cont 21;
	TokenBase _ -> cont 22;
	TokenNumber _ happy_dollar_dollar -> cont 23;
	TokenVar _ happy_dollar_dollar -> cont 24;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 25 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parserTurtle tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
