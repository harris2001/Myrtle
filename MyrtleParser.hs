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
happyExpList = Happy_Data_Array.listArray (0,1100) ([0,0,0,16,0,0,0,2048,0,0,0,0,8,0,0,0,16384,0,0,0,0,2,0,0,0,57344,65,0,0,16384,0,0,0,0,30720,16,0,32768,0,0,0,0,0,8192,0,0,0,2048,0,0,0,20480,0,0,0,0,8,0,0,0,36864,0,0,0,192,0,0,0,0,256,0,0,0,0,0,0,0,16384,0,0,0,0,32,0,0,0,0,0,128,0,0,2048,0,0,0,256,0,0,0,16384,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,224,32,512,0,0,0,0,0,0,0,4128,0,0,0,1024,0,0,0,0,61440,32,0,0,0,1024,0,0,0,0,0,0,0,0,256,0,0,128,0,0,0,0,0,0,0,0,16384,0,0,0,0,2064,0,0,128,0,0,0,0,0,0,8,0,0,0,0,0,0,32768,0,0,0,8,0,0,0,0,64,0,0,0,8192,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,1092,7936,0,0,8192,0,0,0,0,128,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,32,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,64,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,16,0,128,0,0,4096,0,0,0,60928,3,0,0,0,1028,1536,0,0,512,0,0,0,0,3,0,0,0,384,0,0,0,61440,31,96,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1152,272,9216,0,49152,34831,8,62,0,0,0,0,0,0,8048,24576,0,0,0,16,0,0,0,2048,0,0,0,16510,68,432,0,0,0,4096,0,0,0,0,8,0,896,128,2048,0,0,0,0,0,0,0,256,0,0,1024,0,0,0,0,0,4128,0,0,256,0,0,0,0,0,0,0,0,8064,4368,27648,0,0,0,0,0,0,57344,62,0,0,0,64,24576,0,0,8192,0,0,0,0,16,0,0,0,2048,0,0,0,0,503,1536,0,0,512,0,0,0,4032,2184,13824,0,0,0,129,0,0,8,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32192,0,0,0,32768,0,192,0,0,64,0,0,0,8192,0,0,0,0,32768,0,0,0,16,64,0,0,2304,544,18432,0,32768,4100,1,36,0,4032,2184,13824,0,8192,17409,0,9,0,144,34,1152,0,18432,4352,16384,2,0,32804,8,288,0,4608,1088,36864,0,0,8255,34,216,0,8064,4368,27648,0,0,32192,1,0,0,32768,128,192,0,0,0,0,0,0,0,0,0,0,9216,2176,8192,1,0,0,0,0,0,3584,0,6144,0,32768,4100,1,36,0,576,136,4608,0,57344,17415,4,27,0,144,34,1152,0,18432,4352,16384,2,0,32804,8,288,0,4608,1088,36864,0,0,8201,2,72,0,8064,4368,27648,0,49152,34831,8,54,0,0,0,512,0,0,0,0,1,0,64,256,64,0,64512,34944,24576,3,0,0,512,0,0,16128,8736,55296,0,32768,4127,17,108,0,576,136,4608,0,8192,17409,0,9,0,144,34,1152,0,18432,4352,16384,2,0,32804,8,288,0,4608,1088,36864,0,0,8201,2,72,0,1152,272,9216,0,0,0,0,0,0,16,0,0,0,2048,0,0,0,0,0,0,0,0,14336,0,0,0,0,1,0,0,0,16128,8736,55296,0,0,0,2,0,0,256,0,1024,0,32768,0,0,2,0,0,0,0,0,0,0,0,0,0,49152,7,0,0,0,512,0,0,0,0,1,0,0,0,248,0,0,0,16384,0,0,0,0,32,0,0,0,7936,0,0,0,0,14,0,0,0,1792,0,0,0,57344,3,0,0,0,448,0,0,0,57344,0,0,0,0,124,0,0,0,15872,0,0,0,0,31,0,0,0,3968,0,0,0,49152,7,0,0,0,992,0,0,0,61440,1,0,0,0,248,0,0,0,31744,0,0,0,0,62,0,0,0,64,8192,0,0,47104,15,16,0,0,2012,6144,0,0,2048,0,0,0,0,503,0,0,0,64384,0,3,0,896,128,2048,0,0,0,0,0,0,12288,31,0,0,0,4024,12288,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,64,0,0,8048,24576,0,0,8192,0,0,0,0,2012,6144,0,0,0,0,0,0,0,0,0,0,0,63488,0,0,0,0,64,0,0,0,8192,0,0,0,0,31,0,0,0,2048,0,0,0,0,4,0,0,0,992,0,0,0,49152,1,0,0,0,224,0,0,0,31744,0,0,0,0,56,0,0,0,7168,0,0,0,32768,15,0,0,0,1996,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,125,384,0,0,15872,0,0,0,0,31,0,0,0,3968,0,0,0,49152,7,0,0,0,992,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,47,0,0,0,1984,0,0,0,0,0,0,0,0,0,0,0,0,512,0,1,0,49152,125,128,0,0,16096,49152,0,0,16384,0,0,0,0,4024,0,0,0,56320,7,24,0,0,0,0,0,0,0,0,0,0,0,248,0,0,0,16384,0,0,0,0,32,0,0,0,7936,0,0,0,0,8,0,0,0,1024,0,0,0,57344,3,0,0,0,448,0,0,0,57344,0,0,0,0,124,0,0,0,14336,0,0,0,0,28,0,0,0,3968,0,0,0,52224,7,0,0,0,0,0,0,0,0,0,0,0,32768,249,0,0,0,0,0,0,0,57344,62,192,0,0,7936,0,0,0,32768,15,0,0,0,1984,0,0,0,57344,3,0,0,0,496,0,0,0,63488,0,0,0,0,256,0,0,0,32768,0,0,0,8,0,0,0,0,0,0,0,0,0,4128,0,0,256,0,0,0,0,0,1032,0,0,0,512,0,0,49152,34831,8,54,0,0,0,0,0,32768,0,2,1,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,128,0,0,0,16384,0,0,0,0,32,0,0,0,4096,0,0,0,0,0,1152,0,0,0,8192,0,0,0,56320,7,0,0,0,8,3072,0,0,1024,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,61440,8707,32770,13,0,504,273,1728,0,64512,34944,24576,3,0,16510,68,432,0,3584,512,8192,0,0,0,2,0,0,0,256,0,0,0,32768,0,0,0,8,0,0,0,0,32768,0,0,0,0,0,0,0,0,2048,0,0,32768,0,0,0,0,0,0,0,0,49152,34831,8,54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,1024,0,0,0,0,2,0,0,0,256,0,0,0,32768,0,0,0,0,64,0,0,0,8192,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","Query","FilteredQuery","BasicQuery","CreateVars","CreateVar","Func","Combinations","CombinationLst","FilterEl","UrlList","JoinOption","SList","SListElem","Cond","Action","Literal","LiteralList","LiteralElems","IntExp","BoolExp","StringExp","Node","Subject","Predicate","Object","Url","','","int","subj","pred","obj","true","false","'-l'","'-r'","'<'","'>'","deq","'='","'+'","'-'","'*'","'/'","'^'","'('","')'","'['","']'","string","filename","'|'","'?'","':'","'_'","';'","filter","map","union","join","where","and","or","var","url","add","length","startsWith","%eof"]
        bit_start = st Prelude.* 71
        bit_end = (st Prelude.+ 1) Prelude.* 71
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..70]
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
action_3 (71) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (54) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (59) = happyShift action_11
action_5 (60) = happyShift action_12
action_5 (61) = happyShift action_13
action_5 (62) = happyShift action_14
action_5 (68) = happyShift action_15
action_5 (5) = happyGoto action_17
action_5 (6) = happyGoto action_9
action_5 (9) = happyGoto action_10
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (53) = happyShift action_4
action_6 (4) = happyGoto action_16
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (59) = happyShift action_11
action_7 (60) = happyShift action_12
action_7 (61) = happyShift action_13
action_7 (62) = happyShift action_14
action_7 (68) = happyShift action_15
action_7 (5) = happyGoto action_8
action_7 (6) = happyGoto action_9
action_7 (9) = happyGoto action_10
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (40) = happyShift action_18
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (63) = happyShift action_31
action_9 _ = happyReduce_4

action_10 (54) = happyShift action_30
action_10 _ = happyReduce_6

action_11 (48) = happyShift action_28
action_11 (50) = happyShift action_29
action_11 (10) = happyGoto action_27
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (48) = happyShift action_26
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (50) = happyShift action_24
action_13 (53) = happyShift action_25
action_13 (15) = happyGoto action_23
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (37) = happyShift action_21
action_14 (38) = happyShift action_22
action_14 (14) = happyGoto action_20
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (48) = happyShift action_19
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_3

action_17 (40) = happyShift action_18
action_17 _ = happyReduce_2

action_18 (40) = happyShift action_58
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (67) = happyShift action_57
action_19 (29) = happyGoto action_56
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (48) = happyShift action_55
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (38) = happyShift action_54
action_21 _ = happyReduce_29

action_22 (37) = happyShift action_53
action_22 _ = happyReduce_30

action_23 _ = happyReduce_16

action_24 (53) = happyShift action_52
action_24 (16) = happyGoto action_51
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_32

action_26 (32) = happyShift action_46
action_26 (33) = happyShift action_47
action_26 (34) = happyShift action_48
action_26 (48) = happyShift action_49
action_26 (68) = happyShift action_50
action_26 (17) = happyGoto action_41
action_26 (18) = happyGoto action_42
action_26 (26) = happyGoto action_43
action_26 (27) = happyGoto action_44
action_26 (28) = happyGoto action_45
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_14

action_28 (50) = happyShift action_39
action_28 (57) = happyShift action_40
action_28 (12) = happyGoto action_38
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (48) = happyShift action_37
action_29 (11) = happyGoto action_36
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (59) = happyShift action_11
action_30 (60) = happyShift action_12
action_30 (61) = happyShift action_13
action_30 (62) = happyShift action_14
action_30 (68) = happyShift action_15
action_30 (6) = happyGoto action_35
action_30 (9) = happyGoto action_10
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (66) = happyShift action_34
action_31 (7) = happyGoto action_32
action_31 (8) = happyGoto action_33
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_5

action_33 (66) = happyShift action_34
action_33 (7) = happyGoto action_96
action_33 (8) = happyGoto action_33
action_33 _ = happyReduce_8

action_34 (42) = happyShift action_95
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_7

action_36 (51) = happyShift action_94
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (50) = happyShift action_39
action_37 (57) = happyShift action_40
action_37 (12) = happyGoto action_93
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (30) = happyShift action_92
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (67) = happyShift action_57
action_39 (13) = happyGoto action_90
action_39 (29) = happyGoto action_91
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_23

action_41 (49) = happyShift action_89
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (30) = happyShift action_88
action_42 _ = happyReduce_35

action_43 (42) = happyShift action_87
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (42) = happyShift action_86
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (42) = happyShift action_85
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_182

action_47 _ = happyReduce_183

action_48 _ = happyReduce_184

action_49 (31) = happyShift action_76
action_49 (32) = happyShift action_46
action_49 (33) = happyShift action_47
action_49 (34) = happyShift action_48
action_49 (35) = happyShift action_77
action_49 (36) = happyShift action_78
action_49 (44) = happyShift action_79
action_49 (48) = happyShift action_80
action_49 (52) = happyShift action_81
action_49 (66) = happyShift action_82
action_49 (67) = happyShift action_57
action_49 (68) = happyShift action_50
action_49 (69) = happyShift action_83
action_49 (70) = happyShift action_84
action_49 (18) = happyGoto action_68
action_49 (22) = happyGoto action_69
action_49 (23) = happyGoto action_70
action_49 (24) = happyGoto action_71
action_49 (26) = happyGoto action_72
action_49 (27) = happyGoto action_73
action_49 (28) = happyGoto action_74
action_49 (29) = happyGoto action_75
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (48) = happyShift action_67
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (51) = happyShift action_66
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (30) = happyShift action_65
action_52 _ = happyReduce_33

action_53 _ = happyReduce_27

action_54 _ = happyReduce_28

action_55 (32) = happyShift action_46
action_55 (33) = happyShift action_47
action_55 (34) = happyShift action_48
action_55 (25) = happyGoto action_61
action_55 (26) = happyGoto action_62
action_55 (27) = happyGoto action_63
action_55 (28) = happyGoto action_64
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (30) = happyShift action_60
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_185

action_58 (53) = happyShift action_59
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_1

action_60 (67) = happyShift action_57
action_60 (29) = happyGoto action_165
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (30) = happyShift action_164
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_179

action_63 _ = happyReduce_180

action_64 _ = happyReduce_181

action_65 (53) = happyShift action_52
action_65 (16) = happyGoto action_163
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_31

action_67 (32) = happyShift action_162
action_67 (67) = happyShift action_57
action_67 (29) = happyGoto action_161
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (49) = happyShift action_160
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (39) = happyShift action_152
action_69 (40) = happyShift action_153
action_69 (41) = happyShift action_154
action_69 (43) = happyShift action_155
action_69 (44) = happyShift action_156
action_69 (45) = happyShift action_157
action_69 (46) = happyShift action_158
action_69 (47) = happyShift action_159
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (41) = happyShift action_148
action_70 (49) = happyShift action_149
action_70 (64) = happyShift action_150
action_70 (65) = happyShift action_151
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (41) = happyShift action_147
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (41) = happyShift action_146
action_72 (42) = happyShift action_87
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (41) = happyShift action_145
action_73 (42) = happyShift action_86
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (39) = happyShift action_135
action_74 (40) = happyShift action_136
action_74 (41) = happyShift action_137
action_74 (42) = happyShift action_85
action_74 (43) = happyShift action_138
action_74 (44) = happyShift action_139
action_74 (45) = happyShift action_140
action_74 (46) = happyShift action_141
action_74 (47) = happyShift action_142
action_74 (64) = happyShift action_143
action_74 (65) = happyShift action_144
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (41) = happyShift action_134
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_110

action_77 _ = happyReduce_173

action_78 _ = happyReduce_174

action_79 (31) = happyShift action_76
action_79 (34) = happyShift action_48
action_79 (44) = happyShift action_79
action_79 (48) = happyShift action_132
action_79 (66) = happyShift action_133
action_79 (69) = happyShift action_83
action_79 (22) = happyGoto action_130
action_79 (28) = happyGoto action_131
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (31) = happyShift action_76
action_80 (32) = happyShift action_46
action_80 (33) = happyShift action_47
action_80 (34) = happyShift action_48
action_80 (35) = happyShift action_77
action_80 (36) = happyShift action_78
action_80 (44) = happyShift action_79
action_80 (48) = happyShift action_80
action_80 (52) = happyShift action_81
action_80 (66) = happyShift action_82
action_80 (67) = happyShift action_57
action_80 (68) = happyShift action_50
action_80 (69) = happyShift action_83
action_80 (70) = happyShift action_84
action_80 (18) = happyGoto action_68
action_80 (22) = happyGoto action_128
action_80 (23) = happyGoto action_129
action_80 (24) = happyGoto action_71
action_80 (26) = happyGoto action_72
action_80 (27) = happyGoto action_73
action_80 (28) = happyGoto action_74
action_80 (29) = happyGoto action_75
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_178

action_82 (39) = happyShift action_118
action_82 (40) = happyShift action_119
action_82 (41) = happyShift action_120
action_82 (43) = happyShift action_121
action_82 (44) = happyShift action_122
action_82 (45) = happyShift action_123
action_82 (46) = happyShift action_124
action_82 (47) = happyShift action_125
action_82 (64) = happyShift action_126
action_82 (65) = happyShift action_127
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (48) = happyShift action_117
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (48) = happyShift action_116
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (31) = happyShift action_76
action_85 (32) = happyShift action_46
action_85 (33) = happyShift action_47
action_85 (34) = happyShift action_48
action_85 (35) = happyShift action_77
action_85 (36) = happyShift action_78
action_85 (44) = happyShift action_79
action_85 (48) = happyShift action_104
action_85 (52) = happyShift action_81
action_85 (66) = happyShift action_82
action_85 (67) = happyShift action_57
action_85 (69) = happyShift action_83
action_85 (70) = happyShift action_84
action_85 (22) = happyGoto action_112
action_85 (23) = happyGoto action_113
action_85 (24) = happyGoto action_114
action_85 (26) = happyGoto action_100
action_85 (27) = happyGoto action_101
action_85 (28) = happyGoto action_102
action_85 (29) = happyGoto action_115
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (67) = happyShift action_57
action_86 (29) = happyGoto action_111
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (67) = happyShift action_57
action_87 (29) = happyGoto action_110
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (32) = happyShift action_46
action_88 (33) = happyShift action_47
action_88 (34) = happyShift action_48
action_88 (48) = happyShift action_49
action_88 (68) = happyShift action_50
action_88 (17) = happyGoto action_109
action_88 (18) = happyGoto action_42
action_88 (26) = happyGoto action_43
action_88 (27) = happyGoto action_44
action_88 (28) = happyGoto action_45
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_15

action_90 (51) = happyShift action_108
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (30) = happyShift action_107
action_91 _ = happyReduce_25

action_92 (50) = happyShift action_39
action_92 (57) = happyShift action_40
action_92 (12) = happyGoto action_106
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (30) = happyShift action_105
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_20

action_95 (31) = happyShift action_76
action_95 (32) = happyShift action_46
action_95 (33) = happyShift action_47
action_95 (34) = happyShift action_48
action_95 (35) = happyShift action_77
action_95 (36) = happyShift action_78
action_95 (44) = happyShift action_79
action_95 (48) = happyShift action_104
action_95 (52) = happyShift action_81
action_95 (66) = happyShift action_82
action_95 (67) = happyShift action_57
action_95 (69) = happyShift action_83
action_95 (70) = happyShift action_84
action_95 (22) = happyGoto action_97
action_95 (23) = happyGoto action_98
action_95 (24) = happyGoto action_99
action_95 (26) = happyGoto action_100
action_95 (27) = happyGoto action_101
action_95 (28) = happyGoto action_102
action_95 (29) = happyGoto action_103
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_9

action_97 (39) = happyShift action_152
action_97 (40) = happyShift action_153
action_97 (41) = happyShift action_154
action_97 (43) = happyShift action_155
action_97 (44) = happyShift action_156
action_97 (45) = happyShift action_157
action_97 (46) = happyShift action_158
action_97 (47) = happyShift action_159
action_97 _ = happyReduce_10

action_98 (41) = happyShift action_148
action_98 (64) = happyShift action_150
action_98 (65) = happyShift action_151
action_98 _ = happyReduce_12

action_99 (41) = happyShift action_147
action_99 _ = happyReduce_11

action_100 (41) = happyShift action_146
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (41) = happyShift action_145
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (39) = happyShift action_135
action_102 (40) = happyShift action_136
action_102 (41) = happyShift action_137
action_102 (43) = happyShift action_138
action_102 (44) = happyShift action_139
action_102 (45) = happyShift action_140
action_102 (46) = happyShift action_141
action_102 (47) = happyShift action_142
action_102 (64) = happyShift action_143
action_102 (65) = happyShift action_144
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (41) = happyShift action_134
action_103 _ = happyReduce_13

action_104 (31) = happyShift action_76
action_104 (32) = happyShift action_46
action_104 (33) = happyShift action_47
action_104 (34) = happyShift action_48
action_104 (35) = happyShift action_77
action_104 (36) = happyShift action_78
action_104 (44) = happyShift action_79
action_104 (48) = happyShift action_104
action_104 (52) = happyShift action_81
action_104 (66) = happyShift action_82
action_104 (67) = happyShift action_57
action_104 (69) = happyShift action_83
action_104 (70) = happyShift action_84
action_104 (22) = happyGoto action_128
action_104 (23) = happyGoto action_129
action_104 (24) = happyGoto action_71
action_104 (26) = happyGoto action_100
action_104 (27) = happyGoto action_101
action_104 (28) = happyGoto action_102
action_104 (29) = happyGoto action_75
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (50) = happyShift action_39
action_105 (57) = happyShift action_40
action_105 (12) = happyGoto action_285
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (30) = happyShift action_284
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (67) = happyShift action_57
action_107 (13) = happyGoto action_283
action_107 (29) = happyGoto action_91
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_24

action_109 _ = happyReduce_36

action_110 _ = happyReduce_38

action_111 _ = happyReduce_39

action_112 (39) = happyShift action_152
action_112 (40) = happyShift action_153
action_112 (41) = happyShift action_154
action_112 (43) = happyShift action_155
action_112 (44) = happyShift action_156
action_112 (45) = happyShift action_157
action_112 (46) = happyShift action_158
action_112 (47) = happyShift action_159
action_112 _ = happyReduce_42

action_113 (41) = happyShift action_148
action_113 (64) = happyShift action_150
action_113 (65) = happyShift action_151
action_113 _ = happyReduce_43

action_114 (41) = happyShift action_147
action_114 _ = happyReduce_41

action_115 (41) = happyShift action_134
action_115 _ = happyReduce_40

action_116 (52) = happyShift action_282
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (34) = happyShift action_48
action_117 (52) = happyShift action_281
action_117 (28) = happyGoto action_280
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (31) = happyShift action_76
action_118 (34) = happyShift action_48
action_118 (44) = happyShift action_79
action_118 (48) = happyShift action_132
action_118 (66) = happyShift action_279
action_118 (69) = happyShift action_83
action_118 (22) = happyGoto action_277
action_118 (28) = happyGoto action_278
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (31) = happyShift action_76
action_119 (34) = happyShift action_48
action_119 (44) = happyShift action_79
action_119 (48) = happyShift action_132
action_119 (66) = happyShift action_276
action_119 (69) = happyShift action_83
action_119 (22) = happyGoto action_274
action_119 (28) = happyGoto action_275
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (31) = happyShift action_76
action_120 (32) = happyShift action_46
action_120 (33) = happyShift action_47
action_120 (34) = happyShift action_48
action_120 (35) = happyShift action_77
action_120 (36) = happyShift action_78
action_120 (44) = happyShift action_79
action_120 (48) = happyShift action_104
action_120 (52) = happyShift action_81
action_120 (66) = happyShift action_273
action_120 (67) = happyShift action_57
action_120 (69) = happyShift action_83
action_120 (70) = happyShift action_84
action_120 (22) = happyGoto action_268
action_120 (23) = happyGoto action_269
action_120 (24) = happyGoto action_270
action_120 (26) = happyGoto action_100
action_120 (27) = happyGoto action_101
action_120 (28) = happyGoto action_271
action_120 (29) = happyGoto action_272
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (31) = happyShift action_76
action_121 (34) = happyShift action_48
action_121 (44) = happyShift action_79
action_121 (48) = happyShift action_132
action_121 (66) = happyShift action_267
action_121 (69) = happyShift action_83
action_121 (22) = happyGoto action_265
action_121 (28) = happyGoto action_266
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (31) = happyShift action_76
action_122 (34) = happyShift action_48
action_122 (44) = happyShift action_79
action_122 (48) = happyShift action_132
action_122 (66) = happyShift action_264
action_122 (69) = happyShift action_83
action_122 (22) = happyGoto action_262
action_122 (28) = happyGoto action_263
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (31) = happyShift action_76
action_123 (34) = happyShift action_48
action_123 (44) = happyShift action_79
action_123 (48) = happyShift action_132
action_123 (66) = happyShift action_261
action_123 (69) = happyShift action_83
action_123 (22) = happyGoto action_259
action_123 (28) = happyGoto action_260
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (31) = happyShift action_76
action_124 (34) = happyShift action_48
action_124 (44) = happyShift action_79
action_124 (48) = happyShift action_132
action_124 (66) = happyShift action_258
action_124 (69) = happyShift action_83
action_124 (22) = happyGoto action_256
action_124 (28) = happyGoto action_257
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (31) = happyShift action_76
action_125 (34) = happyShift action_48
action_125 (44) = happyShift action_79
action_125 (48) = happyShift action_132
action_125 (66) = happyShift action_255
action_125 (69) = happyShift action_83
action_125 (22) = happyGoto action_253
action_125 (28) = happyGoto action_254
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (31) = happyShift action_76
action_126 (32) = happyShift action_46
action_126 (33) = happyShift action_47
action_126 (34) = happyShift action_48
action_126 (35) = happyShift action_77
action_126 (36) = happyShift action_78
action_126 (44) = happyShift action_79
action_126 (48) = happyShift action_104
action_126 (52) = happyShift action_81
action_126 (66) = happyShift action_252
action_126 (67) = happyShift action_57
action_126 (69) = happyShift action_83
action_126 (70) = happyShift action_84
action_126 (22) = happyGoto action_69
action_126 (23) = happyGoto action_250
action_126 (24) = happyGoto action_71
action_126 (26) = happyGoto action_100
action_126 (27) = happyGoto action_101
action_126 (28) = happyGoto action_251
action_126 (29) = happyGoto action_75
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (31) = happyShift action_76
action_127 (32) = happyShift action_46
action_127 (33) = happyShift action_47
action_127 (34) = happyShift action_48
action_127 (35) = happyShift action_77
action_127 (36) = happyShift action_78
action_127 (44) = happyShift action_79
action_127 (48) = happyShift action_104
action_127 (52) = happyShift action_81
action_127 (66) = happyShift action_249
action_127 (67) = happyShift action_57
action_127 (69) = happyShift action_83
action_127 (70) = happyShift action_84
action_127 (22) = happyGoto action_69
action_127 (23) = happyGoto action_247
action_127 (24) = happyGoto action_71
action_127 (26) = happyGoto action_100
action_127 (27) = happyGoto action_101
action_127 (28) = happyGoto action_248
action_127 (29) = happyGoto action_75
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (39) = happyShift action_152
action_128 (40) = happyShift action_153
action_128 (41) = happyShift action_154
action_128 (43) = happyShift action_155
action_128 (44) = happyShift action_156
action_128 (45) = happyShift action_157
action_128 (46) = happyShift action_158
action_128 (47) = happyShift action_159
action_128 (49) = happyShift action_246
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (41) = happyShift action_148
action_129 (49) = happyShift action_245
action_129 (64) = happyShift action_150
action_129 (65) = happyShift action_151
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_107

action_131 _ = happyReduce_108

action_132 (31) = happyShift action_76
action_132 (34) = happyShift action_48
action_132 (44) = happyShift action_79
action_132 (48) = happyShift action_132
action_132 (66) = happyShift action_244
action_132 (69) = happyShift action_83
action_132 (22) = happyGoto action_243
action_132 (28) = happyGoto action_234
action_132 _ = happyFail (happyExpListPerState 132)

action_133 _ = happyReduce_109

action_134 (32) = happyShift action_46
action_134 (33) = happyShift action_47
action_134 (34) = happyShift action_48
action_134 (66) = happyShift action_242
action_134 (67) = happyShift action_57
action_134 (26) = happyGoto action_238
action_134 (27) = happyGoto action_239
action_134 (28) = happyGoto action_240
action_134 (29) = happyGoto action_241
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (31) = happyShift action_76
action_135 (34) = happyShift action_48
action_135 (44) = happyShift action_79
action_135 (48) = happyShift action_132
action_135 (66) = happyShift action_237
action_135 (69) = happyShift action_83
action_135 (22) = happyGoto action_236
action_135 (28) = happyGoto action_234
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (31) = happyShift action_76
action_136 (34) = happyShift action_48
action_136 (44) = happyShift action_79
action_136 (48) = happyShift action_132
action_136 (66) = happyShift action_235
action_136 (69) = happyShift action_83
action_136 (22) = happyGoto action_233
action_136 (28) = happyGoto action_234
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (31) = happyShift action_76
action_137 (32) = happyShift action_46
action_137 (33) = happyShift action_47
action_137 (34) = happyShift action_48
action_137 (35) = happyShift action_77
action_137 (36) = happyShift action_78
action_137 (44) = happyShift action_79
action_137 (48) = happyShift action_104
action_137 (52) = happyShift action_81
action_137 (66) = happyShift action_232
action_137 (67) = happyShift action_57
action_137 (69) = happyShift action_83
action_137 (70) = happyShift action_84
action_137 (22) = happyGoto action_228
action_137 (23) = happyGoto action_229
action_137 (24) = happyGoto action_230
action_137 (26) = happyGoto action_100
action_137 (27) = happyGoto action_101
action_137 (28) = happyGoto action_102
action_137 (29) = happyGoto action_231
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (31) = happyShift action_76
action_138 (34) = happyShift action_48
action_138 (44) = happyShift action_79
action_138 (48) = happyShift action_132
action_138 (66) = happyShift action_227
action_138 (69) = happyShift action_83
action_138 (22) = happyGoto action_225
action_138 (28) = happyGoto action_226
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (31) = happyShift action_76
action_139 (34) = happyShift action_48
action_139 (44) = happyShift action_79
action_139 (48) = happyShift action_132
action_139 (66) = happyShift action_224
action_139 (69) = happyShift action_83
action_139 (22) = happyGoto action_222
action_139 (28) = happyGoto action_223
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (31) = happyShift action_76
action_140 (34) = happyShift action_48
action_140 (44) = happyShift action_79
action_140 (48) = happyShift action_132
action_140 (66) = happyShift action_221
action_140 (69) = happyShift action_83
action_140 (22) = happyGoto action_219
action_140 (28) = happyGoto action_220
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (31) = happyShift action_76
action_141 (34) = happyShift action_48
action_141 (44) = happyShift action_79
action_141 (48) = happyShift action_132
action_141 (66) = happyShift action_218
action_141 (69) = happyShift action_83
action_141 (22) = happyGoto action_216
action_141 (28) = happyGoto action_217
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (31) = happyShift action_76
action_142 (34) = happyShift action_48
action_142 (44) = happyShift action_79
action_142 (48) = happyShift action_132
action_142 (66) = happyShift action_215
action_142 (69) = happyShift action_83
action_142 (22) = happyGoto action_213
action_142 (28) = happyGoto action_214
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (31) = happyShift action_76
action_143 (32) = happyShift action_46
action_143 (33) = happyShift action_47
action_143 (34) = happyShift action_48
action_143 (35) = happyShift action_77
action_143 (36) = happyShift action_78
action_143 (44) = happyShift action_79
action_143 (48) = happyShift action_104
action_143 (52) = happyShift action_81
action_143 (66) = happyShift action_212
action_143 (67) = happyShift action_57
action_143 (69) = happyShift action_83
action_143 (70) = happyShift action_84
action_143 (22) = happyGoto action_69
action_143 (23) = happyGoto action_211
action_143 (24) = happyGoto action_71
action_143 (26) = happyGoto action_100
action_143 (27) = happyGoto action_101
action_143 (28) = happyGoto action_102
action_143 (29) = happyGoto action_75
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (31) = happyShift action_76
action_144 (32) = happyShift action_46
action_144 (33) = happyShift action_47
action_144 (34) = happyShift action_48
action_144 (35) = happyShift action_77
action_144 (36) = happyShift action_78
action_144 (44) = happyShift action_79
action_144 (48) = happyShift action_104
action_144 (52) = happyShift action_81
action_144 (66) = happyShift action_210
action_144 (67) = happyShift action_57
action_144 (69) = happyShift action_83
action_144 (70) = happyShift action_84
action_144 (22) = happyGoto action_69
action_144 (23) = happyGoto action_209
action_144 (24) = happyGoto action_71
action_144 (26) = happyGoto action_100
action_144 (27) = happyGoto action_101
action_144 (28) = happyGoto action_102
action_144 (29) = happyGoto action_75
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (67) = happyShift action_57
action_145 (29) = happyGoto action_208
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (67) = happyShift action_57
action_146 (29) = happyGoto action_207
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (34) = happyShift action_48
action_147 (52) = happyShift action_81
action_147 (66) = happyShift action_206
action_147 (24) = happyGoto action_204
action_147 (28) = happyGoto action_205
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (31) = happyShift action_76
action_148 (32) = happyShift action_46
action_148 (33) = happyShift action_47
action_148 (34) = happyShift action_48
action_148 (35) = happyShift action_77
action_148 (36) = happyShift action_78
action_148 (44) = happyShift action_79
action_148 (48) = happyShift action_104
action_148 (52) = happyShift action_81
action_148 (66) = happyShift action_203
action_148 (67) = happyShift action_57
action_148 (69) = happyShift action_83
action_148 (70) = happyShift action_84
action_148 (22) = happyGoto action_69
action_148 (23) = happyGoto action_201
action_148 (24) = happyGoto action_71
action_148 (26) = happyGoto action_100
action_148 (27) = happyGoto action_101
action_148 (28) = happyGoto action_202
action_148 (29) = happyGoto action_75
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (55) = happyShift action_200
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (31) = happyShift action_76
action_150 (32) = happyShift action_46
action_150 (33) = happyShift action_47
action_150 (34) = happyShift action_48
action_150 (35) = happyShift action_77
action_150 (36) = happyShift action_78
action_150 (44) = happyShift action_79
action_150 (48) = happyShift action_104
action_150 (52) = happyShift action_81
action_150 (66) = happyShift action_199
action_150 (67) = happyShift action_57
action_150 (69) = happyShift action_83
action_150 (70) = happyShift action_84
action_150 (22) = happyGoto action_69
action_150 (23) = happyGoto action_197
action_150 (24) = happyGoto action_71
action_150 (26) = happyGoto action_100
action_150 (27) = happyGoto action_101
action_150 (28) = happyGoto action_198
action_150 (29) = happyGoto action_75
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (31) = happyShift action_76
action_151 (32) = happyShift action_46
action_151 (33) = happyShift action_47
action_151 (34) = happyShift action_48
action_151 (35) = happyShift action_77
action_151 (36) = happyShift action_78
action_151 (44) = happyShift action_79
action_151 (48) = happyShift action_104
action_151 (52) = happyShift action_81
action_151 (66) = happyShift action_196
action_151 (67) = happyShift action_57
action_151 (69) = happyShift action_83
action_151 (70) = happyShift action_84
action_151 (22) = happyGoto action_69
action_151 (23) = happyGoto action_194
action_151 (24) = happyGoto action_71
action_151 (26) = happyGoto action_100
action_151 (27) = happyGoto action_101
action_151 (28) = happyGoto action_195
action_151 (29) = happyGoto action_75
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (31) = happyShift action_76
action_152 (34) = happyShift action_48
action_152 (44) = happyShift action_79
action_152 (48) = happyShift action_132
action_152 (66) = happyShift action_193
action_152 (69) = happyShift action_83
action_152 (22) = happyGoto action_191
action_152 (28) = happyGoto action_192
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (31) = happyShift action_76
action_153 (34) = happyShift action_48
action_153 (44) = happyShift action_79
action_153 (48) = happyShift action_132
action_153 (66) = happyShift action_190
action_153 (69) = happyShift action_83
action_153 (22) = happyGoto action_188
action_153 (28) = happyGoto action_189
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (31) = happyShift action_76
action_154 (34) = happyShift action_48
action_154 (44) = happyShift action_79
action_154 (48) = happyShift action_132
action_154 (66) = happyShift action_187
action_154 (69) = happyShift action_83
action_154 (22) = happyGoto action_185
action_154 (28) = happyGoto action_186
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (31) = happyShift action_76
action_155 (34) = happyShift action_48
action_155 (44) = happyShift action_79
action_155 (48) = happyShift action_132
action_155 (66) = happyShift action_184
action_155 (69) = happyShift action_83
action_155 (22) = happyGoto action_182
action_155 (28) = happyGoto action_183
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (31) = happyShift action_76
action_156 (34) = happyShift action_48
action_156 (44) = happyShift action_79
action_156 (48) = happyShift action_132
action_156 (66) = happyShift action_181
action_156 (69) = happyShift action_83
action_156 (22) = happyGoto action_179
action_156 (28) = happyGoto action_180
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (31) = happyShift action_76
action_157 (34) = happyShift action_48
action_157 (44) = happyShift action_79
action_157 (48) = happyShift action_132
action_157 (66) = happyShift action_178
action_157 (69) = happyShift action_83
action_157 (22) = happyGoto action_176
action_157 (28) = happyGoto action_177
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (31) = happyShift action_76
action_158 (34) = happyShift action_48
action_158 (44) = happyShift action_79
action_158 (48) = happyShift action_132
action_158 (66) = happyShift action_175
action_158 (69) = happyShift action_83
action_158 (22) = happyGoto action_173
action_158 (28) = happyGoto action_174
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (31) = happyShift action_76
action_159 (34) = happyShift action_48
action_159 (44) = happyShift action_79
action_159 (48) = happyShift action_132
action_159 (66) = happyShift action_172
action_159 (69) = happyShift action_83
action_159 (22) = happyGoto action_170
action_159 (28) = happyGoto action_171
action_159 _ = happyFail (happyExpListPerState 159)

action_160 _ = happyReduce_52

action_161 (30) = happyShift action_169
action_161 _ = happyFail (happyExpListPerState 161)

action_162 (30) = happyShift action_168
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_34

action_164 (32) = happyShift action_46
action_164 (33) = happyShift action_47
action_164 (34) = happyShift action_48
action_164 (25) = happyGoto action_167
action_164 (26) = happyGoto action_62
action_164 (27) = happyGoto action_63
action_164 (28) = happyGoto action_64
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (30) = happyShift action_166
action_165 _ = happyFail (happyExpListPerState 165)

action_166 (31) = happyShift action_76
action_166 (32) = happyShift action_46
action_166 (33) = happyShift action_47
action_166 (34) = happyShift action_48
action_166 (35) = happyShift action_77
action_166 (36) = happyShift action_78
action_166 (44) = happyShift action_79
action_166 (48) = happyShift action_104
action_166 (52) = happyShift action_81
action_166 (66) = happyShift action_82
action_166 (67) = happyShift action_57
action_166 (69) = happyShift action_83
action_166 (70) = happyShift action_84
action_166 (19) = happyGoto action_299
action_166 (22) = happyGoto action_300
action_166 (23) = happyGoto action_301
action_166 (24) = happyGoto action_302
action_166 (26) = happyGoto action_100
action_166 (27) = happyGoto action_101
action_166 (28) = happyGoto action_102
action_166 (29) = happyGoto action_303
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (49) = happyShift action_298
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (33) = happyShift action_297
action_168 (67) = happyShift action_57
action_168 (29) = happyGoto action_296
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (33) = happyShift action_295
action_169 (67) = happyShift action_57
action_169 (29) = happyGoto action_294
action_169 _ = happyFail (happyExpListPerState 169)

action_170 _ = happyReduce_97

action_171 _ = happyReduce_99

action_172 (43) = happyShift action_121
action_172 (44) = happyShift action_122
action_172 (45) = happyShift action_123
action_172 (46) = happyShift action_124
action_172 (47) = happyShift action_125
action_172 _ = happyReduce_104

action_173 (47) = happyShift action_159
action_173 _ = happyReduce_88

action_174 (47) = happyShift action_142
action_174 _ = happyReduce_90

action_175 (43) = happyShift action_121
action_175 (44) = happyShift action_122
action_175 (45) = happyShift action_123
action_175 (46) = happyShift action_124
action_175 (47) = happyShift action_125
action_175 _ = happyReduce_95

action_176 (47) = happyShift action_159
action_176 _ = happyReduce_79

action_177 (47) = happyShift action_142
action_177 _ = happyReduce_81

action_178 (43) = happyShift action_121
action_178 (44) = happyShift action_122
action_178 (45) = happyShift action_123
action_178 (46) = happyShift action_124
action_178 (47) = happyShift action_125
action_178 _ = happyReduce_86

action_179 (45) = happyShift action_157
action_179 (46) = happyShift action_158
action_179 (47) = happyShift action_159
action_179 _ = happyReduce_70

action_180 (45) = happyShift action_140
action_180 (46) = happyShift action_141
action_180 (47) = happyShift action_142
action_180 _ = happyReduce_72

action_181 (43) = happyShift action_121
action_181 (44) = happyShift action_122
action_181 (45) = happyShift action_123
action_181 (46) = happyShift action_124
action_181 (47) = happyShift action_125
action_181 _ = happyReduce_77

action_182 (45) = happyShift action_157
action_182 (46) = happyShift action_158
action_182 (47) = happyShift action_159
action_182 _ = happyReduce_61

action_183 (45) = happyShift action_140
action_183 (46) = happyShift action_141
action_183 (47) = happyShift action_142
action_183 _ = happyReduce_63

action_184 (43) = happyShift action_121
action_184 (44) = happyShift action_122
action_184 (45) = happyShift action_123
action_184 (46) = happyShift action_124
action_184 (47) = happyShift action_125
action_184 _ = happyReduce_68

action_185 (43) = happyShift action_155
action_185 (44) = happyShift action_156
action_185 (45) = happyShift action_157
action_185 (46) = happyShift action_158
action_185 (47) = happyShift action_159
action_185 _ = happyReduce_145

action_186 (43) = happyShift action_138
action_186 (44) = happyShift action_139
action_186 (45) = happyShift action_140
action_186 (46) = happyShift action_141
action_186 (47) = happyShift action_142
action_186 _ = happyReduce_150

action_187 (43) = happyShift action_121
action_187 (44) = happyShift action_122
action_187 (45) = happyShift action_123
action_187 (46) = happyShift action_124
action_187 (47) = happyShift action_125
action_187 _ = happyReduce_162

action_188 (43) = happyShift action_155
action_188 (44) = happyShift action_156
action_188 (45) = happyShift action_157
action_188 (46) = happyShift action_158
action_188 (47) = happyShift action_159
action_188 _ = happyReduce_129

action_189 (43) = happyShift action_138
action_189 (44) = happyShift action_139
action_189 (45) = happyShift action_140
action_189 (46) = happyShift action_141
action_189 (47) = happyShift action_142
action_189 _ = happyReduce_130

action_190 (43) = happyShift action_121
action_190 (44) = happyShift action_122
action_190 (45) = happyShift action_123
action_190 (46) = happyShift action_124
action_190 (47) = happyShift action_125
action_190 _ = happyReduce_135

action_191 (43) = happyShift action_155
action_191 (44) = happyShift action_156
action_191 (45) = happyShift action_157
action_191 (46) = happyShift action_158
action_191 (47) = happyShift action_159
action_191 _ = happyReduce_137

action_192 (43) = happyShift action_138
action_192 (44) = happyShift action_139
action_192 (45) = happyShift action_140
action_192 (46) = happyShift action_141
action_192 (47) = happyShift action_142
action_192 _ = happyReduce_138

action_193 (43) = happyShift action_121
action_193 (44) = happyShift action_122
action_193 (45) = happyShift action_123
action_193 (46) = happyShift action_124
action_193 (47) = happyShift action_125
action_193 _ = happyReduce_143

action_194 (41) = happyShift action_148
action_194 (64) = happyShift action_150
action_194 _ = happyReduce_121

action_195 (39) = happyShift action_135
action_195 (40) = happyShift action_136
action_195 (41) = happyShift action_137
action_195 (43) = happyShift action_138
action_195 (44) = happyShift action_139
action_195 (45) = happyShift action_140
action_195 (46) = happyShift action_141
action_195 (47) = happyShift action_142
action_195 (64) = happyShift action_143
action_195 _ = happyReduce_122

action_196 (39) = happyShift action_118
action_196 (40) = happyShift action_119
action_196 (41) = happyShift action_120
action_196 (43) = happyShift action_121
action_196 (44) = happyShift action_122
action_196 (45) = happyShift action_123
action_196 (46) = happyShift action_124
action_196 (47) = happyShift action_125
action_196 (64) = happyShift action_126
action_196 (65) = happyShift action_127
action_196 _ = happyReduce_127

action_197 (41) = happyShift action_148
action_197 _ = happyReduce_113

action_198 (39) = happyShift action_135
action_198 (40) = happyShift action_136
action_198 (41) = happyShift action_137
action_198 (43) = happyShift action_138
action_198 (44) = happyShift action_139
action_198 (45) = happyShift action_140
action_198 (46) = happyShift action_141
action_198 (47) = happyShift action_142
action_198 _ = happyReduce_114

action_199 (39) = happyShift action_118
action_199 (40) = happyShift action_119
action_199 (41) = happyShift action_120
action_199 (43) = happyShift action_121
action_199 (44) = happyShift action_122
action_199 (45) = happyShift action_123
action_199 (46) = happyShift action_124
action_199 (47) = happyShift action_125
action_199 (64) = happyShift action_126
action_199 (65) = happyShift action_127
action_199 _ = happyReduce_119

action_200 (32) = happyShift action_46
action_200 (33) = happyShift action_47
action_200 (34) = happyShift action_48
action_200 (48) = happyShift action_49
action_200 (68) = happyShift action_50
action_200 (17) = happyGoto action_293
action_200 (18) = happyGoto action_42
action_200 (26) = happyGoto action_43
action_200 (27) = happyGoto action_44
action_200 (28) = happyGoto action_45
action_200 _ = happyFail (happyExpListPerState 200)

action_201 _ = happyReduce_146

action_202 (39) = happyShift action_135
action_202 (40) = happyShift action_136
action_202 (43) = happyShift action_138
action_202 (44) = happyShift action_139
action_202 (45) = happyShift action_140
action_202 (46) = happyShift action_141
action_202 (47) = happyShift action_142
action_202 _ = happyReduce_152

action_203 (39) = happyShift action_118
action_203 (40) = happyShift action_119
action_203 (41) = happyShift action_120
action_203 (43) = happyShift action_121
action_203 (44) = happyShift action_122
action_203 (45) = happyShift action_123
action_203 (46) = happyShift action_124
action_203 (47) = happyShift action_125
action_203 (64) = happyShift action_126
action_203 (65) = happyShift action_127
action_203 _ = happyReduce_163

action_204 _ = happyReduce_147

action_205 _ = happyReduce_154

action_206 _ = happyReduce_164

action_207 _ = happyReduce_155

action_208 _ = happyReduce_157

action_209 (41) = happyShift action_148
action_209 (64) = happyShift action_150
action_209 _ = happyReduce_123

action_210 (39) = happyShift action_118
action_210 (40) = happyShift action_119
action_210 (41) = happyShift action_120
action_210 (43) = happyShift action_121
action_210 (44) = happyShift action_122
action_210 (45) = happyShift action_123
action_210 (46) = happyShift action_124
action_210 (47) = happyShift action_125
action_210 (64) = happyShift action_126
action_210 (65) = happyShift action_127
action_210 _ = happyReduce_125

action_211 (41) = happyShift action_148
action_211 _ = happyReduce_115

action_212 (39) = happyShift action_118
action_212 (40) = happyShift action_119
action_212 (41) = happyShift action_120
action_212 (43) = happyShift action_121
action_212 (44) = happyShift action_122
action_212 (45) = happyShift action_123
action_212 (46) = happyShift action_124
action_212 (47) = happyShift action_125
action_212 (64) = happyShift action_126
action_212 (65) = happyShift action_127
action_212 _ = happyReduce_117

action_213 _ = happyReduce_98

action_214 _ = happyReduce_100

action_215 (43) = happyShift action_121
action_215 (44) = happyShift action_122
action_215 (45) = happyShift action_123
action_215 (46) = happyShift action_124
action_215 (47) = happyShift action_125
action_215 _ = happyReduce_102

action_216 (47) = happyShift action_159
action_216 _ = happyReduce_89

action_217 (47) = happyShift action_142
action_217 _ = happyReduce_91

action_218 (43) = happyShift action_121
action_218 (44) = happyShift action_122
action_218 (45) = happyShift action_123
action_218 (46) = happyShift action_124
action_218 (47) = happyShift action_125
action_218 _ = happyReduce_93

action_219 (47) = happyShift action_159
action_219 _ = happyReduce_80

action_220 (47) = happyShift action_142
action_220 _ = happyReduce_82

action_221 (43) = happyShift action_121
action_221 (44) = happyShift action_122
action_221 (45) = happyShift action_123
action_221 (46) = happyShift action_124
action_221 (47) = happyShift action_125
action_221 _ = happyReduce_84

action_222 (45) = happyShift action_157
action_222 (46) = happyShift action_158
action_222 (47) = happyShift action_159
action_222 _ = happyReduce_71

action_223 (45) = happyShift action_140
action_223 (46) = happyShift action_141
action_223 (47) = happyShift action_142
action_223 _ = happyReduce_73

action_224 (43) = happyShift action_121
action_224 (44) = happyShift action_122
action_224 (45) = happyShift action_123
action_224 (46) = happyShift action_124
action_224 (47) = happyShift action_125
action_224 _ = happyReduce_75

action_225 (45) = happyShift action_157
action_225 (46) = happyShift action_158
action_225 (47) = happyShift action_159
action_225 _ = happyReduce_62

action_226 (45) = happyShift action_140
action_226 (46) = happyShift action_141
action_226 (47) = happyShift action_142
action_226 _ = happyReduce_64

action_227 (43) = happyShift action_121
action_227 (44) = happyShift action_122
action_227 (45) = happyShift action_123
action_227 (46) = happyShift action_124
action_227 (47) = happyShift action_125
action_227 _ = happyReduce_66

action_228 (39) = happyShift action_152
action_228 (40) = happyShift action_153
action_228 (43) = happyShift action_155
action_228 (44) = happyShift action_156
action_228 (45) = happyShift action_157
action_228 (46) = happyShift action_158
action_228 (47) = happyShift action_159
action_228 _ = happyReduce_149

action_229 _ = happyReduce_151

action_230 _ = happyReduce_153

action_231 _ = happyReduce_159

action_232 (39) = happyShift action_118
action_232 (40) = happyShift action_119
action_232 (41) = happyShift action_120
action_232 (43) = happyShift action_121
action_232 (44) = happyShift action_122
action_232 (45) = happyShift action_123
action_232 (46) = happyShift action_124
action_232 (47) = happyShift action_125
action_232 (64) = happyShift action_126
action_232 (65) = happyShift action_127
action_232 _ = happyReduce_161

action_233 (43) = happyShift action_155
action_233 (44) = happyShift action_156
action_233 (45) = happyShift action_157
action_233 (46) = happyShift action_158
action_233 (47) = happyShift action_159
action_233 _ = happyReduce_131

action_234 (43) = happyShift action_138
action_234 (44) = happyShift action_139
action_234 (45) = happyShift action_140
action_234 (46) = happyShift action_141
action_234 (47) = happyShift action_142
action_234 _ = happyFail (happyExpListPerState 234)

action_235 (43) = happyShift action_121
action_235 (44) = happyShift action_122
action_235 (45) = happyShift action_123
action_235 (46) = happyShift action_124
action_235 (47) = happyShift action_125
action_235 _ = happyReduce_133

action_236 (43) = happyShift action_155
action_236 (44) = happyShift action_156
action_236 (45) = happyShift action_157
action_236 (46) = happyShift action_158
action_236 (47) = happyShift action_159
action_236 _ = happyReduce_139

action_237 (43) = happyShift action_121
action_237 (44) = happyShift action_122
action_237 (45) = happyShift action_123
action_237 (46) = happyShift action_124
action_237 (47) = happyShift action_125
action_237 _ = happyReduce_141

action_238 _ = happyReduce_156

action_239 _ = happyReduce_158

action_240 _ = happyReduce_160

action_241 _ = happyReduce_148

action_242 _ = happyReduce_165

action_243 (43) = happyShift action_155
action_243 (44) = happyShift action_156
action_243 (45) = happyShift action_157
action_243 (46) = happyShift action_158
action_243 (47) = happyShift action_159
action_243 (49) = happyShift action_246
action_243 _ = happyFail (happyExpListPerState 243)

action_244 (43) = happyShift action_121
action_244 (44) = happyShift action_122
action_244 (45) = happyShift action_123
action_244 (46) = happyShift action_124
action_244 (47) = happyShift action_125
action_244 _ = happyFail (happyExpListPerState 244)

action_245 _ = happyReduce_172

action_246 _ = happyReduce_106

action_247 (41) = happyShift action_148
action_247 (64) = happyShift action_150
action_247 _ = happyReduce_126

action_248 (39) = happyShift action_135
action_248 (40) = happyShift action_136
action_248 (41) = happyShift action_137
action_248 (43) = happyShift action_138
action_248 (44) = happyShift action_139
action_248 (45) = happyShift action_140
action_248 (46) = happyShift action_141
action_248 (47) = happyShift action_142
action_248 (64) = happyShift action_143
action_248 _ = happyReduce_124

action_249 (39) = happyShift action_118
action_249 (40) = happyShift action_119
action_249 (41) = happyShift action_120
action_249 (43) = happyShift action_121
action_249 (44) = happyShift action_122
action_249 (45) = happyShift action_123
action_249 (46) = happyShift action_124
action_249 (47) = happyShift action_125
action_249 (64) = happyShift action_126
action_249 (65) = happyShift action_127
action_249 _ = happyReduce_128

action_250 (41) = happyShift action_148
action_250 _ = happyReduce_118

action_251 (39) = happyShift action_135
action_251 (40) = happyShift action_136
action_251 (41) = happyShift action_137
action_251 (43) = happyShift action_138
action_251 (44) = happyShift action_139
action_251 (45) = happyShift action_140
action_251 (46) = happyShift action_141
action_251 (47) = happyShift action_142
action_251 _ = happyReduce_116

action_252 (39) = happyShift action_118
action_252 (40) = happyShift action_119
action_252 (41) = happyShift action_120
action_252 (43) = happyShift action_121
action_252 (44) = happyShift action_122
action_252 (45) = happyShift action_123
action_252 (46) = happyShift action_124
action_252 (47) = happyShift action_125
action_252 (64) = happyShift action_126
action_252 (65) = happyShift action_127
action_252 _ = happyReduce_120

action_253 _ = happyReduce_103

action_254 _ = happyReduce_101

action_255 (43) = happyShift action_121
action_255 (44) = happyShift action_122
action_255 (45) = happyShift action_123
action_255 (46) = happyShift action_124
action_255 (47) = happyShift action_125
action_255 _ = happyReduce_105

action_256 (47) = happyShift action_159
action_256 _ = happyReduce_94

action_257 (47) = happyShift action_142
action_257 _ = happyReduce_92

action_258 (43) = happyShift action_121
action_258 (44) = happyShift action_122
action_258 (45) = happyShift action_123
action_258 (46) = happyShift action_124
action_258 (47) = happyShift action_125
action_258 _ = happyReduce_96

action_259 (47) = happyShift action_159
action_259 _ = happyReduce_85

action_260 (47) = happyShift action_142
action_260 _ = happyReduce_83

action_261 (43) = happyShift action_121
action_261 (44) = happyShift action_122
action_261 (45) = happyShift action_123
action_261 (46) = happyShift action_124
action_261 (47) = happyShift action_125
action_261 _ = happyReduce_87

action_262 (45) = happyShift action_157
action_262 (46) = happyShift action_158
action_262 (47) = happyShift action_159
action_262 _ = happyReduce_76

action_263 (45) = happyShift action_140
action_263 (46) = happyShift action_141
action_263 (47) = happyShift action_142
action_263 _ = happyReduce_74

action_264 (43) = happyShift action_121
action_264 (44) = happyShift action_122
action_264 (45) = happyShift action_123
action_264 (46) = happyShift action_124
action_264 (47) = happyShift action_125
action_264 _ = happyReduce_78

action_265 (45) = happyShift action_157
action_265 (46) = happyShift action_158
action_265 (47) = happyShift action_159
action_265 _ = happyReduce_67

action_266 (45) = happyShift action_140
action_266 (46) = happyShift action_141
action_266 (47) = happyShift action_142
action_266 _ = happyReduce_65

action_267 (43) = happyShift action_121
action_267 (44) = happyShift action_122
action_267 (45) = happyShift action_123
action_267 (46) = happyShift action_124
action_267 (47) = happyShift action_125
action_267 _ = happyReduce_69

action_268 (39) = happyShift action_152
action_268 (40) = happyShift action_153
action_268 (43) = happyShift action_155
action_268 (44) = happyShift action_156
action_268 (45) = happyShift action_157
action_268 (46) = happyShift action_158
action_268 (47) = happyShift action_159
action_268 _ = happyReduce_167

action_269 _ = happyReduce_168

action_270 _ = happyReduce_169

action_271 (39) = happyShift action_135
action_271 (40) = happyShift action_136
action_271 (43) = happyShift action_138
action_271 (44) = happyShift action_139
action_271 (45) = happyShift action_140
action_271 (46) = happyShift action_141
action_271 (47) = happyShift action_142
action_271 _ = happyReduce_166

action_272 _ = happyReduce_170

action_273 (39) = happyShift action_118
action_273 (40) = happyShift action_119
action_273 (41) = happyShift action_120
action_273 (43) = happyShift action_121
action_273 (44) = happyShift action_122
action_273 (45) = happyShift action_123
action_273 (46) = happyShift action_124
action_273 (47) = happyShift action_125
action_273 (64) = happyShift action_126
action_273 (65) = happyShift action_127
action_273 _ = happyReduce_171

action_274 (43) = happyShift action_155
action_274 (44) = happyShift action_156
action_274 (45) = happyShift action_157
action_274 (46) = happyShift action_158
action_274 (47) = happyShift action_159
action_274 _ = happyReduce_134

action_275 (43) = happyShift action_138
action_275 (44) = happyShift action_139
action_275 (45) = happyShift action_140
action_275 (46) = happyShift action_141
action_275 (47) = happyShift action_142
action_275 _ = happyReduce_132

action_276 (43) = happyShift action_121
action_276 (44) = happyShift action_122
action_276 (45) = happyShift action_123
action_276 (46) = happyShift action_124
action_276 (47) = happyShift action_125
action_276 _ = happyReduce_136

action_277 (43) = happyShift action_155
action_277 (44) = happyShift action_156
action_277 (45) = happyShift action_157
action_277 (46) = happyShift action_158
action_277 (47) = happyShift action_159
action_277 _ = happyReduce_142

action_278 (43) = happyShift action_138
action_278 (44) = happyShift action_139
action_278 (45) = happyShift action_140
action_278 (46) = happyShift action_141
action_278 (47) = happyShift action_142
action_278 _ = happyReduce_140

action_279 (43) = happyShift action_121
action_279 (44) = happyShift action_122
action_279 (45) = happyShift action_123
action_279 (46) = happyShift action_124
action_279 (47) = happyShift action_125
action_279 _ = happyReduce_144

action_280 (49) = happyShift action_292
action_280 _ = happyFail (happyExpListPerState 280)

action_281 (49) = happyShift action_291
action_281 _ = happyFail (happyExpListPerState 281)

action_282 (30) = happyShift action_290
action_282 _ = happyFail (happyExpListPerState 282)

action_283 _ = happyReduce_26

action_284 (50) = happyShift action_288
action_284 (57) = happyShift action_289
action_284 (20) = happyGoto action_287
action_284 _ = happyFail (happyExpListPerState 284)

action_285 (30) = happyShift action_286
action_285 _ = happyFail (happyExpListPerState 285)

action_286 (50) = happyShift action_288
action_286 (57) = happyShift action_289
action_286 (20) = happyGoto action_317
action_286 _ = happyFail (happyExpListPerState 286)

action_287 (49) = happyShift action_316
action_287 _ = happyFail (happyExpListPerState 287)

action_288 (31) = happyShift action_76
action_288 (32) = happyShift action_46
action_288 (33) = happyShift action_47
action_288 (34) = happyShift action_48
action_288 (35) = happyShift action_77
action_288 (36) = happyShift action_78
action_288 (44) = happyShift action_79
action_288 (48) = happyShift action_104
action_288 (52) = happyShift action_81
action_288 (66) = happyShift action_82
action_288 (67) = happyShift action_57
action_288 (69) = happyShift action_83
action_288 (70) = happyShift action_84
action_288 (19) = happyGoto action_314
action_288 (21) = happyGoto action_315
action_288 (22) = happyGoto action_300
action_288 (23) = happyGoto action_301
action_288 (24) = happyGoto action_302
action_288 (26) = happyGoto action_100
action_288 (27) = happyGoto action_101
action_288 (28) = happyGoto action_102
action_288 (29) = happyGoto action_303
action_288 _ = happyFail (happyExpListPerState 288)

action_289 _ = happyReduce_57

action_290 (34) = happyShift action_48
action_290 (52) = happyShift action_313
action_290 (67) = happyShift action_57
action_290 (28) = happyGoto action_311
action_290 (29) = happyGoto action_312
action_290 _ = happyFail (happyExpListPerState 290)

action_291 _ = happyReduce_111

action_292 _ = happyReduce_112

action_293 (56) = happyShift action_310
action_293 _ = happyFail (happyExpListPerState 293)

action_294 (30) = happyShift action_309
action_294 _ = happyFail (happyExpListPerState 294)

action_295 (30) = happyShift action_308
action_295 _ = happyFail (happyExpListPerState 295)

action_296 (30) = happyShift action_307
action_296 _ = happyFail (happyExpListPerState 296)

action_297 (30) = happyShift action_306
action_297 _ = happyFail (happyExpListPerState 297)

action_298 (50) = happyShift action_24
action_298 (53) = happyShift action_25
action_298 (15) = happyGoto action_305
action_298 _ = happyFail (happyExpListPerState 298)

action_299 (49) = happyShift action_304
action_299 _ = happyFail (happyExpListPerState 299)

action_300 (39) = happyShift action_152
action_300 (40) = happyShift action_153
action_300 (41) = happyShift action_154
action_300 (43) = happyShift action_155
action_300 (44) = happyShift action_156
action_300 (45) = happyShift action_157
action_300 (46) = happyShift action_158
action_300 (47) = happyShift action_159
action_300 _ = happyReduce_53

action_301 (41) = happyShift action_148
action_301 (64) = happyShift action_150
action_301 (65) = happyShift action_151
action_301 _ = happyReduce_54

action_302 (41) = happyShift action_147
action_302 _ = happyReduce_55

action_303 (41) = happyShift action_134
action_303 _ = happyReduce_56

action_304 _ = happyReduce_18

action_305 _ = happyReduce_17

action_306 (31) = happyShift action_76
action_306 (32) = happyShift action_46
action_306 (33) = happyShift action_47
action_306 (34) = happyShift action_332
action_306 (35) = happyShift action_77
action_306 (36) = happyShift action_78
action_306 (44) = happyShift action_79
action_306 (48) = happyShift action_104
action_306 (52) = happyShift action_81
action_306 (66) = happyShift action_82
action_306 (67) = happyShift action_57
action_306 (69) = happyShift action_83
action_306 (70) = happyShift action_84
action_306 (19) = happyGoto action_331
action_306 (22) = happyGoto action_300
action_306 (23) = happyGoto action_301
action_306 (24) = happyGoto action_302
action_306 (26) = happyGoto action_100
action_306 (27) = happyGoto action_101
action_306 (28) = happyGoto action_102
action_306 (29) = happyGoto action_303
action_306 _ = happyFail (happyExpListPerState 306)

action_307 (31) = happyShift action_76
action_307 (32) = happyShift action_46
action_307 (33) = happyShift action_47
action_307 (34) = happyShift action_330
action_307 (35) = happyShift action_77
action_307 (36) = happyShift action_78
action_307 (44) = happyShift action_79
action_307 (48) = happyShift action_104
action_307 (52) = happyShift action_81
action_307 (66) = happyShift action_82
action_307 (67) = happyShift action_57
action_307 (69) = happyShift action_83
action_307 (70) = happyShift action_84
action_307 (19) = happyGoto action_329
action_307 (22) = happyGoto action_300
action_307 (23) = happyGoto action_301
action_307 (24) = happyGoto action_302
action_307 (26) = happyGoto action_100
action_307 (27) = happyGoto action_101
action_307 (28) = happyGoto action_102
action_307 (29) = happyGoto action_303
action_307 _ = happyFail (happyExpListPerState 307)

action_308 (31) = happyShift action_76
action_308 (32) = happyShift action_46
action_308 (33) = happyShift action_47
action_308 (34) = happyShift action_328
action_308 (35) = happyShift action_77
action_308 (36) = happyShift action_78
action_308 (44) = happyShift action_79
action_308 (48) = happyShift action_104
action_308 (52) = happyShift action_81
action_308 (66) = happyShift action_82
action_308 (67) = happyShift action_57
action_308 (69) = happyShift action_83
action_308 (70) = happyShift action_84
action_308 (19) = happyGoto action_327
action_308 (22) = happyGoto action_300
action_308 (23) = happyGoto action_301
action_308 (24) = happyGoto action_302
action_308 (26) = happyGoto action_100
action_308 (27) = happyGoto action_101
action_308 (28) = happyGoto action_102
action_308 (29) = happyGoto action_303
action_308 _ = happyFail (happyExpListPerState 308)

action_309 (31) = happyShift action_76
action_309 (32) = happyShift action_46
action_309 (33) = happyShift action_47
action_309 (34) = happyShift action_326
action_309 (35) = happyShift action_77
action_309 (36) = happyShift action_78
action_309 (44) = happyShift action_79
action_309 (48) = happyShift action_104
action_309 (52) = happyShift action_81
action_309 (66) = happyShift action_82
action_309 (67) = happyShift action_57
action_309 (69) = happyShift action_83
action_309 (70) = happyShift action_84
action_309 (19) = happyGoto action_325
action_309 (22) = happyGoto action_300
action_309 (23) = happyGoto action_301
action_309 (24) = happyGoto action_302
action_309 (26) = happyGoto action_100
action_309 (27) = happyGoto action_101
action_309 (28) = happyGoto action_102
action_309 (29) = happyGoto action_303
action_309 _ = happyFail (happyExpListPerState 309)

action_310 (32) = happyShift action_46
action_310 (33) = happyShift action_47
action_310 (34) = happyShift action_48
action_310 (48) = happyShift action_49
action_310 (68) = happyShift action_50
action_310 (17) = happyGoto action_324
action_310 (18) = happyGoto action_42
action_310 (26) = happyGoto action_43
action_310 (27) = happyGoto action_44
action_310 (28) = happyGoto action_45
action_310 _ = happyFail (happyExpListPerState 310)

action_311 (49) = happyShift action_323
action_311 _ = happyFail (happyExpListPerState 311)

action_312 (49) = happyShift action_322
action_312 _ = happyFail (happyExpListPerState 312)

action_313 (49) = happyShift action_321
action_313 _ = happyFail (happyExpListPerState 313)

action_314 (30) = happyShift action_320
action_314 _ = happyReduce_59

action_315 (51) = happyShift action_319
action_315 _ = happyFail (happyExpListPerState 315)

action_316 _ = happyReduce_19

action_317 (49) = happyShift action_318
action_317 _ = happyFail (happyExpListPerState 317)

action_318 (30) = happyShift action_342
action_318 _ = happyReduce_21

action_319 _ = happyReduce_58

action_320 (31) = happyShift action_76
action_320 (32) = happyShift action_46
action_320 (33) = happyShift action_47
action_320 (34) = happyShift action_48
action_320 (35) = happyShift action_77
action_320 (36) = happyShift action_78
action_320 (44) = happyShift action_79
action_320 (48) = happyShift action_104
action_320 (52) = happyShift action_81
action_320 (66) = happyShift action_82
action_320 (67) = happyShift action_57
action_320 (69) = happyShift action_83
action_320 (70) = happyShift action_84
action_320 (19) = happyGoto action_314
action_320 (21) = happyGoto action_341
action_320 (22) = happyGoto action_300
action_320 (23) = happyGoto action_301
action_320 (24) = happyGoto action_302
action_320 (26) = happyGoto action_100
action_320 (27) = happyGoto action_101
action_320 (28) = happyGoto action_102
action_320 (29) = happyGoto action_303
action_320 _ = happyFail (happyExpListPerState 320)

action_321 _ = happyReduce_175

action_322 _ = happyReduce_176

action_323 _ = happyReduce_177

action_324 _ = happyReduce_37

action_325 (49) = happyShift action_340
action_325 _ = happyFail (happyExpListPerState 325)

action_326 (49) = happyShift action_339
action_326 _ = happyReduce_184

action_327 (49) = happyShift action_338
action_327 _ = happyFail (happyExpListPerState 327)

action_328 (49) = happyShift action_337
action_328 _ = happyReduce_184

action_329 (49) = happyShift action_336
action_329 _ = happyFail (happyExpListPerState 329)

action_330 (49) = happyShift action_335
action_330 _ = happyReduce_184

action_331 (49) = happyShift action_334
action_331 _ = happyFail (happyExpListPerState 331)

action_332 (49) = happyShift action_333
action_332 _ = happyReduce_184

action_333 _ = happyReduce_51

action_334 _ = happyReduce_50

action_335 _ = happyReduce_49

action_336 _ = happyReduce_45

action_337 _ = happyReduce_48

action_338 _ = happyReduce_46

action_339 _ = happyReduce_47

action_340 _ = happyReduce_44

action_341 _ = happyReduce_60

action_342 (48) = happyShift action_37
action_342 (11) = happyGoto action_343
action_342 _ = happyFail (happyExpListPerState 342)

action_343 _ = happyReduce_22

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

happyReduce_15 = happyReduce 4 9 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Map happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  9 happyReduction_16
happyReduction_16 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Union happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

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

happyReduce_19 = happyReduce 7 10 happyReduction_19
happyReduction_19 (_ `HappyStk`
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

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TTLCombs happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 7 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
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

happyReduce_22 = happyReduce 9 11 happyReduction_22
happyReduction_22 ((HappyAbsSyn11  happy_var_9) `HappyStk`
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

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn12
		 (Any
	)

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (FilteredList happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  13 happyReduction_25
happyReduction_25 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn13
		 (SimpleUrl happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn13
		 (UrlSeq happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  14 happyReduction_27
happyReduction_27 _
	_
	 =  HappyAbsSyn14
		 (BidirectJoin
	)

happyReduce_28 = happySpecReduce_2  14 happyReduction_28
happyReduction_28 _
	_
	 =  HappyAbsSyn14
		 (BidirectJoin
	)

happyReduce_29 = happySpecReduce_1  14 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn14
		 (LeftJoin
	)

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn14
		 (RightJoin
	)

happyReduce_31 = happySpecReduce_3  15 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (StrList happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  15 happyReduction_32
happyReduction_32 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn15
		 (StrListSingle happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn16
		 (SListEl happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 (HappyAbsSyn16  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn16
		 (SListSeq happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  17 happyReduction_35
happyReduction_35 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (Always happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  17 happyReduction_36
happyReduction_36 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (ActionSeq happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 7 17 happyReduction_37
happyReduction_37 ((HappyAbsSyn17  happy_var_7) `HappyStk`
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

happyReduce_38 = happySpecReduce_3  18 happyReduction_38
happyReduction_38 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignSubj happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  18 happyReduction_39
happyReduction_39 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignPred happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  18 happyReduction_40
happyReduction_40 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjUrl happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  18 happyReduction_41
happyReduction_41 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjStr happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  18 happyReduction_42
happyReduction_42 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjInt happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  18 happyReduction_43
happyReduction_43 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn18
		 (AssignObjBool happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happyReduce 8 18 happyReduction_44
happyReduction_44 (_ `HappyStk`
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

happyReduce_45 = happyReduce 8 18 happyReduction_45
happyReduction_45 (_ `HappyStk`
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

happyReduce_46 = happyReduce 8 18 happyReduction_46
happyReduction_46 (_ `HappyStk`
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

happyReduce_47 = happyReduce 8 18 happyReduction_47
happyReduction_47 (_ `HappyStk`
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

happyReduce_48 = happyReduce 8 18 happyReduction_48
happyReduction_48 (_ `HappyStk`
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

happyReduce_49 = happyReduce 8 18 happyReduction_49
happyReduction_49 (_ `HappyStk`
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

happyReduce_50 = happyReduce 8 18 happyReduction_50
happyReduction_50 (_ `HappyStk`
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

happyReduce_51 = happyReduce 8 18 happyReduction_51
happyReduction_51 (_ `HappyStk`
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

happyReduce_52 = happySpecReduce_3  18 happyReduction_52
happyReduction_52 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  19 happyReduction_53
happyReduction_53 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 (IntLit happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  19 happyReduction_54
happyReduction_54 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn19
		 (BoolLit happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  19 happyReduction_55
happyReduction_55 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (StrLit happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  19 happyReduction_56
happyReduction_56 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn19
		 (UrlLit happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  20 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn20
		 (AnyLit
	)

happyReduce_58 = happySpecReduce_3  20 happyReduction_58
happyReduction_58 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (LiteralLst happy_var_2
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  21 happyReduction_59
happyReduction_59 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (SingleLit happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  21 happyReduction_60
happyReduction_60 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  22 happyReduction_61
happyReduction_61 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  22 happyReduction_62
happyReduction_62 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  22 happyReduction_63
happyReduction_63 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  22 happyReduction_64
happyReduction_64 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  22 happyReduction_65
happyReduction_65 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVO happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  22 happyReduction_66
happyReduction_66 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOV happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  22 happyReduction_67
happyReduction_67 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVI happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  22 happyReduction_68
happyReduction_68 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIV happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  22 happyReduction_69
happyReduction_69 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVV happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  22 happyReduction_70
happyReduction_70 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  22 happyReduction_71
happyReduction_71 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  22 happyReduction_72
happyReduction_72 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  22 happyReduction_73
happyReduction_73 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  22 happyReduction_74
happyReduction_74 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVO happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  22 happyReduction_75
happyReduction_75 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOV happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  22 happyReduction_76
happyReduction_76 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVI happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  22 happyReduction_77
happyReduction_77 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIV happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  22 happyReduction_78
happyReduction_78 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVV happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  22 happyReduction_79
happyReduction_79 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  22 happyReduction_80
happyReduction_80 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  22 happyReduction_81
happyReduction_81 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  22 happyReduction_82
happyReduction_82 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  22 happyReduction_83
happyReduction_83 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVO happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  22 happyReduction_84
happyReduction_84 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOV happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  22 happyReduction_85
happyReduction_85 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVI happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  22 happyReduction_86
happyReduction_86 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIV happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  22 happyReduction_87
happyReduction_87 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVV happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  22 happyReduction_88
happyReduction_88 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  22 happyReduction_89
happyReduction_89 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  22 happyReduction_90
happyReduction_90 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  22 happyReduction_91
happyReduction_91 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  22 happyReduction_92
happyReduction_92 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVO happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  22 happyReduction_93
happyReduction_93 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOV happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  22 happyReduction_94
happyReduction_94 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVI happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  22 happyReduction_95
happyReduction_95 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIV happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  22 happyReduction_96
happyReduction_96 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVV happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  22 happyReduction_97
happyReduction_97 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  22 happyReduction_98
happyReduction_98 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  22 happyReduction_99
happyReduction_99 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  22 happyReduction_100
happyReduction_100 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  22 happyReduction_101
happyReduction_101 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVO happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  22 happyReduction_102
happyReduction_102 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOV happy_var_1 happy_var_3
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_3  22 happyReduction_103
happyReduction_103 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVI happy_var_1 happy_var_3
	)
happyReduction_103 _ _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_3  22 happyReduction_104
happyReduction_104 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIV happy_var_1 happy_var_3
	)
happyReduction_104 _ _ _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_3  22 happyReduction_105
happyReduction_105 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVV happy_var_1 happy_var_3
	)
happyReduction_105 _ _ _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_3  22 happyReduction_106
happyReduction_106 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (happy_var_2
	)
happyReduction_106 _ _ _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_2  22 happyReduction_107
happyReduction_107 (HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateI happy_var_2
	)
happyReduction_107 _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_2  22 happyReduction_108
happyReduction_108 (HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateO happy_var_2
	)
happyReduction_108 _ _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_2  22 happyReduction_109
happyReduction_109 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn22
		 (NegateV happy_var_2
	)
happyReduction_109 _ _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_1  22 happyReduction_110
happyReduction_110 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn22
		 (QInt happy_var_1
	)
happyReduction_110 _  = notHappyAtAll 

happyReduce_111 = happyReduce 4 22 happyReduction_111
happyReduction_111 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Length happy_var_3
	) `HappyStk` happyRest

happyReduce_112 = happyReduce 4 22 happyReduction_112
happyReduction_112 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (LengthObj
	) `HappyStk` happyRest

happyReduce_113 = happySpecReduce_3  23 happyReduction_113
happyReduction_113 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (And happy_var_1 happy_var_3
	)
happyReduction_113 _ _ _  = notHappyAtAll 

happyReduce_114 = happySpecReduce_3  23 happyReduction_114
happyReduction_114 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_114 _ _ _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_3  23 happyReduction_115
happyReduction_115 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_115 _ _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_3  23 happyReduction_116
happyReduction_116 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVO happy_var_1 happy_var_3
	)
happyReduction_116 _ _ _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_3  23 happyReduction_117
happyReduction_117 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOV happy_var_1 happy_var_3
	)
happyReduction_117 _ _ _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_3  23 happyReduction_118
happyReduction_118 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVB happy_var_1 happy_var_3
	)
happyReduction_118 _ _ _  = notHappyAtAll 

happyReduce_119 = happySpecReduce_3  23 happyReduction_119
happyReduction_119 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndBV happy_var_1 happy_var_3
	)
happyReduction_119 _ _ _  = notHappyAtAll 

happyReduce_120 = happySpecReduce_3  23 happyReduction_120
happyReduction_120 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVV happy_var_1 happy_var_3
	)
happyReduction_120 _ _ _  = notHappyAtAll 

happyReduce_121 = happySpecReduce_3  23 happyReduction_121
happyReduction_121 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (Or happy_var_1 happy_var_3
	)
happyReduction_121 _ _ _  = notHappyAtAll 

happyReduce_122 = happySpecReduce_3  23 happyReduction_122
happyReduction_122 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_122 _ _ _  = notHappyAtAll 

happyReduce_123 = happySpecReduce_3  23 happyReduction_123
happyReduction_123 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_123 _ _ _  = notHappyAtAll 

happyReduce_124 = happySpecReduce_3  23 happyReduction_124
happyReduction_124 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVO happy_var_1 happy_var_3
	)
happyReduction_124 _ _ _  = notHappyAtAll 

happyReduce_125 = happySpecReduce_3  23 happyReduction_125
happyReduction_125 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOV happy_var_1 happy_var_3
	)
happyReduction_125 _ _ _  = notHappyAtAll 

happyReduce_126 = happySpecReduce_3  23 happyReduction_126
happyReduction_126 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVB happy_var_1 happy_var_3
	)
happyReduction_126 _ _ _  = notHappyAtAll 

happyReduce_127 = happySpecReduce_3  23 happyReduction_127
happyReduction_127 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrBV happy_var_1 happy_var_3
	)
happyReduction_127 _ _ _  = notHappyAtAll 

happyReduce_128 = happySpecReduce_3  23 happyReduction_128
happyReduction_128 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVV happy_var_1 happy_var_3
	)
happyReduction_128 _ _ _  = notHappyAtAll 

happyReduce_129 = happySpecReduce_3  23 happyReduction_129
happyReduction_129 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_129 _ _ _  = notHappyAtAll 

happyReduce_130 = happySpecReduce_3  23 happyReduction_130
happyReduction_130 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_130 _ _ _  = notHappyAtAll 

happyReduce_131 = happySpecReduce_3  23 happyReduction_131
happyReduction_131 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_131 _ _ _  = notHappyAtAll 

happyReduce_132 = happySpecReduce_3  23 happyReduction_132
happyReduction_132 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVO happy_var_1 happy_var_3
	)
happyReduction_132 _ _ _  = notHappyAtAll 

happyReduce_133 = happySpecReduce_3  23 happyReduction_133
happyReduction_133 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOV happy_var_1 happy_var_3
	)
happyReduction_133 _ _ _  = notHappyAtAll 

happyReduce_134 = happySpecReduce_3  23 happyReduction_134
happyReduction_134 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVI happy_var_1 happy_var_3
	)
happyReduction_134 _ _ _  = notHappyAtAll 

happyReduce_135 = happySpecReduce_3  23 happyReduction_135
happyReduction_135 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIV happy_var_1 happy_var_3
	)
happyReduction_135 _ _ _  = notHappyAtAll 

happyReduce_136 = happySpecReduce_3  23 happyReduction_136
happyReduction_136 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVV happy_var_1 happy_var_3
	)
happyReduction_136 _ _ _  = notHappyAtAll 

happyReduce_137 = happySpecReduce_3  23 happyReduction_137
happyReduction_137 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_137 _ _ _  = notHappyAtAll 

happyReduce_138 = happySpecReduce_3  23 happyReduction_138
happyReduction_138 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_138 _ _ _  = notHappyAtAll 

happyReduce_139 = happySpecReduce_3  23 happyReduction_139
happyReduction_139 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_139 _ _ _  = notHappyAtAll 

happyReduce_140 = happySpecReduce_3  23 happyReduction_140
happyReduction_140 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVO happy_var_1 happy_var_3
	)
happyReduction_140 _ _ _  = notHappyAtAll 

happyReduce_141 = happySpecReduce_3  23 happyReduction_141
happyReduction_141 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOV happy_var_1 happy_var_3
	)
happyReduction_141 _ _ _  = notHappyAtAll 

happyReduce_142 = happySpecReduce_3  23 happyReduction_142
happyReduction_142 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVI happy_var_1 happy_var_3
	)
happyReduction_142 _ _ _  = notHappyAtAll 

happyReduce_143 = happySpecReduce_3  23 happyReduction_143
happyReduction_143 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIV happy_var_1 happy_var_3
	)
happyReduction_143 _ _ _  = notHappyAtAll 

happyReduce_144 = happySpecReduce_3  23 happyReduction_144
happyReduction_144 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVV happy_var_1 happy_var_3
	)
happyReduction_144 _ _ _  = notHappyAtAll 

happyReduce_145 = happySpecReduce_3  23 happyReduction_145
happyReduction_145 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_145 _ _ _  = notHappyAtAll 

happyReduce_146 = happySpecReduce_3  23 happyReduction_146
happyReduction_146 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_146 _ _ _  = notHappyAtAll 

happyReduce_147 = happySpecReduce_3  23 happyReduction_147
happyReduction_147 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_147 _ _ _  = notHappyAtAll 

happyReduce_148 = happySpecReduce_3  23 happyReduction_148
happyReduction_148 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_148 _ _ _  = notHappyAtAll 

happyReduce_149 = happySpecReduce_3  23 happyReduction_149
happyReduction_149 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_149 _ _ _  = notHappyAtAll 

happyReduce_150 = happySpecReduce_3  23 happyReduction_150
happyReduction_150 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_150 _ _ _  = notHappyAtAll 

happyReduce_151 = happySpecReduce_3  23 happyReduction_151
happyReduction_151 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_151 _ _ _  = notHappyAtAll 

happyReduce_152 = happySpecReduce_3  23 happyReduction_152
happyReduction_152 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_152 _ _ _  = notHappyAtAll 

happyReduce_153 = happySpecReduce_3  23 happyReduction_153
happyReduction_153 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_153 _ _ _  = notHappyAtAll 

happyReduce_154 = happySpecReduce_3  23 happyReduction_154
happyReduction_154 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_154 _ _ _  = notHappyAtAll 

happyReduce_155 = happySpecReduce_3  23 happyReduction_155
happyReduction_155 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQSU happy_var_3
	)
happyReduction_155 _ _ _  = notHappyAtAll 

happyReduce_156 = happySpecReduce_3  23 happyReduction_156
happyReduction_156 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUS happy_var_1
	)
happyReduction_156 _ _ _  = notHappyAtAll 

happyReduce_157 = happySpecReduce_3  23 happyReduction_157
happyReduction_157 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQPU happy_var_3
	)
happyReduction_157 _ _ _  = notHappyAtAll 

happyReduce_158 = happySpecReduce_3  23 happyReduction_158
happyReduction_158 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUP happy_var_1
	)
happyReduction_158 _ _ _  = notHappyAtAll 

happyReduce_159 = happySpecReduce_3  23 happyReduction_159
happyReduction_159 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQOU happy_var_3
	)
