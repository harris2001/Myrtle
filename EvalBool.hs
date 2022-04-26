module EvalBool where

import MyrtleParser
import RDF_Parser
import Data.List

data Assignment = IntVarAss Int | BoolVarAss Bool | StringVarAss String | UrlVarAss MyrtleParser.Url
    deriving Show
type Env = (String,Assignment)
------------------------------------------------------------------------------------------
--                                   Evaluating Bool                                    --
------------------------------------------------------------------------------------------
evalSimpleBool :: BoolExp -> [Env] -> Bool
evalSimpleBool QTrue env = True
evalSimpleBool QFalse env = False
evalSimpleBool (And x y) env = (evalSimpleBool x env) && (evalSimpleBool y env)
evalSimpleBool (Or x y) env = (evalSimpleBool x env) || (evalSimpleBool y env)
evalSimpleBool (EQBB x y) env = (evalSimpleBool x env) == (evalSimpleBool y env)
evalSimpleBool (GTII x y) env = (evalInt x env) > (evalInt y env)
evalSimpleBool (LTII x y) env = (evalInt x env) < (evalInt y env)
evalSimpleBool (EQII x y) env = (evalInt x env) == (evalInt y env)
evalSimpleBool (StartsWithStr s1 s2) env = isPrefixOf s1 s2
evalSimpleBool (StartsWithUrl s (NewUrl u)) env = isPrefixOf s u
-- evalSimpleBool (IntVariable str) env = (lookupBoolEnv env str)
evalSimpleBool _ _ = error "Subject conditions cannot be used inside the where clause"

isBoolEval :: BoolExp -> Bool
isBoolEval QTrue = True
isBoolEval QFalse = True
isBoolEval (And _ _) = True
isBoolEval (Or _ _) = True
isBoolEval (EQBB _ _) = True
isBoolEval (GTII _ _) = True
isBoolEval (LTII _ _) = True
isBoolEval (EQII _ _) = True
isBoolEval (StartsWithStr _ _) = True
isBoolEval (StartsWithUrl _ _) = True
isBoolEval (StartsWithObj _) = True
isBoolEval _ = False

evalBoolObj :: BoolExp ->[Env] -> (TTLObject -> Bool)
evalBoolObj (GTIO x _) env = \o ->  (isIntObj o) && (((evalIntExp x env) o) > (getIntObj o))
evalBoolObj (GTOI _ x) env = \o ->  (isIntObj o) && ((getIntObj o) > ((evalIntExp x env) o))
evalBoolObj (LTIO x _) env = \o ->  (isIntObj o) && (((evalIntExp x env)o) < (getIntObj o))
evalBoolObj (LTOI _ x) env = \o ->  (isIntObj o) && ((getIntObj o) < ((evalIntExp x env)o))
evalBoolObj (EQIO x _) env = \o ->  (isIntObj o) && (((evalIntExp x env)o) == (getIntObj o))
evalBoolObj (EQOI _ x) env = \o ->  (isIntObj o) && ((getIntObj o) == ((evalIntExp x env)o))
evalBoolObj (AndIO x _) env = \o -> (isBoolObj o) && (evalBoolObj x env o) && (getBoolObj o)
evalBoolObj (AndOI _ x) env = \o -> (isBoolObj o) && (getBoolObj o) && (evalBoolObj x env o)
evalBoolObj (OrIO x _) env = \o ->  (isBoolObj o) && (evalBoolObj x env o) || (getBoolObj o)
evalBoolObj (OrOI _ x) env = \o ->  (isBoolObj o) && (getBoolObj o) || (evalBoolObj x env o)
evalBoolObj (EQBO x _) env = \o ->  (isBoolObj o) && (evalBoolObj x env o) == (getBoolObj o)
evalBoolObj (EQOB _ x) env = \o ->  (isBoolObj o) && (getBoolObj o) == (evalBoolObj x env o)
evalBoolObj QTrue env = \o -> True
evalBoolObj QFalse env = \o -> False
evalBoolObj (And x y) env = \o -> (evalBoolObj x env o) && (evalBoolObj y env o)
evalBoolObj (Or x y) env = \o -> (evalBoolObj x env o) || (evalBoolObj y env o)
evalBoolObj (EQBB x y) env = \o -> (evalBoolObj x env o) == (evalBoolObj y env o)
evalBoolObj (GTII x y) env = \o -> (evalInt x env) > (evalInt y env)
evalBoolObj (LTII x y) env = \o -> (evalInt x env) < (evalInt y env)
evalBoolObj (EQII x y) env = \o -> (evalInt x env) == (evalInt y env)
evalBoolObj (StartsWithObj s) env = \o -> (isStrObj o && isPrefixOf s (getStrObj o)) || (isUrlObj o && isPrefixOf s (getUrlObj o))
evalBoolObj boolExp env = \o -> evalSimpleBool boolExp env

