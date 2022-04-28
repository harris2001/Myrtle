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
happyExpList = Happy_Data_Array.listArray (0,1200) ([0,0,0,16,0,0,0,1024,0,0,0,0,2,0,0,0,0,0,0,0,8192,0,0,0,0,1920,1,0,0,57344,65,0,0,2,0,0,0,0,8192,0,0,0,2048,0,0,0,10240,0,0,0,0,2,0,0,0,4608,0,0,0,8204,0,0,0,0,8,0,0,0,2,0,0,0,128,0,0,0,32,0,128,0,0,2048,0,0,0,128,0,0,0,4096,0,0,0,57344,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,224,32,256,0,0,0,0,0,0,0,1032,0,0,0,128,0,0,0,0,1920,1,0,0,0,16,0,0,0,0,0,0,0,0,1,0,32768,0,0,0,0,0,0,0,0,0,16,0,0,0,512,1,0,2048,0,0,0,0,0,0,32,0,0,0,0,0,0,0,1,0,0,8,0,0,0,0,32,0,0,0,2048,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,34831,8,31,0,0,32,0,0,0,16384,0,0,32768,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14336,0,0,0,32768,0,0,0,0,32,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,1,0,2,0,64,0,128,0,512,0,0,0,0,14,0,0,0,0,4096,0,0,0,0,0,0,0,8,0,32,0,0,1024,0,0,0,32192,0,0,0,16384,64,48,0,0,16,0,0,0,3072,0,0,0,0,3,0,0,0,8176,12288,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9216,2176,36864,0,0,8255,34,124,0,0,0,0,0,0,8048,12288,0,0,0,8,0,0,0,512,0,0,49152,34831,8,27,0,0,0,128,0,0,0,8192,0,0,14,2,16,0,0,0,0,0,0,0,1,0,0,2,0,0,0,0,2048,4,0,8192,0,0,0,0,0,0,0,0,64512,34944,45056,1,0,0,0,0,0,49152,125,0,0,0,64,12288,0,0,4096,0,0,0,0,4,0,0,0,256,0,0,0,28672,31,48,0,0,16,0,0,0,8255,34,108,0,0,512,1,0,2048,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63232,1,0,0,0,1,192,0,0,64,0,0,0,4096,0,0,0,0,8192,0,0,0,2,8,0,0,144,34,576,0,9216,2176,36864,0,0,8255,34,108,0,576,136,2304,0,36864,8704,16384,2,0,32804,8,144,0,2304,544,9216,0,16384,34818,0,9,0,1008,546,1728,0,64512,34944,45056,1,0,63232,5,0,0,0,257,192,0,0,0,0,0,0,0,0,0,0,2304,544,9216,0,0,0,0,0,0,224,0,192,0,9216,2176,36864,0,0,8201,2,36,0,4032,2184,6912,0,36864,8704,16384,2,0,32804,8,144,0,2304,544,9216,0,16384,34818,0,9,0,144,34,576,0,64512,34944,45056,1,0,8255,34,108,0,0,0,512,0,0,0,32768,0,0,32,128,16,0,16128,8736,27648,0,0,0,64,0,0,1008,546,1728,0,64512,34944,45056,1,0,8201,2,36,0,576,136,2304,0,36864,8704,16384,2,0,32804,8,144,0,2304,544,9216,0,16384,34818,0,9,0,144,34,576,0,9216,2176,36864,0,0,0,0,0,0,32,0,0,0,2048,0,0,0,0,0,0,0,0,0,1024,0,0,32768,3,0,0,0,8,0,0,0,512,0,0,0,32768,0,0,0,0,32,0,0,0,61440,8707,49154,6,0,33020,136,432,0,16128,8736,27648,0,49152,34831,8,27,0,0,64,0,0,0,8192,1,0,0,4,0,8,0,256,0,512,0,0,0,0,0,0,0,0,0,0,0,496,0,0,0,16384,0,0,0,0,16,0,0,0,1984,0,0,0,0,1,0,0,0,64,0,0,0,7936,0,0,0,0,7,0,0,0,448,0,0,0,31744,0,0,0,0,28,0,0,0,1792,0,0,0,61440,1,0,0,0,124,0,0,0,7936,0,0,0,49152,7,0,0,0,496,0,0,0,31744,0,0,0,0,31,0,0,0,1984,0,0,0,61440,1,0,0,0,124,0,0,0,64,4096,0,0,56320,7,4,0,0,503,768,0,0,256,0,0,0,28672,31,0,0,0,2012,3072,0,0,14,2,16,0,0,0,0,0,0,7984,0,0,0,56320,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,64,0,0,8048,12288,0,0,4096,0,0,0,0,503,768,0,0,0,0,0,0,0,0,0,0,0,1984,0,0,0,0,1,0,0,0,64,0,0,0,7936,0,0,0,0,4,0,0,0,256,0,0,0,31744,0,0,0,0,28,0,0,0,1792,0,0,0,61440,1,0,0,0,112,0,0,0,7168,0,0,0,49152,7,0,0,0,499,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63232,1,3,0,0,124,0,0,0,7936,0,0,0,49152,7,0,0,0,496,0,0,0,31744,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,23,0,0,0,496,0,0,0,0,0,0,0,0,0,0,0,0,16,1024,0,0,63232,1,1,0,49152,125,192,0,0,64,0,0,0,56320,7,0,0,0,503,768,0,0,0,0,0,0,0,0,0,0,0,1984,0,0,0,0,1,0,0,0,64,0,0,0,7936,0,0,0,0,4,0,0,0,256,0,0,0,31744,0,0,0,0,28,0,0,0,1792,0,0,0,61440,1,0,0,0,112,0,0,0,7168,0,0,0,49152,7,0,0,0,499,0,0,0,0,0,0,0,0,0,0,0,0,1996,0,0,0,0,0,0,0,49152,125,192,0,0,7936,0,0,0,49152,7,0,0,0,496,0,0,0,31744,0,0,0,0,31,0,0,0,1984,0,0,0,0,4,0,0,0,256,0,0,2048,0,0,0,0,0,0,0,0,0,2048,4,0,8192,0,0,0,0,0,16512,0,0,0,4096,0,0,0,8255,34,108,0,0,0,0,0,32768,0,32770,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,8,0,0,0,512,0,0,0,32768,0,0,0,0,32,0,0,0,0,0,0,0,0,0,288,0,0,0,1024,0,0,0,32192,0,0,0,16384,0,48,0,0,16,0,0,0,1024,0,0,0,0,256,0,0,0,16384,0,0,0,0,16,0,0,0,1024,0,0,0,0,1,0,0,0,64,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4032,2184,6912,0,61440,8707,49154,6,0,33020,136,432,0,16128,8736,27648,0,32768,32771,0,4,0,0,64,0,0,0,4096,0,0,0,0,4,0,0,32,0,0,0,0,0,1,0,0,0,0,0,0,0,1024,0,0,8192,0,0,0,0,0,0,0,0,64512,34944,45056,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,1,0,0,0,64,0,0,0,4096,0,0,0,0,4,0,0,0,256,0,0,0,16384,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","Query","FilteredQuery","BasicQuery","CreateVars","CreateVar","Func","Combinations","CombinationLst","FilterEl","UrlList","JoinOption","SList","SListElem","Cond","Action","Literal","LiteralList","LiteralElems","IntExp","BoolExp","StringExp","Node","Subject","Predicate","Object","Url","','","int","subj","pred","obj","true","false","'-l'","'-r'","'<'","'>'","deq","'='","'+'","'-'","'*'","'/'","'^'","'('","')'","'['","']'","string","filename","'|'","'?'","':'","'_'","filter","map","union","join","where","and","or","var","url","add","length","startsWith","%eof"]
        bit_start = st Prelude.* 70
        bit_end = (st Prelude.+ 1) Prelude.* 70
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..69]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (53) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (53) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (54) = happyShift action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (70) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (54) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (58) = happyShift action_10
action_5 (59) = happyShift action_11
action_5 (60) = happyShift action_12
action_5 (61) = happyShift action_13
action_5 (67) = happyShift action_14
action_5 (5) = happyGoto action_15
action_5 (6) = happyGoto action_8
action_5 (9) = happyGoto action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (58) = happyShift action_10
action_6 (59) = happyShift action_11
action_6 (60) = happyShift action_12
action_6 (61) = happyShift action_13
action_6 (67) = happyShift action_14
action_6 (5) = happyGoto action_7
action_6 (6) = happyGoto action_8
action_6 (9) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (40) = happyShift action_16
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (62) = happyShift action_30
action_8 _ = happyReduce_3

action_9 (54) = happyShift action_29
action_9 _ = happyReduce_5

action_10 (48) = happyShift action_27
action_10 (50) = happyShift action_28
action_10 (10) = happyGoto action_26
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (48) = happyShift action_25
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (50) = happyShift action_23
action_12 (53) = happyShift action_24
action_12 (15) = happyGoto action_22
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (37) = happyShift action_19
action_13 (38) = happyShift action_20
action_13 (48) = happyShift action_21
action_13 (14) = happyGoto action_18
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (48) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (40) = happyShift action_16
action_15 _ = happyReduce_2

action_16 (40) = happyShift action_62
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (32) = happyShift action_60
action_17 (66) = happyShift action_61
action_17 (29) = happyGoto action_59
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (48) = happyShift action_58
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (38) = happyShift action_57
action_19 _ = happyReduce_36

action_20 (37) = happyShift action_56
action_20 _ = happyReduce_37

action_21 (32) = happyShift action_45
action_21 (33) = happyShift action_46
action_21 (34) = happyShift action_47
action_21 (25) = happyGoto action_52
action_21 (26) = happyGoto action_53
action_21 (27) = happyGoto action_54
action_21 (28) = happyGoto action_55
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_15

action_23 (53) = happyShift action_51
action_23 (16) = happyGoto action_50
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_39

action_25 (32) = happyShift action_45
action_25 (33) = happyShift action_46
action_25 (34) = happyShift action_47
action_25 (48) = happyShift action_48
action_25 (67) = happyShift action_49
action_25 (17) = happyGoto action_40
action_25 (18) = happyGoto action_41
action_25 (26) = happyGoto action_42
action_25 (27) = happyGoto action_43
action_25 (28) = happyGoto action_44
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_13

action_27 (50) = happyShift action_38
action_27 (57) = happyShift action_39
action_27 (12) = happyGoto action_37
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (48) = happyShift action_36
action_28 (11) = happyGoto action_35
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (58) = happyShift action_10
action_29 (59) = happyShift action_11
action_29 (60) = happyShift action_12
action_29 (61) = happyShift action_13
action_29 (67) = happyShift action_14
action_29 (6) = happyGoto action_34
action_29 (9) = happyGoto action_9
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (65) = happyShift action_33
action_30 (7) = happyGoto action_31
action_30 (8) = happyGoto action_32
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_4

action_32 (65) = happyShift action_33
action_32 (7) = happyGoto action_99
action_32 (8) = happyGoto action_32
action_32 _ = happyReduce_7

action_33 (42) = happyShift action_98
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_6

action_35 (51) = happyShift action_97
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (50) = happyShift action_38
action_36 (57) = happyShift action_39
action_36 (12) = happyGoto action_96
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (30) = happyShift action_95
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (66) = happyShift action_61
action_38 (13) = happyGoto action_93
action_38 (29) = happyGoto action_94
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_30

action_40 (49) = happyShift action_92
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (30) = happyShift action_91
action_41 _ = happyReduce_42

action_42 (42) = happyShift action_90
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (42) = happyShift action_89
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (42) = happyShift action_88
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_189

action_46 _ = happyReduce_190

action_47 _ = happyReduce_191

action_48 (31) = happyShift action_79
action_48 (32) = happyShift action_45
action_48 (33) = happyShift action_46
action_48 (34) = happyShift action_47
action_48 (35) = happyShift action_80
action_48 (36) = happyShift action_81
action_48 (44) = happyShift action_82
action_48 (48) = happyShift action_83
action_48 (52) = happyShift action_84
action_48 (65) = happyShift action_85
action_48 (66) = happyShift action_61
action_48 (67) = happyShift action_49
action_48 (68) = happyShift action_86
action_48 (69) = happyShift action_87
action_48 (18) = happyGoto action_71
action_48 (22) = happyGoto action_72
action_48 (23) = happyGoto action_73
action_48 (24) = happyGoto action_74
action_48 (26) = happyGoto action_75
action_48 (27) = happyGoto action_76
action_48 (28) = happyGoto action_77
action_48 (29) = happyGoto action_78
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (48) = happyShift action_70
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (51) = happyShift action_69
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (30) = happyShift action_68
action_51 _ = happyReduce_40

action_52 (30) = happyShift action_67
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_186

action_54 _ = happyReduce_187

action_55 _ = happyReduce_188

action_56 _ = happyReduce_34

action_57 _ = happyReduce_35

action_58 (32) = happyShift action_45
action_58 (33) = happyShift action_46
action_58 (34) = happyShift action_47
action_58 (25) = happyGoto action_66
action_58 (26) = happyGoto action_53
action_58 (27) = happyGoto action_54
action_58 (28) = happyGoto action_55
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (30) = happyShift action_65
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (30) = happyShift action_64
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_192

action_62 (53) = happyShift action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_1

action_64 (33) = happyShift action_172
action_64 (66) = happyShift action_61
action_64 (29) = happyGoto action_171
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (33) = happyShift action_170
action_65 (66) = happyShift action_61
action_65 (29) = happyGoto action_169
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (30) = happyShift action_168
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (32) = happyShift action_45
action_67 (33) = happyShift action_46
action_67 (34) = happyShift action_47
action_67 (25) = happyGoto action_167
action_67 (26) = happyGoto action_53
action_67 (27) = happyGoto action_54
action_67 (28) = happyGoto action_55
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (53) = happyShift action_51
action_68 (16) = happyGoto action_166
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_38

action_70 (32) = happyShift action_165
action_70 (66) = happyShift action_61
action_70 (29) = happyGoto action_164
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (49) = happyShift action_163
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (39) = happyShift action_155
action_72 (40) = happyShift action_156
action_72 (41) = happyShift action_157
action_72 (43) = happyShift action_158
action_72 (44) = happyShift action_159
action_72 (45) = happyShift action_160
action_72 (46) = happyShift action_161
action_72 (47) = happyShift action_162
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (41) = happyShift action_151
action_73 (49) = happyShift action_152
action_73 (63) = happyShift action_153
action_73 (64) = happyShift action_154
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (41) = happyShift action_150
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (41) = happyShift action_149
action_75 (42) = happyShift action_90
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (41) = happyShift action_148
action_76 (42) = happyShift action_89
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (39) = happyShift action_138
action_77 (40) = happyShift action_139
action_77 (41) = happyShift action_140
action_77 (42) = happyShift action_88
action_77 (43) = happyShift action_141
action_77 (44) = happyShift action_142
action_77 (45) = happyShift action_143
action_77 (46) = happyShift action_144
action_77 (47) = happyShift action_145
action_77 (63) = happyShift action_146
action_77 (64) = happyShift action_147
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (41) = happyShift action_137
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_117

action_80 _ = happyReduce_180

action_81 _ = happyReduce_181

action_82 (31) = happyShift action_79
action_82 (34) = happyShift action_47
action_82 (44) = happyShift action_82
action_82 (48) = happyShift action_135
action_82 (65) = happyShift action_136
action_82 (68) = happyShift action_86
action_82 (22) = happyGoto action_133
action_82 (28) = happyGoto action_134
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (31) = happyShift action_79
action_83 (32) = happyShift action_45
action_83 (33) = happyShift action_46
action_83 (34) = happyShift action_47
action_83 (35) = happyShift action_80
action_83 (36) = happyShift action_81
action_83 (44) = happyShift action_82
action_83 (48) = happyShift action_83
action_83 (52) = happyShift action_84
action_83 (65) = happyShift action_85
action_83 (66) = happyShift action_61
action_83 (67) = happyShift action_49
action_83 (68) = happyShift action_86
action_83 (69) = happyShift action_87
action_83 (18) = happyGoto action_71
action_83 (22) = happyGoto action_131
action_83 (23) = happyGoto action_132
action_83 (24) = happyGoto action_74
action_83 (26) = happyGoto action_75
action_83 (27) = happyGoto action_76
action_83 (28) = happyGoto action_77
action_83 (29) = happyGoto action_78
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_185

action_85 (39) = happyShift action_121
action_85 (40) = happyShift action_122
action_85 (41) = happyShift action_123
action_85 (43) = happyShift action_124
action_85 (44) = happyShift action_125
action_85 (45) = happyShift action_126
action_85 (46) = happyShift action_127
action_85 (47) = happyShift action_128
action_85 (63) = happyShift action_129
action_85 (64) = happyShift action_130
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (48) = happyShift action_120
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (48) = happyShift action_119
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (31) = happyShift action_79
action_88 (32) = happyShift action_45
action_88 (33) = happyShift action_46
action_88 (34) = happyShift action_47
action_88 (35) = happyShift action_80
action_88 (36) = happyShift action_81
action_88 (44) = happyShift action_82
action_88 (48) = happyShift action_107
action_88 (52) = happyShift action_84
action_88 (65) = happyShift action_85
action_88 (66) = happyShift action_61
action_88 (68) = happyShift action_86
action_88 (69) = happyShift action_87
action_88 (22) = happyGoto action_115
action_88 (23) = happyGoto action_116
action_88 (24) = happyGoto action_117
action_88 (26) = happyGoto action_103
action_88 (27) = happyGoto action_104
action_88 (28) = happyGoto action_105
action_88 (29) = happyGoto action_118
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (66) = happyShift action_61
action_89 (29) = happyGoto action_114
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (66) = happyShift action_61
action_90 (29) = happyGoto action_113
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (32) = happyShift action_45
action_91 (33) = happyShift action_46
action_91 (34) = happyShift action_47
action_91 (48) = happyShift action_48
action_91 (67) = happyShift action_49
action_91 (17) = happyGoto action_112
action_91 (18) = happyGoto action_41
action_91 (26) = happyGoto action_42
action_91 (27) = happyGoto action_43
action_91 (28) = happyGoto action_44
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_14

action_93 (51) = happyShift action_111
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (30) = happyShift action_110
action_94 _ = happyReduce_32

action_95 (50) = happyShift action_38
action_95 (57) = happyShift action_39
action_95 (12) = happyGoto action_109
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (30) = happyShift action_108
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_27

action_98 (31) = happyShift action_79
action_98 (32) = happyShift action_45
action_98 (33) = happyShift action_46
action_98 (34) = happyShift action_47
action_98 (35) = happyShift action_80
action_98 (36) = happyShift action_81
action_98 (44) = happyShift action_82
action_98 (48) = happyShift action_107
action_98 (52) = happyShift action_84
action_98 (65) = happyShift action_85
action_98 (66) = happyShift action_61
action_98 (68) = happyShift action_86
action_98 (69) = happyShift action_87
action_98 (22) = happyGoto action_100
action_98 (23) = happyGoto action_101
action_98 (24) = happyGoto action_102
action_98 (26) = happyGoto action_103
action_98 (27) = happyGoto action_104
action_98 (28) = happyGoto action_105
action_98 (29) = happyGoto action_106
action_98 _ = happyFail (happyExpListPerState 98)

action_99 _ = happyReduce_8

action_100 (39) = happyShift action_155
action_100 (40) = happyShift action_156
action_100 (41) = happyShift action_157
action_100 (43) = happyShift action_158
action_100 (44) = happyShift action_159
action_100 (45) = happyShift action_160
action_100 (46) = happyShift action_161
action_100 (47) = happyShift action_162
action_100 _ = happyReduce_9

action_101 (41) = happyShift action_151
action_101 (63) = happyShift action_153
action_101 (64) = happyShift action_154
action_101 _ = happyReduce_11

action_102 (41) = happyShift action_150
action_102 _ = happyReduce_10

action_103 (41) = happyShift action_149
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (41) = happyShift action_148
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (39) = happyShift action_138
action_105 (40) = happyShift action_139
action_105 (41) = happyShift action_140
action_105 (43) = happyShift action_141
action_105 (44) = happyShift action_142
action_105 (45) = happyShift action_143
action_105 (46) = happyShift action_144
action_105 (47) = happyShift action_145
action_105 (63) = happyShift action_146
action_105 (64) = happyShift action_147
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (41) = happyShift action_137
action_106 _ = happyReduce_12

action_107 (31) = happyShift action_79
action_107 (32) = happyShift action_45
action_107 (33) = happyShift action_46
action_107 (34) = happyShift action_47
action_107 (35) = happyShift action_80
action_107 (36) = happyShift action_81
action_107 (44) = happyShift action_82
action_107 (48) = happyShift action_107
action_107 (52) = happyShift action_84
action_107 (65) = happyShift action_85
action_107 (66) = happyShift action_61
action_107 (68) = happyShift action_86
action_107 (69) = happyShift action_87
action_107 (22) = happyGoto action_131
action_107 (23) = happyGoto action_132
action_107 (24) = happyGoto action_74
action_107 (26) = happyGoto action_103
action_107 (27) = happyGoto action_104
action_107 (28) = happyGoto action_105
action_107 (29) = happyGoto action_78
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (50) = happyShift action_38
action_108 (57) = happyShift action_39
action_108 (12) = happyGoto action_296
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (30) = happyShift action_295
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (66) = happyShift action_61
action_110 (13) = happyGoto action_294
action_110 (29) = happyGoto action_94
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_31

action_112 _ = happyReduce_43

action_113 _ = happyReduce_45

action_114 _ = happyReduce_46

action_115 (39) = happyShift action_155
action_115 (40) = happyShift action_156
action_115 (41) = happyShift action_157
action_115 (43) = happyShift action_158
action_115 (44) = happyShift action_159
action_115 (45) = happyShift action_160
action_115 (46) = happyShift action_161
action_115 (47) = happyShift action_162
action_115 _ = happyReduce_49

action_116 (41) = happyShift action_151
action_116 (63) = happyShift action_153
action_116 (64) = happyShift action_154
action_116 _ = happyReduce_50

action_117 (41) = happyShift action_150
action_117 _ = happyReduce_48

action_118 (41) = happyShift action_137
action_118 _ = happyReduce_47

action_119 (52) = happyShift action_293
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (34) = happyShift action_47
action_120 (52) = happyShift action_292
action_120 (28) = happyGoto action_291
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (31) = happyShift action_79
action_121 (34) = happyShift action_47
action_121 (44) = happyShift action_82
action_121 (48) = happyShift action_135
action_121 (65) = happyShift action_290
action_121 (68) = happyShift action_86
action_121 (22) = happyGoto action_288
action_121 (28) = happyGoto action_289
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (31) = happyShift action_79
action_122 (34) = happyShift action_47
action_122 (44) = happyShift action_82
action_122 (48) = happyShift action_135
action_122 (65) = happyShift action_287
action_122 (68) = happyShift action_86
action_122 (22) = happyGoto action_285
action_122 (28) = happyGoto action_286
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (31) = happyShift action_79
action_123 (32) = happyShift action_45
action_123 (33) = happyShift action_46
action_123 (34) = happyShift action_47
action_123 (35) = happyShift action_80
action_123 (36) = happyShift action_81
action_123 (44) = happyShift action_82
action_123 (48) = happyShift action_107
action_123 (52) = happyShift action_84
action_123 (65) = happyShift action_284
action_123 (66) = happyShift action_61
action_123 (68) = happyShift action_86
action_123 (69) = happyShift action_87
action_123 (22) = happyGoto action_279
action_123 (23) = happyGoto action_280
action_123 (24) = happyGoto action_281
action_123 (26) = happyGoto action_103
action_123 (27) = happyGoto action_104
action_123 (28) = happyGoto action_282
action_123 (29) = happyGoto action_283
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (31) = happyShift action_79
action_124 (34) = happyShift action_47
action_124 (44) = happyShift action_82
action_124 (48) = happyShift action_135
action_124 (65) = happyShift action_278
action_124 (68) = happyShift action_86
action_124 (22) = happyGoto action_276
action_124 (28) = happyGoto action_277
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (31) = happyShift action_79
action_125 (34) = happyShift action_47
action_125 (44) = happyShift action_82
action_125 (48) = happyShift action_135
action_125 (65) = happyShift action_275
action_125 (68) = happyShift action_86
action_125 (22) = happyGoto action_273
action_125 (28) = happyGoto action_274
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (31) = happyShift action_79
action_126 (34) = happyShift action_47
action_126 (44) = happyShift action_82
action_126 (48) = happyShift action_135
action_126 (65) = happyShift action_272
action_126 (68) = happyShift action_86
action_126 (22) = happyGoto action_270
action_126 (28) = happyGoto action_271
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (31) = happyShift action_79
action_127 (34) = happyShift action_47
action_127 (44) = happyShift action_82
action_127 (48) = happyShift action_135
action_127 (65) = happyShift action_269
action_127 (68) = happyShift action_86
action_127 (22) = happyGoto action_267
action_127 (28) = happyGoto action_268
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (31) = happyShift action_79
action_128 (34) = happyShift action_47
action_128 (44) = happyShift action_82
action_128 (48) = happyShift action_135
action_128 (65) = happyShift action_266
action_128 (68) = happyShift action_86
action_128 (22) = happyGoto action_264
action_128 (28) = happyGoto action_265
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (31) = happyShift action_79
action_129 (32) = happyShift action_45
action_129 (33) = happyShift action_46
action_129 (34) = happyShift action_47
action_129 (35) = happyShift action_80
action_129 (36) = happyShift action_81
action_129 (44) = happyShift action_82
action_129 (48) = happyShift action_107
action_129 (52) = happyShift action_84
action_129 (65) = happyShift action_263
action_129 (66) = happyShift action_61
action_129 (68) = happyShift action_86
action_129 (69) = happyShift action_87
action_129 (22) = happyGoto action_72
action_129 (23) = happyGoto action_261
action_129 (24) = happyGoto action_74
action_129 (26) = happyGoto action_103
action_129 (27) = happyGoto action_104
action_129 (28) = happyGoto action_262
action_129 (29) = happyGoto action_78
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (31) = happyShift action_79
action_130 (32) = happyShift action_45
action_130 (33) = happyShift action_46
action_130 (34) = happyShift action_47
action_130 (35) = happyShift action_80
action_130 (36) = happyShift action_81
action_130 (44) = happyShift action_82
action_130 (48) = happyShift action_107
action_130 (52) = happyShift action_84
action_130 (65) = happyShift action_260
action_130 (66) = happyShift action_61
action_130 (68) = happyShift action_86
action_130 (69) = happyShift action_87
action_130 (22) = happyGoto action_72
action_130 (23) = happyGoto action_258
action_130 (24) = happyGoto action_74
action_130 (26) = happyGoto action_103
action_130 (27) = happyGoto action_104
action_130 (28) = happyGoto action_259
action_130 (29) = happyGoto action_78
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (39) = happyShift action_155
action_131 (40) = happyShift action_156
action_131 (41) = happyShift action_157
action_131 (43) = happyShift action_158
action_131 (44) = happyShift action_159
action_131 (45) = happyShift action_160
action_131 (46) = happyShift action_161
action_131 (47) = happyShift action_162
action_131 (49) = happyShift action_257
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (41) = happyShift action_151
action_132 (49) = happyShift action_256
action_132 (63) = happyShift action_153
action_132 (64) = happyShift action_154
action_132 _ = happyFail (happyExpListPerState 132)

action_133 _ = happyReduce_114

action_134 _ = happyReduce_115

action_135 (31) = happyShift action_79
action_135 (34) = happyShift action_47
action_135 (44) = happyShift action_82
action_135 (48) = happyShift action_135
action_135 (65) = happyShift action_255
action_135 (68) = happyShift action_86
action_135 (22) = happyGoto action_254
action_135 (28) = happyGoto action_245
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_116

action_137 (32) = happyShift action_45
action_137 (33) = happyShift action_46
action_137 (34) = happyShift action_47
action_137 (65) = happyShift action_253
action_137 (66) = happyShift action_61
action_137 (26) = happyGoto action_249
action_137 (27) = happyGoto action_250
action_137 (28) = happyGoto action_251
action_137 (29) = happyGoto action_252
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (31) = happyShift action_79
action_138 (34) = happyShift action_47
action_138 (44) = happyShift action_82
action_138 (48) = happyShift action_135
action_138 (65) = happyShift action_248
action_138 (68) = happyShift action_86
action_138 (22) = happyGoto action_247
action_138 (28) = happyGoto action_245
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (31) = happyShift action_79
action_139 (34) = happyShift action_47
action_139 (44) = happyShift action_82
action_139 (48) = happyShift action_135
action_139 (65) = happyShift action_246
action_139 (68) = happyShift action_86
action_139 (22) = happyGoto action_244
action_139 (28) = happyGoto action_245
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (31) = happyShift action_79
action_140 (32) = happyShift action_45
action_140 (33) = happyShift action_46
action_140 (34) = happyShift action_47
action_140 (35) = happyShift action_80
action_140 (36) = happyShift action_81
action_140 (44) = happyShift action_82
action_140 (48) = happyShift action_107
action_140 (52) = happyShift action_84
action_140 (65) = happyShift action_243
action_140 (66) = happyShift action_61
action_140 (68) = happyShift action_86
action_140 (69) = happyShift action_87
action_140 (22) = happyGoto action_239
action_140 (23) = happyGoto action_240
action_140 (24) = happyGoto action_241
action_140 (26) = happyGoto action_103
action_140 (27) = happyGoto action_104
action_140 (28) = happyGoto action_105
action_140 (29) = happyGoto action_242
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (31) = happyShift action_79
action_141 (34) = happyShift action_47
action_141 (44) = happyShift action_82
action_141 (48) = happyShift action_135
action_141 (65) = happyShift action_238
action_141 (68) = happyShift action_86
action_141 (22) = happyGoto action_236
action_141 (28) = happyGoto action_237
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (31) = happyShift action_79
action_142 (34) = happyShift action_47
action_142 (44) = happyShift action_82
action_142 (48) = happyShift action_135
action_142 (65) = happyShift action_235
action_142 (68) = happyShift action_86
action_142 (22) = happyGoto action_233
action_142 (28) = happyGoto action_234
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (31) = happyShift action_79
action_143 (34) = happyShift action_47
action_143 (44) = happyShift action_82
action_143 (48) = happyShift action_135
action_143 (65) = happyShift action_232
action_143 (68) = happyShift action_86
action_143 (22) = happyGoto action_230
action_143 (28) = happyGoto action_231
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (31) = happyShift action_79
action_144 (34) = happyShift action_47
action_144 (44) = happyShift action_82
action_144 (48) = happyShift action_135
action_144 (65) = happyShift action_229
action_144 (68) = happyShift action_86
action_144 (22) = happyGoto action_227
action_144 (28) = happyGoto action_228
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (31) = happyShift action_79
action_145 (34) = happyShift action_47
action_145 (44) = happyShift action_82
action_145 (48) = happyShift action_135
action_145 (65) = happyShift action_226
action_145 (68) = happyShift action_86
action_145 (22) = happyGoto action_224
action_145 (28) = happyGoto action_225
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (31) = happyShift action_79
action_146 (32) = happyShift action_45
action_146 (33) = happyShift action_46
action_146 (34) = happyShift action_47
action_146 (35) = happyShift action_80
action_146 (36) = happyShift action_81
action_146 (44) = happyShift action_82
action_146 (48) = happyShift action_107
action_146 (52) = happyShift action_84
action_146 (65) = happyShift action_223
action_146 (66) = happyShift action_61
action_146 (68) = happyShift action_86
action_146 (69) = happyShift action_87
action_146 (22) = happyGoto action_72
action_146 (23) = happyGoto action_222
action_146 (24) = happyGoto action_74
action_146 (26) = happyGoto action_103
action_146 (27) = happyGoto action_104
action_146 (28) = happyGoto action_105
action_146 (29) = happyGoto action_78
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (31) = happyShift action_79
action_147 (32) = happyShift action_45
action_147 (33) = happyShift action_46
action_147 (34) = happyShift action_47
action_147 (35) = happyShift action_80
action_147 (36) = happyShift action_81
action_147 (44) = happyShift action_82
action_147 (48) = happyShift action_107
action_147 (52) = happyShift action_84
action_147 (65) = happyShift action_221
action_147 (66) = happyShift action_61
action_147 (68) = happyShift action_86
action_147 (69) = happyShift action_87
action_147 (22) = happyGoto action_72
action_147 (23) = happyGoto action_220
action_147 (24) = happyGoto action_74
action_147 (26) = happyGoto action_103
action_147 (27) = happyGoto action_104
action_147 (28) = happyGoto action_105
action_147 (29) = happyGoto action_78
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (66) = happyShift action_61
action_148 (29) = happyGoto action_219
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (66) = happyShift action_61
action_149 (29) = happyGoto action_218
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (34) = happyShift action_47
action_150 (52) = happyShift action_84
action_150 (65) = happyShift action_217
action_150 (24) = happyGoto action_215
action_150 (28) = happyGoto action_216
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (31) = happyShift action_79
action_151 (32) = happyShift action_45
action_151 (33) = happyShift action_46
action_151 (34) = happyShift action_47
action_151 (35) = happyShift action_80
action_151 (36) = happyShift action_81
action_151 (44) = happyShift action_82
action_151 (48) = happyShift action_107
action_151 (52) = happyShift action_84
action_151 (65) = happyShift action_214
action_151 (66) = happyShift action_61
action_151 (68) = happyShift action_86
action_151 (69) = happyShift action_87
action_151 (22) = happyGoto action_72
action_151 (23) = happyGoto action_212
action_151 (24) = happyGoto action_74
action_151 (26) = happyGoto action_103
action_151 (27) = happyGoto action_104
action_151 (28) = happyGoto action_213
action_151 (29) = happyGoto action_78
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (55) = happyShift action_211
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (31) = happyShift action_79
action_153 (32) = happyShift action_45
action_153 (33) = happyShift action_46
action_153 (34) = happyShift action_47
action_153 (35) = happyShift action_80
action_153 (36) = happyShift action_81
action_153 (44) = happyShift action_82
action_153 (48) = happyShift action_107
action_153 (52) = happyShift action_84
action_153 (65) = happyShift action_210
action_153 (66) = happyShift action_61
action_153 (68) = happyShift action_86
action_153 (69) = happyShift action_87
action_153 (22) = happyGoto action_72
action_153 (23) = happyGoto action_208
action_153 (24) = happyGoto action_74
action_153 (26) = happyGoto action_103
action_153 (27) = happyGoto action_104
action_153 (28) = happyGoto action_209
action_153 (29) = happyGoto action_78
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (31) = happyShift action_79
action_154 (32) = happyShift action_45
action_154 (33) = happyShift action_46
action_154 (34) = happyShift action_47
action_154 (35) = happyShift action_80
action_154 (36) = happyShift action_81
action_154 (44) = happyShift action_82
action_154 (48) = happyShift action_107
action_154 (52) = happyShift action_84
action_154 (65) = happyShift action_207
action_154 (66) = happyShift action_61
action_154 (68) = happyShift action_86
action_154 (69) = happyShift action_87
action_154 (22) = happyGoto action_72
action_154 (23) = happyGoto action_205
action_154 (24) = happyGoto action_74
action_154 (26) = happyGoto action_103
action_154 (27) = happyGoto action_104
action_154 (28) = happyGoto action_206
action_154 (29) = happyGoto action_78
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (31) = happyShift action_79
action_155 (34) = happyShift action_47
action_155 (44) = happyShift action_82
action_155 (48) = happyShift action_135
action_155 (65) = happyShift action_204
action_155 (68) = happyShift action_86
action_155 (22) = happyGoto action_202
action_155 (28) = happyGoto action_203
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (31) = happyShift action_79
action_156 (34) = happyShift action_47
action_156 (44) = happyShift action_82
action_156 (48) = happyShift action_135
action_156 (65) = happyShift action_201
action_156 (68) = happyShift action_86
action_156 (22) = happyGoto action_199
action_156 (28) = happyGoto action_200
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (31) = happyShift action_79
action_157 (34) = happyShift action_47
action_157 (44) = happyShift action_82
action_157 (48) = happyShift action_135
action_157 (65) = happyShift action_198
action_157 (68) = happyShift action_86
action_157 (22) = happyGoto action_196
action_157 (28) = happyGoto action_197
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (31) = happyShift action_79
action_158 (34) = happyShift action_47
action_158 (44) = happyShift action_82
action_158 (48) = happyShift action_135
action_158 (65) = happyShift action_195
action_158 (68) = happyShift action_86
action_158 (22) = happyGoto action_193
action_158 (28) = happyGoto action_194
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (31) = happyShift action_79
action_159 (34) = happyShift action_47
action_159 (44) = happyShift action_82
action_159 (48) = happyShift action_135
action_159 (65) = happyShift action_192
action_159 (68) = happyShift action_86
action_159 (22) = happyGoto action_190
action_159 (28) = happyGoto action_191
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (31) = happyShift action_79
action_160 (34) = happyShift action_47
action_160 (44) = happyShift action_82
action_160 (48) = happyShift action_135
action_160 (65) = happyShift action_189
action_160 (68) = happyShift action_86
action_160 (22) = happyGoto action_187
action_160 (28) = happyGoto action_188
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (31) = happyShift action_79
action_161 (34) = happyShift action_47
action_161 (44) = happyShift action_82
action_161 (48) = happyShift action_135
action_161 (65) = happyShift action_186
action_161 (68) = happyShift action_86
action_161 (22) = happyGoto action_184
action_161 (28) = happyGoto action_185
action_161 _ = happyFail (happyExpListPerState 161)

action_162 (31) = happyShift action_79
action_162 (34) = happyShift action_47
action_162 (44) = happyShift action_82
action_162 (48) = happyShift action_135
action_162 (65) = happyShift action_183
action_162 (68) = happyShift action_86
action_162 (22) = happyGoto action_181
action_162 (28) = happyGoto action_182
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_59

action_164 (30) = happyShift action_180
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (30) = happyShift action_179
action_165 _ = happyFail (happyExpListPerState 165)

action_166 _ = happyReduce_41

action_167 (49) = happyShift action_178
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (32) = happyShift action_45
action_168 (33) = happyShift action_46
action_168 (34) = happyShift action_47
action_168 (25) = happyGoto action_177
action_168 (26) = happyGoto action_53
action_168 (27) = happyGoto action_54
action_168 (28) = happyGoto action_55
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (30) = happyShift action_176
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (30) = happyShift action_175
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (30) = happyShift action_174
action_171 _ = happyFail (happyExpListPerState 171)

action_172 (30) = happyShift action_173
action_172 _ = happyFail (happyExpListPerState 172)

action_173 (31) = happyShift action_79
action_173 (32) = happyShift action_45
action_173 (33) = happyShift action_46
action_173 (34) = happyShift action_322
action_173 (35) = happyShift action_80
action_173 (36) = happyShift action_81
action_173 (44) = happyShift action_82
action_173 (48) = happyShift action_107
action_173 (52) = happyShift action_84
action_173 (65) = happyShift action_85
action_173 (66) = happyShift action_61
action_173 (68) = happyShift action_86
action_173 (69) = happyShift action_87
action_173 (19) = happyGoto action_321
action_173 (22) = happyGoto action_312
action_173 (23) = happyGoto action_313
action_173 (24) = happyGoto action_314
action_173 (26) = happyGoto action_103
action_173 (27) = happyGoto action_104
action_173 (28) = happyGoto action_105
action_173 (29) = happyGoto action_315
action_173 _ = happyFail (happyExpListPerState 173)

action_174 (31) = happyShift action_79
action_174 (32) = happyShift action_45
action_174 (33) = happyShift action_46
action_174 (34) = happyShift action_320
action_174 (35) = happyShift action_80
action_174 (36) = happyShift action_81
action_174 (44) = happyShift action_82
action_174 (48) = happyShift action_107
action_174 (52) = happyShift action_84
action_174 (65) = happyShift action_85
action_174 (66) = happyShift action_61
action_174 (68) = happyShift action_86
action_174 (69) = happyShift action_87
action_174 (19) = happyGoto action_319
action_174 (22) = happyGoto action_312
action_174 (23) = happyGoto action_313
action_174 (24) = happyGoto action_314
action_174 (26) = happyGoto action_103
action_174 (27) = happyGoto action_104
action_174 (28) = happyGoto action_105
action_174 (29) = happyGoto action_315
action_174 _ = happyFail (happyExpListPerState 174)

action_175 (31) = happyShift action_79
action_175 (32) = happyShift action_45
action_175 (33) = happyShift action_46
action_175 (34) = happyShift action_318
action_175 (35) = happyShift action_80
action_175 (36) = happyShift action_81
action_175 (44) = happyShift action_82
action_175 (48) = happyShift action_107
action_175 (52) = happyShift action_84
action_175 (65) = happyShift action_85
action_175 (66) = happyShift action_61
action_175 (68) = happyShift action_86
action_175 (69) = happyShift action_87
action_175 (19) = happyGoto action_317
action_175 (22) = happyGoto action_312
action_175 (23) = happyGoto action_313
action_175 (24) = happyGoto action_314
action_175 (26) = happyGoto action_103
action_175 (27) = happyGoto action_104
action_175 (28) = happyGoto action_105
action_175 (29) = happyGoto action_315
action_175 _ = happyFail (happyExpListPerState 175)

action_176 (31) = happyShift action_79
action_176 (32) = happyShift action_45
action_176 (33) = happyShift action_46
action_176 (34) = happyShift action_316
action_176 (35) = happyShift action_80
action_176 (36) = happyShift action_81
action_176 (44) = happyShift action_82
action_176 (48) = happyShift action_107
action_176 (52) = happyShift action_84
action_176 (65) = happyShift action_85
action_176 (66) = happyShift action_61
action_176 (68) = happyShift action_86
action_176 (69) = happyShift action_87
action_176 (19) = happyGoto action_311
action_176 (22) = happyGoto action_312
action_176 (23) = happyGoto action_313
action_176 (24) = happyGoto action_314
action_176 (26) = happyGoto action_103
action_176 (27) = happyGoto action_104
action_176 (28) = happyGoto action_105
action_176 (29) = happyGoto action_315
action_176 _ = happyFail (happyExpListPerState 176)

action_177 (49) = happyShift action_310
action_177 _ = happyFail (happyExpListPerState 177)

action_178 (50) = happyShift action_23
action_178 (53) = happyShift action_24
action_178 (15) = happyGoto action_309
action_178 _ = happyFail (happyExpListPerState 178)

action_179 (33) = happyShift action_308
action_179 (66) = happyShift action_61
action_179 (29) = happyGoto action_307
action_179 _ = happyFail (happyExpListPerState 179)

action_180 (33) = happyShift action_306
action_180 (66) = happyShift action_61
action_180 (29) = happyGoto action_305
action_180 _ = happyFail (happyExpListPerState 180)

action_181 _ = happyReduce_104

action_182 _ = happyReduce_106

action_183 (43) = happyShift action_124
action_183 (44) = happyShift action_125
action_183 (45) = happyShift action_126
action_183 (46) = happyShift action_127
action_183 (47) = happyShift action_128
action_183 _ = happyReduce_111

action_184 (47) = happyShift action_162
action_184 _ = happyReduce_95

action_185 (47) = happyShift action_145
action_185 _ = happyReduce_97

action_186 (43) = happyShift action_124
action_186 (44) = happyShift action_125
action_186 (45) = happyShift action_126
action_186 (46) = happyShift action_127
action_186 (47) = happyShift action_128
action_186 _ = happyReduce_102

action_187 (47) = happyShift action_162
action_187 _ = happyReduce_86

action_188 (47) = happyShift action_145
action_188 _ = happyReduce_88

action_189 (43) = happyShift action_124
action_189 (44) = happyShift action_125
action_189 (45) = happyShift action_126
action_189 (46) = happyShift action_127
action_189 (47) = happyShift action_128
action_189 _ = happyReduce_93

action_190 (45) = happyShift action_160
action_190 (46) = happyShift action_161
action_190 (47) = happyShift action_162
action_190 _ = happyReduce_77

action_191 (45) = happyShift action_143
action_191 (46) = happyShift action_144
action_191 (47) = happyShift action_145
action_191 _ = happyReduce_79

action_192 (43) = happyShift action_124
action_192 (44) = happyShift action_125
action_192 (45) = happyShift action_126
action_192 (46) = happyShift action_127
action_192 (47) = happyShift action_128
action_192 _ = happyReduce_84

action_193 (45) = happyShift action_160
action_193 (46) = happyShift action_161
action_193 (47) = happyShift action_162
action_193 _ = happyReduce_68

action_194 (45) = happyShift action_143
action_194 (46) = happyShift action_144
action_194 (47) = happyShift action_145
action_194 _ = happyReduce_70

action_195 (43) = happyShift action_124
action_195 (44) = happyShift action_125
action_195 (45) = happyShift action_126
action_195 (46) = happyShift action_127
action_195 (47) = happyShift action_128
action_195 _ = happyReduce_75

action_196 (43) = happyShift action_158
action_196 (44) = happyShift action_159
action_196 (45) = happyShift action_160
action_196 (46) = happyShift action_161
action_196 (47) = happyShift action_162
action_196 _ = happyReduce_152

action_197 (43) = happyShift action_141
action_197 (44) = happyShift action_142
action_197 (45) = happyShift action_143
action_197 (46) = happyShift action_144
action_197 (47) = happyShift action_145
action_197 _ = happyReduce_157

action_198 (43) = happyShift action_124
action_198 (44) = happyShift action_125
action_198 (45) = happyShift action_126
action_198 (46) = happyShift action_127
action_198 (47) = happyShift action_128
action_198 _ = happyReduce_169

action_199 (43) = happyShift action_158
action_199 (44) = happyShift action_159
action_199 (45) = happyShift action_160
action_199 (46) = happyShift action_161
action_199 (47) = happyShift action_162
action_199 _ = happyReduce_136

action_200 (43) = happyShift action_141
action_200 (44) = happyShift action_142
action_200 (45) = happyShift action_143
action_200 (46) = happyShift action_144
action_200 (47) = happyShift action_145
action_200 _ = happyReduce_137

action_201 (43) = happyShift action_124
action_201 (44) = happyShift action_125
action_201 (45) = happyShift action_126
action_201 (46) = happyShift action_127
action_201 (47) = happyShift action_128
action_201 _ = happyReduce_142

action_202 (43) = happyShift action_158
action_202 (44) = happyShift action_159
action_202 (45) = happyShift action_160
action_202 (46) = happyShift action_161
action_202 (47) = happyShift action_162
action_202 _ = happyReduce_144

action_203 (43) = happyShift action_141
action_203 (44) = happyShift action_142
action_203 (45) = happyShift action_143
action_203 (46) = happyShift action_144
action_203 (47) = happyShift action_145
action_203 _ = happyReduce_145

action_204 (43) = happyShift action_124
action_204 (44) = happyShift action_125
action_204 (45) = happyShift action_126
action_204 (46) = happyShift action_127
action_204 (47) = happyShift action_128
action_204 _ = happyReduce_150

action_205 (41) = happyShift action_151
action_205 (63) = happyShift action_153
action_205 _ = happyReduce_128

action_206 (39) = happyShift action_138
action_206 (40) = happyShift action_139
action_206 (41) = happyShift action_140
action_206 (43) = happyShift action_141
action_206 (44) = happyShift action_142
action_206 (45) = happyShift action_143
action_206 (46) = happyShift action_144
action_206 (47) = happyShift action_145
action_206 (63) = happyShift action_146
action_206 _ = happyReduce_129

action_207 (39) = happyShift action_121
action_207 (40) = happyShift action_122
action_207 (41) = happyShift action_123
action_207 (43) = happyShift action_124
action_207 (44) = happyShift action_125
action_207 (45) = happyShift action_126
action_207 (46) = happyShift action_127
action_207 (47) = happyShift action_128
action_207 (63) = happyShift action_129
action_207 (64) = happyShift action_130
action_207 _ = happyReduce_134

action_208 (41) = happyShift action_151
action_208 _ = happyReduce_120

action_209 (39) = happyShift action_138
action_209 (40) = happyShift action_139
action_209 (41) = happyShift action_140
action_209 (43) = happyShift action_141
action_209 (44) = happyShift action_142
action_209 (45) = happyShift action_143
action_209 (46) = happyShift action_144
action_209 (47) = happyShift action_145
action_209 _ = happyReduce_121

action_210 (39) = happyShift action_121
action_210 (40) = happyShift action_122
action_210 (41) = happyShift action_123
action_210 (43) = happyShift action_124
action_210 (44) = happyShift action_125
action_210 (45) = happyShift action_126
action_210 (46) = happyShift action_127
action_210 (47) = happyShift action_128
action_210 (63) = happyShift action_129
action_210 (64) = happyShift action_130
action_210 _ = happyReduce_126

action_211 (32) = happyShift action_45
action_211 (33) = happyShift action_46
action_211 (34) = happyShift action_47
action_211 (48) = happyShift action_48
action_211 (67) = happyShift action_49
action_211 (17) = happyGoto action_304
action_211 (18) = happyGoto action_41
action_211 (26) = happyGoto action_42
action_211 (27) = happyGoto action_43
action_211 (28) = happyGoto action_44
action_211 _ = happyFail (happyExpListPerState 211)

action_212 _ = happyReduce_153

action_213 (39) = happyShift action_138
action_213 (40) = happyShift action_139
action_213 (43) = happyShift action_141
action_213 (44) = happyShift action_142
action_213 (45) = happyShift action_143
action_213 (46) = happyShift action_144
action_213 (47) = happyShift action_145
action_213 _ = happyReduce_159

action_214 (39) = happyShift action_121
action_214 (40) = happyShift action_122
action_214 (41) = happyShift action_123
action_214 (43) = happyShift action_124
action_214 (44) = happyShift action_125
action_214 (45) = happyShift action_126
action_214 (46) = happyShift action_127
action_214 (47) = happyShift action_128
action_214 (63) = happyShift action_129
action_214 (64) = happyShift action_130
action_214 _ = happyReduce_170

action_215 _ = happyReduce_154

action_216 _ = happyReduce_161

action_217 _ = happyReduce_171

action_218 _ = happyReduce_162

action_219 _ = happyReduce_164

action_220 (41) = happyShift action_151
action_220 (63) = happyShift action_153
action_220 _ = happyReduce_130

action_221 (39) = happyShift action_121
action_221 (40) = happyShift action_122
action_221 (41) = happyShift action_123
action_221 (43) = happyShift action_124
action_221 (44) = happyShift action_125
action_221 (45) = happyShift action_126
action_221 (46) = happyShift action_127
action_221 (47) = happyShift action_128
action_221 (63) = happyShift action_129
action_221 (64) = happyShift action_130
action_221 _ = happyReduce_132

action_222 (41) = happyShift action_151
action_222 _ = happyReduce_122

action_223 (39) = happyShift action_121
action_223 (40) = happyShift action_122
action_223 (41) = happyShift action_123
action_223 (43) = happyShift action_124
action_223 (44) = happyShift action_125
action_223 (45) = happyShift action_126
action_223 (46) = happyShift action_127
action_223 (47) = happyShift action_128
action_223 (63) = happyShift action_129
action_223 (64) = happyShift action_130
action_223 _ = happyReduce_124

action_224 _ = happyReduce_105

action_225 _ = happyReduce_107

action_226 (43) = happyShift action_124
action_226 (44) = happyShift action_125
action_226 (45) = happyShift action_126
action_226 (46) = happyShift action_127
action_226 (47) = happyShift action_128
action_226 _ = happyReduce_109

action_227 (47) = happyShift action_162
action_227 _ = happyReduce_96

action_228 (47) = happyShift action_145
action_228 _ = happyReduce_98

action_229 (43) = happyShift action_124
action_229 (44) = happyShift action_125
action_229 (45) = happyShift action_126
action_229 (46) = happyShift action_127
action_229 (47) = happyShift action_128
action_229 _ = happyReduce_100

action_230 (47) = happyShift action_162
action_230 _ = happyReduce_87

action_231 (47) = happyShift action_145
action_231 _ = happyReduce_89

action_232 (43) = happyShift action_124
action_232 (44) = happyShift action_125
action_232 (45) = happyShift action_126
action_232 (46) = happyShift action_127
action_232 (47) = happyShift action_128
action_232 _ = happyReduce_91

action_233 (45) = happyShift action_160
action_233 (46) = happyShift action_161
action_233 (47) = happyShift action_162
action_233 _ = happyReduce_78

action_234 (45) = happyShift action_143
action_234 (46) = happyShift action_144
action_234 (47) = happyShift action_145
action_234 _ = happyReduce_80

action_235 (43) = happyShift action_124
action_235 (44) = happyShift action_125
action_235 (45) = happyShift action_126
action_235 (46) = happyShift action_127
action_235 (47) = happyShift action_128
action_235 _ = happyReduce_82

action_236 (45) = happyShift action_160
action_236 (46) = happyShift action_161
action_236 (47) = happyShift action_162
action_236 _ = happyReduce_69

action_237 (45) = happyShift action_143
action_237 (46) = happyShift action_144
action_237 (47) = happyShift action_145
action_237 _ = happyReduce_71

action_238 (43) = happyShift action_124
action_238 (44) = happyShift action_125
action_238 (45) = happyShift action_126
action_238 (46) = happyShift action_127
action_238 (47) = happyShift action_128
action_238 _ = happyReduce_73

action_239 (39) = happyShift action_155
action_239 (40) = happyShift action_156
action_239 (43) = happyShift action_158
action_239 (44) = happyShift action_159
action_239 (45) = happyShift action_160
action_239 (46) = happyShift action_161
action_239 (47) = happyShift action_162
action_239 _ = happyReduce_156

action_240 _ = happyReduce_158

action_241 _ = happyReduce_160

action_242 _ = happyReduce_166

action_243 (39) = happyShift action_121
action_243 (40) = happyShift action_122
action_243 (41) = happyShift action_123
action_243 (43) = happyShift action_124
action_243 (44) = happyShift action_125
action_243 (45) = happyShift action_126
action_243 (46) = happyShift action_127
action_243 (47) = happyShift action_128
action_243 (63) = happyShift action_129
action_243 (64) = happyShift action_130
action_243 _ = happyReduce_168

action_244 (43) = happyShift action_158
action_244 (44) = happyShift action_159
action_244 (45) = happyShift action_160
action_244 (46) = happyShift action_161
action_244 (47) = happyShift action_162
action_244 _ = happyReduce_138

action_245 (43) = happyShift action_141
action_245 (44) = happyShift action_142
action_245 (45) = happyShift action_143
action_245 (46) = happyShift action_144
action_245 (47) = happyShift action_145
action_245 _ = happyFail (happyExpListPerState 245)

action_246 (43) = happyShift action_124
action_246 (44) = happyShift action_125
action_246 (45) = happyShift action_126
action_246 (46) = happyShift action_127
action_246 (47) = happyShift action_128
action_246 _ = happyReduce_140

action_247 (43) = happyShift action_158
action_247 (44) = happyShift action_159
action_247 (45) = happyShift action_160
action_247 (46) = happyShift action_161
action_247 (47) = happyShift action_162
action_247 _ = happyReduce_146

action_248 (43) = happyShift action_124
action_248 (44) = happyShift action_125
action_248 (45) = happyShift action_126
action_248 (46) = happyShift action_127
action_248 (47) = happyShift action_128
action_248 _ = happyReduce_148

action_249 _ = happyReduce_163

action_250 _ = happyReduce_165

action_251 _ = happyReduce_167

action_252 _ = happyReduce_155

action_253 _ = happyReduce_172

action_254 (43) = happyShift action_158
action_254 (44) = happyShift action_159
action_254 (45) = happyShift action_160
action_254 (46) = happyShift action_161
action_254 (47) = happyShift action_162
action_254 (49) = happyShift action_257
action_254 _ = happyFail (happyExpListPerState 254)

action_255 (43) = happyShift action_124
action_255 (44) = happyShift action_125
action_255 (45) = happyShift action_126
action_255 (46) = happyShift action_127
action_255 (47) = happyShift action_128
action_255 _ = happyFail (happyExpListPerState 255)

action_256 _ = happyReduce_179

action_257 _ = happyReduce_113

action_258 (41) = happyShift action_151
action_258 (63) = happyShift action_153
action_258 _ = happyReduce_133

action_259 (39) = happyShift action_138
action_259 (40) = happyShift action_139
action_259 (41) = happyShift action_140
action_259 (43) = happyShift action_141
action_259 (44) = happyShift action_142
action_259 (45) = happyShift action_143
action_259 (46) = happyShift action_144
action_259 (47) = happyShift action_145
action_259 (63) = happyShift action_146
action_259 _ = happyReduce_131

action_260 (39) = happyShift action_121
action_260 (40) = happyShift action_122
action_260 (41) = happyShift action_123
action_260 (43) = happyShift action_124
action_260 (44) = happyShift action_125
action_260 (45) = happyShift action_126
action_260 (46) = happyShift action_127
action_260 (47) = happyShift action_128
action_260 (63) = happyShift action_129
action_260 (64) = happyShift action_130
action_260 _ = happyReduce_135

action_261 (41) = happyShift action_151
action_261 _ = happyReduce_125

action_262 (39) = happyShift action_138
action_262 (40) = happyShift action_139
action_262 (41) = happyShift action_140
action_262 (43) = happyShift action_141
action_262 (44) = happyShift action_142
action_262 (45) = happyShift action_143
action_262 (46) = happyShift action_144
action_262 (47) = happyShift action_145
action_262 _ = happyReduce_123

action_263 (39) = happyShift action_121
action_263 (40) = happyShift action_122
action_263 (41) = happyShift action_123
action_263 (43) = happyShift action_124
action_263 (44) = happyShift action_125
action_263 (45) = happyShift action_126
action_263 (46) = happyShift action_127
action_263 (47) = happyShift action_128
action_263 (63) = happyShift action_129
action_263 (64) = happyShift action_130
action_263 _ = happyReduce_127

action_264 _ = happyReduce_110

action_265 _ = happyReduce_108

action_266 (43) = happyShift action_124
action_266 (44) = happyShift action_125
action_266 (45) = happyShift action_126
action_266 (46) = happyShift action_127
action_266 (47) = happyShift action_128
action_266 _ = happyReduce_112

action_267 (47) = happyShift action_162
action_267 _ = happyReduce_101

action_268 (47) = happyShift action_145
action_268 _ = happyReduce_99

action_269 (43) = happyShift action_124
action_269 (44) = happyShift action_125
action_269 (45) = happyShift action_126
action_269 (46) = happyShift action_127
action_269 (47) = happyShift action_128
action_269 _ = happyReduce_103

action_270 (47) = happyShift action_162
action_270 _ = happyReduce_92

action_271 (47) = happyShift action_145
action_271 _ = happyReduce_90

action_272 (43) = happyShift action_124
action_272 (44) = happyShift action_125
action_272 (45) = happyShift action_126
action_272 (46) = happyShift action_127
action_272 (47) = happyShift action_128
action_272 _ = happyReduce_94

action_273 (45) = happyShift action_160
action_273 (46) = happyShift action_161
action_273 (47) = happyShift action_162
action_273 _ = happyReduce_83

action_274 (45) = happyShift action_143
action_274 (46) = happyShift action_144
action_274 (47) = happyShift action_145
action_274 _ = happyReduce_81

action_275 (43) = happyShift action_124
action_275 (44) = happyShift action_125
action_275 (45) = happyShift action_126
action_275 (46) = happyShift action_127
action_275 (47) = happyShift action_128
action_275 _ = happyReduce_85

action_276 (45) = happyShift action_160
action_276 (46) = happyShift action_161
action_276 (47) = happyShift action_162
action_276 _ = happyReduce_74

action_277 (45) = happyShift action_143
action_277 (46) = happyShift action_144
action_277 (47) = happyShift action_145
action_277 _ = happyReduce_72

action_278 (43) = happyShift action_124
action_278 (44) = happyShift action_125
action_278 (45) = happyShift action_126
action_278 (46) = happyShift action_127
action_278 (47) = happyShift action_128
action_278 _ = happyReduce_76

action_279 (39) = happyShift action_155
action_279 (40) = happyShift action_156
action_279 (43) = happyShift action_158
action_279 (44) = happyShift action_159
action_279 (45) = happyShift action_160
action_279 (46) = happyShift action_161
action_279 (47) = happyShift action_162
action_279 _ = happyReduce_174

action_280 _ = happyReduce_175

action_281 _ = happyReduce_176

action_282 (39) = happyShift action_138
action_282 (40) = happyShift action_139
action_282 (43) = happyShift action_141
action_282 (44) = happyShift action_142
action_282 (45) = happyShift action_143
action_282 (46) = happyShift action_144
action_282 (47) = happyShift action_145
action_282 _ = happyReduce_173

action_283 _ = happyReduce_177

action_284 (39) = happyShift action_121
action_284 (40) = happyShift action_122
action_284 (41) = happyShift action_123
action_284 (43) = happyShift action_124
action_284 (44) = happyShift action_125
action_284 (45) = happyShift action_126
action_284 (46) = happyShift action_127
action_284 (47) = happyShift action_128
action_284 (63) = happyShift action_129
action_284 (64) = happyShift action_130
action_284 _ = happyReduce_178

action_285 (43) = happyShift action_158
action_285 (44) = happyShift action_159
action_285 (45) = happyShift action_160
action_285 (46) = happyShift action_161
action_285 (47) = happyShift action_162
action_285 _ = happyReduce_141

action_286 (43) = happyShift action_141
action_286 (44) = happyShift action_142
action_286 (45) = happyShift action_143
action_286 (46) = happyShift action_144
action_286 (47) = happyShift action_145
action_286 _ = happyReduce_139

action_287 (43) = happyShift action_124
action_287 (44) = happyShift action_125
action_287 (45) = happyShift action_126
action_287 (46) = happyShift action_127
action_287 (47) = happyShift action_128
action_287 _ = happyReduce_143

action_288 (43) = happyShift action_158
action_288 (44) = happyShift action_159
action_288 (45) = happyShift action_160
action_288 (46) = happyShift action_161
action_288 (47) = happyShift action_162
action_288 _ = happyReduce_149

action_289 (43) = happyShift action_141
action_289 (44) = happyShift action_142
action_289 (45) = happyShift action_143
action_289 (46) = happyShift action_144
action_289 (47) = happyShift action_145
action_289 _ = happyReduce_147

action_290 (43) = happyShift action_124
action_290 (44) = happyShift action_125
action_290 (45) = happyShift action_126
action_290 (46) = happyShift action_127
action_290 (47) = happyShift action_128
action_290 _ = happyReduce_151

action_291 (49) = happyShift action_303
action_291 _ = happyFail (happyExpListPerState 291)

action_292 (49) = happyShift action_302
action_292 _ = happyFail (happyExpListPerState 292)

action_293 (30) = happyShift action_301
action_293 _ = happyFail (happyExpListPerState 293)

action_294 _ = happyReduce_33

action_295 (50) = happyShift action_299
action_295 (57) = happyShift action_300
action_295 (20) = happyGoto action_298
action_295 _ = happyFail (happyExpListPerState 295)

action_296 (30) = happyShift action_297
action_296 _ = happyFail (happyExpListPerState 296)

action_297 (50) = happyShift action_299
action_297 (57) = happyShift action_300
action_297 (20) = happyGoto action_343
action_297 _ = happyFail (happyExpListPerState 297)

action_298 (49) = happyShift action_342
action_298 _ = happyFail (happyExpListPerState 298)

action_299 (31) = happyShift action_79
action_299 (32) = happyShift action_45
action_299 (33) = happyShift action_46
action_299 (34) = happyShift action_47
action_299 (35) = happyShift action_80
action_299 (36) = happyShift action_81
action_299 (44) = happyShift action_82
action_299 (48) = happyShift action_107
action_299 (52) = happyShift action_84
action_299 (65) = happyShift action_85
action_299 (66) = happyShift action_61
action_299 (68) = happyShift action_86
action_299 (69) = happyShift action_87
action_299 (19) = happyGoto action_340
action_299 (21) = happyGoto action_341
action_299 (22) = happyGoto action_312
action_299 (23) = happyGoto action_313
action_299 (24) = happyGoto action_314
action_299 (26) = happyGoto action_103
action_299 (27) = happyGoto action_104
action_299 (28) = happyGoto action_105
action_299 (29) = happyGoto action_315
action_299 _ = happyFail (happyExpListPerState 299)

action_300 _ = happyReduce_64

action_301 (34) = happyShift action_47
action_301 (52) = happyShift action_339
action_301 (66) = happyShift action_61
action_301 (28) = happyGoto action_337
action_301 (29) = happyGoto action_338
action_301 _ = happyFail (happyExpListPerState 301)

action_302 _ = happyReduce_118

action_303 _ = happyReduce_119

action_304 (56) = happyShift action_336
action_304 _ = happyFail (happyExpListPerState 304)

action_305 (30) = happyShift action_335
action_305 _ = happyFail (happyExpListPerState 305)

action_306 (30) = happyShift action_334
action_306 _ = happyFail (happyExpListPerState 306)

action_307 (30) = happyShift action_333
action_307 _ = happyFail (happyExpListPerState 307)

action_308 (30) = happyShift action_332
action_308 _ = happyFail (happyExpListPerState 308)

action_309 _ = happyReduce_16

action_310 (50) = happyShift action_23
action_310 (53) = happyShift action_24
action_310 (15) = happyGoto action_331
action_310 _ = happyFail (happyExpListPerState 310)

action_311 (49) = happyShift action_330
action_311 _ = happyFail (happyExpListPerState 311)

action_312 (39) = happyShift action_155
action_312 (40) = happyShift action_156
action_312 (41) = happyShift action_157
action_312 (43) = happyShift action_158
action_312 (44) = happyShift action_159
action_312 (45) = happyShift action_160
action_312 (46) = happyShift action_161
action_312 (47) = happyShift action_162
action_312 _ = happyReduce_60

action_313 (41) = happyShift action_151
action_313 (63) = happyShift action_153
action_313 (64) = happyShift action_154
action_313 _ = happyReduce_61

action_314 (41) = happyShift action_150
action_314 _ = happyReduce_62

action_315 (41) = happyShift action_137
action_315 _ = happyReduce_63

action_316 (49) = happyShift action_329
action_316 _ = happyReduce_191

action_317 (49) = happyShift action_328
action_317 _ = happyFail (happyExpListPerState 317)

action_318 (49) = happyShift action_327
action_318 _ = happyReduce_191

action_319 (49) = happyShift action_326
action_319 _ = happyFail (happyExpListPerState 319)

action_320 (49) = happyShift action_325
action_320 _ = happyReduce_191

action_321 (49) = happyShift action_324
action_321 _ = happyFail (happyExpListPerState 321)

action_322 (49) = happyShift action_323
action_322 _ = happyReduce_191

action_323 _ = happyReduce_25

action_324 _ = happyReduce_24

action_325 _ = happyReduce_23

action_326 _ = happyReduce_19

action_327 _ = happyReduce_22

action_328 _ = happyReduce_20

action_329 _ = happyReduce_21

action_330 _ = happyReduce_18

action_331 _ = happyReduce_17

action_332 (31) = happyShift action_79
action_332 (32) = happyShift action_45
action_332 (33) = happyShift action_46
action_332 (34) = happyShift action_358
action_332 (35) = happyShift action_80
action_332 (36) = happyShift action_81
action_332 (44) = happyShift action_82
action_332 (48) = happyShift action_107
action_332 (52) = happyShift action_84
action_332 (65) = happyShift action_85
action_332 (66) = happyShift action_61
action_332 (68) = happyShift action_86
action_332 (69) = happyShift action_87
action_332 (19) = happyGoto action_357
action_332 (22) = happyGoto action_312
action_332 (23) = happyGoto action_313
action_332 (24) = happyGoto action_314
action_332 (26) = happyGoto action_103
action_332 (27) = happyGoto action_104
action_332 (28) = happyGoto action_105
action_332 (29) = happyGoto action_315
action_332 _ = happyFail (happyExpListPerState 332)

action_333 (31) = happyShift action_79
action_333 (32) = happyShift action_45
action_333 (33) = happyShift action_46
action_333 (34) = happyShift action_356
action_333 (35) = happyShift action_80
action_333 (36) = happyShift action_81
action_333 (44) = happyShift action_82
action_333 (48) = happyShift action_107
action_333 (52) = happyShift action_84
action_333 (65) = happyShift action_85
action_333 (66) = happyShift action_61
action_333 (68) = happyShift action_86
action_333 (69) = happyShift action_87
action_333 (19) = happyGoto action_355
action_333 (22) = happyGoto action_312
action_333 (23) = happyGoto action_313
action_333 (24) = happyGoto action_314
action_333 (26) = happyGoto action_103
action_333 (27) = happyGoto action_104
action_333 (28) = happyGoto action_105
action_333 (29) = happyGoto action_315
action_333 _ = happyFail (happyExpListPerState 333)

action_334 (31) = happyShift action_79
action_334 (32) = happyShift action_45
action_334 (33) = happyShift action_46
action_334 (34) = happyShift action_354
action_334 (35) = happyShift action_80
action_334 (36) = happyShift action_81
action_334 (44) = happyShift action_82
action_334 (48) = happyShift action_107
action_334 (52) = happyShift action_84
action_334 (65) = happyShift action_85
action_334 (66) = happyShift action_61
action_334 (68) = happyShift action_86
action_334 (69) = happyShift action_87
action_334 (19) = happyGoto action_353
action_334 (22) = happyGoto action_312
action_334 (23) = happyGoto action_313
action_334 (24) = happyGoto action_314
action_334 (26) = happyGoto action_103
action_334 (27) = happyGoto action_104
action_334 (28) = happyGoto action_105
action_334 (29) = happyGoto action_315
action_334 _ = happyFail (happyExpListPerState 334)

action_335 (31) = happyShift action_79
action_335 (32) = happyShift action_45
action_335 (33) = happyShift action_46
action_335 (34) = happyShift action_352
action_335 (35) = happyShift action_80
action_335 (36) = happyShift action_81
action_335 (44) = happyShift action_82
action_335 (48) = happyShift action_107
action_335 (52) = happyShift action_84
action_335 (65) = happyShift action_85
action_335 (66) = happyShift action_61
action_335 (68) = happyShift action_86
action_335 (69) = happyShift action_87
action_335 (19) = happyGoto action_351
action_335 (22) = happyGoto action_312
action_335 (23) = happyGoto action_313
action_335 (24) = happyGoto action_314
action_335 (26) = happyGoto action_103
action_335 (27) = happyGoto action_104
action_335 (28) = happyGoto action_105
action_335 (29) = happyGoto action_315
action_335 _ = happyFail (happyExpListPerState 335)

action_336 (32) = happyShift action_45
action_336 (33) = happyShift action_46
action_336 (34) = happyShift action_47
action_336 (48) = happyShift action_48
action_336 (67) = happyShift action_49
action_336 (17) = happyGoto action_350
action_336 (18) = happyGoto action_41
action_336 (26) = happyGoto action_42
action_336 (27) = happyGoto action_43
action_336 (28) = happyGoto action_44
action_336 _ = happyFail (happyExpListPerState 336)

action_337 (49) = happyShift action_349
action_337 _ = happyFail (happyExpListPerState 337)

action_338 (49) = happyShift action_348
action_338 _ = happyFail (happyExpListPerState 338)

action_339 (49) = happyShift action_347
action_339 _ = happyFail (happyExpListPerState 339)

action_340 (30) = happyShift action_346
action_340 _ = happyReduce_66

action_341 (51) = happyShift action_345
action_341 _ = happyFail (happyExpListPerState 341)

action_342 _ = happyReduce_26

action_343 (49) = happyShift action_344
action_343 _ = happyFail (happyExpListPerState 343)

action_344 (30) = happyShift action_368
action_344 _ = happyReduce_28

action_345 _ = happyReduce_65

action_346 (31) = happyShift action_79
action_346 (32) = happyShift action_45
action_346 (33) = happyShift action_46
action_346 (34) = happyShift action_47
action_346 (35) = happyShift action_80
action_346 (36) = happyShift action_81
action_346 (44) = happyShift action_82
action_346 (48) = happyShift action_107
action_346 (52) = happyShift action_84
action_346 (65) = happyShift action_85
action_346 (66) = happyShift action_61
action_346 (68) = happyShift action_86
action_346 (69) = happyShift action_87
action_346 (19) = happyGoto action_340
action_346 (21) = happyGoto action_367
action_346 (22) = happyGoto action_312
action_346 (23) = happyGoto action_313
action_346 (24) = happyGoto action_314
action_346 (26) = happyGoto action_103
action_346 (27) = happyGoto action_104
action_346 (28) = happyGoto action_105
action_346 (29) = happyGoto action_315
action_346 _ = happyFail (happyExpListPerState 346)

action_347 _ = happyReduce_182

action_348 _ = happyReduce_183

action_349 _ = happyReduce_184

action_350 _ = happyReduce_44

action_351 (49) = happyShift action_366
action_351 _ = happyFail (happyExpListPerState 351)

action_352 (49) = happyShift action_365
action_352 _ = happyReduce_191

action_353 (49) = happyShift action_364
action_353 _ = happyFail (happyExpListPerState 353)

action_354 (49) = happyShift action_363
action_354 _ = happyReduce_191

action_355 (49) = happyShift action_362
action_355 _ = happyFail (happyExpListPerState 355)

action_356 (49) = happyShift action_361
action_356 _ = happyReduce_191

action_357 (49) = happyShift action_360
action_357 _ = happyFail (happyExpListPerState 357)

action_358 (49) = happyShift action_359
action_358 _ = happyReduce_191

action_359 _ = happyReduce_58

action_360 _ = happyReduce_57

action_361 _ = happyReduce_56

action_362 _ = happyReduce_52

action_363 _ = happyReduce_55

action_364 _ = happyReduce_53

action_365 _ = happyReduce_54

action_366 _ = happyReduce_51

action_367 _ = happyReduce_67

action_368 (48) = happyShift action_36
action_368 (11) = happyGoto action_369
action_368 _ = happyFail (happyExpListPerState 368)

action_369 _ = happyReduce_29

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

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (NewQuery happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (WhereQuery happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (FuncStack happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (FuncStackSeq happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (UVarEnv happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  7 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (VarEnv happy_var_1 happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  8 happyReduction_9
happyReduction_9 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (IntVar happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (StringVar happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (BoolVar happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 (HappyAbsSyn29  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (UrlVar happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  9 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Filter happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 9 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Map happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Union happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 7 9 happyReduction_16
happyReduction_16 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (NormalJoin happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 8 9 happyReduction_17
happyReduction_17 ((HappyAbsSyn15  happy_var_8) `HappyStk`
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

happyReduce_18 = happyReduce 8 9 happyReduction_18
happyReduction_18 (_ `HappyStk`
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

happyReduce_19 = happyReduce 8 9 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTripPO happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 8 9 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTripSO happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 8 9 happyReduction_21
happyReduction_21 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTripSP happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 8 9 happyReduction_22
happyReduction_22 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTripS happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 8 9 happyReduction_23
happyReduction_23 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTripP happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 8 9 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTripO happy_var_7
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 8 9 happyReduction_25
happyReduction_25 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AddTrip
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 7 10 happyReduction_26
happyReduction_26 (_ `HappyStk`
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

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TTLCombs happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 7 11 happyReduction_28
happyReduction_28 (_ `HappyStk`
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

happyReduce_29 = happyReduce 9 11 happyReduction_29
happyReduction_29 ((HappyAbsSyn11  happy_var_9) `HappyStk`
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

happyReduce_30 = happySpecReduce_1  12 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn12
		 (Any
	)

happyReduce_31 = happySpecReduce_3  12 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (FilteredList happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  13 happyReduction_32
happyReduction_32 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn13
		 (SimpleUrl happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  13 happyReduction_33
happyReduction_33 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn13
		 (UrlSeq happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  14 happyReduction_34
happyReduction_34 _
	_
	 =  HappyAbsSyn14
		 (BidirectJoin
	)

happyReduce_35 = happySpecReduce_2  14 happyReduction_35
happyReduction_35 _
	_
	 =  HappyAbsSyn14
		 (BidirectJoin
	)

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn14
		 (LeftJoin
	)

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn14
		 (RightJoin
	)

happyReduce_38 = happySpecReduce_3  15 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (StrList happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn15
		 (StrListSingle happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  16 happyReduction_40
happyReduction_40 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn16
		 (SListEl happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  16 happyReduction_41
happyReduction_41 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn16
		 (SListSeq happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (Always happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  17 happyReduction_43
happyReduction_43 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (ActionSeq happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happyReduce 7 17 happyReduction_44
happyReduction_44 ((HappyAbsSyn17  happy_var_7) `HappyStk`
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

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignSubj happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  18 happyReduction_46
happyReduction_46 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignPred happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjUrl happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  18 happyReduction_48
happyReduction_48 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjStr happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  18 happyReduction_49
happyReduction_49 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjInt happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  18 happyReduction_50
happyReduction_50 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjBool happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happyReduce 8 18 happyReduction_51
happyReduction_51 (_ `HappyStk`
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

happyReduce_52 = happyReduce 8 18 happyReduction_52
happyReduction_52 (_ `HappyStk`
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

happyReduce_53 = happyReduce 8 18 happyReduction_53
happyReduction_53 (_ `HappyStk`
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

happyReduce_54 = happyReduce 8 18 happyReduction_54
happyReduction_54 (_ `HappyStk`
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

happyReduce_55 = happyReduce 8 18 happyReduction_55
happyReduction_55 (_ `HappyStk`
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

happyReduce_56 = happyReduce 8 18 happyReduction_56
happyReduction_56 (_ `HappyStk`
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

happyReduce_57 = happyReduce 8 18 happyReduction_57
happyReduction_57 (_ `HappyStk`
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

happyReduce_58 = happyReduce 8 18 happyReduction_58
happyReduction_58 (_ `HappyStk`
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

happyReduce_59 = happySpecReduce_3  18 happyReduction_59
happyReduction_59 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  19 happyReduction_60
happyReduction_60 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 (IntLit happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  19 happyReduction_61
happyReduction_61 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn19
		 (BoolLit happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  19 happyReduction_62
happyReduction_62 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (StrLit happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  19 happyReduction_63
happyReduction_63 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn19
		 (UrlLit happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  20 happyReduction_64
happyReduction_64 _
	 =  HappyAbsSyn20
		 (AnyLit
	)

happyReduce_65 = happySpecReduce_3  20 happyReduction_65
happyReduction_65 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (LiteralLst happy_var_2
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  21 happyReduction_66
happyReduction_66 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (SingleLit happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  21 happyReduction_67
happyReduction_67 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  22 happyReduction_68
happyReduction_68 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  22 happyReduction_69
happyReduction_69 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  22 happyReduction_70
happyReduction_70 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  22 happyReduction_71
happyReduction_71 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  22 happyReduction_72
happyReduction_72 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVO happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  22 happyReduction_73
happyReduction_73 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOV happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  22 happyReduction_74
happyReduction_74 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVI happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  22 happyReduction_75
happyReduction_75 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIV happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  22 happyReduction_76
happyReduction_76 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVV happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  22 happyReduction_77
happyReduction_77 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  22 happyReduction_78
happyReduction_78 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  22 happyReduction_79
happyReduction_79 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  22 happyReduction_80
happyReduction_80 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  22 happyReduction_81
happyReduction_81 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVO happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  22 happyReduction_82
happyReduction_82 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOV happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  22 happyReduction_83
happyReduction_83 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVI happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  22 happyReduction_84
happyReduction_84 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIV happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  22 happyReduction_85
happyReduction_85 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVV happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  22 happyReduction_86
happyReduction_86 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  22 happyReduction_87
happyReduction_87 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  22 happyReduction_88
happyReduction_88 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  22 happyReduction_89
happyReduction_89 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  22 happyReduction_90
happyReduction_90 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVO happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  22 happyReduction_91
happyReduction_91 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOV happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  22 happyReduction_92
happyReduction_92 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVI happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  22 happyReduction_93
happyReduction_93 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIV happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  22 happyReduction_94
happyReduction_94 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVV happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  22 happyReduction_95
happyReduction_95 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  22 happyReduction_96
happyReduction_96 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  22 happyReduction_97
happyReduction_97 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  22 happyReduction_98
happyReduction_98 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  22 happyReduction_99
happyReduction_99 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVO happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  22 happyReduction_100
happyReduction_100 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOV happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  22 happyReduction_101
happyReduction_101 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVI happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  22 happyReduction_102
happyReduction_102 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIV happy_var_1 happy_var_3
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_3  22 happyReduction_103
happyReduction_103 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVV happy_var_1 happy_var_3
	)
happyReduction_103 _ _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_3  22 happyReduction_104
happyReduction_104 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_104 _ _ _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_3  22 happyReduction_105
happyReduction_105 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_105 _ _ _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_3  22 happyReduction_106
happyReduction_106 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_106 _ _ _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_3  22 happyReduction_107
happyReduction_107 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_107 _ _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_3  22 happyReduction_108
happyReduction_108 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVO happy_var_1 happy_var_3
	)
happyReduction_108 _ _ _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_3  22 happyReduction_109
happyReduction_109 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOV happy_var_1 happy_var_3
	)
happyReduction_109 _ _ _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_3  22 happyReduction_110
happyReduction_110 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVI happy_var_1 happy_var_3
	)
happyReduction_110 _ _ _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_3  22 happyReduction_111
happyReduction_111 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIV happy_var_1 happy_var_3
	)
happyReduction_111 _ _ _  = notHappyAtAll 

happyReduce_112 = happySpecReduce_3  22 happyReduction_112
happyReduction_112 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVV happy_var_1 happy_var_3
	)
happyReduction_112 _ _ _  = notHappyAtAll 

happyReduce_113 = happySpecReduce_3  22 happyReduction_113
happyReduction_113 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (happy_var_2
	)
happyReduction_113 _ _ _  = notHappyAtAll 

happyReduce_114 = happySpecReduce_2  22 happyReduction_114
happyReduction_114 (HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateI happy_var_2
	)
happyReduction_114 _ _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_2  22 happyReduction_115
happyReduction_115 (HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateO happy_var_2
	)
happyReduction_115 _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_2  22 happyReduction_116
happyReduction_116 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn22
		 (NegateV happy_var_2
	)
happyReduction_116 _ _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_1  22 happyReduction_117
happyReduction_117 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn22
		 (QInt happy_var_1
	)
happyReduction_117 _  = notHappyAtAll 

happyReduce_118 = happyReduce 4 22 happyReduction_118
happyReduction_118 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Length happy_var_3
	) `HappyStk` happyRest

happyReduce_119 = happyReduce 4 22 happyReduction_119
happyReduction_119 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (LengthObj
	) `HappyStk` happyRest

happyReduce_120 = happySpecReduce_3  23 happyReduction_120
happyReduction_120 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (And happy_var_1 happy_var_3
	)
happyReduction_120 _ _ _  = notHappyAtAll 

happyReduce_121 = happySpecReduce_3  23 happyReduction_121
happyReduction_121 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_121 _ _ _  = notHappyAtAll 

happyReduce_122 = happySpecReduce_3  23 happyReduction_122
happyReduction_122 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_122 _ _ _  = notHappyAtAll 

happyReduce_123 = happySpecReduce_3  23 happyReduction_123
happyReduction_123 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVO happy_var_1 happy_var_3
	)
happyReduction_123 _ _ _  = notHappyAtAll 

happyReduce_124 = happySpecReduce_3  23 happyReduction_124
happyReduction_124 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOV happy_var_1 happy_var_3
	)
happyReduction_124 _ _ _  = notHappyAtAll 

happyReduce_125 = happySpecReduce_3  23 happyReduction_125
happyReduction_125 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVB happy_var_1 happy_var_3
	)
happyReduction_125 _ _ _  = notHappyAtAll 

happyReduce_126 = happySpecReduce_3  23 happyReduction_126
happyReduction_126 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndBV happy_var_1 happy_var_3
	)
happyReduction_126 _ _ _  = notHappyAtAll 

happyReduce_127 = happySpecReduce_3  23 happyReduction_127
happyReduction_127 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVV happy_var_1 happy_var_3
	)
happyReduction_127 _ _ _  = notHappyAtAll 

happyReduce_128 = happySpecReduce_3  23 happyReduction_128
happyReduction_128 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (Or happy_var_1 happy_var_3
	)
happyReduction_128 _ _ _  = notHappyAtAll 

happyReduce_129 = happySpecReduce_3  23 happyReduction_129
happyReduction_129 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_129 _ _ _  = notHappyAtAll 

happyReduce_130 = happySpecReduce_3  23 happyReduction_130
happyReduction_130 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_130 _ _ _  = notHappyAtAll 

happyReduce_131 = happySpecReduce_3  23 happyReduction_131
happyReduction_131 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVO happy_var_1 happy_var_3
	)
happyReduction_131 _ _ _  = notHappyAtAll 

happyReduce_132 = happySpecReduce_3  23 happyReduction_132
happyReduction_132 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOV happy_var_1 happy_var_3
	)
happyReduction_132 _ _ _  = notHappyAtAll 

happyReduce_133 = happySpecReduce_3  23 happyReduction_133
happyReduction_133 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVB happy_var_1 happy_var_3
	)
happyReduction_133 _ _ _  = notHappyAtAll 

happyReduce_134 = happySpecReduce_3  23 happyReduction_134
happyReduction_134 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrBV happy_var_1 happy_var_3
	)
happyReduction_134 _ _ _  = notHappyAtAll 

happyReduce_135 = happySpecReduce_3  23 happyReduction_135
happyReduction_135 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVV happy_var_1 happy_var_3
	)
happyReduction_135 _ _ _  = notHappyAtAll 

happyReduce_136 = happySpecReduce_3  23 happyReduction_136
happyReduction_136 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_136 _ _ _  = notHappyAtAll 

happyReduce_137 = happySpecReduce_3  23 happyReduction_137
happyReduction_137 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_137 _ _ _  = notHappyAtAll 

happyReduce_138 = happySpecReduce_3  23 happyReduction_138
happyReduction_138 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_138 _ _ _  = notHappyAtAll 

happyReduce_139 = happySpecReduce_3  23 happyReduction_139
happyReduction_139 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVO happy_var_1 happy_var_3
	)
happyReduction_139 _ _ _  = notHappyAtAll 

happyReduce_140 = happySpecReduce_3  23 happyReduction_140
happyReduction_140 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOV happy_var_1 happy_var_3
	)
happyReduction_140 _ _ _  = notHappyAtAll 

happyReduce_141 = happySpecReduce_3  23 happyReduction_141
happyReduction_141 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVI happy_var_1 happy_var_3
	)
happyReduction_141 _ _ _  = notHappyAtAll 

happyReduce_142 = happySpecReduce_3  23 happyReduction_142
happyReduction_142 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIV happy_var_1 happy_var_3
	)
happyReduction_142 _ _ _  = notHappyAtAll 

happyReduce_143 = happySpecReduce_3  23 happyReduction_143
happyReduction_143 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVV happy_var_1 happy_var_3
	)
happyReduction_143 _ _ _  = notHappyAtAll 

happyReduce_144 = happySpecReduce_3  23 happyReduction_144
happyReduction_144 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_144 _ _ _  = notHappyAtAll 

happyReduce_145 = happySpecReduce_3  23 happyReduction_145
happyReduction_145 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_145 _ _ _  = notHappyAtAll 

happyReduce_146 = happySpecReduce_3  23 happyReduction_146
happyReduction_146 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_146 _ _ _  = notHappyAtAll 

happyReduce_147 = happySpecReduce_3  23 happyReduction_147
happyReduction_147 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVO happy_var_1 happy_var_3
	)
happyReduction_147 _ _ _  = notHappyAtAll 

happyReduce_148 = happySpecReduce_3  23 happyReduction_148
happyReduction_148 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOV happy_var_1 happy_var_3
	)
happyReduction_148 _ _ _  = notHappyAtAll 

happyReduce_149 = happySpecReduce_3  23 happyReduction_149
happyReduction_149 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVI happy_var_1 happy_var_3
	)
happyReduction_149 _ _ _  = notHappyAtAll 

happyReduce_150 = happySpecReduce_3  23 happyReduction_150
happyReduction_150 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIV happy_var_1 happy_var_3
	)
happyReduction_150 _ _ _  = notHappyAtAll 

happyReduce_151 = happySpecReduce_3  23 happyReduction_151
happyReduction_151 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVV happy_var_1 happy_var_3
	)
happyReduction_151 _ _ _  = notHappyAtAll 

happyReduce_152 = happySpecReduce_3  23 happyReduction_152
happyReduction_152 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_152 _ _ _  = notHappyAtAll 

happyReduce_153 = happySpecReduce_3  23 happyReduction_153
happyReduction_153 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_153 _ _ _  = notHappyAtAll 

happyReduce_154 = happySpecReduce_3  23 happyReduction_154
happyReduction_154 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_154 _ _ _  = notHappyAtAll 

happyReduce_155 = happySpecReduce_3  23 happyReduction_155
happyReduction_155 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_155 _ _ _  = notHappyAtAll 

happyReduce_156 = happySpecReduce_3  23 happyReduction_156
happyReduction_156 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_156 _ _ _  = notHappyAtAll 

happyReduce_157 = happySpecReduce_3  23 happyReduction_157
happyReduction_157 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_157 _ _ _  = notHappyAtAll 

happyReduce_158 = happySpecReduce_3  23 happyReduction_158
happyReduction_158 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_158 _ _ _  = notHappyAtAll 

happyReduce_159 = happySpecReduce_3  23 happyReduction_159
happyReduction_159 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_159 _ _ _  = notHappyAtAll 

happyReduce_160 = happySpecReduce_3  23 happyReduction_160
happyReduction_160 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_160 _ _ _  = notHappyAtAll 

happyReduce_161 = happySpecReduce_3  23 happyReduction_161
happyReduction_161 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_161 _ _ _  = notHappyAtAll 

happyReduce_162 = happySpecReduce_3  23 happyReduction_162
happyReduction_162 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQSU happy_var_3
	)
happyReduction_162 _ _ _  = notHappyAtAll 

happyReduce_163 = happySpecReduce_3  23 happyReduction_163
happyReduction_163 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUS happy_var_1
	)
happyReduction_163 _ _ _  = notHappyAtAll 

happyReduce_164 = happySpecReduce_3  23 happyReduction_164
happyReduction_164 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQPU happy_var_3
	)
happyReduction_164 _ _ _  = notHappyAtAll 

happyReduce_165 = happySpecReduce_3  23 happyReduction_165
happyReduction_165 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUP happy_var_1
	)
happyReduction_165 _ _ _  = notHappyAtAll 

happyReduce_166 = happySpecReduce_3  23 happyReduction_166
happyReduction_166 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQOU happy_var_3
	)
happyReduction_166 _ _ _  = notHappyAtAll 

happyReduce_167 = happySpecReduce_3  23 happyReduction_167
happyReduction_167 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUO happy_var_1
	)
happyReduction_167 _ _ _  = notHappyAtAll 

happyReduce_168 = happySpecReduce_3  23 happyReduction_168
happyReduction_168 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOV happy_var_1 happy_var_3
	)
happyReduction_168 _ _ _  = notHappyAtAll 

happyReduce_169 = happySpecReduce_3  23 happyReduction_169
happyReduction_169 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIV happy_var_1 happy_var_3
	)
happyReduction_169 _ _ _  = notHappyAtAll 

happyReduce_170 = happySpecReduce_3  23 happyReduction_170
happyReduction_170 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBV happy_var_1 happy_var_3
	)
happyReduction_170 _ _ _  = notHappyAtAll 

happyReduce_171 = happySpecReduce_3  23 happyReduction_171
happyReduction_171 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSV happy_var_1 happy_var_3
	)
happyReduction_171 _ _ _  = notHappyAtAll 

happyReduce_172 = happySpecReduce_3  23 happyReduction_172
happyReduction_172 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUV happy_var_1 happy_var_3
	)
happyReduction_172 _ _ _  = notHappyAtAll 

happyReduce_173 = happySpecReduce_3  23 happyReduction_173
happyReduction_173 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVO happy_var_1 happy_var_3
	)
happyReduction_173 _ _ _  = notHappyAtAll 

happyReduce_174 = happySpecReduce_3  23 happyReduction_174
happyReduction_174 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVI happy_var_1 happy_var_3
	)
happyReduction_174 _ _ _  = notHappyAtAll 

happyReduce_175 = happySpecReduce_3  23 happyReduction_175
happyReduction_175 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVB happy_var_1 happy_var_3
	)
happyReduction_175 _ _ _  = notHappyAtAll 

happyReduce_176 = happySpecReduce_3  23 happyReduction_176
happyReduction_176 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVS happy_var_1 happy_var_3
	)
