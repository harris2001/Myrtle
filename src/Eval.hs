module Eval where

import MyrtleParser
import RDF_Parser
import Data.List

data Assignment = IntVarAss Int | BoolVarAss Bool | StringVarAss String | UrlVarAss MyrtleParser.Url
    deriving Show
type Env = (String,Assignment)
------------------------------------------------------------------------------------------
--                                   Evaluating Bool                                    --
------------------------------------------------------------------------------------------
--Evaluation of operation between (BoolExp and BoolExp),
--                                (IntExp and IntExp),
--                                (StrExp and StrExp)

evalSimpleBool :: BoolExp -> [Env] -> Bool
evalSimpleBool QTrue env = True
evalSimpleBool QFalse env = False
evalSimpleBool (And x y) env =  (evalSimpleBool x env) && (evalSimpleBool y env)
evalSimpleBool (AndVB x b) env = (unwrap(lookupBoolEnv env x)) && (evalSimpleBool b env)
evalSimpleBool (AndBV b x) env = (unwrap(lookupBoolEnv env x)) && (evalSimpleBool b env)
evalSimpleBool (Or x y)   env  = (evalSimpleBool x env) || (evalSimpleBool y env)
evalSimpleBool (OrVB x b) env = (unwrap(lookupBoolEnv env x)) || (evalSimpleBool b env)
evalSimpleBool (OrBV b x) env = (unwrap(lookupBoolEnv env x)) || (evalSimpleBool b env)
evalSimpleBool (GTII x y) env = (evalInt x env) > (evalInt y env)
evalSimpleBool (GTVI x y) env = (unwrap(lookupIntEnv env x)) > (evalInt y env)
evalSimpleBool (GTIV x y) env = (evalInt x env) > (unwrap(lookupIntEnv env y))
evalSimpleBool (LTII x y) env = (evalInt x env) < (evalInt y env)
evalSimpleBool (LTVI x y) env = (unwrap(lookupIntEnv env x)) < (evalInt y env)
evalSimpleBool (LTIV x y) env = (evalInt x env) < (unwrap(lookupIntEnv env y))
evalSimpleBool (EQII x y) env = (evalInt x env) == (evalInt y env)
evalSimpleBool (EQBB x y) env = (evalSimpleBool x env) == (evalSimpleBool y env)
evalSimpleBool (EQSS x y) env = (evalSimpleStr x env) == (evalSimpleStr y env)
evalSimpleBool (EQUU x y) env = (evalUrl x env) == (evalUrl y env)
evalSimpleBool (StartsWithStr s1 s2) env = isPrefixOf s1 s2
evalSimpleBool (StartsWithUrl s (NewUrl u)) env = isPrefixOf s u
evalSimpleBool (EQVI x y) env = (unwrap(lookupIntEnv env x)) == (evalInt y env)
evalSimpleBool (EQIV x y) env = (unwrap(lookupIntEnv env y)) == (evalInt x env)
evalSimpleBool (EQVB x y) env = (unwrap(lookupBoolEnv env x)) == (evalSimpleBool y env)
evalSimpleBool (EQBV x y) env = (unwrap(lookupBoolEnv env y)) == (evalSimpleBool x env)
evalSimpleBool (EQVS x y) env = (unwrap(lookupStrEnv env x)) == (evalSimpleStr y env)
evalSimpleBool (EQSV x y) env = (unwrap(lookupStrEnv env y)) == (evalSimpleStr x env)
evalSimpleBool (EQVU x y) env = (evalUrl (unwrap(lookupUrlEnv env x)) env) == (evalUrl y env)
evalSimpleBool (EQUV x y) env = (evalUrl (unwrap(lookupUrlEnv env y)) env) == (evalUrl x env)

evalSimpleBool x _ = error  "Syntax error while trying to evaluate simple boolean expression"