evalUBool :: BoolExp -> [Env] -> (MyrtleParser.Url -> Bool)
evalUBool (EQUU (NewUrl x) (NewUrl y)) env = \o -> x == y
evalUBool (EQSU _ (NewUrl x)) env = \(NewUrl s) -> s == x
evalUBool (EQUS (NewUrl x) _) env = \(NewUrl s) -> x == s
evalUBool (EQPU _ (NewUrl x)) env = \(NewUrl p) -> p == x
evalUBool (EQUP (NewUrl x) _) env = \(NewUrl p) -> x == p
evalUBool (EQOU _ (NewUrl x)) env = \(NewUrl o) -> o == x
evalUBool (EQUO (NewUrl x) _) env = \(NewUrl o) -> x == o

evalSBool :: BoolExp -> (String -> Bool)
evalSBool (EQSS (QString x) (QString y)) = \o -> x == y
evalSBool (EQSO (QString x) _) = \o -> x == o
evalSBool (EQOS _ (QString x)) = \o -> o == x

------------------------------------------------------------------------------------------
--                                   Evaluating Url                                     --
------------------------------------------------------------------------------------------
evalUrl :: MyrtleParser.Url -> String
evalUrl (NewUrl x) = x
-- evalUrl (Var str) env = (lookupUrlEnv env str)
------------------------------------------------------------------------------------------
--                                  Evaluating String                                   --
------------------------------------------------------------------------------------------

evalSimpleStr :: StringExp -> [Env] -> String
evalSimpleStr (QString x) env = x
-- evalSimpleStr (Var str) env = (lookupStrEnv env str)

------------------------------------------------------------------------------------------
--                                   Evaluating Int                                     --
------------------------------------------------------------------------------------------
evalInt :: IntExp -> [Env] -> Int
evalInt (PlusII x1 x2) env = ((evalInt x1 env) + (evalInt x2 env))
evalInt (MinusII x1 x2) env = ((evalInt x1 env) - (evalInt x2 env))
evalInt (TimesII x1 x2) env = ((evalInt x1 env) * (evalInt x2 env))
evalInt (DivII x1 x2) env = ((evalInt x1 env) `div` (evalInt x2 env))
evalInt (ExpoII x1 x2) env = ((evalInt x1 env) ^ (evalInt x2 env))
evalInt (QInt int) env = int 
evalInt (NegateI x) env = (-1*(evalInt x env))
-- evalInt (IntVariable str) env = (lookupIntEnv env str)
evalInt (Length str) _ = length(str)
evalInt _ _ = error "Integer expressions on objects cannot be used inside the where clause"

isIntEval :: IntExp -> Bool
isIntEval (PlusII _ _ )  = True
isIntEval (MinusII _ _ ) = True
isIntEval (TimesII _ _ ) = True
isIntEval (DivII _ _ ) = True
isIntEval (ExpoII _ _ ) = True
isIntEval (QInt _ ) = True
isIntEval (NegateI _ ) = True
-- isIntEval (IntVariable _ ) = True
isIntEval (Length _) = True
isIntEval LengthObj = True
isIntEval _ = False

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

