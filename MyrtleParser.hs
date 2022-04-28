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
happyExpList = Happy_Data_Array.listArray (0,999) ([0,0,0,16,0,0,0,1024,0,0,0,0,2,0,0,0,0,0,0,0,8192,0,0,0,0,1920,1,0,0,57344,65,0,0,2,0,0,0,0,8192,0,0,0,2048,0,0,0,10240,0,0,0,0,2,0,0,0,4608,0,0,0,8204,0,0,0,0,8,0,0,0,2,0,0,0,128,0,0,0,0,0,128,0,0,2048,0,0,0,128,0,0,0,4096,0,0,0,57344,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,224,32,256,0,0,0,0,0,0,0,1032,0,0,0,128,0,0,0,0,1920,1,0,0,0,16,0,0,0,0,0,0,0,0,1,0,32768,0,0,0,0,0,0,0,0,0,16,0,0,0,512,1,0,2048,0,0,0,0,0,0,32,0,0,0,0,0,0,0,1,0,0,8,0,0,0,0,32,0,0,0,2048,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,34831,8,31,0,0,32,0,0,0,16384,0,0,32768,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14336,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,2048,0,8192,0,0,0,0,224,0,0,0,0,0,1,0,0,0,0,0,0,0,0,512,0,0,16384,0,0,0,56320,7,0,0,0,1028,768,0,0,256,0,0,0,49152,0,0,0,0,48,0,0,0,65280,1,3,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,34818,0,9,0,1008,546,1984,0,0,0,0,0,0,63232,1,3,0,0,128,0,0,0,8192,0,0,0,33020,136,432,0,0,0,2048,0,0,0,0,2,0,224,32,256,0,0,0,0,0,0,0,16,0,0,32,0,0,0,0,32768,64,0,0,2,0,0,0,0,0,0,0,49152,34831,8,27,0,0,0,0,0,0,2012,0,0,0,1024,0,3,0,0,1,0,0,0,64,0,0,0,4096,0,0,0,0,503,768,0,0,256,0,0,0,1008,546,1728,0,0,8192,16,0,32768,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28672,31,0,0,0,16,3072,0,0,1024,0,0,0,0,1,0,0,0,0,2,0,0,32,128,0,0,2304,544,9216,0,16384,34818,0,9,0,1008,546,1728,0,9216,2176,36864,0,0,8201,2,36,0,576,136,2304,0,36864,8704,16384,2,0,32804,8,144,0,16128,8736,27648,0,49152,34831,8,27,0,28672,95,0,0,0,4112,3072,0,0,0,0,0,0,0,0,0,0,36864,8704,16384,2,0,0,0,0,0,3584,0,3072,0,16384,34818,0,9,0,144,34,576,0,64512,34944,45056,1,0,8201,2,36,0,576,136,2304,0,36864,8704,16384,2,0,32804,8,144,0,2304,544,9216,0,49152,34831,8,27,0,1008,546,1728,0,0,0,8192,0,0,0,0,8,0,512,2048,256,0,61440,8707,49154,6,0,0,1024,0,0,16128,8736,27648,0,49152,34831,8,27,0,144,34,576,0,9216,2176,36864,0,0,8201,2,36,0,576,136,2304,0,36864,8704,16384,2,0,32804,8,144,0,2304,544,9216,0,16384,34818,0,9,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,256,0,0,57344,0,0,0,0,2,0,0,0,16128,8736,27648,0,0,0,1,0,0,0,1152,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,7936,0,0,0,0,4,0,0,0,256,0,0,0,31744,0,0,0,0,16,0,0,0,1024,0,0,0,61440,1,0,0,0,112,0,0,0,7168,0,0,0,49152,7,0,0,0,448,0,0,0,28672,0,0,0,0,31,0,0,0,1984,0,0,0,61440,1,0,0,0,124,0,0,0,7936,0,0,0,49152,7,0,0,0,496,0,0,0,31744,0,0,0,0,31,0,0,0,1984,0,0,0,1024,0,1,0,49152,125,64,0,0,8048,12288,0,0,4096,0,0,0,0,503,0,0,0,32192,49152,0,0,224,32,256,0,0,0,0,0,0,62208,1,0,0,49152,125,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,1024,0,0,63232,1,3,0,0,1,0,0,0,8048,12288,0,0,0,0,0,0,0,0,0,0,0,31744,0,0,0,0,16,0,0,0,1024,0,0,0,61440,1,0,0,0,64,0,0,0,4096,0,0,0,49152,7,0,0,0,448,0,0,0,28672,0,0,0,0,31,0,0,0,1792,0,0,0,49152,1,0,0,0,124,0,0,0,7984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28672,31,48,0,0,1984,0,0,0,61440,1,0,0,0,124,0,0,0,7936,0,0,0,49152,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,380,0,0,0,7936,0,0,0,0,0,0,0,0,0,0,0,0,256,16384,0,0,28672,31,16,0,0,2012,3072,0,0,1024,0,0,0,49152,125,0,0,0,8048,12288,0,0,0,0,0,0,0,0,0,0,0,31744,0,0,0,0,16,0,0,0,1024,0,0,0,61440,1,0,0,0,64,0,0,0,4096,0,0,0,49152,7,0,0,0,448,0,0,0,28672,0,0,0,0,31,0,0,0,1792,0,0,0,49152,1,0,0,0,124,0,0,0,7984,0,0,0,0,0,0,0,0,0,0,0,0,31936,0,0,0,0,0,0,0,0,2012,3072,0,0,61440,1,0,0,0,124,0,0,0,7936,0,0,0,49152,7,0,0,0,496,0,0,0,31744,0,0,0,0,64,0,0,0,4096,0,0,32768,0,0,0,0,0,0,0,0,0,32768,64,0,0,2,0,0,0,0,2048,4,0,0,0,1,0,0,1008,546,1728,0,0,0,0,0,0,8,32,8,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,128,0,0,0,0,0,0,0,0,0,1152,0,0,0,4096,0,0,0,63232,1,0,0,0,1,192,0,0,64,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,1008,546,1728,0,14336,2048,16384,0,0,0,4,0,0,0,256,0,0,0,16384,0,0,0,2,0,0,0,0,4096,0,0,0,0,0,0,0,0,64,0,0,512,0,0,0,0,0,0,0,0,4032,2184,6912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0
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

action_16 (40) = happyShift action_61
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (66) = happyShift action_60
action_17 (29) = happyGoto action_59
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (48) = happyShift action_58
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (38) = happyShift action_57
action_19 _ = happyReduce_29

action_20 (37) = happyShift action_56
action_20 _ = happyReduce_30

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

action_24 _ = happyReduce_32

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
action_32 (7) = happyGoto action_97
action_32 (8) = happyGoto action_32
action_32 _ = happyReduce_7

action_33 (42) = happyShift action_96
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_6

action_35 (51) = happyShift action_95
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (50) = happyShift action_38
action_36 (57) = happyShift action_39
action_36 (12) = happyGoto action_94
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (30) = happyShift action_93
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (66) = happyShift action_60
action_38 (13) = happyGoto action_91
action_38 (29) = happyGoto action_92
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_23

action_40 (49) = happyShift action_90
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (30) = happyShift action_89
action_41 _ = happyReduce_35

action_42 (42) = happyShift action_88
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (42) = happyShift action_87
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (42) = happyShift action_86
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_175

action_46 _ = happyReduce_176

action_47 _ = happyReduce_177

action_48 (31) = happyShift action_77
action_48 (32) = happyShift action_45
action_48 (33) = happyShift action_46
action_48 (34) = happyShift action_47
action_48 (35) = happyShift action_78
action_48 (36) = happyShift action_79
action_48 (44) = happyShift action_80
action_48 (48) = happyShift action_81
action_48 (52) = happyShift action_82
action_48 (65) = happyShift action_83
action_48 (66) = happyShift action_60
action_48 (67) = happyShift action_49
action_48 (68) = happyShift action_84
action_48 (69) = happyShift action_85
action_48 (18) = happyGoto action_69
action_48 (22) = happyGoto action_70
action_48 (23) = happyGoto action_71
action_48 (24) = happyGoto action_72
action_48 (26) = happyGoto action_73
action_48 (27) = happyGoto action_74
action_48 (28) = happyGoto action_75
action_48 (29) = happyGoto action_76
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (48) = happyShift action_68
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (51) = happyShift action_67
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (30) = happyShift action_66
action_51 _ = happyReduce_33

action_52 (30) = happyShift action_65
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_172

action_54 _ = happyReduce_173

action_55 _ = happyReduce_174

action_56 _ = happyReduce_27

action_57 _ = happyReduce_28

action_58 (32) = happyShift action_45
action_58 (33) = happyShift action_46
action_58 (34) = happyShift action_47
action_58 (25) = happyGoto action_64
action_58 (26) = happyGoto action_53
action_58 (27) = happyGoto action_54
action_58 (28) = happyGoto action_55
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (30) = happyShift action_63
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_178

action_61 (53) = happyShift action_62
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_1

action_63 (66) = happyShift action_60
action_63 (29) = happyGoto action_166
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (30) = happyShift action_165
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (32) = happyShift action_45
action_65 (33) = happyShift action_46
action_65 (34) = happyShift action_47
action_65 (25) = happyGoto action_164
action_65 (26) = happyGoto action_53
action_65 (27) = happyGoto action_54
action_65 (28) = happyGoto action_55
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (53) = happyShift action_51
action_66 (16) = happyGoto action_163
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_31

action_68 (66) = happyShift action_60
action_68 (29) = happyGoto action_162
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (49) = happyShift action_161
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (39) = happyShift action_153
action_70 (40) = happyShift action_154
action_70 (41) = happyShift action_155
action_70 (43) = happyShift action_156
action_70 (44) = happyShift action_157
action_70 (45) = happyShift action_158
action_70 (46) = happyShift action_159
action_70 (47) = happyShift action_160
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (41) = happyShift action_149
action_71 (49) = happyShift action_150
action_71 (63) = happyShift action_151
action_71 (64) = happyShift action_152
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (41) = happyShift action_148
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (41) = happyShift action_147
action_73 (42) = happyShift action_88
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (41) = happyShift action_146
action_74 (42) = happyShift action_87
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (39) = happyShift action_136
action_75 (40) = happyShift action_137
action_75 (41) = happyShift action_138
action_75 (42) = happyShift action_86
action_75 (43) = happyShift action_139
action_75 (44) = happyShift action_140
action_75 (45) = happyShift action_141
action_75 (46) = happyShift action_142
action_75 (47) = happyShift action_143
action_75 (63) = happyShift action_144
action_75 (64) = happyShift action_145
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (41) = happyShift action_135
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_103

action_78 _ = happyReduce_166

action_79 _ = happyReduce_167

action_80 (31) = happyShift action_77
action_80 (34) = happyShift action_47
action_80 (44) = happyShift action_80
action_80 (48) = happyShift action_133
action_80 (65) = happyShift action_134
action_80 (68) = happyShift action_84
action_80 (22) = happyGoto action_131
action_80 (28) = happyGoto action_132
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (31) = happyShift action_77
action_81 (32) = happyShift action_45
action_81 (33) = happyShift action_46
action_81 (34) = happyShift action_47
action_81 (35) = happyShift action_78
action_81 (36) = happyShift action_79
action_81 (44) = happyShift action_80
action_81 (48) = happyShift action_81
action_81 (52) = happyShift action_82
action_81 (65) = happyShift action_83
action_81 (66) = happyShift action_60
action_81 (67) = happyShift action_49
action_81 (68) = happyShift action_84
action_81 (69) = happyShift action_85
action_81 (18) = happyGoto action_69
action_81 (22) = happyGoto action_129
action_81 (23) = happyGoto action_130
action_81 (24) = happyGoto action_72
action_81 (26) = happyGoto action_73
action_81 (27) = happyGoto action_74
action_81 (28) = happyGoto action_75
action_81 (29) = happyGoto action_76
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_171

action_83 (39) = happyShift action_119
action_83 (40) = happyShift action_120
action_83 (41) = happyShift action_121
action_83 (43) = happyShift action_122
action_83 (44) = happyShift action_123
action_83 (45) = happyShift action_124
action_83 (46) = happyShift action_125
action_83 (47) = happyShift action_126
action_83 (63) = happyShift action_127
action_83 (64) = happyShift action_128
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (48) = happyShift action_118
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (48) = happyShift action_117
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (31) = happyShift action_77
action_86 (32) = happyShift action_45
action_86 (33) = happyShift action_46
action_86 (34) = happyShift action_47
action_86 (35) = happyShift action_78
action_86 (36) = happyShift action_79
action_86 (44) = happyShift action_80
action_86 (48) = happyShift action_105
action_86 (52) = happyShift action_82
action_86 (65) = happyShift action_83
action_86 (66) = happyShift action_60
action_86 (68) = happyShift action_84
action_86 (69) = happyShift action_85
action_86 (22) = happyGoto action_113
action_86 (23) = happyGoto action_114
action_86 (24) = happyGoto action_115
action_86 (26) = happyGoto action_101
action_86 (27) = happyGoto action_102
action_86 (28) = happyGoto action_103
action_86 (29) = happyGoto action_116
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (66) = happyShift action_60
action_87 (29) = happyGoto action_112
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (66) = happyShift action_60
action_88 (29) = happyGoto action_111
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (32) = happyShift action_45
action_89 (33) = happyShift action_46
action_89 (34) = happyShift action_47
action_89 (48) = happyShift action_48
action_89 (67) = happyShift action_49
action_89 (17) = happyGoto action_110
action_89 (18) = happyGoto action_41
action_89 (26) = happyGoto action_42
action_89 (27) = happyGoto action_43
action_89 (28) = happyGoto action_44
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_14

action_91 (51) = happyShift action_109
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (30) = happyShift action_108
action_92 _ = happyReduce_25

action_93 (50) = happyShift action_38
action_93 (57) = happyShift action_39
action_93 (12) = happyGoto action_107
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (30) = happyShift action_106
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_20

action_96 (31) = happyShift action_77
action_96 (32) = happyShift action_45
action_96 (33) = happyShift action_46
action_96 (34) = happyShift action_47
action_96 (35) = happyShift action_78
action_96 (36) = happyShift action_79
action_96 (44) = happyShift action_80
action_96 (48) = happyShift action_105
action_96 (52) = happyShift action_82
action_96 (65) = happyShift action_83
action_96 (66) = happyShift action_60
action_96 (68) = happyShift action_84
action_96 (69) = happyShift action_85
action_96 (22) = happyGoto action_98
action_96 (23) = happyGoto action_99
action_96 (24) = happyGoto action_100
action_96 (26) = happyGoto action_101
action_96 (27) = happyGoto action_102
action_96 (28) = happyGoto action_103
action_96 (29) = happyGoto action_104
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_8

action_98 (39) = happyShift action_153
action_98 (40) = happyShift action_154
action_98 (41) = happyShift action_155
action_98 (43) = happyShift action_156
action_98 (44) = happyShift action_157
action_98 (45) = happyShift action_158
action_98 (46) = happyShift action_159
action_98 (47) = happyShift action_160
action_98 _ = happyReduce_9

action_99 (41) = happyShift action_149
action_99 (63) = happyShift action_151
action_99 (64) = happyShift action_152
action_99 _ = happyReduce_11

action_100 (41) = happyShift action_148
action_100 _ = happyReduce_10

action_101 (41) = happyShift action_147
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (41) = happyShift action_146
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (39) = happyShift action_136
action_103 (40) = happyShift action_137
action_103 (41) = happyShift action_138
action_103 (43) = happyShift action_139
action_103 (44) = happyShift action_140
action_103 (45) = happyShift action_141
action_103 (46) = happyShift action_142
action_103 (47) = happyShift action_143
action_103 (63) = happyShift action_144
action_103 (64) = happyShift action_145
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (41) = happyShift action_135
action_104 _ = happyReduce_12

action_105 (31) = happyShift action_77
action_105 (32) = happyShift action_45
action_105 (33) = happyShift action_46
action_105 (34) = happyShift action_47
action_105 (35) = happyShift action_78
action_105 (36) = happyShift action_79
action_105 (44) = happyShift action_80
action_105 (48) = happyShift action_105
action_105 (52) = happyShift action_82
action_105 (65) = happyShift action_83
action_105 (66) = happyShift action_60
action_105 (68) = happyShift action_84
action_105 (69) = happyShift action_85
action_105 (22) = happyGoto action_129
action_105 (23) = happyGoto action_130
action_105 (24) = happyGoto action_72
action_105 (26) = happyGoto action_101
action_105 (27) = happyGoto action_102
action_105 (28) = happyGoto action_103
action_105 (29) = happyGoto action_76
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (50) = happyShift action_38
action_106 (57) = happyShift action_39
action_106 (12) = happyGoto action_286
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (30) = happyShift action_285
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (66) = happyShift action_60
action_108 (13) = happyGoto action_284
action_108 (29) = happyGoto action_92
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_24

action_110 _ = happyReduce_36

action_111 _ = happyReduce_38

action_112 _ = happyReduce_39

action_113 (39) = happyShift action_153
action_113 (40) = happyShift action_154
action_113 (41) = happyShift action_155
action_113 (43) = happyShift action_156
action_113 (44) = happyShift action_157
action_113 (45) = happyShift action_158
action_113 (46) = happyShift action_159
action_113 (47) = happyShift action_160
action_113 _ = happyReduce_42

action_114 (41) = happyShift action_149
action_114 (63) = happyShift action_151
action_114 (64) = happyShift action_152
action_114 _ = happyReduce_43

action_115 (41) = happyShift action_148
action_115 _ = happyReduce_41

action_116 (41) = happyShift action_135
action_116 _ = happyReduce_40

action_117 (52) = happyShift action_283
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (34) = happyShift action_47
action_118 (52) = happyShift action_282
action_118 (28) = happyGoto action_281
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (31) = happyShift action_77
action_119 (34) = happyShift action_47
action_119 (44) = happyShift action_80
action_119 (48) = happyShift action_133
action_119 (65) = happyShift action_280
action_119 (68) = happyShift action_84
action_119 (22) = happyGoto action_278
action_119 (28) = happyGoto action_279
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (31) = happyShift action_77
action_120 (34) = happyShift action_47
action_120 (44) = happyShift action_80
action_120 (48) = happyShift action_133
action_120 (65) = happyShift action_277
action_120 (68) = happyShift action_84
action_120 (22) = happyGoto action_275
action_120 (28) = happyGoto action_276
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (31) = happyShift action_77
action_121 (32) = happyShift action_45
action_121 (33) = happyShift action_46
action_121 (34) = happyShift action_47
action_121 (35) = happyShift action_78
action_121 (36) = happyShift action_79
action_121 (44) = happyShift action_80
action_121 (48) = happyShift action_105
action_121 (52) = happyShift action_82
action_121 (65) = happyShift action_274
action_121 (66) = happyShift action_60
action_121 (68) = happyShift action_84
action_121 (69) = happyShift action_85
action_121 (22) = happyGoto action_269
action_121 (23) = happyGoto action_270
action_121 (24) = happyGoto action_271
action_121 (26) = happyGoto action_101
action_121 (27) = happyGoto action_102
action_121 (28) = happyGoto action_272
action_121 (29) = happyGoto action_273
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (31) = happyShift action_77
action_122 (34) = happyShift action_47
action_122 (44) = happyShift action_80
action_122 (48) = happyShift action_133
action_122 (65) = happyShift action_268
action_122 (68) = happyShift action_84
action_122 (22) = happyGoto action_266
action_122 (28) = happyGoto action_267
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (31) = happyShift action_77
action_123 (34) = happyShift action_47
action_123 (44) = happyShift action_80
action_123 (48) = happyShift action_133
action_123 (65) = happyShift action_265
action_123 (68) = happyShift action_84
action_123 (22) = happyGoto action_263
action_123 (28) = happyGoto action_264
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (31) = happyShift action_77
action_124 (34) = happyShift action_47
action_124 (44) = happyShift action_80
action_124 (48) = happyShift action_133
action_124 (65) = happyShift action_262
action_124 (68) = happyShift action_84
action_124 (22) = happyGoto action_260
action_124 (28) = happyGoto action_261
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (31) = happyShift action_77
action_125 (34) = happyShift action_47
action_125 (44) = happyShift action_80
action_125 (48) = happyShift action_133
action_125 (65) = happyShift action_259
action_125 (68) = happyShift action_84
action_125 (22) = happyGoto action_257
action_125 (28) = happyGoto action_258
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (31) = happyShift action_77
action_126 (34) = happyShift action_47
action_126 (44) = happyShift action_80
action_126 (48) = happyShift action_133
action_126 (65) = happyShift action_256
action_126 (68) = happyShift action_84
action_126 (22) = happyGoto action_254
action_126 (28) = happyGoto action_255
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (31) = happyShift action_77
action_127 (32) = happyShift action_45
action_127 (33) = happyShift action_46
action_127 (34) = happyShift action_47
action_127 (35) = happyShift action_78
action_127 (36) = happyShift action_79
action_127 (44) = happyShift action_80
action_127 (48) = happyShift action_105
action_127 (52) = happyShift action_82
action_127 (65) = happyShift action_253
action_127 (66) = happyShift action_60
action_127 (68) = happyShift action_84
action_127 (69) = happyShift action_85
action_127 (22) = happyGoto action_70
action_127 (23) = happyGoto action_251
action_127 (24) = happyGoto action_72
action_127 (26) = happyGoto action_101
action_127 (27) = happyGoto action_102
action_127 (28) = happyGoto action_252
action_127 (29) = happyGoto action_76
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (31) = happyShift action_77
action_128 (32) = happyShift action_45
action_128 (33) = happyShift action_46
action_128 (34) = happyShift action_47
action_128 (35) = happyShift action_78
action_128 (36) = happyShift action_79
action_128 (44) = happyShift action_80
action_128 (48) = happyShift action_105
action_128 (52) = happyShift action_82
action_128 (65) = happyShift action_250
action_128 (66) = happyShift action_60
action_128 (68) = happyShift action_84
action_128 (69) = happyShift action_85
action_128 (22) = happyGoto action_70
action_128 (23) = happyGoto action_248
action_128 (24) = happyGoto action_72
action_128 (26) = happyGoto action_101
action_128 (27) = happyGoto action_102
action_128 (28) = happyGoto action_249
action_128 (29) = happyGoto action_76
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (39) = happyShift action_153
action_129 (40) = happyShift action_154
action_129 (41) = happyShift action_155
action_129 (43) = happyShift action_156
action_129 (44) = happyShift action_157
action_129 (45) = happyShift action_158
action_129 (46) = happyShift action_159
action_129 (47) = happyShift action_160
action_129 (49) = happyShift action_247
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (41) = happyShift action_149
action_130 (49) = happyShift action_246
action_130 (63) = happyShift action_151
action_130 (64) = happyShift action_152
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_100

action_132 _ = happyReduce_101

action_133 (31) = happyShift action_77
action_133 (34) = happyShift action_47
action_133 (44) = happyShift action_80
action_133 (48) = happyShift action_133
action_133 (65) = happyShift action_245
action_133 (68) = happyShift action_84
action_133 (22) = happyGoto action_244
action_133 (28) = happyGoto action_235
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_102

action_135 (32) = happyShift action_45
action_135 (33) = happyShift action_46
action_135 (34) = happyShift action_47
action_135 (65) = happyShift action_243
action_135 (66) = happyShift action_60
action_135 (26) = happyGoto action_239
action_135 (27) = happyGoto action_240
action_135 (28) = happyGoto action_241
action_135 (29) = happyGoto action_242
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (31) = happyShift action_77
action_136 (34) = happyShift action_47
action_136 (44) = happyShift action_80
action_136 (48) = happyShift action_133
action_136 (65) = happyShift action_238
action_136 (68) = happyShift action_84
action_136 (22) = happyGoto action_237
action_136 (28) = happyGoto action_235
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (31) = happyShift action_77
action_137 (34) = happyShift action_47
action_137 (44) = happyShift action_80
action_137 (48) = happyShift action_133
action_137 (65) = happyShift action_236
action_137 (68) = happyShift action_84
action_137 (22) = happyGoto action_234
action_137 (28) = happyGoto action_235
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (31) = happyShift action_77
action_138 (32) = happyShift action_45
action_138 (33) = happyShift action_46
action_138 (34) = happyShift action_47
action_138 (35) = happyShift action_78
action_138 (36) = happyShift action_79
action_138 (44) = happyShift action_80
action_138 (48) = happyShift action_105
action_138 (52) = happyShift action_82
action_138 (65) = happyShift action_233
action_138 (66) = happyShift action_60
action_138 (68) = happyShift action_84
action_138 (69) = happyShift action_85
action_138 (22) = happyGoto action_229
action_138 (23) = happyGoto action_230
action_138 (24) = happyGoto action_231
action_138 (26) = happyGoto action_101
action_138 (27) = happyGoto action_102
action_138 (28) = happyGoto action_103
action_138 (29) = happyGoto action_232
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (31) = happyShift action_77
action_139 (34) = happyShift action_47
action_139 (44) = happyShift action_80
action_139 (48) = happyShift action_133
action_139 (65) = happyShift action_228
action_139 (68) = happyShift action_84
action_139 (22) = happyGoto action_226
action_139 (28) = happyGoto action_227
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (31) = happyShift action_77
action_140 (34) = happyShift action_47
action_140 (44) = happyShift action_80
action_140 (48) = happyShift action_133
action_140 (65) = happyShift action_225
action_140 (68) = happyShift action_84
action_140 (22) = happyGoto action_223
action_140 (28) = happyGoto action_224
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (31) = happyShift action_77
action_141 (34) = happyShift action_47
action_141 (44) = happyShift action_80
action_141 (48) = happyShift action_133
action_141 (65) = happyShift action_222
action_141 (68) = happyShift action_84
action_141 (22) = happyGoto action_220
action_141 (28) = happyGoto action_221
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (31) = happyShift action_77
action_142 (34) = happyShift action_47
action_142 (44) = happyShift action_80
action_142 (48) = happyShift action_133
action_142 (65) = happyShift action_219
action_142 (68) = happyShift action_84
action_142 (22) = happyGoto action_217
action_142 (28) = happyGoto action_218
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (31) = happyShift action_77
action_143 (34) = happyShift action_47
action_143 (44) = happyShift action_80
action_143 (48) = happyShift action_133
action_143 (65) = happyShift action_216
action_143 (68) = happyShift action_84
action_143 (22) = happyGoto action_214
action_143 (28) = happyGoto action_215
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (31) = happyShift action_77
action_144 (32) = happyShift action_45
action_144 (33) = happyShift action_46
action_144 (34) = happyShift action_47
action_144 (35) = happyShift action_78
action_144 (36) = happyShift action_79
action_144 (44) = happyShift action_80
action_144 (48) = happyShift action_105
action_144 (52) = happyShift action_82
action_144 (65) = happyShift action_213
action_144 (66) = happyShift action_60
action_144 (68) = happyShift action_84
action_144 (69) = happyShift action_85
action_144 (22) = happyGoto action_70
action_144 (23) = happyGoto action_212
action_144 (24) = happyGoto action_72
action_144 (26) = happyGoto action_101
action_144 (27) = happyGoto action_102
action_144 (28) = happyGoto action_103
action_144 (29) = happyGoto action_76
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (31) = happyShift action_77
action_145 (32) = happyShift action_45
action_145 (33) = happyShift action_46
action_145 (34) = happyShift action_47
action_145 (35) = happyShift action_78
action_145 (36) = happyShift action_79
action_145 (44) = happyShift action_80
action_145 (48) = happyShift action_105
action_145 (52) = happyShift action_82
action_145 (65) = happyShift action_211
action_145 (66) = happyShift action_60
action_145 (68) = happyShift action_84
action_145 (69) = happyShift action_85
action_145 (22) = happyGoto action_70
action_145 (23) = happyGoto action_210
action_145 (24) = happyGoto action_72
action_145 (26) = happyGoto action_101
action_145 (27) = happyGoto action_102
action_145 (28) = happyGoto action_103
action_145 (29) = happyGoto action_76
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (66) = happyShift action_60
action_146 (29) = happyGoto action_209
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (66) = happyShift action_60
action_147 (29) = happyGoto action_208
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (34) = happyShift action_47
action_148 (52) = happyShift action_82
action_148 (65) = happyShift action_207
action_148 (24) = happyGoto action_205
action_148 (28) = happyGoto action_206
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (31) = happyShift action_77
action_149 (32) = happyShift action_45
action_149 (33) = happyShift action_46
action_149 (34) = happyShift action_47
action_149 (35) = happyShift action_78
action_149 (36) = happyShift action_79
action_149 (44) = happyShift action_80
action_149 (48) = happyShift action_105
action_149 (52) = happyShift action_82
action_149 (65) = happyShift action_204
action_149 (66) = happyShift action_60
action_149 (68) = happyShift action_84
action_149 (69) = happyShift action_85
action_149 (22) = happyGoto action_70
action_149 (23) = happyGoto action_202
action_149 (24) = happyGoto action_72
action_149 (26) = happyGoto action_101
action_149 (27) = happyGoto action_102
action_149 (28) = happyGoto action_203
action_149 (29) = happyGoto action_76
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (55) = happyShift action_201
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (31) = happyShift action_77
action_151 (32) = happyShift action_45
action_151 (33) = happyShift action_46
action_151 (34) = happyShift action_47
action_151 (35) = happyShift action_78
action_151 (36) = happyShift action_79
action_151 (44) = happyShift action_80
action_151 (48) = happyShift action_105
action_151 (52) = happyShift action_82
action_151 (65) = happyShift action_200
action_151 (66) = happyShift action_60
action_151 (68) = happyShift action_84
action_151 (69) = happyShift action_85
action_151 (22) = happyGoto action_70
action_151 (23) = happyGoto action_198
action_151 (24) = happyGoto action_72
action_151 (26) = happyGoto action_101
action_151 (27) = happyGoto action_102
action_151 (28) = happyGoto action_199
action_151 (29) = happyGoto action_76
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (31) = happyShift action_77
action_152 (32) = happyShift action_45
action_152 (33) = happyShift action_46
action_152 (34) = happyShift action_47
action_152 (35) = happyShift action_78
action_152 (36) = happyShift action_79
action_152 (44) = happyShift action_80
action_152 (48) = happyShift action_105
action_152 (52) = happyShift action_82
action_152 (65) = happyShift action_197
action_152 (66) = happyShift action_60
action_152 (68) = happyShift action_84
action_152 (69) = happyShift action_85
action_152 (22) = happyGoto action_70
action_152 (23) = happyGoto action_195
action_152 (24) = happyGoto action_72
action_152 (26) = happyGoto action_101
action_152 (27) = happyGoto action_102
action_152 (28) = happyGoto action_196
action_152 (29) = happyGoto action_76
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (31) = happyShift action_77
action_153 (34) = happyShift action_47
action_153 (44) = happyShift action_80
action_153 (48) = happyShift action_133
action_153 (65) = happyShift action_194
action_153 (68) = happyShift action_84
action_153 (22) = happyGoto action_192
action_153 (28) = happyGoto action_193
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (31) = happyShift action_77
action_154 (34) = happyShift action_47
action_154 (44) = happyShift action_80
action_154 (48) = happyShift action_133
action_154 (65) = happyShift action_191
action_154 (68) = happyShift action_84
action_154 (22) = happyGoto action_189
action_154 (28) = happyGoto action_190
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (31) = happyShift action_77
action_155 (34) = happyShift action_47
action_155 (44) = happyShift action_80
action_155 (48) = happyShift action_133
action_155 (65) = happyShift action_188
action_155 (68) = happyShift action_84
action_155 (22) = happyGoto action_186
action_155 (28) = happyGoto action_187
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (31) = happyShift action_77
action_156 (34) = happyShift action_47
action_156 (44) = happyShift action_80
action_156 (48) = happyShift action_133
action_156 (65) = happyShift action_185
action_156 (68) = happyShift action_84
action_156 (22) = happyGoto action_183
action_156 (28) = happyGoto action_184
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (31) = happyShift action_77
action_157 (34) = happyShift action_47
action_157 (44) = happyShift action_80
action_157 (48) = happyShift action_133
action_157 (65) = happyShift action_182
action_157 (68) = happyShift action_84
action_157 (22) = happyGoto action_180
action_157 (28) = happyGoto action_181
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (31) = happyShift action_77
action_158 (34) = happyShift action_47
action_158 (44) = happyShift action_80
action_158 (48) = happyShift action_133
action_158 (65) = happyShift action_179
action_158 (68) = happyShift action_84
action_158 (22) = happyGoto action_177
action_158 (28) = happyGoto action_178
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (31) = happyShift action_77
action_159 (34) = happyShift action_47
action_159 (44) = happyShift action_80
action_159 (48) = happyShift action_133
action_159 (65) = happyShift action_176
action_159 (68) = happyShift action_84
action_159 (22) = happyGoto action_174
action_159 (28) = happyGoto action_175
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (31) = happyShift action_77
action_160 (34) = happyShift action_47
action_160 (44) = happyShift action_80
action_160 (48) = happyShift action_133
action_160 (65) = happyShift action_173
action_160 (68) = happyShift action_84
action_160 (22) = happyGoto action_171
action_160 (28) = happyGoto action_172
action_160 _ = happyFail (happyExpListPerState 160)

action_161 _ = happyReduce_45

action_162 (30) = happyShift action_170
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_34

action_164 (49) = happyShift action_169
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (32) = happyShift action_45
action_165 (33) = happyShift action_46
action_165 (34) = happyShift action_47
action_165 (25) = happyGoto action_168
action_165 (26) = happyGoto action_53
action_165 (27) = happyGoto action_54
action_165 (28) = happyGoto action_55
action_165 _ = happyFail (happyExpListPerState 165)

action_166 (30) = happyShift action_167
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (31) = happyShift action_77
action_167 (32) = happyShift action_45
action_167 (33) = happyShift action_46
action_167 (34) = happyShift action_47
action_167 (35) = happyShift action_78
action_167 (36) = happyShift action_79
action_167 (44) = happyShift action_80
action_167 (48) = happyShift action_105
action_167 (52) = happyShift action_82
action_167 (65) = happyShift action_83
action_167 (66) = happyShift action_60
action_167 (68) = happyShift action_84
action_167 (69) = happyShift action_85
action_167 (19) = happyGoto action_298
action_167 (22) = happyGoto action_299
action_167 (23) = happyGoto action_300
action_167 (24) = happyGoto action_301
action_167 (26) = happyGoto action_101
action_167 (27) = happyGoto action_102
action_167 (28) = happyGoto action_103
action_167 (29) = happyGoto action_302
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (49) = happyShift action_297
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (50) = happyShift action_23
action_169 (53) = happyShift action_24
action_169 (15) = happyGoto action_296
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (66) = happyShift action_60
action_170 (29) = happyGoto action_295
action_170 _ = happyFail (happyExpListPerState 170)

action_171 _ = happyReduce_90

action_172 _ = happyReduce_92

action_173 (43) = happyShift action_122
action_173 (44) = happyShift action_123
action_173 (45) = happyShift action_124
action_173 (46) = happyShift action_125
action_173 (47) = happyShift action_126
action_173 _ = happyReduce_97

action_174 (47) = happyShift action_160
action_174 _ = happyReduce_81

action_175 (47) = happyShift action_143
action_175 _ = happyReduce_83

action_176 (43) = happyShift action_122
action_176 (44) = happyShift action_123
action_176 (45) = happyShift action_124
action_176 (46) = happyShift action_125
action_176 (47) = happyShift action_126
action_176 _ = happyReduce_88

action_177 (47) = happyShift action_160
action_177 _ = happyReduce_72

action_178 (47) = happyShift action_143
action_178 _ = happyReduce_74

action_179 (43) = happyShift action_122
action_179 (44) = happyShift action_123
action_179 (45) = happyShift action_124
action_179 (46) = happyShift action_125
action_179 (47) = happyShift action_126
action_179 _ = happyReduce_79

action_180 (45) = happyShift action_158
action_180 (46) = happyShift action_159
action_180 (47) = happyShift action_160
action_180 _ = happyReduce_63

action_181 (45) = happyShift action_141
action_181 (46) = happyShift action_142
action_181 (47) = happyShift action_143
action_181 _ = happyReduce_65

action_182 (43) = happyShift action_122
action_182 (44) = happyShift action_123
action_182 (45) = happyShift action_124
action_182 (46) = happyShift action_125
action_182 (47) = happyShift action_126
action_182 _ = happyReduce_70

action_183 (45) = happyShift action_158
action_183 (46) = happyShift action_159
action_183 (47) = happyShift action_160
action_183 _ = happyReduce_54

action_184 (45) = happyShift action_141
action_184 (46) = happyShift action_142
action_184 (47) = happyShift action_143
action_184 _ = happyReduce_56

action_185 (43) = happyShift action_122
action_185 (44) = happyShift action_123
action_185 (45) = happyShift action_124
action_185 (46) = happyShift action_125
action_185 (47) = happyShift action_126
action_185 _ = happyReduce_61

action_186 (43) = happyShift action_156
action_186 (44) = happyShift action_157
action_186 (45) = happyShift action_158
action_186 (46) = happyShift action_159
action_186 (47) = happyShift action_160
action_186 _ = happyReduce_138

action_187 (43) = happyShift action_139
action_187 (44) = happyShift action_140
action_187 (45) = happyShift action_141
action_187 (46) = happyShift action_142
action_187 (47) = happyShift action_143
action_187 _ = happyReduce_143

action_188 (43) = happyShift action_122
action_188 (44) = happyShift action_123
action_188 (45) = happyShift action_124
action_188 (46) = happyShift action_125
action_188 (47) = happyShift action_126
action_188 _ = happyReduce_155

action_189 (43) = happyShift action_156
action_189 (44) = happyShift action_157
action_189 (45) = happyShift action_158
action_189 (46) = happyShift action_159
action_189 (47) = happyShift action_160
action_189 _ = happyReduce_122

action_190 (43) = happyShift action_139
action_190 (44) = happyShift action_140
action_190 (45) = happyShift action_141
action_190 (46) = happyShift action_142
action_190 (47) = happyShift action_143
action_190 _ = happyReduce_123

action_191 (43) = happyShift action_122
action_191 (44) = happyShift action_123
action_191 (45) = happyShift action_124
action_191 (46) = happyShift action_125
action_191 (47) = happyShift action_126
action_191 _ = happyReduce_128

action_192 (43) = happyShift action_156
action_192 (44) = happyShift action_157
action_192 (45) = happyShift action_158
action_192 (46) = happyShift action_159
action_192 (47) = happyShift action_160
action_192 _ = happyReduce_130

action_193 (43) = happyShift action_139
action_193 (44) = happyShift action_140
action_193 (45) = happyShift action_141
action_193 (46) = happyShift action_142
action_193 (47) = happyShift action_143
action_193 _ = happyReduce_131

action_194 (43) = happyShift action_122
action_194 (44) = happyShift action_123
action_194 (45) = happyShift action_124
action_194 (46) = happyShift action_125
action_194 (47) = happyShift action_126
action_194 _ = happyReduce_136

action_195 (41) = happyShift action_149
action_195 (63) = happyShift action_151
action_195 _ = happyReduce_114

action_196 (39) = happyShift action_136
action_196 (40) = happyShift action_137
action_196 (41) = happyShift action_138
action_196 (43) = happyShift action_139
action_196 (44) = happyShift action_140
action_196 (45) = happyShift action_141
action_196 (46) = happyShift action_142
action_196 (47) = happyShift action_143
action_196 (63) = happyShift action_144
action_196 _ = happyReduce_115

action_197 (39) = happyShift action_119
action_197 (40) = happyShift action_120
action_197 (41) = happyShift action_121
action_197 (43) = happyShift action_122
action_197 (44) = happyShift action_123
action_197 (45) = happyShift action_124
action_197 (46) = happyShift action_125
action_197 (47) = happyShift action_126
action_197 (63) = happyShift action_127
action_197 (64) = happyShift action_128
action_197 _ = happyReduce_120

action_198 (41) = happyShift action_149
action_198 _ = happyReduce_106

action_199 (39) = happyShift action_136
action_199 (40) = happyShift action_137
action_199 (41) = happyShift action_138
action_199 (43) = happyShift action_139
action_199 (44) = happyShift action_140
action_199 (45) = happyShift action_141
action_199 (46) = happyShift action_142
action_199 (47) = happyShift action_143
action_199 _ = happyReduce_107

action_200 (39) = happyShift action_119
action_200 (40) = happyShift action_120
action_200 (41) = happyShift action_121
action_200 (43) = happyShift action_122
action_200 (44) = happyShift action_123
action_200 (45) = happyShift action_124
action_200 (46) = happyShift action_125
action_200 (47) = happyShift action_126
action_200 (63) = happyShift action_127
action_200 (64) = happyShift action_128
action_200 _ = happyReduce_112

action_201 (32) = happyShift action_45
action_201 (33) = happyShift action_46
action_201 (34) = happyShift action_47
action_201 (48) = happyShift action_48
action_201 (67) = happyShift action_49
action_201 (17) = happyGoto action_294
action_201 (18) = happyGoto action_41
action_201 (26) = happyGoto action_42
action_201 (27) = happyGoto action_43
action_201 (28) = happyGoto action_44
action_201 _ = happyFail (happyExpListPerState 201)

action_202 _ = happyReduce_139

action_203 (39) = happyShift action_136
action_203 (40) = happyShift action_137
action_203 (43) = happyShift action_139
action_203 (44) = happyShift action_140
action_203 (45) = happyShift action_141
action_203 (46) = happyShift action_142
action_203 (47) = happyShift action_143
action_203 _ = happyReduce_145

action_204 (39) = happyShift action_119
action_204 (40) = happyShift action_120
action_204 (41) = happyShift action_121
action_204 (43) = happyShift action_122
action_204 (44) = happyShift action_123
action_204 (45) = happyShift action_124
action_204 (46) = happyShift action_125
action_204 (47) = happyShift action_126
action_204 (63) = happyShift action_127
action_204 (64) = happyShift action_128
action_204 _ = happyReduce_156

action_205 _ = happyReduce_140

action_206 _ = happyReduce_147

action_207 _ = happyReduce_157

action_208 _ = happyReduce_148

action_209 _ = happyReduce_150

action_210 (41) = happyShift action_149
action_210 (63) = happyShift action_151
action_210 _ = happyReduce_116

action_211 (39) = happyShift action_119
action_211 (40) = happyShift action_120
action_211 (41) = happyShift action_121
action_211 (43) = happyShift action_122
action_211 (44) = happyShift action_123
action_211 (45) = happyShift action_124
action_211 (46) = happyShift action_125
action_211 (47) = happyShift action_126
action_211 (63) = happyShift action_127
action_211 (64) = happyShift action_128
action_211 _ = happyReduce_118

action_212 (41) = happyShift action_149
action_212 _ = happyReduce_108

action_213 (39) = happyShift action_119
action_213 (40) = happyShift action_120
action_213 (41) = happyShift action_121
action_213 (43) = happyShift action_122
action_213 (44) = happyShift action_123
action_213 (45) = happyShift action_124
action_213 (46) = happyShift action_125
action_213 (47) = happyShift action_126
action_213 (63) = happyShift action_127
action_213 (64) = happyShift action_128
action_213 _ = happyReduce_110

action_214 _ = happyReduce_91

action_215 _ = happyReduce_93

action_216 (43) = happyShift action_122
action_216 (44) = happyShift action_123
action_216 (45) = happyShift action_124
action_216 (46) = happyShift action_125
action_216 (47) = happyShift action_126
action_216 _ = happyReduce_95

action_217 (47) = happyShift action_160
action_217 _ = happyReduce_82

action_218 (47) = happyShift action_143
action_218 _ = happyReduce_84

action_219 (43) = happyShift action_122
action_219 (44) = happyShift action_123
action_219 (45) = happyShift action_124
action_219 (46) = happyShift action_125
action_219 (47) = happyShift action_126
action_219 _ = happyReduce_86

action_220 (47) = happyShift action_160
action_220 _ = happyReduce_73

action_221 (47) = happyShift action_143
action_221 _ = happyReduce_75

action_222 (43) = happyShift action_122
action_222 (44) = happyShift action_123
action_222 (45) = happyShift action_124
action_222 (46) = happyShift action_125
action_222 (47) = happyShift action_126
action_222 _ = happyReduce_77

action_223 (45) = happyShift action_158
action_223 (46) = happyShift action_159
action_223 (47) = happyShift action_160
action_223 _ = happyReduce_64

action_224 (45) = happyShift action_141
action_224 (46) = happyShift action_142
action_224 (47) = happyShift action_143
action_224 _ = happyReduce_66

action_225 (43) = happyShift action_122
action_225 (44) = happyShift action_123
action_225 (45) = happyShift action_124
action_225 (46) = happyShift action_125
action_225 (47) = happyShift action_126
action_225 _ = happyReduce_68

action_226 (45) = happyShift action_158
action_226 (46) = happyShift action_159
action_226 (47) = happyShift action_160
action_226 _ = happyReduce_55

action_227 (45) = happyShift action_141
action_227 (46) = happyShift action_142
action_227 (47) = happyShift action_143
action_227 _ = happyReduce_57

action_228 (43) = happyShift action_122
action_228 (44) = happyShift action_123
action_228 (45) = happyShift action_124
action_228 (46) = happyShift action_125
action_228 (47) = happyShift action_126
action_228 _ = happyReduce_59

action_229 (39) = happyShift action_153
action_229 (40) = happyShift action_154
action_229 (43) = happyShift action_156
action_229 (44) = happyShift action_157
action_229 (45) = happyShift action_158
action_229 (46) = happyShift action_159
action_229 (47) = happyShift action_160
action_229 _ = happyReduce_142

action_230 _ = happyReduce_144

action_231 _ = happyReduce_146

action_232 _ = happyReduce_152

action_233 (39) = happyShift action_119
action_233 (40) = happyShift action_120
action_233 (41) = happyShift action_121
action_233 (43) = happyShift action_122
action_233 (44) = happyShift action_123
action_233 (45) = happyShift action_124
action_233 (46) = happyShift action_125
action_233 (47) = happyShift action_126
action_233 (63) = happyShift action_127
action_233 (64) = happyShift action_128
action_233 _ = happyReduce_154

action_234 (43) = happyShift action_156
action_234 (44) = happyShift action_157
action_234 (45) = happyShift action_158
action_234 (46) = happyShift action_159
action_234 (47) = happyShift action_160
action_234 _ = happyReduce_124

action_235 (43) = happyShift action_139
action_235 (44) = happyShift action_140
action_235 (45) = happyShift action_141
action_235 (46) = happyShift action_142
action_235 (47) = happyShift action_143
action_235 _ = happyFail (happyExpListPerState 235)

action_236 (43) = happyShift action_122
action_236 (44) = happyShift action_123
action_236 (45) = happyShift action_124
action_236 (46) = happyShift action_125
action_236 (47) = happyShift action_126
action_236 _ = happyReduce_126

action_237 (43) = happyShift action_156
action_237 (44) = happyShift action_157
action_237 (45) = happyShift action_158
action_237 (46) = happyShift action_159
action_237 (47) = happyShift action_160
action_237 _ = happyReduce_132

action_238 (43) = happyShift action_122
action_238 (44) = happyShift action_123
action_238 (45) = happyShift action_124
action_238 (46) = happyShift action_125
action_238 (47) = happyShift action_126
action_238 _ = happyReduce_134

action_239 _ = happyReduce_149

action_240 _ = happyReduce_151

action_241 _ = happyReduce_153

action_242 _ = happyReduce_141

action_243 _ = happyReduce_158

action_244 (43) = happyShift action_156
action_244 (44) = happyShift action_157
action_244 (45) = happyShift action_158
action_244 (46) = happyShift action_159
action_244 (47) = happyShift action_160
action_244 (49) = happyShift action_247
action_244 _ = happyFail (happyExpListPerState 244)

action_245 (43) = happyShift action_122
action_245 (44) = happyShift action_123
action_245 (45) = happyShift action_124
action_245 (46) = happyShift action_125
action_245 (47) = happyShift action_126
action_245 _ = happyFail (happyExpListPerState 245)

action_246 _ = happyReduce_165

action_247 _ = happyReduce_99

action_248 (41) = happyShift action_149
action_248 (63) = happyShift action_151
action_248 _ = happyReduce_119

action_249 (39) = happyShift action_136
action_249 (40) = happyShift action_137
action_249 (41) = happyShift action_138
action_249 (43) = happyShift action_139
action_249 (44) = happyShift action_140
action_249 (45) = happyShift action_141
action_249 (46) = happyShift action_142
action_249 (47) = happyShift action_143
action_249 (63) = happyShift action_144
action_249 _ = happyReduce_117

action_250 (39) = happyShift action_119
action_250 (40) = happyShift action_120
action_250 (41) = happyShift action_121
action_250 (43) = happyShift action_122
action_250 (44) = happyShift action_123
action_250 (45) = happyShift action_124
action_250 (46) = happyShift action_125
action_250 (47) = happyShift action_126
action_250 (63) = happyShift action_127
action_250 (64) = happyShift action_128
action_250 _ = happyReduce_121

action_251 (41) = happyShift action_149
action_251 _ = happyReduce_111

action_252 (39) = happyShift action_136
action_252 (40) = happyShift action_137
action_252 (41) = happyShift action_138
action_252 (43) = happyShift action_139
action_252 (44) = happyShift action_140
action_252 (45) = happyShift action_141
action_252 (46) = happyShift action_142
action_252 (47) = happyShift action_143
action_252 _ = happyReduce_109

action_253 (39) = happyShift action_119
action_253 (40) = happyShift action_120
action_253 (41) = happyShift action_121
action_253 (43) = happyShift action_122
action_253 (44) = happyShift action_123
action_253 (45) = happyShift action_124
action_253 (46) = happyShift action_125
action_253 (47) = happyShift action_126
action_253 (63) = happyShift action_127
action_253 (64) = happyShift action_128
action_253 _ = happyReduce_113

action_254 _ = happyReduce_96

action_255 _ = happyReduce_94

action_256 (43) = happyShift action_122
action_256 (44) = happyShift action_123
action_256 (45) = happyShift action_124
action_256 (46) = happyShift action_125
action_256 (47) = happyShift action_126
action_256 _ = happyReduce_98

action_257 (47) = happyShift action_160
action_257 _ = happyReduce_87

action_258 (47) = happyShift action_143
action_258 _ = happyReduce_85

action_259 (43) = happyShift action_122
action_259 (44) = happyShift action_123
action_259 (45) = happyShift action_124
action_259 (46) = happyShift action_125
action_259 (47) = happyShift action_126
action_259 _ = happyReduce_89

action_260 (47) = happyShift action_160
action_260 _ = happyReduce_78

action_261 (47) = happyShift action_143
action_261 _ = happyReduce_76

action_262 (43) = happyShift action_122
action_262 (44) = happyShift action_123
action_262 (45) = happyShift action_124
action_262 (46) = happyShift action_125
action_262 (47) = happyShift action_126
action_262 _ = happyReduce_80

action_263 (45) = happyShift action_158
action_263 (46) = happyShift action_159
action_263 (47) = happyShift action_160
action_263 _ = happyReduce_69

action_264 (45) = happyShift action_141
action_264 (46) = happyShift action_142
action_264 (47) = happyShift action_143
action_264 _ = happyReduce_67

action_265 (43) = happyShift action_122
action_265 (44) = happyShift action_123
action_265 (45) = happyShift action_124
action_265 (46) = happyShift action_125
action_265 (47) = happyShift action_126
action_265 _ = happyReduce_71

action_266 (45) = happyShift action_158
action_266 (46) = happyShift action_159
action_266 (47) = happyShift action_160
action_266 _ = happyReduce_60

action_267 (45) = happyShift action_141
action_267 (46) = happyShift action_142
action_267 (47) = happyShift action_143
action_267 _ = happyReduce_58

action_268 (43) = happyShift action_122
action_268 (44) = happyShift action_123
action_268 (45) = happyShift action_124
action_268 (46) = happyShift action_125
action_268 (47) = happyShift action_126
action_268 _ = happyReduce_62

action_269 (39) = happyShift action_153
action_269 (40) = happyShift action_154
action_269 (43) = happyShift action_156
action_269 (44) = happyShift action_157
action_269 (45) = happyShift action_158
action_269 (46) = happyShift action_159
action_269 (47) = happyShift action_160
action_269 _ = happyReduce_160

action_270 _ = happyReduce_161

action_271 _ = happyReduce_162

action_272 (39) = happyShift action_136
action_272 (40) = happyShift action_137
action_272 (43) = happyShift action_139
action_272 (44) = happyShift action_140
action_272 (45) = happyShift action_141
action_272 (46) = happyShift action_142
action_272 (47) = happyShift action_143
action_272 _ = happyReduce_159

action_273 _ = happyReduce_163

action_274 (39) = happyShift action_119
action_274 (40) = happyShift action_120
action_274 (41) = happyShift action_121
action_274 (43) = happyShift action_122
action_274 (44) = happyShift action_123
action_274 (45) = happyShift action_124
action_274 (46) = happyShift action_125
action_274 (47) = happyShift action_126
action_274 (63) = happyShift action_127
action_274 (64) = happyShift action_128
action_274 _ = happyReduce_164

action_275 (43) = happyShift action_156
action_275 (44) = happyShift action_157
action_275 (45) = happyShift action_158
action_275 (46) = happyShift action_159
action_275 (47) = happyShift action_160
action_275 _ = happyReduce_127

action_276 (43) = happyShift action_139
action_276 (44) = happyShift action_140
action_276 (45) = happyShift action_141
action_276 (46) = happyShift action_142
action_276 (47) = happyShift action_143
action_276 _ = happyReduce_125

action_277 (43) = happyShift action_122
action_277 (44) = happyShift action_123
action_277 (45) = happyShift action_124
action_277 (46) = happyShift action_125
action_277 (47) = happyShift action_126
action_277 _ = happyReduce_129

action_278 (43) = happyShift action_156
action_278 (44) = happyShift action_157
action_278 (45) = happyShift action_158
action_278 (46) = happyShift action_159
action_278 (47) = happyShift action_160
action_278 _ = happyReduce_135

action_279 (43) = happyShift action_139
action_279 (44) = happyShift action_140
action_279 (45) = happyShift action_141
action_279 (46) = happyShift action_142
action_279 (47) = happyShift action_143
action_279 _ = happyReduce_133

action_280 (43) = happyShift action_122
action_280 (44) = happyShift action_123
action_280 (45) = happyShift action_124
action_280 (46) = happyShift action_125
action_280 (47) = happyShift action_126
action_280 _ = happyReduce_137

action_281 (49) = happyShift action_293
action_281 _ = happyFail (happyExpListPerState 281)

action_282 (49) = happyShift action_292
action_282 _ = happyFail (happyExpListPerState 282)

action_283 (30) = happyShift action_291
action_283 _ = happyFail (happyExpListPerState 283)

action_284 _ = happyReduce_26

action_285 (50) = happyShift action_289
action_285 (57) = happyShift action_290
action_285 (20) = happyGoto action_288
action_285 _ = happyFail (happyExpListPerState 285)

action_286 (30) = happyShift action_287
action_286 _ = happyFail (happyExpListPerState 286)

action_287 (50) = happyShift action_289
action_287 (57) = happyShift action_290
action_287 (20) = happyGoto action_313
action_287 _ = happyFail (happyExpListPerState 287)

action_288 (49) = happyShift action_312
action_288 _ = happyFail (happyExpListPerState 288)

action_289 (31) = happyShift action_77
action_289 (32) = happyShift action_45
action_289 (33) = happyShift action_46
action_289 (34) = happyShift action_47
action_289 (35) = happyShift action_78
action_289 (36) = happyShift action_79
action_289 (44) = happyShift action_80
action_289 (48) = happyShift action_105
action_289 (52) = happyShift action_82
action_289 (65) = happyShift action_83
action_289 (66) = happyShift action_60
action_289 (68) = happyShift action_84
action_289 (69) = happyShift action_85
action_289 (19) = happyGoto action_310
action_289 (21) = happyGoto action_311
action_289 (22) = happyGoto action_299
action_289 (23) = happyGoto action_300
action_289 (24) = happyGoto action_301
action_289 (26) = happyGoto action_101
action_289 (27) = happyGoto action_102
action_289 (28) = happyGoto action_103
action_289 (29) = happyGoto action_302
action_289 _ = happyFail (happyExpListPerState 289)

action_290 _ = happyReduce_50

action_291 (34) = happyShift action_47
action_291 (52) = happyShift action_309
action_291 (66) = happyShift action_60
action_291 (28) = happyGoto action_307
action_291 (29) = happyGoto action_308
action_291 _ = happyFail (happyExpListPerState 291)

action_292 _ = happyReduce_104

action_293 _ = happyReduce_105

action_294 (56) = happyShift action_306
action_294 _ = happyFail (happyExpListPerState 294)

action_295 (30) = happyShift action_305
action_295 _ = happyFail (happyExpListPerState 295)

action_296 _ = happyReduce_16

action_297 (50) = happyShift action_23
action_297 (53) = happyShift action_24
action_297 (15) = happyGoto action_304
action_297 _ = happyFail (happyExpListPerState 297)

action_298 (49) = happyShift action_303
action_298 _ = happyFail (happyExpListPerState 298)

action_299 (39) = happyShift action_153
action_299 (40) = happyShift action_154
action_299 (41) = happyShift action_155
action_299 (43) = happyShift action_156
action_299 (44) = happyShift action_157
action_299 (45) = happyShift action_158
action_299 (46) = happyShift action_159
action_299 (47) = happyShift action_160
action_299 _ = happyReduce_46

action_300 (41) = happyShift action_149
action_300 (63) = happyShift action_151
action_300 (64) = happyShift action_152
action_300 _ = happyReduce_47

action_301 (41) = happyShift action_148
action_301 _ = happyReduce_48

action_302 (41) = happyShift action_135
action_302 _ = happyReduce_49

action_303 _ = happyReduce_18

action_304 _ = happyReduce_17

action_305 (31) = happyShift action_77
action_305 (32) = happyShift action_45
action_305 (33) = happyShift action_46
action_305 (34) = happyShift action_47
action_305 (35) = happyShift action_78
action_305 (36) = happyShift action_79
action_305 (44) = happyShift action_80
action_305 (48) = happyShift action_105
action_305 (52) = happyShift action_82
action_305 (65) = happyShift action_83
action_305 (66) = happyShift action_60
action_305 (68) = happyShift action_84
action_305 (69) = happyShift action_85
action_305 (19) = happyGoto action_321
action_305 (22) = happyGoto action_299
action_305 (23) = happyGoto action_300
action_305 (24) = happyGoto action_301
action_305 (26) = happyGoto action_101
action_305 (27) = happyGoto action_102
action_305 (28) = happyGoto action_103
action_305 (29) = happyGoto action_302
action_305 _ = happyFail (happyExpListPerState 305)

action_306 (32) = happyShift action_45
action_306 (33) = happyShift action_46
action_306 (34) = happyShift action_47
action_306 (48) = happyShift action_48
action_306 (67) = happyShift action_49
action_306 (17) = happyGoto action_320
action_306 (18) = happyGoto action_41
action_306 (26) = happyGoto action_42
action_306 (27) = happyGoto action_43
action_306 (28) = happyGoto action_44
action_306 _ = happyFail (happyExpListPerState 306)

action_307 (49) = happyShift action_319
action_307 _ = happyFail (happyExpListPerState 307)

action_308 (49) = happyShift action_318
action_308 _ = happyFail (happyExpListPerState 308)

action_309 (49) = happyShift action_317
action_309 _ = happyFail (happyExpListPerState 309)

action_310 (30) = happyShift action_316
action_310 _ = happyReduce_52

action_311 (51) = happyShift action_315
action_311 _ = happyFail (happyExpListPerState 311)

action_312 _ = happyReduce_19

action_313 (49) = happyShift action_314
action_313 _ = happyFail (happyExpListPerState 313)

action_314 (30) = happyShift action_324
action_314 _ = happyReduce_21

action_315 _ = happyReduce_51

action_316 (31) = happyShift action_77
action_316 (32) = happyShift action_45
action_316 (33) = happyShift action_46
action_316 (34) = happyShift action_47
action_316 (35) = happyShift action_78
action_316 (36) = happyShift action_79
action_316 (44) = happyShift action_80
action_316 (48) = happyShift action_105
action_316 (52) = happyShift action_82
action_316 (65) = happyShift action_83
action_316 (66) = happyShift action_60
action_316 (68) = happyShift action_84
action_316 (69) = happyShift action_85
action_316 (19) = happyGoto action_310
action_316 (21) = happyGoto action_323
action_316 (22) = happyGoto action_299
action_316 (23) = happyGoto action_300
action_316 (24) = happyGoto action_301
action_316 (26) = happyGoto action_101
action_316 (27) = happyGoto action_102
action_316 (28) = happyGoto action_103
action_316 (29) = happyGoto action_302
action_316 _ = happyFail (happyExpListPerState 316)

action_317 _ = happyReduce_168

action_318 _ = happyReduce_169

action_319 _ = happyReduce_170

action_320 _ = happyReduce_37

action_321 (49) = happyShift action_322
action_321 _ = happyFail (happyExpListPerState 321)

action_322 _ = happyReduce_44

action_323 _ = happyReduce_53

action_324 (48) = happyShift action_36
action_324 (11) = happyGoto action_325
action_324 _ = happyFail (happyExpListPerState 324)

action_325 _ = happyReduce_22

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
		 (AddTrip happy_var_3 happy_var_5 happy_var_7
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
		 (Add happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  19 happyReduction_46
happyReduction_46 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 (IntLit happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  19 happyReduction_47
happyReduction_47 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn19
		 (BoolLit happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  19 happyReduction_48
happyReduction_48 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (StrLit happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  19 happyReduction_49
happyReduction_49 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn19
		 (UrlLit happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  20 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn20
		 (AnyLit
	)

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (LiteralLst happy_var_2
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  21 happyReduction_52
happyReduction_52 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (SingleLit happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  21 happyReduction_53
happyReduction_53 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  22 happyReduction_54
happyReduction_54 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  22 happyReduction_55
happyReduction_55 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  22 happyReduction_56
happyReduction_56 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  22 happyReduction_57
happyReduction_57 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  22 happyReduction_58
happyReduction_58 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVO happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  22 happyReduction_59
happyReduction_59 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusOV happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  22 happyReduction_60
happyReduction_60 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVI happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  22 happyReduction_61
happyReduction_61 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (PlusIV happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  22 happyReduction_62
happyReduction_62 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (PlusVV happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  22 happyReduction_63
happyReduction_63 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  22 happyReduction_64
happyReduction_64 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  22 happyReduction_65
happyReduction_65 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  22 happyReduction_66
happyReduction_66 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  22 happyReduction_67
happyReduction_67 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVO happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  22 happyReduction_68
happyReduction_68 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusOV happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  22 happyReduction_69
happyReduction_69 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVI happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  22 happyReduction_70
happyReduction_70 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (MinusIV happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  22 happyReduction_71
happyReduction_71 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (MinusVV happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  22 happyReduction_72
happyReduction_72 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  22 happyReduction_73
happyReduction_73 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  22 happyReduction_74
happyReduction_74 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  22 happyReduction_75
happyReduction_75 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  22 happyReduction_76
happyReduction_76 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVO happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  22 happyReduction_77
happyReduction_77 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesOV happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  22 happyReduction_78
happyReduction_78 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVI happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  22 happyReduction_79
happyReduction_79 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (TimesIV happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  22 happyReduction_80
happyReduction_80 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (TimesVV happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  22 happyReduction_81
happyReduction_81 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  22 happyReduction_82
happyReduction_82 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  22 happyReduction_83
happyReduction_83 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  22 happyReduction_84
happyReduction_84 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  22 happyReduction_85
happyReduction_85 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVO happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  22 happyReduction_86
happyReduction_86 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (DivOV happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  22 happyReduction_87
happyReduction_87 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVI happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  22 happyReduction_88
happyReduction_88 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (DivIV happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  22 happyReduction_89
happyReduction_89 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (DivVV happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  22 happyReduction_90
happyReduction_90 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  22 happyReduction_91
happyReduction_91 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  22 happyReduction_92
happyReduction_92 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  22 happyReduction_93
happyReduction_93 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  22 happyReduction_94
happyReduction_94 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVO happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  22 happyReduction_95
happyReduction_95 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoOV happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  22 happyReduction_96
happyReduction_96 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVI happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  22 happyReduction_97
happyReduction_97 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (ExpoIV happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  22 happyReduction_98
happyReduction_98 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn22
		 (ExpoVV happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  22 happyReduction_99
happyReduction_99 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (happy_var_2
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_2  22 happyReduction_100
happyReduction_100 (HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateI happy_var_2
	)
happyReduction_100 _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_2  22 happyReduction_101
happyReduction_101 (HappyAbsSyn28  happy_var_2)
	_
	 =  HappyAbsSyn22
		 (NegateO happy_var_2
	)
happyReduction_101 _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_2  22 happyReduction_102
happyReduction_102 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn22
		 (NegateV happy_var_2
	)
happyReduction_102 _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_1  22 happyReduction_103
happyReduction_103 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn22
		 (QInt happy_var_1
	)
happyReduction_103 _  = notHappyAtAll 

happyReduce_104 = happyReduce 4 22 happyReduction_104
happyReduction_104 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Length happy_var_3
	) `HappyStk` happyRest

happyReduce_105 = happyReduce 4 22 happyReduction_105
happyReduction_105 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (LengthObj
	) `HappyStk` happyRest

happyReduce_106 = happySpecReduce_3  23 happyReduction_106
happyReduction_106 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (And happy_var_1 happy_var_3
	)
happyReduction_106 _ _ _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_3  23 happyReduction_107
happyReduction_107 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_107 _ _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_3  23 happyReduction_108
happyReduction_108 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_108 _ _ _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_3  23 happyReduction_109
happyReduction_109 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVO happy_var_1 happy_var_3
	)
happyReduction_109 _ _ _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_3  23 happyReduction_110
happyReduction_110 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (AndOV happy_var_1 happy_var_3
	)
happyReduction_110 _ _ _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_3  23 happyReduction_111
happyReduction_111 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVB happy_var_1 happy_var_3
	)
happyReduction_111 _ _ _  = notHappyAtAll 

happyReduce_112 = happySpecReduce_3  23 happyReduction_112
happyReduction_112 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AndBV happy_var_1 happy_var_3
	)
happyReduction_112 _ _ _  = notHappyAtAll 

happyReduce_113 = happySpecReduce_3  23 happyReduction_113
happyReduction_113 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (AndVV happy_var_1 happy_var_3
	)
happyReduction_113 _ _ _  = notHappyAtAll 

happyReduce_114 = happySpecReduce_3  23 happyReduction_114
happyReduction_114 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (Or happy_var_1 happy_var_3
	)
happyReduction_114 _ _ _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_3  23 happyReduction_115
happyReduction_115 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_115 _ _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_3  23 happyReduction_116
happyReduction_116 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_116 _ _ _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_3  23 happyReduction_117
happyReduction_117 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVO happy_var_1 happy_var_3
	)
happyReduction_117 _ _ _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_3  23 happyReduction_118
happyReduction_118 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (OrOV happy_var_1 happy_var_3
	)
happyReduction_118 _ _ _  = notHappyAtAll 

happyReduce_119 = happySpecReduce_3  23 happyReduction_119
happyReduction_119 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVB happy_var_1 happy_var_3
	)
happyReduction_119 _ _ _  = notHappyAtAll 

happyReduce_120 = happySpecReduce_3  23 happyReduction_120
happyReduction_120 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (OrBV happy_var_1 happy_var_3
	)
happyReduction_120 _ _ _  = notHappyAtAll 

happyReduce_121 = happySpecReduce_3  23 happyReduction_121
happyReduction_121 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (OrVV happy_var_1 happy_var_3
	)
happyReduction_121 _ _ _  = notHappyAtAll 

happyReduce_122 = happySpecReduce_3  23 happyReduction_122
happyReduction_122 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_122 _ _ _  = notHappyAtAll 

happyReduce_123 = happySpecReduce_3  23 happyReduction_123
happyReduction_123 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_123 _ _ _  = notHappyAtAll 

happyReduce_124 = happySpecReduce_3  23 happyReduction_124
happyReduction_124 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_124 _ _ _  = notHappyAtAll 

happyReduce_125 = happySpecReduce_3  23 happyReduction_125
happyReduction_125 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVO happy_var_1 happy_var_3
	)
happyReduction_125 _ _ _  = notHappyAtAll 

happyReduce_126 = happySpecReduce_3  23 happyReduction_126
happyReduction_126 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (GTOV happy_var_1 happy_var_3
	)
happyReduction_126 _ _ _  = notHappyAtAll 

happyReduce_127 = happySpecReduce_3  23 happyReduction_127
happyReduction_127 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVI happy_var_1 happy_var_3
	)
happyReduction_127 _ _ _  = notHappyAtAll 

happyReduce_128 = happySpecReduce_3  23 happyReduction_128
happyReduction_128 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (GTIV happy_var_1 happy_var_3
	)
happyReduction_128 _ _ _  = notHappyAtAll 

happyReduce_129 = happySpecReduce_3  23 happyReduction_129
happyReduction_129 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (GTVV happy_var_1 happy_var_3
	)
happyReduction_129 _ _ _  = notHappyAtAll 

happyReduce_130 = happySpecReduce_3  23 happyReduction_130
happyReduction_130 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_130 _ _ _  = notHappyAtAll 

happyReduce_131 = happySpecReduce_3  23 happyReduction_131
happyReduction_131 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_131 _ _ _  = notHappyAtAll 

happyReduce_132 = happySpecReduce_3  23 happyReduction_132
happyReduction_132 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_132 _ _ _  = notHappyAtAll 

happyReduce_133 = happySpecReduce_3  23 happyReduction_133
happyReduction_133 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVO happy_var_1 happy_var_3
	)
happyReduction_133 _ _ _  = notHappyAtAll 

happyReduce_134 = happySpecReduce_3  23 happyReduction_134
happyReduction_134 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (LTOV happy_var_1 happy_var_3
	)
happyReduction_134 _ _ _  = notHappyAtAll 

happyReduce_135 = happySpecReduce_3  23 happyReduction_135
happyReduction_135 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVI happy_var_1 happy_var_3
	)
happyReduction_135 _ _ _  = notHappyAtAll 

happyReduce_136 = happySpecReduce_3  23 happyReduction_136
happyReduction_136 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (LTIV happy_var_1 happy_var_3
	)
happyReduction_136 _ _ _  = notHappyAtAll 

happyReduce_137 = happySpecReduce_3  23 happyReduction_137
happyReduction_137 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (LTVV happy_var_1 happy_var_3
	)
happyReduction_137 _ _ _  = notHappyAtAll 

happyReduce_138 = happySpecReduce_3  23 happyReduction_138
happyReduction_138 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_138 _ _ _  = notHappyAtAll 

happyReduce_139 = happySpecReduce_3  23 happyReduction_139
happyReduction_139 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_139 _ _ _  = notHappyAtAll 

happyReduce_140 = happySpecReduce_3  23 happyReduction_140
happyReduction_140 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_140 _ _ _  = notHappyAtAll 

happyReduce_141 = happySpecReduce_3  23 happyReduction_141
happyReduction_141 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_141 _ _ _  = notHappyAtAll 

happyReduce_142 = happySpecReduce_3  23 happyReduction_142
happyReduction_142 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_142 _ _ _  = notHappyAtAll 

happyReduce_143 = happySpecReduce_3  23 happyReduction_143
happyReduction_143 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_143 _ _ _  = notHappyAtAll 

happyReduce_144 = happySpecReduce_3  23 happyReduction_144
happyReduction_144 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_144 _ _ _  = notHappyAtAll 

happyReduce_145 = happySpecReduce_3  23 happyReduction_145
happyReduction_145 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_145 _ _ _  = notHappyAtAll 

happyReduce_146 = happySpecReduce_3  23 happyReduction_146
happyReduction_146 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_146 _ _ _  = notHappyAtAll 

happyReduce_147 = happySpecReduce_3  23 happyReduction_147
happyReduction_147 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_147 _ _ _  = notHappyAtAll 

happyReduce_148 = happySpecReduce_3  23 happyReduction_148
happyReduction_148 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQSU happy_var_3
	)
happyReduction_148 _ _ _  = notHappyAtAll 

happyReduce_149 = happySpecReduce_3  23 happyReduction_149
happyReduction_149 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUS happy_var_1
	)
happyReduction_149 _ _ _  = notHappyAtAll 

happyReduce_150 = happySpecReduce_3  23 happyReduction_150
happyReduction_150 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQPU happy_var_3
	)
happyReduction_150 _ _ _  = notHappyAtAll 

happyReduce_151 = happySpecReduce_3  23 happyReduction_151
happyReduction_151 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUP happy_var_1
	)
happyReduction_151 _ _ _  = notHappyAtAll 

happyReduce_152 = happySpecReduce_3  23 happyReduction_152
happyReduction_152 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn23
		 (EQOU happy_var_3
	)
happyReduction_152 _ _ _  = notHappyAtAll 

happyReduce_153 = happySpecReduce_3  23 happyReduction_153
happyReduction_153 _
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUO happy_var_1
	)
happyReduction_153 _ _ _  = notHappyAtAll 

happyReduce_154 = happySpecReduce_3  23 happyReduction_154
happyReduction_154 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn23
		 (EQOV happy_var_1 happy_var_3
	)
happyReduction_154 _ _ _  = notHappyAtAll 

happyReduce_155 = happySpecReduce_3  23 happyReduction_155
happyReduction_155 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (EQIV happy_var_1 happy_var_3
	)
happyReduction_155 _ _ _  = notHappyAtAll 

happyReduce_156 = happySpecReduce_3  23 happyReduction_156
happyReduction_156 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (EQBV happy_var_1 happy_var_3
	)
happyReduction_156 _ _ _  = notHappyAtAll 

happyReduce_157 = happySpecReduce_3  23 happyReduction_157
happyReduction_157 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (EQSV happy_var_1 happy_var_3
	)
happyReduction_157 _ _ _  = notHappyAtAll 

happyReduce_158 = happySpecReduce_3  23 happyReduction_158
happyReduction_158 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (EQUV happy_var_1 happy_var_3
	)
happyReduction_158 _ _ _  = notHappyAtAll 

happyReduce_159 = happySpecReduce_3  23 happyReduction_159
happyReduction_159 (HappyAbsSyn28  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVO happy_var_1 happy_var_3
	)
happyReduction_159 _ _ _  = notHappyAtAll 

happyReduce_160 = happySpecReduce_3  23 happyReduction_160
happyReduction_160 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVI happy_var_1 happy_var_3
	)
happyReduction_160 _ _ _  = notHappyAtAll 

happyReduce_161 = happySpecReduce_3  23 happyReduction_161
happyReduction_161 (HappyAbsSyn23  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVB happy_var_1 happy_var_3
	)
happyReduction_161 _ _ _  = notHappyAtAll 

happyReduce_162 = happySpecReduce_3  23 happyReduction_162
happyReduction_162 (HappyAbsSyn24  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVS happy_var_1 happy_var_3
	)
happyReduction_162 _ _ _  = notHappyAtAll 

happyReduce_163 = happySpecReduce_3  23 happyReduction_163
happyReduction_163 (HappyAbsSyn29  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVU happy_var_1 happy_var_3
	)
happyReduction_163 _ _ _  = notHappyAtAll 

happyReduce_164 = happySpecReduce_3  23 happyReduction_164
happyReduction_164 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn23
		 (EQVV happy_var_1 happy_var_3
	)
happyReduction_164 _ _ _  = notHappyAtAll 

happyReduce_165 = happySpecReduce_3  23 happyReduction_165
happyReduction_165 _
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (happy_var_2
	)
happyReduction_165 _ _ _  = notHappyAtAll 

happyReduce_166 = happySpecReduce_1  23 happyReduction_166
happyReduction_166 _
	 =  HappyAbsSyn23
		 (QTrue
	)

happyReduce_167 = happySpecReduce_1  23 happyReduction_167
happyReduction_167 _
	 =  HappyAbsSyn23
		 (QFalse
	)

happyReduce_168 = happyReduce 6 23 happyReduction_168
happyReduction_168 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithStr happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_169 = happyReduce 6 23 happyReduction_169
happyReduction_169 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithUrl happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_170 = happyReduce 6 23 happyReduction_170
happyReduction_170 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (StartsWithObj happy_var_3
	) `HappyStk` happyRest

happyReduce_171 = happySpecReduce_1  24 happyReduction_171
happyReduction_171 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn24
		 (QString happy_var_1
	)
happyReduction_171 _  = notHappyAtAll 

happyReduce_172 = happySpecReduce_1  25 happyReduction_172
happyReduction_172 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (S happy_var_1
	)
happyReduction_172 _  = notHappyAtAll 

happyReduce_173 = happySpecReduce_1  25 happyReduction_173
happyReduction_173 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn25
		 (P happy_var_1
	)
happyReduction_173 _  = notHappyAtAll 

happyReduce_174 = happySpecReduce_1  25 happyReduction_174
happyReduction_174 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn25
		 (O happy_var_1
	)
happyReduction_174 _  = notHappyAtAll 

happyReduce_175 = happySpecReduce_1  26 happyReduction_175
happyReduction_175 _
	 =  HappyAbsSyn26
		 (Subj
	)

happyReduce_176 = happySpecReduce_1  27 happyReduction_176
happyReduction_176 _
	 =  HappyAbsSyn27
		 (Pred
	)

happyReduce_177 = happySpecReduce_1  28 happyReduction_177
happyReduction_177 _
	 =  HappyAbsSyn28
		 (Obj
	)

happyReduce_178 = happySpecReduce_1  29 happyReduction_178
happyReduction_178 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn29
		 (NewUrl happy_var_1
	)
happyReduction_178 _  = notHappyAtAll 

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
            | AssignObjStr Object StringExp | AssignObjInt Object IntExp | AssignObjBool Object BoolExp
            | Add Url Url Literal
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
            Filter Combinations | AddTrip Url Url Literal
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
