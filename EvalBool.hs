module EvalBool where

import MyrtleParser
import RDF_Parser

data Assignment = IntVarAss Int | BoolVarAss Bool | StringVarAss String

type Env = (String,Assignment)

-- DONE --
evalSimpleBool :: BoolExp -> [Env] -> Bool
evalSimpleBool QTrue env = True
evalSimpleBool QFalse env = False
evalSimpleBool (And x y) env = (evalSimpleBool x env) && (evalSimpleBool y env)
evalSimpleBool (Or x y) env = (evalSimpleBool x env) || (evalSimpleBool y env)
evalSimpleBool (EQBB x y) env = (evalSimpleBool x env) == (evalSimpleBool y env)
evalSimpleBool (GTII x y) env = (evalInt x env) > (evalInt y env)
evalSimpleBool (LTII x y) env = (evalInt x env) < (evalInt y env)
evalSimpleBool (EQII x y) env = (evalInt x env) == (evalInt y env)
evalSimpleBool _ _ = error "Subject conditions cannot be used inside the where clause"
-- evalSimpleBool (String x y) env 

evalBoolObj :: BoolExp ->[Env] -> (TTLObject -> Bool)
-- evalBoolObj _ _ = \o -> False
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
evalBoolObj boolExp env = \o -> evalSimpleBool boolExp env



-- DONE --
evalInt :: IntExp -> [Env] -> Int
evalInt (PlusII x1 x2) env = ((evalInt x1 env) + (evalInt x2 env))
evalInt (MinusII x1 x2) env = ((evalInt x1 env) - (evalInt x2 env))
evalInt (TimesII x1 x2) env = ((evalInt x1 env) * (evalInt x2 env))
evalInt (DivII x1 x2) env = ((evalInt x1 env) `div` (evalInt x2 env))
evalInt (ExpoII x1 x2) env = ((evalInt x1 env) ^ (evalInt x2 env))
evalInt (QInt int) env = int 
evalInt (NegateI x) env = (-1*(evalInt x env))
evalInt (IntVariable str) env = (lookupEnv env str)

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



evalUBool :: BoolExp -> (MyrtleParser.Url -> Bool)
evalUBool (EQUU (NewUrl x) (NewUrl y)) = \o -> x == y
evalUBool (EQSU _ (NewUrl x)) = \(NewUrl s) -> s == x
evalUBool (EQUS (NewUrl x) _) = \(NewUrl s) -> x == s
evalUBool (EQPU _ (NewUrl x)) = \(NewUrl p) -> p == x
evalUBool (EQUP (NewUrl x) _) = \(NewUrl p) -> x == p
evalUBool (EQOU _ (NewUrl x)) = \(NewUrl o) -> o == x
evalUBool (EQUO (NewUrl x) _) = \(NewUrl o) -> x == o



-- DONE --
evalSimpleStr :: StringExp -> [Env] -> String
evalSimpleStr (QString s) envs = s


-- evalSimpleBoolObj :: BoolExp -> [Env] -> (Bool -> Bool)
-- evalSimpleBoolObj (AndIO x _) env = \o -> (evalSimpleBoolObj x env o) && o
-- evalSimpleBoolObj (AndOI _ x) env = \o -> o && (evalSimpleBoolObj x env o)
-- evalSimpleBoolObj (OrIO x _) env= \o -> (evalSimpleBoolObj x env o) || o
-- evalSimpleBoolObj (OrOI _ x) env= \o -> o || (evalSimpleBoolObj x env o)
-- evalSimpleBoolObj (EQBO x _) env= \o -> (evalSimpleBoolObj x env o) == o
-- evalSimpleBoolObj (EQOB _ x) env= \o -> o == (evalSimpleBoolObj x env o)
-- evalSimpleBoolObj boolExp env = \o -> evalSimpleBool boolExp env

getIntObj :: TTLObject -> Int
getIntObj (IntObj x) = x
-- getIntObj (TTLBoolObj x) = x
getIntObj x = error ("Object "++show x++" is not an integer")

isIntObj :: TTLObject -> Bool
isIntObj (IntObj x) = True
isIntObj _ = False


getBoolObj :: TTLObject -> Bool
getBoolObj (TTLBoolObj x) = x
getBoolObj x = error ("Object "++show x++" is not a boolean")

isBoolObj :: TTLObject -> Bool
isBoolObj (TTLBoolObj x) = True
isBoolObj _ = False

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