happyReduction_176 _ _ _  = notHappyAtAll 

happyReduce_177 = happySpecReduce_3  23 happyReduction_177
happyReduction_177 (HappyAbsSyn29  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVU happy_var_1 happy_var_3
	)
happyReduction_177 _ _ _  = notHappyAtAll 

happyReduce_178 = happySpecReduce_3  23 happyReduction_178
happyReduction_178 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVV happy_var_1 happy_var_3
	)
happyReduction_178 _ _ _  = notHappyAtAll 

happyReduce_179 = happySpecReduce_3  23 happyReduction_179
happyReduction_179 _
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (happy_var_2
	)
happyReduction_179 _ _ _  = notHappyAtAll 

happyReduce_180 = happySpecReduce_1  23 happyReduction_180
happyReduction_180 _
	 =  HappyAbsSyn23
		 (QTrue
	)

happyReduce_181 = happySpecReduce_1  23 happyReduction_181
happyReduction_181 _
	 =  HappyAbsSyn23
		 (QFalse
	)

happyReduce_182 = happyReduce 6 23 happyReduction_182
happyReduction_182 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithStr happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_183 = happyReduce 6 23 happyReduction_183
happyReduction_183 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithUrl happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_184 = happyReduce 6 23 happyReduction_184
happyReduction_184 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithObj happy_var_3
	) `HappyStk` happyRest