happyReduction_159 _ _ _  = notHappyAtAll 

happyReduce_160 = happySpecReduce_3  23 happyReduction_160
happyReduction_160 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUO happy_var_1
	)
happyReduction_160 _ _ _  = notHappyAtAll 

happyReduce_161 = happySpecReduce_3  23 happyReduction_161
happyReduction_161 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOV happy_var_1 happy_var_3
	)
happyReduction_161 _ _ _  = notHappyAtAll 

happyReduce_162 = happySpecReduce_3  23 happyReduction_162
happyReduction_162 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIV happy_var_1 happy_var_3
	)
happyReduction_162 _ _ _  = notHappyAtAll 

happyReduce_163 = happySpecReduce_3  23 happyReduction_163
happyReduction_163 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBV happy_var_1 happy_var_3
	)
happyReduction_163 _ _ _  = notHappyAtAll 

happyReduce_164 = happySpecReduce_3  23 happyReduction_164
happyReduction_164 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSV happy_var_1 happy_var_3
	)
happyReduction_164 _ _ _  = notHappyAtAll 

happyReduce_165 = happySpecReduce_3  23 happyReduction_165
happyReduction_165 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUV happy_var_1 happy_var_3
	)
happyReduction_165 _ _ _  = notHappyAtAll 

happyReduce_166 = happySpecReduce_3  23 happyReduction_166
happyReduction_166 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVO happy_var_1 happy_var_3
	)