--Evaluation of operation between BoolExp and BoolExp
evalBoolObj :: BoolExp ->[Env] -> (TTLObject -> Bool)
evalBoolObj (And x y) env = \o -> (evalBoolObj x env o) && (evalBoolObj y env o)
evalBoolObj (AndIO x _) env = \o -> (isBoolObj o) && (evalBoolObj x env o) && (getBoolObj o)
evalBoolObj (AndOI _ x) env = \o -> (isBoolObj o) && (getBoolObj o) && (evalBoolObj x env o)
evalBoolObj (Or x y) env = \o -> (evalBoolObj x env o) || (evalBoolObj y env o)
evalBoolObj (OrIO x _) env = \o ->  (isBoolObj o) && (evalBoolObj x env o) || (getBoolObj o)
evalBoolObj (OrOI _ x) env = \o ->  (isBoolObj o) && (getBoolObj o) || (evalBoolObj x env o)
evalBoolObj (GTIO x _) env = \o ->  (isIntObj o) && (((evalIntExp x env) o) > (getIntObj o))
evalBoolObj (GTOI _ x) env = \o ->  (isIntObj o) && ((getIntObj o) > ((evalIntExp x env) o))
evalBoolObj (LTIO x _) env = \o ->  (isIntObj o) && (((evalIntExp x env)o) < (getIntObj o))
evalBoolObj (LTOI _ x) env = \o ->  (isIntObj o) && ((getIntObj o) < ((evalIntExp x env)o))
evalBoolObj (EQIO x _) env = \o ->  (isIntObj o) && (((evalIntExp x env)o) == (getIntObj o))
evalBoolObj (EQOI _ x) env = \o ->  (isIntObj o) && ((getIntObj o) == ((evalIntExp x env)o))
evalBoolObj (EQBO x _) env = \o ->  (isBoolObj o) && (evalBoolObj x env o) == (getBoolObj o)
evalBoolObj (EQOB _ x) env = \o ->  (isBoolObj o) && (getBoolObj o) == (evalBoolObj x env o)
evalBoolObj QTrue env = \o -> True
evalBoolObj QFalse env = \o -> False
evalBoolObj (StartsWithObj s) env = \o -> (isStrObj o && isPrefixOf s (getStrObj o)) || (isUrlObj o && isPrefixOf s (printingUrl o))
-- And now for variables
evalBoolObj (AndVO x _) env = \o -> (isBoolObj o) && ((unwrap(lookupBoolEnv env x)) && (getBoolObj o))
evalBoolObj (AndOV _ x) env = \o -> (isBoolObj o) && ((unwrap(lookupBoolEnv env x)) && (getBoolObj o))
evalBoolObj (AndVB x b) env = \o -> ((unwrap(lookupBoolEnv env x)) && (evalBoolObj b env o))
evalBoolObj (AndBV b x) env = \o -> ((unwrap(lookupBoolEnv env x)) && (evalBoolObj b env o))
evalBoolObj (AndVV a b) env = \o -> (lookupBoolEnv env b) /= Nothing && ((unwrap(lookupBoolEnv env a)) && (unwrap(lookupBoolEnv env b)))
evalBoolObj (OrVO x _) env = \o ->  (isBoolObj o) && ((unwrap(lookupBoolEnv env x)) || (getBoolObj o))
evalBoolObj (OrOV _ x) env = \o ->  (isBoolObj o) && ((unwrap(lookupBoolEnv env x)) || (getBoolObj o))
evalBoolObj (OrVB x b) env = \o ->  ((unwrap(lookupBoolEnv env x)) || (evalBoolObj b env o))
evalBoolObj (OrBV b x) env = \o ->  ((unwrap(lookupBoolEnv env x)) || (evalBoolObj b env o))
evalBoolObj (OrVV a b) env = \o ->  (lookupBoolEnv env b) /= Nothing && ((unwrap(lookupBoolEnv env a)) || (unwrap(lookupBoolEnv env b)))
evalBoolObj (GTVO x _) env = \o ->  (isBoolObj o) && ((unwrap(lookupIntEnv env x)) > (getIntObj o))
evalBoolObj (GTOV _ x) env = \o ->  (isBoolObj o) && ((unwrap(lookupIntEnv env x)) < (getIntObj o))
evalBoolObj (GTVV a b) env = \o ->  (lookupBoolEnv env b) /= Nothing && ((unwrap(lookupIntEnv env a)) > (unwrap(lookupIntEnv env b)))
evalBoolObj (LTVO x _) env = \o ->  (isBoolObj o) && ((unwrap(lookupIntEnv env x)) < (getIntObj o))
evalBoolObj (LTOV _ x) env = \o ->  (isBoolObj o) && ((unwrap(lookupIntEnv env x)) > (getIntObj o))
evalBoolObj (LTVV a b) env = \o ->  (lookupBoolEnv env b) /= Nothing && ((unwrap(lookupIntEnv env a)) < (unwrap(lookupIntEnv env b)))
evalBoolObj (EQVO x _) env = \o ->  (((isBoolObj o) && ((unwrap(lookupBoolEnv env x)) == (getBoolObj o)))
                                     || ((isIntObj o) && (unwrap(lookupIntEnv env x)) == (getIntObj o))
                                     || ((isStrObj o) && (unwrap(lookupStrEnv env x)) == (getStrObj o))
                                     || ((isUrlObj o) && (evalUrl (unwrap(lookupUrlEnv env x)) env) == (evalUrl (getUrlObj o)) env)
                                    )
