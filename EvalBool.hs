module EvalBool where
-- import EvalInt
import MyrtleParser

evalBBool :: BoolExp -> (Bool -> Bool)
evalBBool QTrue = \o -> True
evalBBool QFalse = \o -> False
evalBBool (And x y) = \o -> (evalBool x o) && (evalBool y o)
evalBBool (AndIO x _) = \o -> (evalBool x o) && o
evalBBool (AndOI _ x) = \o -> o && (evalBool x o)
evalBBool (Or x y) = \o -> (evalBool x o) || (evalBool y o)
evalBBool (OrIO x _) = \o -> (evalBool x o) || o
evalBBool (OrOI _ x) = \o -> o || (evalBool x o)
evalBool (EQBB x y) = \o -> (evalBool x o) == (evalBool y o)
evalBool (EQBO x _) = \o -> (evalBool x o) == o
evalBool (EQOB _ x) = \o -> o == (evalBool x o)

-- Waiting for evalBool to be written in EvalInt
-- evalIBool :: BoolExp -> (Int -> Bool)
-- evalIBool (GTII x y) = \o -> (evalInt x o) > (evalInt y o) // NOT POSSIBLE BECAUSE O HERE IS INT NOT BOOL
-- evalIBool (GTIO x _) = \o -> (evalInt x o) > (getInt o)
-- evalIBool (GTOI _ x) = \o -> (getInt o) > (evalInt x o)
-- evalIBool (LTII x y) = \o -> (evalInt x o) < (evalInt y o)
-- evalIBool (LTIO x _) = \o -> (evalInt x o) < (getInt o)
-- evalIBool (LTOI _ x) = \o -> (getInt o) < (evalInt x o)
-- evalIBool (EQII x y) = \o -> (evalInt x o) == (evalInt y o)
-- evalIBool (EQIO x _) = \o -> (evalInt x o) == (getInt o)
-- evalIBool (EQOI _ x) = \o -> (getInt o) == (evalInt x o)

getInt :: IntExp -> Int
getInt (QInt x) = x
getInt x = error ("The given expression " ++ show (x) ++ " needs evaluation.")

evalSBool :: BoolExp -> (String -> Bool)
evalSBool (EQSS (QString x) (QString y)) = \o -> x == y
evalSBool (EQSO (QString x) _) = \o -> x == o
evalSBool (EQOS _ (QString x)) = \o -> o == x

evalUBool :: BoolExp -> (Url -> Bool)
evalUBool (EQUU (NewUrl x) (NewUrl y)) = \o -> x == y
evalUBool (EQSU _ (NewUrl x)) = \(NewUrl s) -> s == x
evalUBool (EQUS (NewUrl x) _) = \(NewUrl s) -> x == s
evalUBool (EQPU _ (NewUrl x)) = \(NewUrl p) -> p == x
evalUBool (EQUP (NewUrl x) _) = \(NewUrl p) -> x == p
evalUBool (EQOU _ (NewUrl x)) = \(NewUrl o) -> o == x
evalUBool (EQUO (NewUrl x) _) = \(NewUrl o) -> x == o