happyReduction_166 _ _ _  = notHappyAtAll 

happyReduce_167 = happySpecReduce_3  23 happyReduction_167
happyReduction_167 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVI happy_var_1 happy_var_3
	)
happyReduction_167 _ _ _  = notHappyAtAll 

happyReduce_168 = happySpecReduce_3  23 happyReduction_168
happyReduction_168 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVB happy_var_1 happy_var_3
	)
happyReduction_168 _ _ _  = notHappyAtAll 

happyReduce_169 = happySpecReduce_3  23 happyReduction_169
happyReduction_169 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVS happy_var_1 happy_var_3
	)
happyReduction_169 _ _ _  = notHappyAtAll 

happyReduce_170 = happySpecReduce_3  23 happyReduction_170
happyReduction_170 (HappyAbsSyn29  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVU happy_var_1 happy_var_3
	)
happyReduction_170 _ _ _  = notHappyAtAll 

happyReduce_171 = happySpecReduce_3  23 happyReduction_171
happyReduction_171 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVV happy_var_1 happy_var_3
	)
happyReduction_171 _ _ _  = notHappyAtAll 

happyReduce_172 = happySpecReduce_3  23 happyReduction_172
happyReduction_172 _
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (happy_var_2
	)
happyReduction_172 _ _ _  = notHappyAtAll 