evalBoolObj (EQOV _ x) env = \o -> ((  ((isBoolObj o) && ((unwrap(lookupBoolEnv env x)) == (getBoolObj o))))
                                    || ((lookupIntEnv env x) /= Nothing && ((isIntObj o) && ((unwrap(lookupIntEnv env x)) == (getIntObj o))))
                                    || ((lookupStrEnv env x) /= Nothing && ((isStrObj o) && ((unwrap(lookupStrEnv env x)) == (getStrObj o))))
                                    || (((isUrlObj o) && ((evalUrl (unwrap(lookupUrlEnv env x)) env) == (evalUrl (getUrlObj o) env))))
                                   )
evalBoolObj (EQVV x y) env = \o -> (  ((unwrap(lookupBoolEnv env x)) == (unwrap(lookupBoolEnv env y)))
                                   || ((unwrap(lookupIntEnv env x)) == (unwrap(lookupIntEnv env y)))
                                   || ((unwrap(lookupStrEnv env x)) == (unwrap(lookupStrEnv env y)))
                                   || ((evalUrl (unwrap(lookupUrlEnv env x)) env) == (evalUrl (unwrap(lookupUrlEnv env y)) env))
                                   )
evalBoolObj (EQOU u) env = \o -> (isUrlObj o) && ((evalUrl (getUrlObj o) env) == (evalUrl u env))
evalBoolObj (EQUO u) env = \o -> (isUrlObj o) && ((evalUrl (getUrlObj o) env) == (evalUrl u env))
-- If no object is needed then evaluate single boolexpression evaluation
evalBoolObj boolExp env = \o -> evalSimpleBool boolExp env


evalBoolUrl :: BoolExp -> [Env] -> (MyrtleParser.Url -> Bool)
evalBoolSubj (EQSU s) env = \u -> evalUrl s env == evalUrl u env 
evalBoolSubj (EQUS s) env = \u -> evalUrl s env == evalUrl u env 
evalBoolUrl (EQPU p) env = \u -> evalUrl p env == evalUrl u env 
evalBoolUrl (EQUP p) env = \u -> evalUrl p env == evalUrl u env 
evalBoolUrl _ _ = error "Issue when evaluating url"
------------------------------------------------------------------------------------------
--                                   Evaluating Url                                     --
------------------------------------------------------------------------------------------
evalUrl :: MyrtleParser.Url -> [Env] -> String
evalUrl (NewUrl x) env = x

------------------------------------------------------------------------------------------
--                                  Evaluating String                                   --
------------------------------------------------------------------------------------------
evalSimpleStr :: StringExp -> [Env] -> String
evalSimpleStr (QString x) env = x

