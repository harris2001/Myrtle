{-# OPTIONS_GHC -w #-}
module MyrtleParser where
import MyrtleLexer
import System.IO
import System.Environment

import Data.List
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
	= HappyTerminal (LangToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,1097) ([0,0,0,16,0,0,0,4096,0,0,0,0,32,0,0,0,0,2,0,0,0,32,0,0,0,0,4220,0,0,0,16,0,0,0,0,4220,0,0,128,0,0,0,0,0,128,0,0,0,32,0,0,0,640,0,0,0,32768,2,0,0,0,128,0,0,0,0,18,0,0,12288,0,0,0,0,32768,0,0,0,0,0,0,0,0,128,0,0,0,32768,0,0,0,0,0,0,8,0,0,128,0,0,0,32,0,0,0,4096,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,896,128,4096,0,0,0,0,0,0,0,512,1,0,0,32768,0,0,0,0,0,0,0,0,0,31744,16,0,0,0,1024,0,0,0,0,0,0,0,0,1024,0,0,512,0,0,0,0,0,0,0,0,0,4,0,0,0,512,1,0,8192,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,256,0,0,8192,0,0,0,0,0,2,0,0,0,512,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4032,2184,31744,0,0,32768,0,0,0,0,1024,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,896,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,8,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,128,0,2048,0,0,0,1,0,0,49152,125,0,0,0,256,1,3,0,0,1,0,0,0,768,0,0,0,0,3,0,0,0,32704,0,3,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,576,136,9216,0,49152,34831,8,124,0,0,0,0,0,0,32192,0,3,0,0,128,0,0,0,32768,0,0,0,4032,2184,27648,0,0,0,0,8,0,0,0,2048,0,32768,32771,0,16,0,0,0,0,0,0,0,4,0,0,32,0,0,0,0,0,258,0,0,32,0,0,0,0,0,0,0,0,4032,2184,27648,0,0,0,0,0,0,49152,125,0,0,0,256,0,3,0,0,1,0,0,0,256,0,0,0,0,1,0,0,0,32192,0,3,0,0,1,0,0,49152,34831,8,108,0,0,512,1,0,8192,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32192,0,0,0,0,1,768,0,0,256,0,0,0,0,1,0,0,0,0,8,0,0,512,2048,0,0,16384,34818,0,36,0,576,136,9216,0,49152,34831,8,108,0,576,136,9216,0,16384,34818,0,36,0,576,136,9216,0,16384,34818,0,36,0,576,136,9216,0,49152,34831,8,108,0,4032,2184,27648,0,0,32192,1,0,0,0,257,768,0,0,0,0,0,0,0,0,0,0,16384,34818,0,36,0,0,0,0,0,32768,3,0,12,0,576,136,9216,0,16384,34818,0,36,0,4032,2184,27648,0,16384,34818,0,36,0,576,136,9216,0,16384,34818,0,36,0,576,136,9216,0,16384,34818,0,36,0,4032,2184,27648,0,49152,34831,8,108,0,0,0,2048,0,0,0,0,8,0,512,2048,1024,0,49152,34831,8,108,0,0,16384,0,0,49152,34831,8,108,0,4032,2184,27648,0,16384,34818,0,36,0,576,136,9216,0,16384,34818,0,36,0,576,136,9216,0,16384,34818,0,36,0,576,136,9216,0,16384,34818,0,36,0,576,136,9216,0,0,0,0,0,0,32,0,0,0,8192,0,0,0,0,0,0,0,0,32768,3,0,0,0,32,0,0,0,49152,34831,8,108,0,0,256,0,0,0,1,0,8,0,256,0,2048,0,0,0,0,0,0,0,0,0,0,0,31744,0,0,0,0,64,0,0,0,16384,0,0,0,0,124,0,0,0,16384,0,0,0,0,64,0,0,0,31744,0,0,0,0,112,0,0,0,28672,0,0,0,0,124,0,0,0,28672,0,0,0,0,112,0,0,0,31744,0,0,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,256,0,1,0,49152,125,256,0,0,32192,0,3,0,0,1,0,0,0,32192,0,0,0,49152,125,768,0,32768,32771,0,16,0,0,0,0,0,0,31936,0,0,0,49152,125,768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,256,0,0,32192,0,3,0,0,1,0,0,0,32192,0,3,0,0,0,0,0,0,0,0,0,0,0,124,0,0,0,16384,0,0,0,0,64,0,0,0,31744,0,0,0,0,64,0,0,0,16384,0,0,0,0,124,0,0,0,28672,0,0,0,0,112,0,0,0,31744,0,0,0,0,112,0,0,0,28672,0,0,0,0,124,0,0,0,31936,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32192,0,3,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,380,0,0,0,31744,0,0,0,0,0,0,0,0,0,0,0,0,0,1,256,0,0,32192,0,1,0,49152,125,768,0,0,256,0,0,0,49152,125,0,0,0,32192,0,3,0,0,0,0,0,0,0,0,0,0,0,124,0,0,0,16384,0,0,0,0,64,0,0,0,31744,0,0,0,0,64,0,0,0,16384,0,0,0,0,124,0,0,0,28672,0,0,0,0,112,0,0,0,31744,0,0,0,0,112,0,0,0,28672,0,0,0,0,124,0,0,0,31936,0,0,0,0,0,0,0,0,0,0,0,0,49152,124,0,0,0,0,0,0,0,49152,125,768,0,0,31744,0,0,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,31744,0,0,0,0,124,0,0,0,0,1,0,0,0,256,0,0,8192,0,0,0,0,0,0,0,0,0,0,258,0,0,32,0,0,0,0,0,258,0,0,0,256,0,0,49152,34831,8,108,0,0,0,0,0,0,2,8,8,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,8192,0,0,0,0,32,0,0,0,8192,0,0,0,0,32,0,0,0,0,0,18,0,0,0,256,0,0,0,32192,0,0,0,0,1,768,0,0,256,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,49152,34831,8,108,0,4032,2184,27648,0,49152,34831,8,108,0,4032,2184,27648,0,32768,32771,0,16,0,0,256,0,0,0,0,1,0,0,0,256,0,0,8192,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,256,0,0,8192,0,0,0,0,0,0,0,0,49152,34831,8,108,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,1,0,0,0,256,0,0,0,0,1,0,0,0,256,0,0,0,0,1,0,0,0,256,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","Query","FilteredQuery","BasicQuery","CreateVars","CreateVar","Func","Combinations","CombinationLst","FilterEl","UrlList","JoinOption","SList","SListElem","Cond","Action","Literal","LiteralList","LiteralElems","IntExp","BoolExp","StringExp","Node","Subject","Predicate","Object","Url","','","int","subj","pred","obj","true","false","'-l'","'-r'","'<'","'>'","deq","'='","'+'","'-'","'*'","'/'","'^'","'('","')'","'['","']'","string","filename","'|'","'?'","':'","'_'","';'","filter","remove","map","union","join","where","and","or","var","url","add","length","startsWith","%eof"]
        bit_start = st Prelude.* 72
        bit_end = (st Prelude.+ 1) Prelude.* 72
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..71]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (53) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (53) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (54) = happyShift action_7
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (58) = happyShift action_6
action_3 (72) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (54) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (59) = happyShift action_11
action_5 (60) = happyShift action_12
action_5 (61) = happyShift action_13
action_5 (62) = happyShift action_14
action_5 (63) = happyShift action_15
action_5 (69) = happyShift action_16
action_5 (5) = happyGoto action_18
action_5 (6) = happyGoto action_9
action_5 (9) = happyGoto action_10
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (53) = happyShift action_4
action_6 (4) = happyGoto action_17
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (59) = happyShift action_11
action_7 (60) = happyShift action_12
action_7 (61) = happyShift action_13
action_7 (62) = happyShift action_14
action_7 (63) = happyShift action_15
action_7 (69) = happyShift action_16
action_7 (5) = happyGoto action_8
action_7 (6) = happyGoto action_9
action_7 (9) = happyGoto action_10
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (40) = happyShift action_19
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (64) = happyShift action_33
action_9 _ = happyReduce_4

action_10 (54) = happyShift action_32
action_10 _ = happyReduce_6

action_11 (48) = happyShift action_29
action_11 (50) = happyShift action_30
action_11 (10) = happyGoto action_31
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (48) = happyShift action_29
action_12 (50) = happyShift action_30
action_12 (10) = happyGoto action_28
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (48) = happyShift action_27
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (50) = happyShift action_25
action_14 (53) = happyShift action_26
action_14 (15) = happyGoto action_24
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (37) = happyShift action_22
action_15 (38) = happyShift action_23
action_15 (14) = happyGoto action_21
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (48) = happyShift action_20
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_3

action_18 (40) = happyShift action_19
action_18 _ = happyReduce_2

action_19 (40) = happyShift action_60
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (68) = happyShift action_59
action_20 (29) = happyGoto action_58
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (48) = happyShift action_57
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (38) = happyShift action_56
action_22 _ = happyReduce_30

action_23 (37) = happyShift action_55
action_23 _ = happyReduce_31

action_24 _ = happyReduce_17

action_25 (53) = happyShift action_54
action_25 (16) = happyGoto action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_33

action_27 (32) = happyShift action_48
action_27 (33) = happyShift action_49
action_27 (34) = happyShift action_50
action_27 (48) = happyShift action_51
action_27 (69) = happyShift action_52
action_27 (17) = happyGoto action_43
action_27 (18) = happyGoto action_44
action_27 (26) = happyGoto action_45
action_27 (27) = happyGoto action_46
action_27 (28) = happyGoto action_47
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_15

action_29 (50) = happyShift action_41
action_29 (57) = happyShift action_42
action_29 (12) = happyGoto action_40
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (48) = happyShift action_39
action_30 (11) = happyGoto action_38
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_14

action_32 (59) = happyShift action_11
action_32 (60) = happyShift action_12
action_32 (61) = happyShift action_13
action_32 (62) = happyShift action_14
action_32 (63) = happyShift action_15
action_32 (69) = happyShift action_16
action_32 (6) = happyGoto action_37
action_32 (9) = happyGoto action_10
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (67) = happyShift action_36
action_33 (7) = happyGoto action_34
action_33 (8) = happyGoto action_35
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_5

action_35 (67) = happyShift action_36
action_35 (7) = happyGoto action_98
action_35 (8) = happyGoto action_35
action_35 _ = happyReduce_8

action_36 (42) = happyShift action_97
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_7

action_38 (51) = happyShift action_96
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (50) = happyShift action_41
action_39 (57) = happyShift action_42
action_39 (12) = happyGoto action_95
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (30) = happyShift action_94
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (68) = happyShift action_59
action_41 (13) = happyGoto action_92
action_41 (29) = happyGoto action_93
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_24

action_43 (49) = happyShift action_91
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (30) = happyShift action_90
action_44 _ = happyReduce_36

action_45 (42) = happyShift action_89
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (42) = happyShift action_88
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (42) = happyShift action_87
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_183

action_49 _ = happyReduce_184

action_50 _ = happyReduce_185

action_51 (31) = happyShift action_78
action_51 (32) = happyShift action_48
action_51 (33) = happyShift action_49
action_51 (34) = happyShift action_50
action_51 (35) = happyShift action_79
action_51 (36) = happyShift action_80
action_51 (44) = happyShift action_81
action_51 (48) = happyShift action_82
action_51 (52) = happyShift action_83
action_51 (67) = happyShift action_84
action_51 (68) = happyShift action_59
action_51 (69) = happyShift action_52
action_51 (70) = happyShift action_85
action_51 (71) = happyShift action_86
action_51 (18) = happyGoto action_70
action_51 (22) = happyGoto action_71
action_51 (23) = happyGoto action_72
action_51 (24) = happyGoto action_73
action_51 (26) = happyGoto action_74
action_51 (27) = happyGoto action_75
action_51 (28) = happyGoto action_76
action_51 (29) = happyGoto action_77
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (48) = happyShift action_69
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (51) = happyShift action_68
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (30) = happyShift action_67
action_54 _ = happyReduce_34

action_55 _ = happyReduce_28

action_56 _ = happyReduce_29

action_57 (32) = happyShift action_48
action_57 (33) = happyShift action_49
action_57 (34) = happyShift action_50
action_57 (25) = happyGoto action_63
action_57 (26) = happyGoto action_64
action_57 (27) = happyGoto action_65
action_57 (28) = happyGoto action_66
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (30) = happyShift action_62
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_186

action_60 (53) = happyShift action_61
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_1

action_62 (68) = happyShift action_59
action_62 (29) = happyGoto action_167
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (30) = happyShift action_166
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_180

action_65 _ = happyReduce_181

action_66 _ = happyReduce_182

action_67 (53) = happyShift action_54
action_67 (16) = happyGoto action_165
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_32

action_69 (32) = happyShift action_164
action_69 (68) = happyShift action_59
action_69 (29) = happyGoto action_163
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (49) = happyShift action_162
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (39) = happyShift action_154
action_71 (40) = happyShift action_155
action_71 (41) = happyShift action_156
action_71 (43) = happyShift action_157
action_71 (44) = happyShift action_158
action_71 (45) = happyShift action_159
action_71 (46) = happyShift action_160
action_71 (47) = happyShift action_161
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (41) = happyShift action_150
action_72 (49) = happyShift action_151
action_72 (65) = happyShift action_152
action_72 (66) = happyShift action_153
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (41) = happyShift action_149
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (41) = happyShift action_148
action_74 (42) = happyShift action_89
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (41) = happyShift action_147
action_75 (42) = happyShift action_88
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (39) = happyShift action_137
action_76 (40) = happyShift action_138
action_76 (41) = happyShift action_139
action_76 (42) = happyShift action_87
action_76 (43) = happyShift action_140
action_76 (44) = happyShift action_141
action_76 (45) = happyShift action_142
action_76 (46) = happyShift action_143
action_76 (47) = happyShift action_144
action_76 (65) = happyShift action_145
action_76 (66) = happyShift action_146
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (41) = happyShift action_136
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_111

action_79 _ = happyReduce_174

action_80 _ = happyReduce_175

action_81 (31) = happyShift action_78
action_81 (34) = happyShift action_50
action_81 (44) = happyShift action_81
action_81 (48) = happyShift action_134
action_81 (67) = happyShift action_135
action_81 (70) = happyShift action_85
action_81 (22) = happyGoto action_132
action_81 (28) = happyGoto action_133
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (31) = happyShift action_78
action_82 (32) = happyShift action_48
action_82 (33) = happyShift action_49
action_82 (34) = happyShift action_50
action_82 (35) = happyShift action_79
action_82 (36) = happyShift action_80
action_82 (44) = happyShift action_81
action_82 (48) = happyShift action_82
action_82 (52) = happyShift action_83
action_82 (67) = happyShift action_84
action_82 (68) = happyShift action_59
action_82 (69) = happyShift action_52
action_82 (70) = happyShift action_85
action_82 (71) = happyShift action_86
action_82 (18) = happyGoto action_70
action_82 (22) = happyGoto action_130
action_82 (23) = happyGoto action_131
action_82 (24) = happyGoto action_73
action_82 (26) = happyGoto action_74
action_82 (27) = happyGoto action_75
action_82 (28) = happyGoto action_76
action_82 (29) = happyGoto action_77
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_179

action_84 (39) = happyShift action_120
action_84 (40) = happyShift action_121
action_84 (41) = happyShift action_122
action_84 (43) = happyShift action_123
action_84 (44) = happyShift action_124
action_84 (45) = happyShift action_125
action_84 (46) = happyShift action_126
action_84 (47) = happyShift action_127
action_84 (65) = happyShift action_128
action_84 (66) = happyShift action_129
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (48) = happyShift action_119
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (48) = happyShift action_118
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (31) = happyShift action_78
action_87 (32) = happyShift action_48
action_87 (33) = happyShift action_49
action_87 (34) = happyShift action_50
action_87 (35) = happyShift action_79
action_87 (36) = happyShift action_80
action_87 (44) = happyShift action_81
action_87 (48) = happyShift action_106
action_87 (52) = happyShift action_83
action_87 (67) = happyShift action_84
action_87 (68) = happyShift action_59
action_87 (70) = happyShift action_85
action_87 (71) = happyShift action_86
action_87 (22) = happyGoto action_114
action_87 (23) = happyGoto action_115
action_87 (24) = happyGoto action_116
action_87 (26) = happyGoto action_102
action_87 (27) = happyGoto action_103
action_87 (28) = happyGoto action_104
action_87 (29) = happyGoto action_117
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (68) = happyShift action_59
action_88 (29) = happyGoto action_113
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (68) = happyShift action_59
action_89 (29) = happyGoto action_112
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (32) = happyShift action_48
action_90 (33) = happyShift action_49
action_90 (34) = happyShift action_50
action_90 (48) = happyShift action_51
action_90 (69) = happyShift action_52
action_90 (17) = happyGoto action_111
action_90 (18) = happyGoto action_44
action_90 (26) = happyGoto action_45
action_90 (27) = happyGoto action_46
action_90 (28) = happyGoto action_47
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_16

action_92 (51) = happyShift action_110
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (30) = happyShift action_109
action_93 _ = happyReduce_26

action_94 (50) = happyShift action_41
action_94 (57) = happyShift action_42
action_94 (12) = happyGoto action_108
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (30) = happyShift action_107
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_21

action_97 (31) = happyShift action_78
action_97 (32) = happyShift action_48
action_97 (33) = happyShift action_49
action_97 (34) = happyShift action_50
action_97 (35) = happyShift action_79
action_97 (36) = happyShift action_80
action_97 (44) = happyShift action_81
action_97 (48) = happyShift action_106
action_97 (52) = happyShift action_83
action_97 (67) = happyShift action_84
action_97 (68) = happyShift action_59
action_97 (70) = happyShift action_85
action_97 (71) = happyShift action_86
action_97 (22) = happyGoto action_99
action_97 (23) = happyGoto action_100
action_97 (24) = happyGoto action_101
action_97 (26) = happyGoto action_102
action_97 (27) = happyGoto action_103
action_97 (28) = happyGoto action_104
action_97 (29) = happyGoto action_105
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_9

action_99 (39) = happyShift action_154
action_99 (40) = happyShift action_155
action_99 (41) = happyShift action_156
action_99 (43) = happyShift action_157
action_99 (44) = happyShift action_158
action_99 (45) = happyShift action_159
action_99 (46) = happyShift action_160
action_99 (47) = happyShift action_161
action_99 _ = happyReduce_10

action_100 (41) = happyShift action_150
action_100 (65) = happyShift action_152
action_100 (66) = happyShift action_153
action_100 _ = happyReduce_12

action_101 (41) = happyShift action_149
action_101 _ = happyReduce_11

action_102 (41) = happyShift action_148
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (41) = happyShift action_147
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (39) = happyShift action_137
action_104 (40) = happyShift action_138
action_104 (41) = happyShift action_139
action_104 (43) = happyShift action_140
action_104 (44) = happyShift action_141
action_104 (45) = happyShift action_142
action_104 (46) = happyShift action_143
action_104 (47) = happyShift action_144
action_104 (65) = happyShift action_145
action_104 (66) = happyShift action_146
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (41) = happyShift action_136
action_105 _ = happyReduce_13

action_106 (31) = happyShift action_78
action_106 (32) = happyShift action_48
action_106 (33) = happyShift action_49
action_106 (34) = happyShift action_50
action_106 (35) = happyShift action_79
action_106 (36) = happyShift action_80
action_106 (44) = happyShift action_81
action_106 (48) = happyShift action_106
action_106 (52) = happyShift action_83
action_106 (67) = happyShift action_84
action_106 (68) = happyShift action_59
action_106 (70) = happyShift action_85
action_106 (71) = happyShift action_86
action_106 (22) = happyGoto action_130
action_106 (23) = happyGoto action_131
action_106 (24) = happyGoto action_73
action_106 (26) = happyGoto action_102
action_106 (27) = happyGoto action_103
action_106 (28) = happyGoto action_104
action_106 (29) = happyGoto action_77
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (50) = happyShift action_41
action_107 (57) = happyShift action_42
action_107 (12) = happyGoto action_287
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (30) = happyShift action_286
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (68) = happyShift action_59
action_109 (13) = happyGoto action_285
action_109 (29) = happyGoto action_93
action_109 _ = happyFail (happyExpListPerState 109)

action_110 _ = happyReduce_25

action_111 _ = happyReduce_37

action_112 _ = happyReduce_39

action_113 _ = happyReduce_40

action_114 (39) = happyShift action_154
action_114 (40) = happyShift action_155
action_114 (41) = happyShift action_156
action_114 (43) = happyShift action_157
action_114 (44) = happyShift action_158
action_114 (45) = happyShift action_159
action_114 (46) = happyShift action_160
action_114 (47) = happyShift action_161
action_114 _ = happyReduce_43

action_115 (41) = happyShift action_150
action_115 (65) = happyShift action_152
action_115 (66) = happyShift action_153
action_115 _ = happyReduce_44

action_116 (41) = happyShift action_149
action_116 _ = happyReduce_42

action_117 (41) = happyShift action_136
action_117 _ = happyReduce_41

action_118 (52) = happyShift action_284
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (34) = happyShift action_50
action_119 (52) = happyShift action_283
action_119 (28) = happyGoto action_282
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (31) = happyShift action_78
action_120 (34) = happyShift action_50
action_120 (44) = happyShift action_81
action_120 (48) = happyShift action_134
action_120 (67) = happyShift action_281
action_120 (70) = happyShift action_85
action_120 (22) = happyGoto action_279
action_120 (28) = happyGoto action_280
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (31) = happyShift action_78
action_121 (34) = happyShift action_50
action_121 (44) = happyShift action_81
action_121 (48) = happyShift action_134
action_121 (67) = happyShift action_278
action_121 (70) = happyShift action_85
action_121 (22) = happyGoto action_276
action_121 (28) = happyGoto action_277
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (31) = happyShift action_78
action_122 (32) = happyShift action_48
action_122 (33) = happyShift action_49
action_122 (34) = happyShift action_50
action_122 (35) = happyShift action_79
action_122 (36) = happyShift action_80
action_122 (44) = happyShift action_81
action_122 (48) = happyShift action_106
action_122 (52) = happyShift action_83
action_122 (67) = happyShift action_275
action_122 (68) = happyShift action_59
action_122 (70) = happyShift action_85
action_122 (71) = happyShift action_86
action_122 (22) = happyGoto action_270
action_122 (23) = happyGoto action_271
action_122 (24) = happyGoto action_272
action_122 (26) = happyGoto action_102
action_122 (27) = happyGoto action_103
action_122 (28) = happyGoto action_273
action_122 (29) = happyGoto action_274
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (31) = happyShift action_78
action_123 (34) = happyShift action_50
action_123 (44) = happyShift action_81
action_123 (48) = happyShift action_134
action_123 (67) = happyShift action_269
action_123 (70) = happyShift action_85
action_123 (22) = happyGoto action_267
action_123 (28) = happyGoto action_268
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (31) = happyShift action_78
action_124 (34) = happyShift action_50
action_124 (44) = happyShift action_81
action_124 (48) = happyShift action_134
action_124 (67) = happyShift action_266
action_124 (70) = happyShift action_85
action_124 (22) = happyGoto action_264
action_124 (28) = happyGoto action_265
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (31) = happyShift action_78
action_125 (34) = happyShift action_50
action_125 (44) = happyShift action_81
action_125 (48) = happyShift action_134
action_125 (67) = happyShift action_263
action_125 (70) = happyShift action_85
action_125 (22) = happyGoto action_261
action_125 (28) = happyGoto action_262
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (31) = happyShift action_78
action_126 (34) = happyShift action_50
action_126 (44) = happyShift action_81
action_126 (48) = happyShift action_134
action_126 (67) = happyShift action_260
action_126 (70) = happyShift action_85
action_126 (22) = happyGoto action_258
action_126 (28) = happyGoto action_259
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (31) = happyShift action_78
action_127 (34) = happyShift action_50
action_127 (44) = happyShift action_81
action_127 (48) = happyShift action_134
action_127 (67) = happyShift action_257
action_127 (70) = happyShift action_85
action_127 (22) = happyGoto action_255
action_127 (28) = happyGoto action_256
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (31) = happyShift action_78
action_128 (32) = happyShift action_48
action_128 (33) = happyShift action_49
action_128 (34) = happyShift action_50
action_128 (35) = happyShift action_79
action_128 (36) = happyShift action_80
action_128 (44) = happyShift action_81
action_128 (48) = happyShift action_106
action_128 (52) = happyShift action_83
action_128 (67) = happyShift action_254
action_128 (68) = happyShift action_59
action_128 (70) = happyShift action_85
action_128 (71) = happyShift action_86
action_128 (22) = happyGoto action_71
action_128 (23) = happyGoto action_252
action_128 (24) = happyGoto action_73
action_128 (26) = happyGoto action_102
action_128 (27) = happyGoto action_103
action_128 (28) = happyGoto action_253
action_128 (29) = happyGoto action_77
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (31) = happyShift action_78
action_129 (32) = happyShift action_48
action_129 (33) = happyShift action_49
action_129 (34) = happyShift action_50
action_129 (35) = happyShift action_79
action_129 (36) = happyShift action_80
action_129 (44) = happyShift action_81
action_129 (48) = happyShift action_106
action_129 (52) = happyShift action_83
action_129 (67) = happyShift action_251
action_129 (68) = happyShift action_59
action_129 (70) = happyShift action_85
action_129 (71) = happyShift action_86
action_129 (22) = happyGoto action_71
action_129 (23) = happyGoto action_249
action_129 (24) = happyGoto action_73
action_129 (26) = happyGoto action_102
action_129 (27) = happyGoto action_103
action_129 (28) = happyGoto action_250
action_129 (29) = happyGoto action_77
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (39) = happyShift action_154
action_130 (40) = happyShift action_155
action_130 (41) = happyShift action_156
action_130 (43) = happyShift action_157
action_130 (44) = happyShift action_158
action_130 (45) = happyShift action_159
action_130 (46) = happyShift action_160
action_130 (47) = happyShift action_161
action_130 (49) = happyShift action_248
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (41) = happyShift action_150
action_131 (49) = happyShift action_247
action_131 (65) = happyShift action_152
action_131 (66) = happyShift action_153
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_108

action_133 _ = happyReduce_109

action_134 (31) = happyShift action_78
action_134 (34) = happyShift action_50
action_134 (44) = happyShift action_81
action_134 (48) = happyShift action_134
action_134 (67) = happyShift action_246
action_134 (70) = happyShift action_85
action_134 (22) = happyGoto action_245
action_134 (28) = happyGoto action_236
action_134 _ = happyFail (happyExpListPerState 134)

action_135 _ = happyReduce_110

action_136 (32) = happyShift action_48
action_136 (33) = happyShift action_49
action_136 (34) = happyShift action_50
action_136 (67) = happyShift action_244
action_136 (68) = happyShift action_59
action_136 (26) = happyGoto action_240
action_136 (27) = happyGoto action_241
action_136 (28) = happyGoto action_242
action_136 (29) = happyGoto action_243
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (31) = happyShift action_78
action_137 (34) = happyShift action_50
action_137 (44) = happyShift action_81
action_137 (48) = happyShift action_134
action_137 (67) = happyShift action_239
action_137 (70) = happyShift action_85
action_137 (22) = happyGoto action_238
action_137 (28) = happyGoto action_236
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (31) = happyShift action_78
action_138 (34) = happyShift action_50
action_138 (44) = happyShift action_81
action_138 (48) = happyShift action_134
action_138 (67) = happyShift action_237
action_138 (70) = happyShift action_85
action_138 (22) = happyGoto action_235
action_138 (28) = happyGoto action_236
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (31) = happyShift action_78
action_139 (32) = happyShift action_48
action_139 (33) = happyShift action_49
action_139 (34) = happyShift action_50
action_139 (35) = happyShift action_79
action_139 (36) = happyShift action_80
action_139 (44) = happyShift action_81
action_139 (48) = happyShift action_106
action_139 (52) = happyShift action_83
action_139 (67) = happyShift action_234
action_139 (68) = happyShift action_59
action_139 (70) = happyShift action_85
action_139 (71) = happyShift action_86
action_139 (22) = happyGoto action_230
action_139 (23) = happyGoto action_231
action_139 (24) = happyGoto action_232
action_139 (26) = happyGoto action_102
action_139 (27) = happyGoto action_103
action_139 (28) = happyGoto action_104
action_139 (29) = happyGoto action_233
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (31) = happyShift action_78
action_140 (34) = happyShift action_50
action_140 (44) = happyShift action_81
action_140 (48) = happyShift action_134
action_140 (67) = happyShift action_229
action_140 (70) = happyShift action_85
action_140 (22) = happyGoto action_227
action_140 (28) = happyGoto action_228
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (31) = happyShift action_78
action_141 (34) = happyShift action_50
action_141 (44) = happyShift action_81
action_141 (48) = happyShift action_134
action_141 (67) = happyShift action_226
action_141 (70) = happyShift action_85
action_141 (22) = happyGoto action_224
action_141 (28) = happyGoto action_225
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (31) = happyShift action_78
action_142 (34) = happyShift action_50
action_142 (44) = happyShift action_81
action_142 (48) = happyShift action_134
action_142 (67) = happyShift action_223
action_142 (70) = happyShift action_85
action_142 (22) = happyGoto action_221
action_142 (28) = happyGoto action_222
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (31) = happyShift action_78
action_143 (34) = happyShift action_50
action_143 (44) = happyShift action_81
action_143 (48) = happyShift action_134
action_143 (67) = happyShift action_220
action_143 (70) = happyShift action_85
action_143 (22) = happyGoto action_218
action_143 (28) = happyGoto action_219
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (31) = happyShift action_78
action_144 (34) = happyShift action_50
action_144 (44) = happyShift action_81
action_144 (48) = happyShift action_134
action_144 (67) = happyShift action_217
action_144 (70) = happyShift action_85
action_144 (22) = happyGoto action_215
action_144 (28) = happyGoto action_216
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (31) = happyShift action_78
action_145 (32) = happyShift action_48
action_145 (33) = happyShift action_49
action_145 (34) = happyShift action_50
action_145 (35) = happyShift action_79
action_145 (36) = happyShift action_80
action_145 (44) = happyShift action_81
action_145 (48) = happyShift action_106
action_145 (52) = happyShift action_83
action_145 (67) = happyShift action_214
action_145 (68) = happyShift action_59
action_145 (70) = happyShift action_85
action_145 (71) = happyShift action_86
action_145 (22) = happyGoto action_71
action_145 (23) = happyGoto action_213
action_145 (24) = happyGoto action_73
action_145 (26) = happyGoto action_102
action_145 (27) = happyGoto action_103
action_145 (28) = happyGoto action_104
action_145 (29) = happyGoto action_77
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (31) = happyShift action_78
action_146 (32) = happyShift action_48
action_146 (33) = happyShift action_49
action_146 (34) = happyShift action_50
action_146 (35) = happyShift action_79
action_146 (36) = happyShift action_80
action_146 (44) = happyShift action_81
action_146 (48) = happyShift action_106
action_146 (52) = happyShift action_83
action_146 (67) = happyShift action_212
action_146 (68) = happyShift action_59
action_146 (70) = happyShift action_85
action_146 (71) = happyShift action_86
action_146 (22) = happyGoto action_71
action_146 (23) = happyGoto action_211
action_146 (24) = happyGoto action_73
action_146 (26) = happyGoto action_102
action_146 (27) = happyGoto action_103
action_146 (28) = happyGoto action_104
action_146 (29) = happyGoto action_77
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (68) = happyShift action_59
action_147 (29) = happyGoto action_210
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (68) = happyShift action_59
action_148 (29) = happyGoto action_209
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (34) = happyShift action_50
action_149 (52) = happyShift action_83
action_149 (67) = happyShift action_208
action_149 (24) = happyGoto action_206
action_149 (28) = happyGoto action_207
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (31) = happyShift action_78
action_150 (32) = happyShift action_48
action_150 (33) = happyShift action_49
action_150 (34) = happyShift action_50
action_150 (35) = happyShift action_79
action_150 (36) = happyShift action_80
action_150 (44) = happyShift action_81
action_150 (48) = happyShift action_106
action_150 (52) = happyShift action_83
action_150 (67) = happyShift action_205
action_150 (68) = happyShift action_59
action_150 (70) = happyShift action_85
action_150 (71) = happyShift action_86
action_150 (22) = happyGoto action_71
action_150 (23) = happyGoto action_203
action_150 (24) = happyGoto action_73
action_150 (26) = happyGoto action_102
action_150 (27) = happyGoto action_103
action_150 (28) = happyGoto action_204
action_150 (29) = happyGoto action_77
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (55) = happyShift action_202
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (31) = happyShift action_78
action_152 (32) = happyShift action_48
action_152 (33) = happyShift action_49
action_152 (34) = happyShift action_50
action_152 (35) = happyShift action_79
action_152 (36) = happyShift action_80
action_152 (44) = happyShift action_81
action_152 (48) = happyShift action_106
action_152 (52) = happyShift action_83
action_152 (67) = happyShift action_201
action_152 (68) = happyShift action_59
action_152 (70) = happyShift action_85
action_152 (71) = happyShift action_86
action_152 (22) = happyGoto action_71
action_152 (23) = happyGoto action_199
action_152 (24) = happyGoto action_73
action_152 (26) = happyGoto action_102
action_152 (27) = happyGoto action_103
action_152 (28) = happyGoto action_200
action_152 (29) = happyGoto action_77
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (31) = happyShift action_78
action_153 (32) = happyShift action_48
action_153 (33) = happyShift action_49
action_153 (34) = happyShift action_50
action_153 (35) = happyShift action_79
action_153 (36) = happyShift action_80
action_153 (44) = happyShift action_81
action_153 (48) = happyShift action_106
action_153 (52) = happyShift action_83
action_153 (67) = happyShift action_198
action_153 (68) = happyShift action_59
action_153 (70) = happyShift action_85
action_153 (71) = happyShift action_86
action_153 (22) = happyGoto action_71
action_153 (23) = happyGoto action_196
action_153 (24) = happyGoto action_73
action_153 (26) = happyGoto action_102
action_153 (27) = happyGoto action_103
action_153 (28) = happyGoto action_197
action_153 (29) = happyGoto action_77
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (31) = happyShift action_78
action_154 (34) = happyShift action_50
action_154 (44) = happyShift action_81
action_154 (48) = happyShift action_134
action_154 (67) = happyShift action_195
action_154 (70) = happyShift action_85
action_154 (22) = happyGoto action_193
action_154 (28) = happyGoto action_194
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (31) = happyShift action_78
action_155 (34) = happyShift action_50
action_155 (44) = happyShift action_81
action_155 (48) = happyShift action_134
action_155 (67) = happyShift action_192
action_155 (70) = happyShift action_85
action_155 (22) = happyGoto action_190
action_155 (28) = happyGoto action_191
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (31) = happyShift action_78
action_156 (34) = happyShift action_50
action_156 (44) = happyShift action_81
action_156 (48) = happyShift action_134
action_156 (67) = happyShift action_189
action_156 (70) = happyShift action_85
action_156 (22) = happyGoto action_187
action_156 (28) = happyGoto action_188
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (31) = happyShift action_78
action_157 (34) = happyShift action_50
action_157 (44) = happyShift action_81
action_157 (48) = happyShift action_134
action_157 (67) = happyShift action_186
action_157 (70) = happyShift action_85
action_157 (22) = happyGoto action_184
action_157 (28) = happyGoto action_185
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (31) = happyShift action_78
action_158 (34) = happyShift action_50
action_158 (44) = happyShift action_81
action_158 (48) = happyShift action_134
action_158 (67) = happyShift action_183
action_158 (70) = happyShift action_85
action_158 (22) = happyGoto action_181
action_158 (28) = happyGoto action_182
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (31) = happyShift action_78
action_159 (34) = happyShift action_50
action_159 (44) = happyShift action_81
action_159 (48) = happyShift action_134
action_159 (67) = happyShift action_180
action_159 (70) = happyShift action_85
action_159 (22) = happyGoto action_178
action_159 (28) = happyGoto action_179
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (31) = happyShift action_78
action_160 (34) = happyShift action_50
action_160 (44) = happyShift action_81
action_160 (48) = happyShift action_134
action_160 (67) = happyShift action_177
action_160 (70) = happyShift action_85
action_160 (22) = happyGoto action_175
action_160 (28) = happyGoto action_176
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (31) = happyShift action_78
action_161 (34) = happyShift action_50
action_161 (44) = happyShift action_81
action_161 (48) = happyShift action_134
action_161 (67) = happyShift action_174
action_161 (70) = happyShift action_85
action_161 (22) = happyGoto action_172
action_161 (28) = happyGoto action_173
action_161 _ = happyFail (happyExpListPerState 161)

action_162 _ = happyReduce_53

action_163 (30) = happyShift action_171
action_163 _ = happyFail (happyExpListPerState 163)

action_164 (30) = happyShift action_170
action_164 _ = happyFail (happyExpListPerState 164)

action_165 _ = happyReduce_35

action_166 (32) = happyShift action_48
action_166 (33) = happyShift action_49
action_166 (34) = happyShift action_50
action_166 (25) = happyGoto action_169
action_166 (26) = happyGoto action_64
action_166 (27) = happyGoto action_65
action_166 (28) = happyGoto action_66
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (30) = happyShift action_168
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (31) = happyShift action_78
action_168 (32) = happyShift action_48
action_168 (33) = happyShift action_49
action_168 (34) = happyShift action_50
action_168 (35) = happyShift action_79
action_168 (36) = happyShift action_80
action_168 (44) = happyShift action_81
action_168 (48) = happyShift action_106
action_168 (52) = happyShift action_83
action_168 (67) = happyShift action_84
action_168 (68) = happyShift action_59
action_168 (70) = happyShift action_85
action_168 (71) = happyShift action_86
action_168 (19) = happyGoto action_301
action_168 (22) = happyGoto action_302
action_168 (23) = happyGoto action_303
action_168 (24) = happyGoto action_304
action_168 (26) = happyGoto action_102
action_168 (27) = happyGoto action_103
action_168 (28) = happyGoto action_104
action_168 (29) = happyGoto action_305
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (49) = happyShift action_300
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (33) = happyShift action_299
action_170 (68) = happyShift action_59
action_170 (29) = happyGoto action_298
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (33) = happyShift action_297
action_171 (68) = happyShift action_59
action_171 (29) = happyGoto action_296
action_171 _ = happyFail (happyExpListPerState 171)

action_172 _ = happyReduce_98

action_173 _ = happyReduce_100

action_174 (43) = happyShift action_123
action_174 (44) = happyShift action_124
action_174 (45) = happyShift action_125
action_174 (46) = happyShift action_126
action_174 (47) = happyShift action_127
action_174 _ = happyReduce_105

action_175 (47) = happyShift action_161
action_175 _ = happyReduce_89

action_176 (47) = happyShift action_144
action_176 _ = happyReduce_91

action_177 (43) = happyShift action_123
action_177 (44) = happyShift action_124
action_177 (45) = happyShift action_125
action_177 (46) = happyShift action_126
action_177 (47) = happyShift action_127
action_177 _ = happyReduce_96

action_178 (47) = happyShift action_161
action_178 _ = happyReduce_80

action_179 (47) = happyShift action_144
action_179 _ = happyReduce_82

action_180 (43) = happyShift action_123
action_180 (44) = happyShift action_124
action_180 (45) = happyShift action_125
action_180 (46) = happyShift action_126
action_180 (47) = happyShift action_127
action_180 _ = happyReduce_87

action_181 (45) = happyShift action_159
action_181 (46) = happyShift action_160
action_181 (47) = happyShift action_161
action_181 _ = happyReduce_71

action_182 (45) = happyShift action_142
action_182 (46) = happyShift action_143
action_182 (47) = happyShift action_144
action_182 _ = happyReduce_73

action_183 (43) = happyShift action_123
action_183 (44) = happyShift action_124
action_183 (45) = happyShift action_125
action_183 (46) = happyShift action_126
action_183 (47) = happyShift action_127
action_183 _ = happyReduce_78

action_184 (45) = happyShift action_159
action_184 (46) = happyShift action_160
action_184 (47) = happyShift action_161
action_184 _ = happyReduce_62

action_185 (45) = happyShift action_142
action_185 (46) = happyShift action_143
action_185 (47) = happyShift action_144
action_185 _ = happyReduce_64

action_186 (43) = happyShift action_123
action_186 (44) = happyShift action_124
action_186 (45) = happyShift action_125
action_186 (46) = happyShift action_126
action_186 (47) = happyShift action_127
action_186 _ = happyReduce_69

action_187 (43) = happyShift action_157
action_187 (44) = happyShift action_158
action_187 (45) = happyShift action_159
action_187 (46) = happyShift action_160
action_187 (47) = happyShift action_161
action_187 _ = happyReduce_146

action_188 (43) = happyShift action_140
action_188 (44) = happyShift action_141
action_188 (45) = happyShift action_142
action_188 (46) = happyShift action_143
action_188 (47) = happyShift action_144
action_188 _ = happyReduce_151

action_189 (43) = happyShift action_123
action_189 (44) = happyShift action_124
action_189 (45) = happyShift action_125
action_189 (46) = happyShift action_126
action_189 (47) = happyShift action_127
action_189 _ = happyReduce_163

action_190 (43) = happyShift action_157
action_190 (44) = happyShift action_158
action_190 (45) = happyShift action_159
action_190 (46) = happyShift action_160
action_190 (47) = happyShift action_161
action_190 _ = happyReduce_130

action_191 (43) = happyShift action_140
action_191 (44) = happyShift action_141
action_191 (45) = happyShift action_142
action_191 (46) = happyShift action_143
action_191 (47) = happyShift action_144
action_191 _ = happyReduce_131

action_192 (43) = happyShift action_123
action_192 (44) = happyShift action_124
action_192 (45) = happyShift action_125
action_192 (46) = happyShift action_126
action_192 (47) = happyShift action_127
action_192 _ = happyReduce_136

action_193 (43) = happyShift action_157
action_193 (44) = happyShift action_158
action_193 (45) = happyShift action_159
action_193 (46) = happyShift action_160
action_193 (47) = happyShift action_161
action_193 _ = happyReduce_138

action_194 (43) = happyShift action_140
action_194 (44) = happyShift action_141
action_194 (45) = happyShift action_142
action_194 (46) = happyShift action_143
action_194 (47) = happyShift action_144
action_194 _ = happyReduce_139

action_195 (43) = happyShift action_123
action_195 (44) = happyShift action_124
action_195 (45) = happyShift action_125
action_195 (46) = happyShift action_126
action_195 (47) = happyShift action_127
action_195 _ = happyReduce_144

action_196 (41) = happyShift action_150
action_196 (65) = happyShift action_152
action_196 _ = happyReduce_122

action_197 (39) = happyShift action_137
action_197 (40) = happyShift action_138
action_197 (41) = happyShift action_139
action_197 (43) = happyShift action_140
action_197 (44) = happyShift action_141
action_197 (45) = happyShift action_142
action_197 (46) = happyShift action_143
action_197 (47) = happyShift action_144
action_197 (65) = happyShift action_145
action_197 _ = happyReduce_123

action_198 (39) = happyShift action_120
action_198 (40) = happyShift action_121
action_198 (41) = happyShift action_122
action_198 (43) = happyShift action_123
action_198 (44) = happyShift action_124
action_198 (45) = happyShift action_125
action_198 (46) = happyShift action_126
action_198 (47) = happyShift action_127
action_198 (65) = happyShift action_128
action_198 (66) = happyShift action_129
action_198 _ = happyReduce_128

action_199 (41) = happyShift action_150
action_199 _ = happyReduce_114

action_200 (39) = happyShift action_137
action_200 (40) = happyShift action_138
action_200 (41) = happyShift action_139
action_200 (43) = happyShift action_140
action_200 (44) = happyShift action_141
action_200 (45) = happyShift action_142
action_200 (46) = happyShift action_143
action_200 (47) = happyShift action_144
action_200 _ = happyReduce_115

action_201 (39) = happyShift action_120
action_201 (40) = happyShift action_121
action_201 (41) = happyShift action_122
action_201 (43) = happyShift action_123
action_201 (44) = happyShift action_124
action_201 (45) = happyShift action_125
action_201 (46) = happyShift action_126
action_201 (47) = happyShift action_127
action_201 (65) = happyShift action_128
action_201 (66) = happyShift action_129
action_201 _ = happyReduce_120

action_202 (32) = happyShift action_48
action_202 (33) = happyShift action_49
action_202 (34) = happyShift action_50
action_202 (48) = happyShift action_51
action_202 (69) = happyShift action_52
action_202 (17) = happyGoto action_295
action_202 (18) = happyGoto action_44
action_202 (26) = happyGoto action_45
action_202 (27) = happyGoto action_46
action_202 (28) = happyGoto action_47
action_202 _ = happyFail (happyExpListPerState 202)

action_203 _ = happyReduce_147

action_204 (39) = happyShift action_137
action_204 (40) = happyShift action_138
action_204 (43) = happyShift action_140
action_204 (44) = happyShift action_141
action_204 (45) = happyShift action_142
action_204 (46) = happyShift action_143
action_204 (47) = happyShift action_144
action_204 _ = happyReduce_153

action_205 (39) = happyShift action_120
action_205 (40) = happyShift action_121
action_205 (41) = happyShift action_122
action_205 (43) = happyShift action_123
action_205 (44) = happyShift action_124
action_205 (45) = happyShift action_125
action_205 (46) = happyShift action_126
action_205 (47) = happyShift action_127
action_205 (65) = happyShift action_128
action_205 (66) = happyShift action_129
action_205 _ = happyReduce_164

action_206 _ = happyReduce_148

action_207 _ = happyReduce_155

action_208 _ = happyReduce_165

action_209 _ = happyReduce_156

action_210 _ = happyReduce_158

action_211 (41) = happyShift action_150
action_211 (65) = happyShift action_152
action_211 _ = happyReduce_124

action_212 (39) = happyShift action_120
action_212 (40) = happyShift action_121
action_212 (41) = happyShift action_122
action_212 (43) = happyShift action_123
action_212 (44) = happyShift action_124
action_212 (45) = happyShift action_125
action_212 (46) = happyShift action_126
action_212 (47) = happyShift action_127
action_212 (65) = happyShift action_128
action_212 (66) = happyShift action_129
action_212 _ = happyReduce_126

action_213 (41) = happyShift action_150
action_213 _ = happyReduce_116

action_214 (39) = happyShift action_120
action_214 (40) = happyShift action_121
action_214 (41) = happyShift action_122
action_214 (43) = happyShift action_123
action_214 (44) = happyShift action_124
action_214 (45) = happyShift action_125
action_214 (46) = happyShift action_126
action_214 (47) = happyShift action_127
action_214 (65) = happyShift action_128
action_214 (66) = happyShift action_129
action_214 _ = happyReduce_118

action_215 _ = happyReduce_99

action_216 _ = happyReduce_101

action_217 (43) = happyShift action_123
action_217 (44) = happyShift action_124
action_217 (45) = happyShift action_125
action_217 (46) = happyShift action_126
action_217 (47) = happyShift action_127
action_217 _ = happyReduce_103

action_218 (47) = happyShift action_161
action_218 _ = happyReduce_90

action_219 (47) = happyShift action_144
action_219 _ = happyReduce_92

action_220 (43) = happyShift action_123
action_220 (44) = happyShift action_124
action_220 (45) = happyShift action_125
action_220 (46) = happyShift action_126
action_220 (47) = happyShift action_127
action_220 _ = happyReduce_94

action_221 (47) = happyShift action_161
action_221 _ = happyReduce_81

action_222 (47) = happyShift action_144
action_222 _ = happyReduce_83

action_223 (43) = happyShift action_123
action_223 (44) = happyShift action_124
action_223 (45) = happyShift action_125
action_223 (46) = happyShift action_126
action_223 (47) = happyShift action_127
action_223 _ = happyReduce_85

action_224 (45) = happyShift action_159
action_224 (46) = happyShift action_160
action_224 (47) = happyShift action_161
action_224 _ = happyReduce_72

action_225 (45) = happyShift action_142
action_225 (46) = happyShift action_143
action_225 (47) = happyShift action_144
action_225 _ = happyReduce_74

action_226 (43) = happyShift action_123
action_226 (44) = happyShift action_124
action_226 (45) = happyShift action_125
action_226 (46) = happyShift action_126
action_226 (47) = happyShift action_127
action_226 _ = happyReduce_76

action_227 (45) = happyShift action_159
action_227 (46) = happyShift action_160
action_227 (47) = happyShift action_161
action_227 _ = happyReduce_63

action_228 (45) = happyShift action_142
action_228 (46) = happyShift action_143
action_228 (47) = happyShift action_144
action_228 _ = happyReduce_65

action_229 (43) = happyShift action_123
action_229 (44) = happyShift action_124
action_229 (45) = happyShift action_125
action_229 (46) = happyShift action_126
action_229 (47) = happyShift action_127
action_229 _ = happyReduce_67

action_230 (39) = happyShift action_154
action_230 (40) = happyShift action_155
action_230 (43) = happyShift action_157
action_230 (44) = happyShift action_158
action_230 (45) = happyShift action_159
action_230 (46) = happyShift action_160
action_230 (47) = happyShift action_161
action_230 _ = happyReduce_150

action_231 _ = happyReduce_152

action_232 _ = happyReduce_154

action_233 _ = happyReduce_160

action_234 (39) = happyShift action_120
action_234 (40) = happyShift action_121
action_234 (41) = happyShift action_122
action_234 (43) = happyShift action_123
action_234 (44) = happyShift action_124
action_234 (45) = happyShift action_125
action_234 (46) = happyShift action_126
action_234 (47) = happyShift action_127
action_234 (65) = happyShift action_128
action_234 (66) = happyShift action_129
action_234 _ = happyReduce_162

action_235 (43) = happyShift action_157
action_235 (44) = happyShift action_158
action_235 (45) = happyShift action_159
action_235 (46) = happyShift action_160
action_235 (47) = happyShift action_161
action_235 _ = happyReduce_132

action_236 (43) = happyShift action_140
action_236 (44) = happyShift action_141
action_236 (45) = happyShift action_142
action_236 (46) = happyShift action_143
action_236 (47) = happyShift action_144
action_236 _ = happyFail (happyExpListPerState 236)

action_237 (43) = happyShift action_123
action_237 (44) = happyShift action_124
action_237 (45) = happyShift action_125
action_237 (46) = happyShift action_126
action_237 (47) = happyShift action_127
action_237 _ = happyReduce_134

action_238 (43) = happyShift action_157
action_238 (44) = happyShift action_158
action_238 (45) = happyShift action_159
action_238 (46) = happyShift action_160
action_238 (47) = happyShift action_161
action_238 _ = happyReduce_140

action_239 (43) = happyShift action_123
action_239 (44) = happyShift action_124
action_239 (45) = happyShift action_125
action_239 (46) = happyShift action_126
action_239 (47) = happyShift action_127
action_239 _ = happyReduce_142

action_240 _ = happyReduce_157

action_241 _ = happyReduce_159

action_242 _ = happyReduce_161

action_243 _ = happyReduce_149

action_244 _ = happyReduce_166

action_245 (43) = happyShift action_157
action_245 (44) = happyShift action_158
action_245 (45) = happyShift action_159
action_245 (46) = happyShift action_160
action_245 (47) = happyShift action_161
action_245 (49) = happyShift action_248
action_245 _ = happyFail (happyExpListPerState 245)

action_246 (43) = happyShift action_123
action_246 (44) = happyShift action_124
action_246 (45) = happyShift action_125
action_246 (46) = happyShift action_126
action_246 (47) = happyShift action_127
action_246 _ = happyFail (happyExpListPerState 246)

action_247 _ = happyReduce_173

action_248 _ = happyReduce_107

action_249 (41) = happyShift action_150
action_249 (65) = happyShift action_152
action_249 _ = happyReduce_127

action_250 (39) = happyShift action_137
action_250 (40) = happyShift action_138
action_250 (41) = happyShift action_139
action_250 (43) = happyShift action_140
action_250 (44) = happyShift action_141
action_250 (45) = happyShift action_142
action_250 (46) = happyShift action_143
action_250 (47) = happyShift action_144
action_250 (65) = happyShift action_145
action_250 _ = happyReduce_125

action_251 (39) = happyShift action_120
action_251 (40) = happyShift action_121
action_251 (41) = happyShift action_122
action_251 (43) = happyShift action_123
action_251 (44) = happyShift action_124
action_251 (45) = happyShift action_125
action_251 (46) = happyShift action_126
action_251 (47) = happyShift action_127
action_251 (65) = happyShift action_128
action_251 (66) = happyShift action_129
action_251 _ = happyReduce_129

action_252 (41) = happyShift action_150
action_252 _ = happyReduce_119

action_253 (39) = happyShift action_137
action_253 (40) = happyShift action_138
action_253 (41) = happyShift action_139
action_253 (43) = happyShift action_140
action_253 (44) = happyShift action_141
action_253 (45) = happyShift action_142
action_253 (46) = happyShift action_143
action_253 (47) = happyShift action_144
action_253 _ = happyReduce_117

action_254 (39) = happyShift action_120
action_254 (40) = happyShift action_121
action_254 (41) = happyShift action_122
action_254 (43) = happyShift action_123
action_254 (44) = happyShift action_124
action_254 (45) = happyShift action_125
action_254 (46) = happyShift action_126
action_254 (47) = happyShift action_127
action_254 (65) = happyShift action_128
action_254 (66) = happyShift action_129
action_254 _ = happyReduce_121

action_255 _ = happyReduce_104

action_256 _ = happyReduce_102

action_257 (43) = happyShift action_123
action_257 (44) = happyShift action_124
action_257 (45) = happyShift action_125
action_257 (46) = happyShift action_126
action_257 (47) = happyShift action_127
action_257 _ = happyReduce_106

action_258 (47) = happyShift action_161
action_258 _ = happyReduce_95

action_259 (47) = happyShift action_144
action_259 _ = happyReduce_93

action_260 (43) = happyShift action_123
action_260 (44) = happyShift action_124
action_260 (45) = happyShift action_125
action_260 (46) = happyShift action_126
action_260 (47) = happyShift action_127
action_260 _ = happyReduce_97

action_261 (47) = happyShift action_161
action_261 _ = happyReduce_86

action_262 (47) = happyShift action_144
action_262 _ = happyReduce_84

action_263 (43) = happyShift action_123
action_263 (44) = happyShift action_124
action_263 (45) = happyShift action_125
action_263 (46) = happyShift action_126
action_263 (47) = happyShift action_127
action_263 _ = happyReduce_88

action_264 (45) = happyShift action_159
action_264 (46) = happyShift action_160
action_264 (47) = happyShift action_161
action_264 _ = happyReduce_77

action_265 (45) = happyShift action_142
action_265 (46) = happyShift action_143
action_265 (47) = happyShift action_144
action_265 _ = happyReduce_75

action_266 (43) = happyShift action_123
action_266 (44) = happyShift action_124
action_266 (45) = happyShift action_125
action_266 (46) = happyShift action_126
action_266 (47) = happyShift action_127
action_266 _ = happyReduce_79

action_267 (45) = happyShift action_159
action_267 (46) = happyShift action_160
action_267 (47) = happyShift action_161
action_267 _ = happyReduce_68

action_268 (45) = happyShift action_142
action_268 (46) = happyShift action_143
action_268 (47) = happyShift action_144
action_268 _ = happyReduce_66

action_269 (43) = happyShift action_123
action_269 (44) = happyShift action_124
action_269 (45) = happyShift action_125
action_269 (46) = happyShift action_126
action_269 (47) = happyShift action_127
action_269 _ = happyReduce_70

action_270 (39) = happyShift action_154
action_270 (40) = happyShift action_155
action_270 (43) = happyShift action_157
action_270 (44) = happyShift action_158
action_270 (45) = happyShift action_159
action_270 (46) = happyShift action_160
action_270 (47) = happyShift action_161
action_270 _ = happyReduce_168

action_271 _ = happyReduce_169

action_272 _ = happyReduce_170

action_273 (39) = happyShift action_137
action_273 (40) = happyShift action_138
action_273 (43) = happyShift action_140
action_273 (44) = happyShift action_141
action_273 (45) = happyShift action_142
action_273 (46) = happyShift action_143
action_273 (47) = happyShift action_144
action_273 _ = happyReduce_167

action_274 _ = happyReduce_171

action_275 (39) = happyShift action_120
action_275 (40) = happyShift action_121
action_275 (41) = happyShift action_122
action_275 (43) = happyShift action_123
action_275 (44) = happyShift action_124
action_275 (45) = happyShift action_125
action_275 (46) = happyShift action_126
action_275 (47) = happyShift action_127
action_275 (65) = happyShift action_128
action_275 (66) = happyShift action_129
action_275 _ = happyReduce_172

action_276 (43) = happyShift action_157
action_276 (44) = happyShift action_158
action_276 (45) = happyShift action_159
action_276 (46) = happyShift action_160
action_276 (47) = happyShift action_161
action_276 _ = happyReduce_135

action_277 (43) = happyShift action_140
action_277 (44) = happyShift action_141
action_277 (45) = happyShift action_142
action_277 (46) = happyShift action_143
action_277 (47) = happyShift action_144
action_277 _ = happyReduce_133

action_278 (43) = happyShift action_123
action_278 (44) = happyShift action_124
action_278 (45) = happyShift action_125
action_278 (46) = happyShift action_126
action_278 (47) = happyShift action_127
action_278 _ = happyReduce_137

action_279 (43) = happyShift action_157
action_279 (44) = happyShift action_158
action_279 (45) = happyShift action_159
action_279 (46) = happyShift action_160
action_279 (47) = happyShift action_161
action_279 _ = happyReduce_143

action_280 (43) = happyShift action_140
action_280 (44) = happyShift action_141
action_280 (45) = happyShift action_142
action_280 (46) = happyShift action_143
action_280 (47) = happyShift action_144
action_280 _ = happyReduce_141

action_281 (43) = happyShift action_123
action_281 (44) = happyShift action_124
action_281 (45) = happyShift action_125
action_281 (46) = happyShift action_126
action_281 (47) = happyShift action_127
action_281 _ = happyReduce_145

action_282 (49) = happyShift action_294
action_282 _ = happyFail (happyExpListPerState 282)

action_283 (49) = happyShift action_293
action_283 _ = happyFail (happyExpListPerState 283)

action_284 (30) = happyShift action_292
action_284 _ = happyFail (happyExpListPerState 284)

action_285 _ = happyReduce_27

action_286 (50) = happyShift action_290
action_286 (57) = happyShift action_291
action_286 (20) = happyGoto action_289
action_286 _ = happyFail (happyExpListPerState 286)

action_287 (30) = happyShift action_288
action_287 _ = happyFail (happyExpListPerState 287)

action_288 (50) = happyShift action_290
action_288 (57) = happyShift action_291
action_288 (20) = happyGoto action_319
action_288 _ = happyFail (happyExpListPerState 288)

action_289 (49) = happyShift action_318
action_289 _ = happyFail (happyExpListPerState 289)

action_290 (31) = happyShift action_78
action_290 (32) = happyShift action_48
action_290 (33) = happyShift action_49
action_290 (34) = happyShift action_50
action_290 (35) = happyShift action_79
action_290 (36) = happyShift action_80
action_290 (44) = happyShift action_81
action_290 (48) = happyShift action_106
action_290 (52) = happyShift action_83
action_290 (67) = happyShift action_84
action_290 (68) = happyShift action_59
action_290 (70) = happyShift action_85
action_290 (71) = happyShift action_86
action_290 (19) = happyGoto action_316
action_290 (21) = happyGoto action_317
action_290 (22) = happyGoto action_302
action_290 (23) = happyGoto action_303
action_290 (24) = happyGoto action_304
action_290 (26) = happyGoto action_102
action_290 (27) = happyGoto action_103
action_290 (28) = happyGoto action_104
action_290 (29) = happyGoto action_305
action_290 _ = happyFail (happyExpListPerState 290)

action_291 _ = happyReduce_58

action_292 (34) = happyShift action_50
action_292 (52) = happyShift action_315
action_292 (68) = happyShift action_59
action_292 (28) = happyGoto action_313
action_292 (29) = happyGoto action_314
action_292 _ = happyFail (happyExpListPerState 292)

action_293 _ = happyReduce_112

action_294 _ = happyReduce_113

action_295 (56) = happyShift action_312
action_295 _ = happyFail (happyExpListPerState 295)

action_296 (30) = happyShift action_311
action_296 _ = happyFail (happyExpListPerState 296)

action_297 (30) = happyShift action_310
action_297 _ = happyFail (happyExpListPerState 297)

action_298 (30) = happyShift action_309
action_298 _ = happyFail (happyExpListPerState 298)

action_299 (30) = happyShift action_308
action_299 _ = happyFail (happyExpListPerState 299)

action_300 (50) = happyShift action_25
action_300 (53) = happyShift action_26
action_300 (15) = happyGoto action_307
action_300 _ = happyFail (happyExpListPerState 300)

action_301 (49) = happyShift action_306
action_301 _ = happyFail (happyExpListPerState 301)

action_302 (39) = happyShift action_154
action_302 (40) = happyShift action_155
action_302 (41) = happyShift action_156
action_302 (43) = happyShift action_157
action_302 (44) = happyShift action_158
action_302 (45) = happyShift action_159
action_302 (46) = happyShift action_160
action_302 (47) = happyShift action_161
action_302 _ = happyReduce_54

action_303 (41) = happyShift action_150
action_303 (65) = happyShift action_152
action_303 (66) = happyShift action_153
action_303 _ = happyReduce_55

action_304 (41) = happyShift action_149
action_304 _ = happyReduce_56

action_305 (41) = happyShift action_136
action_305 _ = happyReduce_57

action_306 _ = happyReduce_19

action_307 _ = happyReduce_18

action_308 (31) = happyShift action_78
action_308 (32) = happyShift action_48
action_308 (33) = happyShift action_49
action_308 (34) = happyShift action_334
action_308 (35) = happyShift action_79
action_308 (36) = happyShift action_80
action_308 (44) = happyShift action_81
action_308 (48) = happyShift action_106
action_308 (52) = happyShift action_83
action_308 (67) = happyShift action_84
action_308 (68) = happyShift action_59
action_308 (70) = happyShift action_85
action_308 (71) = happyShift action_86
action_308 (19) = happyGoto action_333
action_308 (22) = happyGoto action_302
action_308 (23) = happyGoto action_303
action_308 (24) = happyGoto action_304
action_308 (26) = happyGoto action_102
action_308 (27) = happyGoto action_103
action_308 (28) = happyGoto action_104
action_308 (29) = happyGoto action_305
action_308 _ = happyFail (happyExpListPerState 308)

action_309 (31) = happyShift action_78
action_309 (32) = happyShift action_48
action_309 (33) = happyShift action_49
action_309 (34) = happyShift action_332
action_309 (35) = happyShift action_79
action_309 (36) = happyShift action_80
action_309 (44) = happyShift action_81
action_309 (48) = happyShift action_106
action_309 (52) = happyShift action_83
action_309 (67) = happyShift action_84
action_309 (68) = happyShift action_59
action_309 (70) = happyShift action_85
action_309 (71) = happyShift action_86
action_309 (19) = happyGoto action_331
action_309 (22) = happyGoto action_302
action_309 (23) = happyGoto action_303
action_309 (24) = happyGoto action_304
action_309 (26) = happyGoto action_102
action_309 (27) = happyGoto action_103
action_309 (28) = happyGoto action_104
action_309 (29) = happyGoto action_305
action_309 _ = happyFail (happyExpListPerState 309)

action_310 (31) = happyShift action_78
action_310 (32) = happyShift action_48
action_310 (33) = happyShift action_49
action_310 (34) = happyShift action_330
action_310 (35) = happyShift action_79
action_310 (36) = happyShift action_80
action_310 (44) = happyShift action_81
action_310 (48) = happyShift action_106
action_310 (52) = happyShift action_83
action_310 (67) = happyShift action_84
action_310 (68) = happyShift action_59
action_310 (70) = happyShift action_85
action_310 (71) = happyShift action_86
action_310 (19) = happyGoto action_329
action_310 (22) = happyGoto action_302
action_310 (23) = happyGoto action_303
action_310 (24) = happyGoto action_304
action_310 (26) = happyGoto action_102
action_310 (27) = happyGoto action_103
action_310 (28) = happyGoto action_104
action_310 (29) = happyGoto action_305
action_310 _ = happyFail (happyExpListPerState 310)

action_311 (31) = happyShift action_78
action_311 (32) = happyShift action_48
action_311 (33) = happyShift action_49
action_311 (34) = happyShift action_328
action_311 (35) = happyShift action_79
action_311 (36) = happyShift action_80
action_311 (44) = happyShift action_81
action_311 (48) = happyShift action_106
action_311 (52) = happyShift action_83
action_311 (67) = happyShift action_84
action_311 (68) = happyShift action_59
action_311 (70) = happyShift action_85
action_311 (71) = happyShift action_86
action_311 (19) = happyGoto action_327
action_311 (22) = happyGoto action_302
action_311 (23) = happyGoto action_303
action_311 (24) = happyGoto action_304
action_311 (26) = happyGoto action_102
action_311 (27) = happyGoto action_103
action_311 (28) = happyGoto action_104
action_311 (29) = happyGoto action_305
action_311 _ = happyFail (happyExpListPerState 311)

action_312 (32) = happyShift action_48
action_312 (33) = happyShift action_49
action_312 (34) = happyShift action_50
action_312 (48) = happyShift action_51
action_312 (69) = happyShift action_52
action_312 (17) = happyGoto action_326
action_312 (18) = happyGoto action_44
action_312 (26) = happyGoto action_45
action_312 (27) = happyGoto action_46
action_312 (28) = happyGoto action_47
action_312 _ = happyFail (happyExpListPerState 312)

action_313 (49) = happyShift action_325
action_313 _ = happyFail (happyExpListPerState 313)

action_314 (49) = happyShift action_324
action_314 _ = happyFail (happyExpListPerState 314)

action_315 (49) = happyShift action_323
action_315 _ = happyFail (happyExpListPerState 315)

action_316 (30) = happyShift action_322
action_316 _ = happyReduce_60

action_317 (51) = happyShift action_321
action_317 _ = happyFail (happyExpListPerState 317)

action_318 _ = happyReduce_20

action_319 (49) = happyShift action_320
action_319 _ = happyFail (happyExpListPerState 319)

action_320 (30) = happyShift action_344
action_320 _ = happyReduce_22

action_321 _ = happyReduce_59

action_322 (31) = happyShift action_78
action_322 (32) = happyShift action_48
action_322 (33) = happyShift action_49
action_322 (34) = happyShift action_50
action_322 (35) = happyShift action_79
action_322 (36) = happyShift action_80
action_322 (44) = happyShift action_81
action_322 (48) = happyShift action_106
action_322 (52) = happyShift action_83
action_322 (67) = happyShift action_84
action_322 (68) = happyShift action_59
action_322 (70) = happyShift action_85
action_322 (71) = happyShift action_86
action_322 (19) = happyGoto action_316
action_322 (21) = happyGoto action_343
action_322 (22) = happyGoto action_302
action_322 (23) = happyGoto action_303
action_322 (24) = happyGoto action_304
action_322 (26) = happyGoto action_102
action_322 (27) = happyGoto action_103
action_322 (28) = happyGoto action_104
action_322 (29) = happyGoto action_305
action_322 _ = happyFail (happyExpListPerState 322)

action_323 _ = happyReduce_176

action_324 _ = happyReduce_177

action_325 _ = happyReduce_178

action_326 _ = happyReduce_38

action_327 (49) = happyShift action_342
action_327 _ = happyFail (happyExpListPerState 327)

action_328 (49) = happyShift action_341
action_328 _ = happyReduce_185

action_329 (49) = happyShift action_340
action_329 _ = happyFail (happyExpListPerState 329)

action_330 (49) = happyShift action_339
action_330 _ = happyReduce_185

action_331 (49) = happyShift action_338
action_331 _ = happyFail (happyExpListPerState 331)

action_332 (49) = happyShift action_337
action_332 _ = happyReduce_185

action_333 (49) = happyShift action_336
action_333 _ = happyFail (happyExpListPerState 333)

action_334 (49) = happyShift action_335
action_334 _ = happyReduce_185

action_335 _ = happyReduce_52

action_336 _ = happyReduce_51

action_337 _ = happyReduce_50

action_338 _ = happyReduce_46

action_339 _ = happyReduce_49

action_340 _ = happyReduce_47

action_341 _ = happyReduce_48

action_342 _ = happyReduce_45

action_343 _ = happyReduce_61

action_344 (48) = happyShift action_39
action_344 (11) = happyGoto action_345
action_344 _ = happyFail (happyExpListPerState 344)

action_345 _ = happyReduce_23

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 ((HappyTerminal (TokenFilename _ happy_var_6)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenFilename _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (WriteQuery happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn4
		 (OutputQuery happy_var_1 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (QuerySeq happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (NewQuery happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (WhereQuery happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (FuncStack happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (FuncStackSeq happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (UVarEnv happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  7 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (VarEnv happy_var_1 happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (IntVar happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (StringVar happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (BoolVar happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  8 happyReduction_13
happyReduction_13 (HappyAbsSyn29  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (UrlVar happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Filter happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Remove happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 9 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Map happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_2  9 happyReduction_17
happyReduction_17 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Union happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 8 9 happyReduction_18
happyReduction_18 ((HappyAbsSyn15  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Join happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 8 9 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTripSPO happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 7 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (TTLComb happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TTLCombs happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 7 11 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (SingleFilter happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 9 11 happyReduction_23
happyReduction_23 ((HappyAbsSyn11  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (FilterSeq happy_var_2 happy_var_4 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn12
		 (Any
	)

happyReduce_25 = happySpecReduce_3  12 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (FilteredList happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  13 happyReduction_26
happyReduction_26 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn13
		 (SimpleUrl happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn13
		 (UrlSeq happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  14 happyReduction_28
happyReduction_28 _
	_
	 =  HappyAbsSyn14
		 (BidirectJoin
	)

happyReduce_29 = happySpecReduce_2  14 happyReduction_29
happyReduction_29 _
	_
	 =  HappyAbsSyn14
		 (BidirectJoin
	)

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn14
		 (LeftJoin
	)

happyReduce_31 = happySpecReduce_1  14 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn14
		 (RightJoin
	)

happyReduce_32 = happySpecReduce_3  15 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (StrList happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  15 happyReduction_33
happyReduction_33 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn15
		 (StrListSingle happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn16
		 (SListEl happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  16 happyReduction_35
happyReduction_35 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn16
		 (SListSeq happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (Always happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  17 happyReduction_37
happyReduction_37 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (ActionSeq happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happyReduce 7 17 happyReduction_38
happyReduction_38 ((HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (If happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_3  18 happyReduction_39
happyReduction_39 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignSubj happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  18 happyReduction_40
happyReduction_40 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignPred happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  18 happyReduction_41
happyReduction_41 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjUrl happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  18 happyReduction_42
happyReduction_42 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjStr happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  18 happyReduction_43
happyReduction_43 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjInt happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  18 happyReduction_44
happyReduction_44 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjBool happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happyReduce 8 18 happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (AddSPO happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 8 18 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (AddPO happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 8 18 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (AddSO happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 8 18 happyReduction_48
happyReduction_48 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (AddSP happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 8 18 happyReduction_49
happyReduction_49 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (AddS happy_var_3
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 8 18 happyReduction_50
happyReduction_50 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (AddP happy_var_5
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 8 18 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (AddO happy_var_7
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 8 18 happyReduction_52
happyReduction_52 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Add
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_3  18 happyReduction_53
happyReduction_53 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  19 happyReduction_54
happyReduction_54 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 (IntLit happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  19 happyReduction_55
happyReduction_55 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn19
		 (BoolLit happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  19 happyReduction_56
happyReduction_56 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (StrLit happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  19 happyReduction_57
happyReduction_57 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn19
		 (UrlLit happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  20 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn20
		 (AnyLit
	)

happyReduce_59 = happySpecReduce_3  20 happyReduction_59
happyReduction_59 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (LiteralLst happy_var_2
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  21 happyReduction_60
happyReduction_60 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (SingleLit happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  21 happyReduction_61
happyReduction_61 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  22 happyReduction_62
happyReduction_62 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  22 happyReduction_63
happyReduction_63 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  22 happyReduction_64
happyReduction_64 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  22 happyReduction_65
happyReduction_65 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  22 happyReduction_66
happyReduction_66 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVO happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  22 happyReduction_67
happyReduction_67 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOV happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  22 happyReduction_68
happyReduction_68 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVI happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  22 happyReduction_69
happyReduction_69 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIV happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  22 happyReduction_70
happyReduction_70 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVV happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  22 happyReduction_71
happyReduction_71 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  22 happyReduction_72
happyReduction_72 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  22 happyReduction_73
happyReduction_73 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  22 happyReduction_74
happyReduction_74 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  22 happyReduction_75
happyReduction_75 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVO happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  22 happyReduction_76
happyReduction_76 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOV happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  22 happyReduction_77
happyReduction_77 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVI happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  22 happyReduction_78
happyReduction_78 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIV happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  22 happyReduction_79
happyReduction_79 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVV happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  22 happyReduction_80
happyReduction_80 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  22 happyReduction_81
happyReduction_81 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  22 happyReduction_82
happyReduction_82 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  22 happyReduction_83
happyReduction_83 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  22 happyReduction_84
happyReduction_84 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVO happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  22 happyReduction_85
happyReduction_85 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOV happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  22 happyReduction_86
happyReduction_86 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVI happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  22 happyReduction_87
happyReduction_87 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIV happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  22 happyReduction_88
happyReduction_88 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVV happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  22 happyReduction_89
happyReduction_89 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  22 happyReduction_90
happyReduction_90 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  22 happyReduction_91
happyReduction_91 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  22 happyReduction_92
happyReduction_92 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  22 happyReduction_93
happyReduction_93 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVO happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  22 happyReduction_94
happyReduction_94 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOV happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  22 happyReduction_95
happyReduction_95 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVI happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  22 happyReduction_96
happyReduction_96 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIV happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  22 happyReduction_97
happyReduction_97 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVV happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  22 happyReduction_98
happyReduction_98 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  22 happyReduction_99
happyReduction_99 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  22 happyReduction_100
happyReduction_100 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  22 happyReduction_101
happyReduction_101 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  22 happyReduction_102
happyReduction_102 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVO happy_var_1 happy_var_3
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_3  22 happyReduction_103
happyReduction_103 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOV happy_var_1 happy_var_3
	)
happyReduction_103 _ _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_3  22 happyReduction_104
happyReduction_104 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVI happy_var_1 happy_var_3
	)
happyReduction_104 _ _ _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_3  22 happyReduction_105
happyReduction_105 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIV happy_var_1 happy_var_3
	)
happyReduction_105 _ _ _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_3  22 happyReduction_106
happyReduction_106 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVV happy_var_1 happy_var_3
	)
happyReduction_106 _ _ _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_3  22 happyReduction_107
happyReduction_107 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (happy_var_2
	)
happyReduction_107 _ _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_2  22 happyReduction_108
happyReduction_108 (HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateI happy_var_2
	)
happyReduction_108 _ _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_2  22 happyReduction_109
happyReduction_109 (HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateO happy_var_2
	)
happyReduction_109 _ _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_2  22 happyReduction_110
happyReduction_110 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn22
		 (NegateV happy_var_2
	)
happyReduction_110 _ _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_1  22 happyReduction_111
happyReduction_111 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn22
		 (QInt happy_var_1
	)
happyReduction_111 _  = notHappyAtAll 

happyReduce_112 = happyReduce 4 22 happyReduction_112
happyReduction_112 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Length happy_var_3
	) `HappyStk` happyRest

happyReduce_113 = happyReduce 4 22 happyReduction_113
happyReduction_113 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (LengthObj
	) `HappyStk` happyRest

happyReduce_114 = happySpecReduce_3  23 happyReduction_114
happyReduction_114 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (And happy_var_1 happy_var_3
	)
happyReduction_114 _ _ _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_3  23 happyReduction_115
happyReduction_115 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_115 _ _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_3  23 happyReduction_116
happyReduction_116 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_116 _ _ _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_3  23 happyReduction_117
happyReduction_117 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVO happy_var_1 happy_var_3
	)
happyReduction_117 _ _ _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_3  23 happyReduction_118
happyReduction_118 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOV happy_var_1 happy_var_3
	)
happyReduction_118 _ _ _  = notHappyAtAll 

happyReduce_119 = happySpecReduce_3  23 happyReduction_119
happyReduction_119 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVB happy_var_1 happy_var_3
	)
happyReduction_119 _ _ _  = notHappyAtAll 

happyReduce_120 = happySpecReduce_3  23 happyReduction_120
happyReduction_120 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndBV happy_var_1 happy_var_3
	)
happyReduction_120 _ _ _  = notHappyAtAll 

happyReduce_121 = happySpecReduce_3  23 happyReduction_121
happyReduction_121 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVV happy_var_1 happy_var_3
	)
happyReduction_121 _ _ _  = notHappyAtAll 

happyReduce_122 = happySpecReduce_3  23 happyReduction_122
happyReduction_122 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (Or happy_var_1 happy_var_3
	)
happyReduction_122 _ _ _  = notHappyAtAll 

happyReduce_123 = happySpecReduce_3  23 happyReduction_123
happyReduction_123 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_123 _ _ _  = notHappyAtAll 

happyReduce_124 = happySpecReduce_3  23 happyReduction_124
happyReduction_124 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_124 _ _ _  = notHappyAtAll 

happyReduce_125 = happySpecReduce_3  23 happyReduction_125
happyReduction_125 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVO happy_var_1 happy_var_3
	)
happyReduction_125 _ _ _  = notHappyAtAll 

happyReduce_126 = happySpecReduce_3  23 happyReduction_126
happyReduction_126 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOV happy_var_1 happy_var_3
	)
happyReduction_126 _ _ _  = notHappyAtAll 

happyReduce_127 = happySpecReduce_3  23 happyReduction_127
happyReduction_127 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVB happy_var_1 happy_var_3
	)
happyReduction_127 _ _ _  = notHappyAtAll 

happyReduce_128 = happySpecReduce_3  23 happyReduction_128
happyReduction_128 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrBV happy_var_1 happy_var_3
	)
happyReduction_128 _ _ _  = notHappyAtAll 

happyReduce_129 = happySpecReduce_3  23 happyReduction_129
happyReduction_129 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVV happy_var_1 happy_var_3
	)
happyReduction_129 _ _ _  = notHappyAtAll 

happyReduce_130 = happySpecReduce_3  23 happyReduction_130
happyReduction_130 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_130 _ _ _  = notHappyAtAll 

happyReduce_131 = happySpecReduce_3  23 happyReduction_131
happyReduction_131 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_131 _ _ _  = notHappyAtAll 

happyReduce_132 = happySpecReduce_3  23 happyReduction_132
happyReduction_132 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_132 _ _ _  = notHappyAtAll 

happyReduce_133 = happySpecReduce_3  23 happyReduction_133
happyReduction_133 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVO happy_var_1 happy_var_3
	)
happyReduction_133 _ _ _  = notHappyAtAll 

happyReduce_134 = happySpecReduce_3  23 happyReduction_134
happyReduction_134 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOV happy_var_1 happy_var_3
	)
happyReduction_134 _ _ _  = notHappyAtAll 

happyReduce_135 = happySpecReduce_3  23 happyReduction_135
happyReduction_135 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVI happy_var_1 happy_var_3
	)
happyReduction_135 _ _ _  = notHappyAtAll 

happyReduce_136 = happySpecReduce_3  23 happyReduction_136
happyReduction_136 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIV happy_var_1 happy_var_3
	)
happyReduction_136 _ _ _  = notHappyAtAll 

happyReduce_137 = happySpecReduce_3  23 happyReduction_137
happyReduction_137 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVV happy_var_1 happy_var_3
	)
happyReduction_137 _ _ _  = notHappyAtAll 

happyReduce_138 = happySpecReduce_3  23 happyReduction_138
happyReduction_138 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_138 _ _ _  = notHappyAtAll 

happyReduce_139 = happySpecReduce_3  23 happyReduction_139
happyReduction_139 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_139 _ _ _  = notHappyAtAll 

happyReduce_140 = happySpecReduce_3  23 happyReduction_140
happyReduction_140 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_140 _ _ _  = notHappyAtAll 

happyReduce_141 = happySpecReduce_3  23 happyReduction_141
happyReduction_141 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVO happy_var_1 happy_var_3
	)
happyReduction_141 _ _ _  = notHappyAtAll 

happyReduce_142 = happySpecReduce_3  23 happyReduction_142
happyReduction_142 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOV happy_var_1 happy_var_3
	)
happyReduction_142 _ _ _  = notHappyAtAll 

happyReduce_143 = happySpecReduce_3  23 happyReduction_143
happyReduction_143 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVI happy_var_1 happy_var_3
	)
happyReduction_143 _ _ _  = notHappyAtAll 

happyReduce_144 = happySpecReduce_3  23 happyReduction_144
happyReduction_144 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIV happy_var_1 happy_var_3
	)
happyReduction_144 _ _ _  = notHappyAtAll 

happyReduce_145 = happySpecReduce_3  23 happyReduction_145
happyReduction_145 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVV happy_var_1 happy_var_3
	)
happyReduction_145 _ _ _  = notHappyAtAll 

happyReduce_146 = happySpecReduce_3  23 happyReduction_146
happyReduction_146 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_146 _ _ _  = notHappyAtAll 

happyReduce_147 = happySpecReduce_3  23 happyReduction_147
happyReduction_147 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_147 _ _ _  = notHappyAtAll 

happyReduce_148 = happySpecReduce_3  23 happyReduction_148
happyReduction_148 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_148 _ _ _  = notHappyAtAll 

happyReduce_149 = happySpecReduce_3  23 happyReduction_149
happyReduction_149 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_149 _ _ _  = notHappyAtAll 

happyReduce_150 = happySpecReduce_3  23 happyReduction_150
happyReduction_150 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_150 _ _ _  = notHappyAtAll 

happyReduce_151 = happySpecReduce_3  23 happyReduction_151
happyReduction_151 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_151 _ _ _  = notHappyAtAll 

happyReduce_152 = happySpecReduce_3  23 happyReduction_152
happyReduction_152 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_152 _ _ _  = notHappyAtAll 

happyReduce_153 = happySpecReduce_3  23 happyReduction_153
happyReduction_153 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_153 _ _ _  = notHappyAtAll 

happyReduce_154 = happySpecReduce_3  23 happyReduction_154
happyReduction_154 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_154 _ _ _  = notHappyAtAll 

happyReduce_155 = happySpecReduce_3  23 happyReduction_155
happyReduction_155 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_155 _ _ _  = notHappyAtAll 

happyReduce_156 = happySpecReduce_3  23 happyReduction_156
happyReduction_156 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQSU happy_var_3
	)
happyReduction_156 _ _ _  = notHappyAtAll 

happyReduce_157 = happySpecReduce_3  23 happyReduction_157
happyReduction_157 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUS happy_var_1
	)
happyReduction_157 _ _ _  = notHappyAtAll 

happyReduce_158 = happySpecReduce_3  23 happyReduction_158
happyReduction_158 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQPU happy_var_3
	)
happyReduction_158 _ _ _  = notHappyAtAll 

happyReduce_159 = happySpecReduce_3  23 happyReduction_159
happyReduction_159 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUP happy_var_1
	)
happyReduction_159 _ _ _  = notHappyAtAll 

happyReduce_160 = happySpecReduce_3  23 happyReduction_160
happyReduction_160 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQOU happy_var_3
	)
happyReduction_160 _ _ _  = notHappyAtAll 

happyReduce_161 = happySpecReduce_3  23 happyReduction_161
happyReduction_161 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUO happy_var_1
	)
happyReduction_161 _ _ _  = notHappyAtAll 

happyReduce_162 = happySpecReduce_3  23 happyReduction_162
happyReduction_162 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOV happy_var_1 happy_var_3
	)
happyReduction_162 _ _ _  = notHappyAtAll 

happyReduce_163 = happySpecReduce_3  23 happyReduction_163
happyReduction_163 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIV happy_var_1 happy_var_3
	)
happyReduction_163 _ _ _  = notHappyAtAll 

happyReduce_164 = happySpecReduce_3  23 happyReduction_164
happyReduction_164 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBV happy_var_1 happy_var_3
	)
happyReduction_164 _ _ _  = notHappyAtAll 

happyReduce_165 = happySpecReduce_3  23 happyReduction_165
happyReduction_165 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSV happy_var_1 happy_var_3
	)
happyReduction_165 _ _ _  = notHappyAtAll 

happyReduce_166 = happySpecReduce_3  23 happyReduction_166
happyReduction_166 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUV happy_var_1 happy_var_3
	)
happyReduction_166 _ _ _  = notHappyAtAll 

happyReduce_167 = happySpecReduce_3  23 happyReduction_167
happyReduction_167 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVO happy_var_1 happy_var_3
	)
happyReduction_167 _ _ _  = notHappyAtAll 

happyReduce_168 = happySpecReduce_3  23 happyReduction_168
happyReduction_168 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVI happy_var_1 happy_var_3
	)
happyReduction_168 _ _ _  = notHappyAtAll 

happyReduce_169 = happySpecReduce_3  23 happyReduction_169
happyReduction_169 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVB happy_var_1 happy_var_3
	)
happyReduction_169 _ _ _  = notHappyAtAll 

happyReduce_170 = happySpecReduce_3  23 happyReduction_170
happyReduction_170 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVS happy_var_1 happy_var_3
	)
happyReduction_170 _ _ _  = notHappyAtAll 

happyReduce_171 = happySpecReduce_3  23 happyReduction_171
happyReduction_171 (HappyAbsSyn29  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVU happy_var_1 happy_var_3
	)
happyReduction_171 _ _ _  = notHappyAtAll 

happyReduce_172 = happySpecReduce_3  23 happyReduction_172
happyReduction_172 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVV happy_var_1 happy_var_3
	)
happyReduction_172 _ _ _  = notHappyAtAll 

happyReduce_173 = happySpecReduce_3  23 happyReduction_173
happyReduction_173 _
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (happy_var_2
	)
happyReduction_173 _ _ _  = notHappyAtAll 

happyReduce_174 = happySpecReduce_1  23 happyReduction_174
happyReduction_174 _
	 =  HappyAbsSyn23
		 (QTrue
	)

happyReduce_175 = happySpecReduce_1  23 happyReduction_175
happyReduction_175 _
	 =  HappyAbsSyn23
		 (QFalse
	)

happyReduce_176 = happyReduce 6 23 happyReduction_176
happyReduction_176 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithStr happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_177 = happyReduce 6 23 happyReduction_177
happyReduction_177 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithUrl happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_178 = happyReduce 6 23 happyReduction_178
happyReduction_178 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithObj happy_var_3
	) `HappyStk` happyRest

happyReduce_179 = happySpecReduce_1  24 happyReduction_179
happyReduction_179 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn24
		 (QString happy_var_1
	)
happyReduction_179 _  = notHappyAtAll 

happyReduce_180 = happySpecReduce_1  25 happyReduction_180
happyReduction_180 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (S happy_var_1
	)
happyReduction_180 _  = notHappyAtAll 

happyReduce_181 = happySpecReduce_1  25 happyReduction_181
happyReduction_181 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (P happy_var_1
	)
happyReduction_181 _  = notHappyAtAll 

happyReduce_182 = happySpecReduce_1  25 happyReduction_182
happyReduction_182 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn25
		 (O happy_var_1
	)
happyReduction_182 _  = notHappyAtAll 

happyReduce_183 = happySpecReduce_1  26 happyReduction_183
happyReduction_183 _
	 =  HappyAbsSyn26
		 (Subj
	)

happyReduce_184 = happySpecReduce_1  27 happyReduction_184
happyReduction_184 _
	 =  HappyAbsSyn27
		 (Pred
	)

happyReduce_185 = happySpecReduce_1  28 happyReduction_185
happyReduction_185 _
	 =  HappyAbsSyn28
		 (Obj
	)

happyReduce_186 = happySpecReduce_1  29 happyReduction_186
happyReduction_186 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn29
		 (NewUrl happy_var_1
	)
happyReduction_186 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 72 72 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenComma _ -> cont 30;
	TokenInt _ happy_dollar_dollar -> cont 31;
	TokenSubj _ -> cont 32;
	TokenPred _ -> cont 33;
	TokenObj _ -> cont 34;
	TokenTrue _ -> cont 35;
	TokenFalse _ -> cont 36;
	TokenLJoin _ -> cont 37;
	TokenRJoin _ -> cont 38;
	TokenLT _ -> cont 39;
	TokenGT _ -> cont 40;
	TokenDEQ _ -> cont 41;
	TokenEQ _ -> cont 42;
	TokenPlus _ -> cont 43;
	TokenMinus _ -> cont 44;
	TokenTimes _ -> cont 45;
	TokenDiv _ -> cont 46;
	TokenExp _ -> cont 47;
	TokenLParen _ -> cont 48;
	TokenRParen _ -> cont 49;
	TokenLBrack _ -> cont 50;
	TokenRBrack _ -> cont 51;
	TokenString _ happy_dollar_dollar -> cont 52;
	TokenFilename _ happy_dollar_dollar -> cont 53;
	TokenPipe _ -> cont 54;
	TokenQuestion _ -> cont 55;
	TokenColon _ -> cont 56;
	TokenAll _ -> cont 57;
	TokenSemiColon _ -> cont 58;
	TokenFilter _ -> cont 59;
	TokenRemove _ -> cont 60;
	TokenMap _ -> cont 61;
	TokenUnion _ -> cont 62;
	TokenJoin _ -> cont 63;
	TokenWhere _ -> cont 64;
	TokenAnd _ -> cont 65;
	TokenOr _ -> cont 66;
	TokenVar _ happy_dollar_dollar -> cont 67;
	TokenUrl _ happy_dollar_dollar -> cont 68;
	TokenAdd _ -> cont 69;
	TokenLength _ -> cont 70;
	TokenStarts _ -> cont 71;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 72 tk tks = happyError' (tks, explist)
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
happyError' :: () => ([(LangToken)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseQuery tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [LangToken] -> a

parseError ((TokenComma  (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenInt  (AlexPn _ l c) _ ) : xs) = error (printing l c)
parseError ((TokenSubj  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenPred  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenObj  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenTrue  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenFalse  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLJoin  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenRJoin  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLT  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenGT  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenDEQ  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenEQ  (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenPlus (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenMinus (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenTimes (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenDiv (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenExp (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLParen (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenRParen (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenLBrack (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenRBrack (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenString (AlexPn _ l c) _ ) : xs) = error (printing l c)
parseError ((TokenPipe (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenQuestion (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenColon (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenAll (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenFilter (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenMap (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenUnion(AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenJoin(AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenWhere (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenAnd (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenOr (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenVar (AlexPn _ l c) _ )  : xs) = error (printing l c)
parseError ((TokenAdd (AlexPn _ l c)) : xs) = error (printing l c)
parseError ((TokenUrl (AlexPn _ l c) _ )  : xs) = error (printing l c)
parseError ((TokenFilename (AlexPn _ l c) _ )  : xs) = error (printing l c)
parseError ((TokenLength (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenStarts (AlexPn _ l c))  : xs) = error (printing l c)

parseError [] = error "Missing output file"

printing x y = "Issue in row: "++show x ++ ", column:" ++ show y

data Subject = Subj
     deriving Show

data Predicate = Pred
     deriving Show

data Object =  Obj 
     deriving Show

data Node = S Subject | P Predicate | O Object
     deriving Show

data StringExp = QString String
     deriving Show
     
-- TODO: add IntVariable & IntObj to doc
data IntExp = PlusII IntExp IntExp | PlusOI Object IntExp | PlusIO IntExp Object | PlusOO Object Object |
              MinusII IntExp IntExp | MinusOI Object IntExp | MinusIO IntExp Object | MinusOO Object Object |
              TimesII IntExp IntExp | TimesOI Object IntExp | TimesIO IntExp Object | TimesOO Object Object |
              DivII IntExp IntExp | DivOI Object IntExp | DivIO IntExp Object | DivOO Object Object |
              ExpoII IntExp IntExp | ExpoOI Object IntExp | ExpoIO IntExp Object | ExpoOO Object Object |
              QInt Int |
              Length String | LengthObj |
              NegateI IntExp |  NegateO Object | NegateV String |
              -- The following rules allow variables ^^ to perform operations on integer expressions
              PlusVO String Object | PlusOV Object String | PlusVI String IntExp | PlusIV IntExp String | PlusVV String String |
              MinusVO String Object | MinusOV Object String | MinusVI String IntExp | MinusIV IntExp String | MinusVV String String |
              TimesVO String Object | TimesOV Object String | TimesVI String IntExp | TimesIV IntExp String | TimesVV String String |
              DivVO String Object | DivOV Object String | DivVI String IntExp | DivIV IntExp String | DivVV String String |
              ExpoVO String Object | ExpoOV Object String | ExpoVI String IntExp | ExpoIV IntExp String | ExpoVV String String  
     deriving Show
     
-- TODO change Nodes in doc
data BoolExp = And BoolExp BoolExp | AndIO BoolExp Object | AndOI Object BoolExp
             | Or BoolExp BoolExp | OrIO BoolExp Object | OrOI Object BoolExp
             | GTII IntExp IntExp | GTIO IntExp Object | GTOI Object IntExp 
             | LTII IntExp IntExp | LTIO IntExp Object | LTOI Object IntExp
             | EQII IntExp IntExp | EQOI Object IntExp | EQIO IntExp Object
             | EQBB BoolExp BoolExp | EQSS StringExp StringExp | EQUU Url Url
             | EQOS Object StringExp | EQSO StringExp Object
             | EQOB Object BoolExp | EQBO BoolExp Object
             | QTrue | QFalse
             | StartsWithObj String | StartsWithStr String String | StartsWithUrl String Url
             -- Needed for doing boolean operations with variables
             | AndVO String Object | AndOV Object String | AndVB String BoolExp | AndBV BoolExp String | AndVV String String
             | OrVO String Object | OrOV Object String | OrVB String BoolExp | OrBV BoolExp String | OrVV String String
             | GTVO String Object | GTOV Object String | GTVI String IntExp | GTIV IntExp String | GTVV String String 
             | LTVO String Object | LTOV Object String | LTVI String IntExp | LTIV IntExp String | LTVV String String 
             | EQVV String String 
             | EQOV Object String | EQIV IntExp String | EQBV BoolExp String | EQSV StringExp String | EQUV Url String
             | EQVO String Object | EQVI String IntExp | EQVB String BoolExp | EQVS String StringExp  | EQVU String Url
             -- Condition for map function
             | EQSU Url | EQUS Url | EQPU Url | EQUP Url | EQOU Url | EQUO Url
     deriving Show


data SList = StrList SListElem | StrListSingle String
     deriving Show
     
data SListElem = SListEl String | SListSeq String SListElem
     deriving Show
     
data CreateVar = IntVar String IntExp | BoolVar String BoolExp | StringVar String StringExp | UrlVar String Url
     deriving Show
     
data CreateVars = UVarEnv CreateVar | VarEnv CreateVar CreateVars
     deriving Show
     
data Query = OutputQuery String FilteredQuery | WriteQuery String FilteredQuery String | QuerySeq Query Query
     deriving Show

data FilteredQuery = NewQuery BasicQuery | WhereQuery BasicQuery CreateVars
     deriving Show
     
data BasicQuery = FuncStack Func | FuncStackSeq Func BasicQuery
     deriving Show

data Cond = Always Action | ActionSeq Action Cond | If BoolExp Cond Cond
     deriving Show

data Action = AssignSubj Subject Url | AssignPred Predicate Url | AssignObjUrl Object Url 
            | AssignObjStr Object StringExp | AssignObjInt Object IntExp | AssignObjBool Object BoolExp | AddSPO Url Url Literal | AddPO Url Literal | AddSO Url Literal | AddSP Url Url | AddS Url | AddP Url | AddO Literal | Add
     deriving Show
     
data JoinOption = BidirectJoin | LeftJoin | RightJoin
     deriving Show

data Url = NewUrl String
     deriving (Show,Eq)

data UrlList = SimpleUrl Url | UrlSeq Url UrlList
     deriving Show

data FilterEl = Any | FilteredList UrlList
     deriving Show

-- Add readme
data Combinations = TTLComb FilterEl FilterEl LiteralList | TTLCombs CombinationLst
     deriving Show

-- Add readme
data CombinationLst = SingleFilter FilterEl FilterEl LiteralList | FilterSeq FilterEl FilterEl LiteralList CombinationLst
     deriving Show

data Literal = IntLit IntExp | BoolLit BoolExp | StrLit StringExp | UrlLit Url  
     deriving Show

data LiteralList = LiteralLst LiteralElems | AnyLit
     deriving Show

data LiteralElems = LiteralSeq Literal LiteralElems | SingleLit Literal 
     deriving Show

-- Readme changes:
--   a) Change Filter
data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter Combinations | AddTripSPO Url Url Literal | Remove Combinations
     deriving Show     


------------------------------------------------------------------------------------------------------
--                                      Helper Functions                                            --
------------------------------------------------------------------------------------------------------

filterToList :: FilterEl -> [String]
filterToList Any = []
filterToList (FilteredList urlList) = urltoList urlList

urltoList :: UrlList -> [String]
urltoList (SimpleUrl (NewUrl url)) = [url]
urltoList (UrlSeq (NewUrl url) urls) = [url] ++ urltoList urls
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