happyReduce_173 = happySpecReduce_1  23 happyReduction_173
happyReduction_173 _
	 =  HappyAbsSyn23
		 (QTrue
	)

happyReduce_174 = happySpecReduce_1  23 happyReduction_174
happyReduction_174 _
	 =  HappyAbsSyn23
		 (QFalse
	)

happyReduce_175 = happyReduce 6 23 happyReduction_175
happyReduction_175 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithStr happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_176 = happyReduce 6 23 happyReduction_176
happyReduction_176 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithUrl happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_177 = happyReduce 6 23 happyReduction_177
happyReduction_177 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithObj happy_var_3
	) `HappyStk` happyRest

happyReduce_178 = happySpecReduce_1  24 happyReduction_178
happyReduction_178 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn24
		 (QString happy_var_1
	)
happyReduction_178 _  = notHappyAtAll 

happyReduce_179 = happySpecReduce_1  25 happyReduction_179
happyReduction_179 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (S happy_var_1
	)
happyReduction_179 _  = notHappyAtAll 

happyReduce_180 = happySpecReduce_1  25 happyReduction_180
happyReduction_180 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (P happy_var_1
	)
happyReduction_180 _  = notHappyAtAll 

happyReduce_181 = happySpecReduce_1  25 happyReduction_181
happyReduction_181 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn25
		 (O happy_var_1
	)