------------------------------------------------------------------------------------------
--                                   Evaluating Int                                     --
------------------------------------------------------------------------------------------
evalInt :: IntExp -> [Env] -> Int
evalInt (PlusII x1 x2) env = ((evalInt x1 env) + (evalInt x2 env))
evalInt (PlusVI x1 x2) env = (unwrap(lookupIntEnv env x1)) + (evalInt x2 env)
evalInt (PlusIV x1 x2) env = (evalInt x1 env) + (unwrap(lookupIntEnv env x2))
evalInt (PlusVV x1 x2) env = (unwrap(lookupIntEnv env x1)) + (unwrap(lookupIntEnv env x2))
evalInt (MinusII x1 x2) env = ((evalInt x1 env) - (evalInt x2 env))
evalInt (MinusVI x1 x2) env = ((unwrap(lookupIntEnv env x1))- (evalInt x2 env))
evalInt (MinusIV x1 x2) env = (evalInt x1 env) - (unwrap(lookupIntEnv env x2))
evalInt (MinusVV x1 x2) env = (unwrap(lookupIntEnv env x1)) - (unwrap(lookupIntEnv env x2))
evalInt (TimesII x1 x2) env = ((evalInt x1 env) * (evalInt x2 env))
evalInt (TimesVI x1 x2) env = ((unwrap(lookupIntEnv env x1)) * (evalInt x2 env))
evalInt (TimesIV x1 x2) env = ((evalInt x1 env) * (unwrap(lookupIntEnv env x2)))
evalInt (TimesVV x1 x2) env = ((unwrap(lookupIntEnv env x1)) * (unwrap(lookupIntEnv env x2)))
evalInt (DivII x1 x2) env = ((evalInt x1 env) `div` (evalInt x2 env))
evalInt (DivVI x1 x2) env = ((unwrap(lookupIntEnv env x1)) `div` (evalInt x2 env))
evalInt (DivIV x1 x2) env = ((evalInt x1 env) `div` (unwrap(lookupIntEnv env x2)))
evalInt (DivVV x1 x2) env = ((unwrap(lookupIntEnv env x1)) `div` (unwrap(lookupIntEnv env x2)))
evalInt (ExpoII x1 x2) env = ((evalInt x1 env) ^ (evalInt x2 env))
evalInt (ExpoVI x1 x2) env = ((unwrap(lookupIntEnv env x1)) ^ (evalInt x2 env))
evalInt (ExpoIV x1 x2) env = ((evalInt x1 env) ^ (unwrap(lookupIntEnv env x2)))
evalInt (ExpoVV x1 x2) env = ((unwrap(lookupIntEnv env x1)) ^ (unwrap(lookupIntEnv env x2)))
evalInt (QInt int) env = int 
evalInt (NegateI x) env = (-1*(evalInt x env))
-- evalInt (IntVariable str) env = (lookupIntEnv env str)
evalInt (Length str) _ = length(str)
evalInt _ _ = error "Syntax error inside where clause"


evalIntExp :: IntExp -> [Env] -> (TTLObject -> Int)
evalIntExp (PlusOI _ x) env = \o -> ((getIntObj o) + ((evalIntExp x env)o))
evalIntExp (PlusIO x _) env = \o -> (((evalIntExp x env)o) + (getIntObj o))
evalIntExp (PlusOO _ _) env = \o -> ((getIntObj o) + (getIntObj o))
evalIntExp (MinusOI _ x) env = \o -> ((getIntObj o) - ((evalIntExp x env)o))
evalIntExp (MinusIO x _) env = \o -> (((evalIntExp x env)o) - (getIntObj o))
evalIntExp (MinusOO _ _) env = \o -> ((getIntObj o) - (getIntObj o))
evalIntExp (TimesOI _ x) env = \o -> ((getIntObj o) * ((evalIntExp x env)o))
evalIntExp (TimesIO x _) env = \o -> (((evalIntExp x env)o) * (getIntObj o))
evalIntExp (TimesOO _ _) env = \o -> ((getIntObj o) * (getIntObj o))
evalIntExp (DivOI _ x) env = \o -> ((getIntObj o) `div` ((evalIntExp x env)o))
evalIntExp (DivIO x _) env = \o -> (((evalIntExp x env)o) `div` (getIntObj o))
evalIntExp (DivOO _ _) env = \o -> 1
evalIntExp (ExpoOI _ x) env = \o -> ((getIntObj o) ^ ((evalIntExp x env)o))
evalIntExp (ExpoIO x _) env = \o -> (((evalIntExp x env)o) ^ (getIntObj o))
evalIntExp (ExpoOO _ _) env = \o -> ((getIntObj o) ^ (getIntObj o))
evalIntExp (NegateO _) env = \o -> (-1*(getIntObj o))
evalIntExp (LengthObj) _ = \(StrObj x) -> (length x)
evalIntExp x env = \o -> evalInt x env