happyReduce_185 = happySpecReduce_1  24 happyReduction_185
happyReduction_185 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn24
		 (QString happy_var_1
	)
happyReduction_185 _  = notHappyAtAll 

happyReduce_186 = happySpecReduce_1  25 happyReduction_186
happyReduction_186 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (S happy_var_1
	)
happyReduction_186 _  = notHappyAtAll 

happyReduce_187 = happySpecReduce_1  25 happyReduction_187
happyReduction_187 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (P happy_var_1
	)
happyReduction_187 _  = notHappyAtAll 

happyReduce_188 = happySpecReduce_1  25 happyReduction_188
happyReduction_188 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn25
		 (O happy_var_1
	)
happyReduction_188 _  = notHappyAtAll 

happyReduce_189 = happySpecReduce_1  26 happyReduction_189
happyReduction_189 _
	 =  HappyAbsSyn26
		 (Subj
	)

happyReduce_190 = happySpecReduce_1  27 happyReduction_190
happyReduction_190 _
	 =  HappyAbsSyn27
		 (Pred
	)

happyReduce_191 = happySpecReduce_1  28 happyReduction_191
happyReduction_191 _
	 =  HappyAbsSyn28
		 (Obj
	)

happyReduce_192 = happySpecReduce_1  29 happyReduction_192
happyReduction_192 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn29
		 (NewUrl happy_var_1
	)
happyReduction_192 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 70 70 notHappyAtAll (HappyState action) sts stk []

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
	TokenFilter _ -> cont 58;
	TokenMap _ -> cont 59;
	TokenUnion _ -> cont 60;
	TokenJoin _ -> cont 61;
	TokenWhere _ -> cont 62;
	TokenAnd _ -> cont 63;
	TokenOr _ -> cont 64;
	TokenVar _ happy_dollar_dollar -> cont 65;
	TokenUrl _ happy_dollar_dollar -> cont 66;
	TokenAdd _ -> cont 67;
	TokenLength _ -> cont 68;
	TokenStarts _ -> cont 69;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 70 tk tks = happyError' (tks, explist)
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
     
data Query = OutputQuery String FilteredQuery | WriteQuery String FilteredQuery String
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
     deriving Show

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
            Filter Combinations | AddTripSPO Url Url Literal | AddTripPO Url Literal | AddTripSO Url Literal | AddTripSP Url Url | AddTripS Url | AddTripP Url | AddTripO Literal | AddTrip
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