happyReduction_181 _  = notHappyAtAll 

happyReduce_182 = happySpecReduce_1  26 happyReduction_182
happyReduction_182 _
	 =  HappyAbsSyn26
		 (Subj
	)

happyReduce_183 = happySpecReduce_1  27 happyReduction_183
happyReduction_183 _
	 =  HappyAbsSyn27
		 (Pred
	)

happyReduce_184 = happySpecReduce_1  28 happyReduction_184
happyReduction_184 _
	 =  HappyAbsSyn28
		 (Obj
	)

happyReduce_185 = happySpecReduce_1  29 happyReduction_185
happyReduction_185 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn29
		 (NewUrl happy_var_1
	)
happyReduction_185 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 71 71 notHappyAtAll (HappyState action) sts stk []

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
	TokenMap _ -> cont 60;
	TokenUnion _ -> cont 61;
	TokenJoin _ -> cont 62;
	TokenWhere _ -> cont 63;
	TokenAnd _ -> cont 64;
	TokenOr _ -> cont 65;
	TokenVar _ happy_dollar_dollar -> cont 66;
	TokenUrl _ happy_dollar_dollar -> cont 67;
	TokenAdd _ -> cont 68;
	TokenLength _ -> cont 69;
	TokenStarts _ -> cont 70;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 71 tk tks = happyError' (tks, explist)
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
            Filter Combinations | AddTripSPO Url Url Literal
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