-- isIntEval :: IntExp -> Bool
-- isIntEval (PlusOI _ x) = True
-- isIntEval (PlusIO x _) = True
-- isIntEval (PlusOO _ _) = True
-- isIntEval (MinusOI _ x) = True
-- isIntEval (MinusIO x _) = True
-- isIntEval (MinusOO _ _) = True
-- isIntEval (TimesOI _ x) = True
-- isIntEval (TimesIO x _) = True
-- isIntEval (TimesOO _ _) = True
-- isIntEval (DivOI _ x) = True
-- isIntEval (DivIO x _) = True
-- isIntEval (DivOO _ _) = True
-- isIntEval (ExpoOI _ x) = True
-- isIntEval (ExpoIO x _) = True
-- isIntEval (ExpoOO _ _) = True
-- isIntEval (NegateO _) = True
-- isIntEval (PlusII _ _ )  = True
-- isIntEval (MinusII _ _ ) = True
-- isIntEval (TimesII _ _ ) = True
-- isIntEval (DivII _ _ ) = True
-- isIntEval (ExpoII _ _ ) = True
-- isIntEval (QInt _ ) = True
-- isIntEval (NegateI _ ) = True
-- isIntEval (IntVariable _ ) = True
-- isIntEval _ = False
-- isIntEval _ = False

-- isBoolEval :: BoolExp -> Bool
-- isBoolEval QTrue = True
-- isBoolEval QFalse = True
-- isBoolEval (And x y) = True
-- isBoolEval (Or x y) = True
-- isBoolEval (EQBB x y) = True 
-- isBoolEval (GTII x y) = True 
-- isBoolEval (LTII x y) = True 
-- isBoolEval (EQII x y) = True 
-- isBoolEval boolExp = True 
-- isBoolEval _ = False

-- isStrEval :: BoolExp -> Bool
-- isStrEval (EQSS _ _) = True
-- isStrEval (EQSO _ _) = True
-- isStrEval (EQOS _ _) = True
-- isStrEval _ = False

-- isUrlEval :: BoolExp -> Bool
-- isUrlEval (EQUU _ _ ) = True
-- isUrlEval (EQSU _ _ ) = True
-- isUrlEval (EQUS _ _ ) = True
-- isUrlEval (EQPU _ _ ) = True
-- isUrlEval (EQUP _ _ ) = True
-- isUrlEval (EQOU _ _ ) = True
-- isUrlEval (EQUO _ _ ) = True
-- isUrlEval _ = False

--------------------------------------------------------------------------------------
--                          Returns the value of a variable                         --
--------------------------------------------------------------------------------------

lookupIntEnv :: [Env] -> String -> Int
lookupIntEnv [] v = error ("Variable "++show v++" not in scope")
lookupIntEnv ((str,IntVarAss val):xs) v | str==v =  val
                                        | otherwise = lookupIntEnv xs v

lookupBoolEnv :: [Env] -> String -> Bool
lookupBoolEnv [] v = error ("Variable "++show v++" not in scope")
lookupBoolEnv ((str,BoolVarAss val):xs) v | str==v =  val
                                          | otherwise = lookupBoolEnv xs v

lookupStrEnv :: [Env] -> String -> String
lookupStrEnv [] v = error ("Variable "++show v++" not in scope")
lookupStrEnv ((str,StringVarAss val):xs) v | str==v =  val
                                            | otherwise = lookupStrEnv xs v

lookupUrlEnv :: [Env] -> String -> MyrtleParser.Url
lookupUrlEnv [] v = error ("Variable "++show v++" not in scope")
lookupUrlEnv ((str,UrlVarAss val):xs) v | str==v =  val
                                        | otherwise = lookupUrlEnv xs v
                                        
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

getUrlObj :: TTLObject -> String
getUrlObj (UrlObj (FinalUrl x)) = x
getUrlObj x = error ("Object "++show x++" is not a URI")

--Literal
lookupEnv :: [Env] -> String -> Int
lookupEnv [] v = error ("Variable "++show v++" not in scope")
--IntLit val
lookupEnv ((str,IntVarAss val):xs) v | str==v =  val
                                     | otherwise = lookupEnv xs v
-- lookupEnv ((str,BoolVarAss val):xs) v | str==v = IntLit val
--                                      | otherwise = lookupEnv xs v
-- lookupEnv ((str,StrVarAss val):xs) v | str==v = IntLit val
--                                      | otherwise = lookupEnv xs v

-- evalSBool :: BoolExp -> (TTLObject -> Bool)
-- evalSBool (EQSS (QString x) (QString y)) = \o -> x == y
-- evalSBool (EQSO (QString x) _) = \o -> x == o
-- evalSBool (EQOS _ (QString x)) = \o -> o == x