--------------------------------------------------------------------------------------
--                          Getting the type of an object                           --
--------------------------------------------------------------------------------------

isIntObj :: TTLObject -> Bool
isIntObj (IntObj x) = True
isIntObj _ = False

isBoolObj :: TTLObject -> Bool
isBoolObj (TTLBoolObj x) = True
isBoolObj _ = False

isUrlObj :: TTLObject -> Bool
isUrlObj (UrlObj _) = True
isUrlObj _ = False

isStrObj :: TTLObject -> Bool
isStrObj (StrObj _) = True
isStrObj _ = False


--------------------------------------------------------------------------------------
--                        Getting the type of an expression                         --
--------------------------------------------------------------------------------------

isBoolEval :: BoolExp -> Bool
isBoolEval QTrue = True
isBoolEval QFalse = True
isBoolEval (And _ _) = True
isBoolEval (AndVB _ _) = True
isBoolEval (AndBV _ _) = True
isBoolEval (Or _ _) = True
isBoolEval (OrVB _ _) = True
isBoolEval (OrBV _ _) = True
isBoolEval (GTII _ _) = True
isBoolEval (GTVI _ _) = True
isBoolEval (GTIV _ _) = True
isBoolEval (LTII _ _) = True
isBoolEval (LTVI _ _) = True
isBoolEval (LTIV _ _) = True
isBoolEval (EQII _ _) = True
isBoolEval (EQBB _ _) = True
isBoolEval (EQSS _ _) = True
isBoolEval (EQUU _ _) = True
isBoolEval (StartsWithStr _ _) = True
isBoolEval (StartsWithUrl _ _) = True
isBoolEval (EQVI _ _) = True
isBoolEval (EQIV _ _) = True
isBoolEval (EQVB _ _) = True
isBoolEval (EQBV _ _) = True
isBoolEval (EQVS _ _) = True
isBoolEval (EQSV _ _) = True
isBoolEval (EQVU _ _) = True
isBoolEval (EQUV _ _) = True
isBoolEval (AndIO _ _) = True
isBoolEval (AndOI _ _) = True
isBoolEval (OrIO _ _) = True
isBoolEval (OrOI _ _) = True
isBoolEval (GTIO _ _) = True
isBoolEval (GTOI _ _) = True
isBoolEval (LTIO _ _) = True
isBoolEval (LTOI _ _) = True
isBoolEval (EQIO _ _) = True
isBoolEval (EQOI _ _) = True
isBoolEval (EQBO _ _) = True
isBoolEval (EQOB _ _) = True
isBoolEval (EQOV _ _) = True
isBoolEval (EQVV _ _) = True
isBoolEval (EQOU _) = True
isBoolEval (EQUO _) = True
isBoolEval _ = False


isIntEval :: IntExp -> Bool
isIntEval (PlusII _ _) = True
isIntEval (PlusVI _ _) = True
isIntEval (PlusIV _ _) = True
isIntEval (PlusVV _ _) = True
isIntEval (MinusII _ _) = True
isIntEval (MinusVI _ _) = True
isIntEval (MinusIV _ _) = True
isIntEval (MinusVV _ _) = True
isIntEval (TimesII _ _) = True
isIntEval (TimesVI _ _) = True
isIntEval (TimesIV _ _) = True
isIntEval (TimesVV _ _) = True
isIntEval (DivII _ _) = True
isIntEval (DivVI _ _) = True
isIntEval (DivIV _ _) = True
isIntEval (DivVV _ _) = True
isIntEval (ExpoII _ _) = True
isIntEval (ExpoVI _ _) = True
isIntEval (ExpoIV _ _) = True
isIntEval (ExpoVV _ _) = True
isIntEval (QInt _) = True
isIntEval (NegateI _) = True
isIntEval LengthObj = True
isIntEval (PlusOI _ _) = True
isIntEval (PlusIO _ _) = True
isIntEval (PlusOO _ _) = True
isIntEval (MinusOI _ _) = True
isIntEval (MinusIO _ _) = True
isIntEval (MinusOO _ _) = True
isIntEval (TimesOI _ _) = True
isIntEval (TimesIO _ _) = True
isIntEval (TimesOO _ _) = True
isIntEval (DivOI _ _) = True
isIntEval (DivIO _ _) = True
isIntEval (DivOO _ _) = True
isIntEval (ExpoOI _ _) = True
isIntEval (ExpoIO _ _) = True
isIntEval (ExpoOO _ _) = True
isIntEval (NegateO _) = True
isIntEval _ = False

--------------------------------------------------------------------------------------
--                          Returns the value of a variable                         --
--------------------------------------------------------------------------------------

lookupIntEnv :: [Env] -> String -> Maybe Int
lookupIntEnv [] v = error ("Variable "++show v++" not in scope")
lookupIntEnv ((str,IntVarAss val):xs) v | str==v = Just val
                                        | otherwise = lookupIntEnv xs v
lookupIntEnv _ _ = Nothing

lookupBoolEnv :: [Env] -> String -> Maybe Bool
lookupBoolEnv [] v = error ("Variable "++show v++" not in scope")
lookupBoolEnv ((str,BoolVarAss val):xs) v | str==v = Just val
                                          | otherwise = lookupBoolEnv xs v
-- lookupBoolEnv ((str,IntVarAss val):xs) v = Just False
lookupBoolEnv _ _ = Nothing

lookupStrEnv :: [Env] -> String -> Maybe String
lookupStrEnv [] v = error ("Variable "++show v++" not in scope")
lookupStrEnv ((str,StringVarAss val):xs) v | str==v = Just val
                                            | otherwise = lookupStrEnv xs v
lookupStrEnv _ _ = Nothing

lookupUrlEnv :: [Env] -> String -> Maybe MyrtleParser.Url
lookupUrlEnv [] v = error ("Variable "++show v++" not in scope")
lookupUrlEnv ((str,UrlVarAss val):xs) v | str==v = Just val
                                        | otherwise = lookupUrlEnv xs v
lookupUrlEnv _ _ = Nothing                            
------------------------------------------------------------------------------------------
--            Helper functions to get Extract the semantics out of an object            --
------------------------------------------------------------------------------------------

getIntObj :: TTLObject -> Int
getIntObj (IntObj x) = x
getIntObj x = error ("Object "++show x++" is not an integer")

getBoolObj :: TTLObject -> Bool
getBoolObj (TTLBoolObj x) = x
getBoolObj x = error ("Object "++show x++" is not a boolean")

getStrObj :: TTLObject -> String
getStrObj (StrObj x) = x
getStrObj x = error ("Object "++show x++" is not a string")

getUrlObj :: TTLObject -> MyrtleParser.Url
getUrlObj (UrlObj (FinalUrl x)) = NewUrl x
getUrlObj x = error ("Object "++show x++" is not a URI")

printingUrl :: TTLObject -> String
printingUrl (UrlObj (FinalUrl x)) = x
printingUrl x = error ("Object "++show x++" is not a URI")

getUrlSP :: MyrtleParser.Url  -> String
getUrlSP (NewUrl u) = u

unwrap :: Maybe a -> a
unwrap (Just x) = x
unwrap Nothing = error "Type error"