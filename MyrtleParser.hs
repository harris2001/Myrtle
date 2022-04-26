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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,543) ([0,0,0,4,0,0,0,32,0,0,0,512,0,0,0,0,0,0,0,32768,0,0,0,0,33728,1,0,0,7680,12,0,1024,0,0,0,0,0,8,0,0,16384,0,0,0,2048,0,0,0,16384,0,0,0,0,72,0,0,1536,16,0,0,0,128,0,0,0,1024,0,0,0,32,0,0,0,256,0,0,0,0,4128,0,0,0,0,256,0,0,512,0,0,0,4,0,0,0,16,0,0,0,28,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,49152,16385,0,0,0,0,1032,0,0,0,49152,387,0,0,0,256,0,0,0,0,0,0,0,16384,0,0,1024,0,0,0,0,0,0,0,16,0,0,0,0,0,2048,0,0,0,0,0,0,0,1,0,0,1,0,0,0,32768,0,0,0,0,4,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4032,2184,768,0,0,8192,0,0,2048,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,8,0,0,0,0,0,0,0,512,0,0,0,0,0,8,0,0,0,0,0,0,0,8256,0,0,0,0,512,0,256,0,0,0,57344,0,0,0,0,0,32,0,0,0,0,0,0,0,128,0,0,0,503,0,0,0,8224,6144,0,0,256,0,0,0,6144,0,0,0,49152,0,0,0,32768,255,384,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,576,136,256,0,32256,17472,6144,0,0,0,0,0,0,0,0,0,0,33020,136,48,0,0,0,256,0,0,0,2048,0,28672,4096,0,0,0,0,0,0,0,0,32,0,0,8,0,0,0,0,1024,2,0,64512,34944,12288,0,0,0,0,0,0,63232,1,0,0,8192,0,24,0,0,1,0,0,0,8,0,0,0,64,0,0,0,64384,32768,1,0,33020,136,48,0,16,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,251,0,0,0,16,3072,0,0,128,0,0,0,1024,0,0,0,47104,47,0,0,0,257,192,0,0,0,0,0,0,0,0,0,32768,4100,1,2,0,56,0,32,0,288,68,128,0,2304,544,1024,0,63488,4353,24577,0,16384,34818,0,1,0,16402,4,8,0,144,34,64,0,1152,272,512,0,9216,2176,4096,0,57344,17415,32772,1,0,8255,34,12,0,0,0,64,0,0,0,512,0,4096,16384,0,0,61440,8707,49154,0,0,0,128,0,0,33020,136,48,0,2016,1092,384,0,2304,544,1024,0,18432,4352,8192,0,16384,34818,0,1,0,16402,4,8,0,144,34,64,0,1152,272,512,0,9216,2176,4096,0,8192,17409,32768,0,0,0,0,0,0,0,0,0,0,0,256,0,0,7168,0,0,0,2048,0,0,0,16384,0,0,0,0,0,4128,0,0,2016,1092,384,0,0,1024,0,0,0,16384,2,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,128,0,0,0,1024,0,0,0,8192,0,0,0,49152,1,0,0,0,14,0,0,0,112,0,0,0,896,0,0,0,7936,0,0,0,63488,0,0,0,49152,7,0,0,0,62,0,0,0,496,0,0,0,3968,0,0,0,256,16384,0,0,60928,3,2,0,16384,0,0,0,32768,251,0,0,14336,2048,0,0,0,0,0,0,0,62208,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,32768,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,16384,0,0,0,0,2,0,0,0,16,0,0,0,224,0,0,0,1792,0,0,0,14336,0,0,0,49152,1,0,0,38912,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63488,0,0,0,49152,7,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,95,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1032,0,0,0,32,0,0,4032,2184,768,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,288,0,0,0,128,0,0,0,503,0,0,0,32,6144,0,0,256,0,0,0,2048,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,2,0,0,4,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,32768,4127,17,6,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","Query","FilteredQuery","BasicQuery","CreateVars","CreateVar","Func","FilterEl","UrlList","JoinOption","SList","SListElem","Cond","Action","Literal","LiteralList","LiteralElems","IntExp","BoolExp","StringExp","Node","Subject","Predicate","Object","Url","','","int","subj","pred","obj","true","false","'-l'","'-r'","'<'","'>'","deq","'='","'+'","'-'","'*'","'/'","'^'","'('","')'","'['","']'","string","filename","'|'","'?'","':'","'_'","filter","map","union","join","where","and","or","var","url","add","get","%eof"]
        bit_start = st Prelude.* 67
        bit_end = (st Prelude.+ 1) Prelude.* 67
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..66]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (51) = happyShift action_4
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (51) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (52) = happyShift action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (67) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (52) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (56) = happyShift action_10
action_5 (57) = happyShift action_11
action_5 (58) = happyShift action_12
action_5 (59) = happyShift action_13
action_5 (65) = happyShift action_14
action_5 (66) = happyShift action_15
action_5 (5) = happyGoto action_16
action_5 (6) = happyGoto action_8
action_5 (9) = happyGoto action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (56) = happyShift action_10
action_6 (57) = happyShift action_11
action_6 (58) = happyShift action_12
action_6 (59) = happyShift action_13
action_6 (65) = happyShift action_14
action_6 (66) = happyShift action_15
action_6 (5) = happyGoto action_7
action_6 (6) = happyGoto action_8
action_6 (9) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (38) = happyShift action_17
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (60) = happyShift action_30
action_8 _ = happyReduce_3

action_9 (52) = happyShift action_29
action_9 _ = happyReduce_5

action_10 (46) = happyShift action_28
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (46) = happyShift action_27
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (48) = happyShift action_25
action_12 (51) = happyShift action_26
action_12 (13) = happyGoto action_24
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (35) = happyShift action_21
action_13 (36) = happyShift action_22
action_13 (46) = happyShift action_23
action_13 (12) = happyGoto action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (46) = happyShift action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (46) = happyShift action_18
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (38) = happyShift action_17
action_16 _ = happyReduce_2

action_17 (38) = happyShift action_59
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (48) = happyShift action_36
action_18 (55) = happyShift action_37
action_18 (10) = happyGoto action_58
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (64) = happyShift action_57
action_19 (27) = happyGoto action_56
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (46) = happyShift action_55
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (36) = happyShift action_54
action_21 _ = happyReduce_25

action_22 (35) = happyShift action_53
action_22 _ = happyReduce_26

action_23 (30) = happyShift action_43
action_23 (31) = happyShift action_44
action_23 (32) = happyShift action_45
action_23 (23) = happyGoto action_49
action_23 (24) = happyGoto action_50
action_23 (25) = happyGoto action_51
action_23 (26) = happyGoto action_52
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_14

action_25 (51) = happyShift action_48
action_25 (14) = happyGoto action_47
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_28

action_27 (30) = happyShift action_43
action_27 (31) = happyShift action_44
action_27 (32) = happyShift action_45
action_27 (46) = happyShift action_46
action_27 (15) = happyGoto action_38
action_27 (16) = happyGoto action_39
action_27 (24) = happyGoto action_40
action_27 (25) = happyGoto action_41
action_27 (26) = happyGoto action_42
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (48) = happyShift action_36
action_28 (55) = happyShift action_37
action_28 (10) = happyGoto action_35
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (56) = happyShift action_10
action_29 (57) = happyShift action_11
action_29 (58) = happyShift action_12
action_29 (59) = happyShift action_13
action_29 (65) = happyShift action_14
action_29 (66) = happyShift action_15
action_29 (6) = happyGoto action_34
action_29 (9) = happyGoto action_9
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (63) = happyShift action_33
action_30 (7) = happyGoto action_31
action_30 (8) = happyGoto action_32
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_4

action_32 (63) = happyShift action_33
action_32 (7) = happyGoto action_91
action_32 (8) = happyGoto action_32
action_32 _ = happyReduce_7

action_33 (40) = happyShift action_90
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_6

action_35 (28) = happyShift action_89
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (64) = happyShift action_57
action_36 (11) = happyGoto action_87
action_36 (27) = happyGoto action_88
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_19

action_38 (47) = happyShift action_86
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (28) = happyShift action_85
action_39 _ = happyReduce_31

action_40 (40) = happyShift action_84
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (40) = happyShift action_83
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (40) = happyShift action_82
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_109

action_44 _ = happyReduce_110

action_45 _ = happyReduce_111

action_46 (29) = happyShift action_75
action_46 (30) = happyShift action_43
action_46 (31) = happyShift action_44
action_46 (32) = happyShift action_45
action_46 (33) = happyShift action_76
action_46 (34) = happyShift action_77
action_46 (42) = happyShift action_78
action_46 (46) = happyShift action_79
action_46 (50) = happyShift action_80
action_46 (63) = happyShift action_81
action_46 (64) = happyShift action_57
action_46 (16) = happyGoto action_67
action_46 (20) = happyGoto action_68
action_46 (21) = happyGoto action_69
action_46 (22) = happyGoto action_70
action_46 (24) = happyGoto action_71
action_46 (25) = happyGoto action_72
action_46 (26) = happyGoto action_73
action_46 (27) = happyGoto action_74
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (49) = happyShift action_66
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (28) = happyShift action_65
action_48 _ = happyReduce_29

action_49 (28) = happyShift action_64
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_106

action_51 _ = happyReduce_107

action_52 _ = happyReduce_108

action_53 _ = happyReduce_23

action_54 _ = happyReduce_24

action_55 (30) = happyShift action_43
action_55 (31) = happyShift action_44
action_55 (32) = happyShift action_45
action_55 (23) = happyGoto action_63
action_55 (24) = happyGoto action_50
action_55 (25) = happyGoto action_51
action_55 (26) = happyGoto action_52
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (28) = happyShift action_62
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_112

action_58 (28) = happyShift action_61
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (51) = happyShift action_60
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_1

action_61 (48) = happyShift action_36
action_61 (55) = happyShift action_37
action_61 (10) = happyGoto action_145
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (64) = happyShift action_57
action_62 (27) = happyGoto action_144
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (28) = happyShift action_143
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (30) = happyShift action_43
action_64 (31) = happyShift action_44
action_64 (32) = happyShift action_45
action_64 (23) = happyGoto action_142
action_64 (24) = happyGoto action_50
action_64 (25) = happyGoto action_51
action_64 (26) = happyGoto action_52
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (51) = happyShift action_48
action_65 (14) = happyGoto action_141
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_27

action_67 (47) = happyShift action_140
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (37) = happyShift action_132
action_68 (38) = happyShift action_133
action_68 (39) = happyShift action_134
action_68 (41) = happyShift action_135
action_68 (42) = happyShift action_136
action_68 (43) = happyShift action_137
action_68 (44) = happyShift action_138
action_68 (45) = happyShift action_139
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (39) = happyShift action_128
action_69 (47) = happyShift action_129
action_69 (61) = happyShift action_130
action_69 (62) = happyShift action_131
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (39) = happyShift action_127
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (39) = happyShift action_126
action_71 (40) = happyShift action_84
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (39) = happyShift action_125
action_72 (40) = happyShift action_83
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (37) = happyShift action_115
action_73 (38) = happyShift action_116
action_73 (39) = happyShift action_117
action_73 (40) = happyShift action_82
action_73 (41) = happyShift action_118
action_73 (42) = happyShift action_119
action_73 (43) = happyShift action_120
action_73 (44) = happyShift action_121
action_73 (45) = happyShift action_122
action_73 (61) = happyShift action_123
action_73 (62) = happyShift action_124
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (39) = happyShift action_114
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_72

action_76 _ = happyReduce_103

action_77 _ = happyReduce_104

action_78 (29) = happyShift action_75
action_78 (32) = happyShift action_45
action_78 (42) = happyShift action_78
action_78 (46) = happyShift action_113
action_78 (63) = happyShift action_81
action_78 (20) = happyGoto action_111
action_78 (26) = happyGoto action_112
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (29) = happyShift action_75
action_79 (30) = happyShift action_43
action_79 (31) = happyShift action_44
action_79 (32) = happyShift action_45
action_79 (33) = happyShift action_76
action_79 (34) = happyShift action_77
action_79 (42) = happyShift action_78
action_79 (46) = happyShift action_79
action_79 (50) = happyShift action_80
action_79 (63) = happyShift action_81
action_79 (64) = happyShift action_57
action_79 (16) = happyGoto action_67
action_79 (20) = happyGoto action_109
action_79 (21) = happyGoto action_110
action_79 (22) = happyGoto action_70
action_79 (24) = happyGoto action_71
action_79 (25) = happyGoto action_72
action_79 (26) = happyGoto action_73
action_79 (27) = happyGoto action_74
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_105

action_81 _ = happyReduce_73

action_82 (29) = happyShift action_75
action_82 (30) = happyShift action_43
action_82 (31) = happyShift action_44
action_82 (32) = happyShift action_45
action_82 (33) = happyShift action_76
action_82 (34) = happyShift action_77
action_82 (42) = happyShift action_78
action_82 (46) = happyShift action_98
action_82 (50) = happyShift action_80
action_82 (63) = happyShift action_81
action_82 (64) = happyShift action_57
action_82 (20) = happyGoto action_105
action_82 (21) = happyGoto action_106
action_82 (22) = happyGoto action_107
action_82 (24) = happyGoto action_95
action_82 (25) = happyGoto action_96
action_82 (26) = happyGoto action_97
action_82 (27) = happyGoto action_108
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (64) = happyShift action_57
action_83 (27) = happyGoto action_104
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (64) = happyShift action_57
action_84 (27) = happyGoto action_103
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (30) = happyShift action_43
action_85 (31) = happyShift action_44
action_85 (32) = happyShift action_45
action_85 (46) = happyShift action_46
action_85 (15) = happyGoto action_102
action_85 (16) = happyGoto action_39
action_85 (24) = happyGoto action_40
action_85 (25) = happyGoto action_41
action_85 (26) = happyGoto action_42
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_13

action_87 (49) = happyShift action_101
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (28) = happyShift action_100
action_88 _ = happyReduce_21

action_89 (48) = happyShift action_36
action_89 (55) = happyShift action_37
action_89 (10) = happyGoto action_99
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (29) = happyShift action_75
action_90 (30) = happyShift action_43
action_90 (31) = happyShift action_44
action_90 (32) = happyShift action_45
action_90 (33) = happyShift action_76
action_90 (34) = happyShift action_77
action_90 (42) = happyShift action_78
action_90 (46) = happyShift action_98
action_90 (50) = happyShift action_80
action_90 (63) = happyShift action_81
action_90 (64) = happyShift action_57
action_90 (20) = happyGoto action_92
action_90 (21) = happyGoto action_93
action_90 (22) = happyGoto action_94
action_90 (24) = happyGoto action_95
action_90 (25) = happyGoto action_96
action_90 (26) = happyGoto action_97
action_90 (27) = happyGoto action_74
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_8

action_92 (37) = happyShift action_132
action_92 (38) = happyShift action_133
action_92 (39) = happyShift action_134
action_92 (41) = happyShift action_135
action_92 (42) = happyShift action_136
action_92 (43) = happyShift action_137
action_92 (44) = happyShift action_138
action_92 (45) = happyShift action_139
action_92 _ = happyReduce_9

action_93 (39) = happyShift action_128
action_93 (61) = happyShift action_130
action_93 (62) = happyShift action_131
action_93 _ = happyReduce_11

action_94 (39) = happyShift action_127
action_94 _ = happyReduce_10

action_95 (39) = happyShift action_126
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (39) = happyShift action_125
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (37) = happyShift action_115
action_97 (38) = happyShift action_116
action_97 (39) = happyShift action_117
action_97 (41) = happyShift action_118
action_97 (42) = happyShift action_119
action_97 (43) = happyShift action_120
action_97 (44) = happyShift action_121
action_97 (45) = happyShift action_122
action_97 (61) = happyShift action_123
action_97 (62) = happyShift action_124
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (29) = happyShift action_75
action_98 (30) = happyShift action_43
action_98 (31) = happyShift action_44
action_98 (32) = happyShift action_45
action_98 (33) = happyShift action_76
action_98 (34) = happyShift action_77
action_98 (42) = happyShift action_78
action_98 (46) = happyShift action_98
action_98 (50) = happyShift action_80
action_98 (63) = happyShift action_81
action_98 (64) = happyShift action_57
action_98 (20) = happyGoto action_109
action_98 (21) = happyGoto action_110
action_98 (22) = happyGoto action_70
action_98 (24) = happyGoto action_95
action_98 (25) = happyGoto action_96
action_98 (26) = happyGoto action_97
action_98 (27) = happyGoto action_74
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (28) = happyShift action_204
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (64) = happyShift action_57
action_100 (11) = happyGoto action_203
action_100 (27) = happyGoto action_88
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_20

action_102 _ = happyReduce_32

action_103 _ = happyReduce_34

action_104 _ = happyReduce_35

action_105 (37) = happyShift action_132
action_105 (38) = happyShift action_133
action_105 (39) = happyShift action_134
action_105 (41) = happyShift action_135
action_105 (42) = happyShift action_136
action_105 (43) = happyShift action_137
action_105 (44) = happyShift action_138
action_105 (45) = happyShift action_139
action_105 _ = happyReduce_38

action_106 (39) = happyShift action_128
action_106 (61) = happyShift action_130
action_106 (62) = happyShift action_131
action_106 _ = happyReduce_39

action_107 (39) = happyShift action_127
action_107 _ = happyReduce_37

action_108 (39) = happyShift action_114
action_108 _ = happyReduce_36

action_109 (37) = happyShift action_132
action_109 (38) = happyShift action_133
action_109 (39) = happyShift action_134
action_109 (41) = happyShift action_135
action_109 (42) = happyShift action_136
action_109 (43) = happyShift action_137
action_109 (44) = happyShift action_138
action_109 (45) = happyShift action_139
action_109 (47) = happyShift action_202
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (39) = happyShift action_128
action_110 (47) = happyShift action_201
action_110 (61) = happyShift action_130
action_110 (62) = happyShift action_131
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_70

action_112 _ = happyReduce_71

action_113 (29) = happyShift action_75
action_113 (32) = happyShift action_45
action_113 (42) = happyShift action_78
action_113 (46) = happyShift action_113
action_113 (63) = happyShift action_81
action_113 (20) = happyGoto action_200
action_113 (26) = happyGoto action_194
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (30) = happyShift action_43
action_114 (31) = happyShift action_44
action_114 (32) = happyShift action_45
action_114 (64) = happyShift action_57
action_114 (24) = happyGoto action_196
action_114 (25) = happyGoto action_197
action_114 (26) = happyGoto action_198
action_114 (27) = happyGoto action_199
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (29) = happyShift action_75
action_115 (32) = happyShift action_45
action_115 (42) = happyShift action_78
action_115 (46) = happyShift action_113
action_115 (63) = happyShift action_81
action_115 (20) = happyGoto action_195
action_115 (26) = happyGoto action_194
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (29) = happyShift action_75
action_116 (32) = happyShift action_45
action_116 (42) = happyShift action_78
action_116 (46) = happyShift action_113
action_116 (63) = happyShift action_81
action_116 (20) = happyGoto action_193
action_116 (26) = happyGoto action_194
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (29) = happyShift action_75
action_117 (30) = happyShift action_43
action_117 (31) = happyShift action_44
action_117 (32) = happyShift action_45
action_117 (33) = happyShift action_76
action_117 (34) = happyShift action_77
action_117 (42) = happyShift action_78
action_117 (46) = happyShift action_98
action_117 (50) = happyShift action_80
action_117 (63) = happyShift action_81
action_117 (64) = happyShift action_57
action_117 (20) = happyGoto action_189
action_117 (21) = happyGoto action_190
action_117 (22) = happyGoto action_191
action_117 (24) = happyGoto action_95
action_117 (25) = happyGoto action_96
action_117 (26) = happyGoto action_97
action_117 (27) = happyGoto action_192
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (29) = happyShift action_75
action_118 (32) = happyShift action_45
action_118 (42) = happyShift action_78
action_118 (46) = happyShift action_113
action_118 (63) = happyShift action_81
action_118 (20) = happyGoto action_187
action_118 (26) = happyGoto action_188
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (29) = happyShift action_75
action_119 (32) = happyShift action_45
action_119 (42) = happyShift action_78
action_119 (46) = happyShift action_113
action_119 (63) = happyShift action_81
action_119 (20) = happyGoto action_185
action_119 (26) = happyGoto action_186
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (29) = happyShift action_75
action_120 (32) = happyShift action_45
action_120 (42) = happyShift action_78
action_120 (46) = happyShift action_113
action_120 (63) = happyShift action_81
action_120 (20) = happyGoto action_183
action_120 (26) = happyGoto action_184
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (29) = happyShift action_75
action_121 (32) = happyShift action_45
action_121 (42) = happyShift action_78
action_121 (46) = happyShift action_113
action_121 (63) = happyShift action_81
action_121 (20) = happyGoto action_181
action_121 (26) = happyGoto action_182
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (29) = happyShift action_75
action_122 (32) = happyShift action_45
action_122 (42) = happyShift action_78
action_122 (46) = happyShift action_113
action_122 (63) = happyShift action_81
action_122 (20) = happyGoto action_179
action_122 (26) = happyGoto action_180
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (29) = happyShift action_75
action_123 (30) = happyShift action_43
action_123 (31) = happyShift action_44
action_123 (32) = happyShift action_45
action_123 (33) = happyShift action_76
action_123 (34) = happyShift action_77
action_123 (42) = happyShift action_78
action_123 (46) = happyShift action_98
action_123 (50) = happyShift action_80
action_123 (63) = happyShift action_81
action_123 (64) = happyShift action_57
action_123 (20) = happyGoto action_68
action_123 (21) = happyGoto action_178
action_123 (22) = happyGoto action_70
action_123 (24) = happyGoto action_95
action_123 (25) = happyGoto action_96
action_123 (26) = happyGoto action_97
action_123 (27) = happyGoto action_74
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (29) = happyShift action_75
action_124 (30) = happyShift action_43
action_124 (31) = happyShift action_44
action_124 (32) = happyShift action_45
action_124 (33) = happyShift action_76
action_124 (34) = happyShift action_77
action_124 (42) = happyShift action_78
action_124 (46) = happyShift action_98
action_124 (50) = happyShift action_80
action_124 (63) = happyShift action_81
action_124 (64) = happyShift action_57
action_124 (20) = happyGoto action_68
action_124 (21) = happyGoto action_177
action_124 (22) = happyGoto action_70
action_124 (24) = happyGoto action_95
action_124 (25) = happyGoto action_96
action_124 (26) = happyGoto action_97
action_124 (27) = happyGoto action_74
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (64) = happyShift action_57
action_125 (27) = happyGoto action_176
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (64) = happyShift action_57
action_126 (27) = happyGoto action_175
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (32) = happyShift action_45
action_127 (50) = happyShift action_80
action_127 (22) = happyGoto action_173
action_127 (26) = happyGoto action_174
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (29) = happyShift action_75
action_128 (30) = happyShift action_43
action_128 (31) = happyShift action_44
action_128 (32) = happyShift action_45
action_128 (33) = happyShift action_76
action_128 (34) = happyShift action_77
action_128 (42) = happyShift action_78
action_128 (46) = happyShift action_98
action_128 (50) = happyShift action_80
action_128 (63) = happyShift action_81
action_128 (64) = happyShift action_57
action_128 (20) = happyGoto action_68
action_128 (21) = happyGoto action_171
action_128 (22) = happyGoto action_70
action_128 (24) = happyGoto action_95
action_128 (25) = happyGoto action_96
action_128 (26) = happyGoto action_172
action_128 (27) = happyGoto action_74
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (53) = happyShift action_170
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (29) = happyShift action_75
action_130 (30) = happyShift action_43
action_130 (31) = happyShift action_44
action_130 (32) = happyShift action_45
action_130 (33) = happyShift action_76
action_130 (34) = happyShift action_77
action_130 (42) = happyShift action_78
action_130 (46) = happyShift action_98
action_130 (50) = happyShift action_80
action_130 (63) = happyShift action_81
action_130 (64) = happyShift action_57
action_130 (20) = happyGoto action_68
action_130 (21) = happyGoto action_168
action_130 (22) = happyGoto action_70
action_130 (24) = happyGoto action_95
action_130 (25) = happyGoto action_96
action_130 (26) = happyGoto action_169
action_130 (27) = happyGoto action_74
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (29) = happyShift action_75
action_131 (30) = happyShift action_43
action_131 (31) = happyShift action_44
action_131 (32) = happyShift action_45
action_131 (33) = happyShift action_76
action_131 (34) = happyShift action_77
action_131 (42) = happyShift action_78
action_131 (46) = happyShift action_98
action_131 (50) = happyShift action_80
action_131 (63) = happyShift action_81
action_131 (64) = happyShift action_57
action_131 (20) = happyGoto action_68
action_131 (21) = happyGoto action_166
action_131 (22) = happyGoto action_70
action_131 (24) = happyGoto action_95
action_131 (25) = happyGoto action_96
action_131 (26) = happyGoto action_167
action_131 (27) = happyGoto action_74
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (29) = happyShift action_75
action_132 (32) = happyShift action_45
action_132 (42) = happyShift action_78
action_132 (46) = happyShift action_113
action_132 (63) = happyShift action_81
action_132 (20) = happyGoto action_164
action_132 (26) = happyGoto action_165
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (29) = happyShift action_75
action_133 (32) = happyShift action_45
action_133 (42) = happyShift action_78
action_133 (46) = happyShift action_113
action_133 (63) = happyShift action_81
action_133 (20) = happyGoto action_162
action_133 (26) = happyGoto action_163
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (29) = happyShift action_75
action_134 (32) = happyShift action_45
action_134 (42) = happyShift action_78
action_134 (46) = happyShift action_113
action_134 (63) = happyShift action_81
action_134 (20) = happyGoto action_160
action_134 (26) = happyGoto action_161
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (29) = happyShift action_75
action_135 (32) = happyShift action_45
action_135 (42) = happyShift action_78
action_135 (46) = happyShift action_113
action_135 (63) = happyShift action_81
action_135 (20) = happyGoto action_158
action_135 (26) = happyGoto action_159
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (29) = happyShift action_75
action_136 (32) = happyShift action_45
action_136 (42) = happyShift action_78
action_136 (46) = happyShift action_113
action_136 (63) = happyShift action_81
action_136 (20) = happyGoto action_156
action_136 (26) = happyGoto action_157
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (29) = happyShift action_75
action_137 (32) = happyShift action_45
action_137 (42) = happyShift action_78
action_137 (46) = happyShift action_113
action_137 (63) = happyShift action_81
action_137 (20) = happyGoto action_154
action_137 (26) = happyGoto action_155
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (29) = happyShift action_75
action_138 (32) = happyShift action_45
action_138 (42) = happyShift action_78
action_138 (46) = happyShift action_113
action_138 (63) = happyShift action_81
action_138 (20) = happyGoto action_152
action_138 (26) = happyGoto action_153
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (29) = happyShift action_75
action_139 (32) = happyShift action_45
action_139 (42) = happyShift action_78
action_139 (46) = happyShift action_113
action_139 (63) = happyShift action_81
action_139 (20) = happyGoto action_150
action_139 (26) = happyGoto action_151
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_40

action_141 _ = happyReduce_30

action_142 (47) = happyShift action_149
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (30) = happyShift action_43
action_143 (31) = happyShift action_44
action_143 (32) = happyShift action_45
action_143 (23) = happyGoto action_148
action_143 (24) = happyGoto action_50
action_143 (25) = happyGoto action_51
action_143 (26) = happyGoto action_52
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (28) = happyShift action_147
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (28) = happyShift action_146
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (48) = happyShift action_206
action_146 (55) = happyShift action_207
action_146 (18) = happyGoto action_216
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (29) = happyShift action_75
action_147 (30) = happyShift action_43
action_147 (31) = happyShift action_44
action_147 (32) = happyShift action_45
action_147 (33) = happyShift action_76
action_147 (34) = happyShift action_77
action_147 (42) = happyShift action_78
action_147 (46) = happyShift action_98
action_147 (50) = happyShift action_80
action_147 (63) = happyShift action_81
action_147 (64) = happyShift action_57
action_147 (17) = happyGoto action_211
action_147 (20) = happyGoto action_212
action_147 (21) = happyGoto action_213
action_147 (22) = happyGoto action_214
action_147 (24) = happyGoto action_95
action_147 (25) = happyGoto action_96
action_147 (26) = happyGoto action_97
action_147 (27) = happyGoto action_215
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (47) = happyShift action_210
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (48) = happyShift action_25
action_149 (51) = happyShift action_26
action_149 (13) = happyGoto action_209
action_149 _ = happyFail (happyExpListPerState 149)

action_150 _ = happyReduce_65

action_151 _ = happyReduce_67

action_152 (45) = happyShift action_139
action_152 _ = happyReduce_61

action_153 (45) = happyShift action_122
action_153 _ = happyReduce_63

action_154 (45) = happyShift action_139
action_154 _ = happyReduce_57

action_155 (45) = happyShift action_122
action_155 _ = happyReduce_59

action_156 (43) = happyShift action_137
action_156 (44) = happyShift action_138
action_156 (45) = happyShift action_139
action_156 _ = happyReduce_53

action_157 (43) = happyShift action_120
action_157 (44) = happyShift action_121
action_157 (45) = happyShift action_122
action_157 _ = happyReduce_55

action_158 (43) = happyShift action_137
action_158 (44) = happyShift action_138
action_158 (45) = happyShift action_139
action_158 _ = happyReduce_49

action_159 (43) = happyShift action_120
action_159 (44) = happyShift action_121
action_159 (45) = happyShift action_122
action_159 _ = happyReduce_51

action_160 (41) = happyShift action_135
action_160 (42) = happyShift action_136
action_160 (43) = happyShift action_137
action_160 (44) = happyShift action_138
action_160 (45) = happyShift action_139
action_160 _ = happyReduce_86

action_161 (41) = happyShift action_118
action_161 (42) = happyShift action_119
action_161 (43) = happyShift action_120
action_161 (44) = happyShift action_121
action_161 (45) = happyShift action_122
action_161 _ = happyReduce_91

action_162 (41) = happyShift action_135
action_162 (42) = happyShift action_136
action_162 (43) = happyShift action_137
action_162 (44) = happyShift action_138
action_162 (45) = happyShift action_139
action_162 _ = happyReduce_80

action_163 (41) = happyShift action_118
action_163 (42) = happyShift action_119
action_163 (43) = happyShift action_120
action_163 (44) = happyShift action_121
action_163 (45) = happyShift action_122
action_163 _ = happyReduce_81

action_164 (41) = happyShift action_135
action_164 (42) = happyShift action_136
action_164 (43) = happyShift action_137
action_164 (44) = happyShift action_138
action_164 (45) = happyShift action_139
action_164 _ = happyReduce_83

action_165 (41) = happyShift action_118
action_165 (42) = happyShift action_119
action_165 (43) = happyShift action_120
action_165 (44) = happyShift action_121
action_165 (45) = happyShift action_122
action_165 _ = happyReduce_84

action_166 (39) = happyShift action_128
action_166 (61) = happyShift action_130
action_166 _ = happyReduce_77

action_167 (37) = happyShift action_115
action_167 (38) = happyShift action_116
action_167 (39) = happyShift action_117
action_167 (41) = happyShift action_118
action_167 (42) = happyShift action_119
action_167 (43) = happyShift action_120
action_167 (44) = happyShift action_121
action_167 (45) = happyShift action_122
action_167 (61) = happyShift action_123
action_167 _ = happyReduce_78

action_168 (39) = happyShift action_128
action_168 _ = happyReduce_74

action_169 (37) = happyShift action_115
action_169 (38) = happyShift action_116
action_169 (39) = happyShift action_117
action_169 (41) = happyShift action_118
action_169 (42) = happyShift action_119
action_169 (43) = happyShift action_120
action_169 (44) = happyShift action_121
action_169 (45) = happyShift action_122
action_169 _ = happyReduce_75

action_170 (30) = happyShift action_43
action_170 (31) = happyShift action_44
action_170 (32) = happyShift action_45
action_170 (46) = happyShift action_46
action_170 (15) = happyGoto action_208
action_170 (16) = happyGoto action_39
action_170 (24) = happyGoto action_40
action_170 (25) = happyGoto action_41
action_170 (26) = happyGoto action_42
action_170 _ = happyFail (happyExpListPerState 170)

action_171 _ = happyReduce_87

action_172 (37) = happyShift action_115
action_172 (38) = happyShift action_116
action_172 (41) = happyShift action_118
action_172 (42) = happyShift action_119
action_172 (43) = happyShift action_120
action_172 (44) = happyShift action_121
action_172 (45) = happyShift action_122
action_172 _ = happyReduce_95

action_173 _ = happyReduce_88

action_174 _ = happyReduce_93

action_175 _ = happyReduce_96

action_176 _ = happyReduce_98

action_177 (39) = happyShift action_128
action_177 (61) = happyShift action_130
action_177 _ = happyReduce_79

action_178 (39) = happyShift action_128
action_178 _ = happyReduce_76

action_179 _ = happyReduce_66

action_180 _ = happyReduce_68

action_181 (45) = happyShift action_139
action_181 _ = happyReduce_62

action_182 (45) = happyShift action_122
action_182 _ = happyReduce_64

action_183 (45) = happyShift action_139
action_183 _ = happyReduce_58

action_184 (45) = happyShift action_122
action_184 _ = happyReduce_60

action_185 (43) = happyShift action_137
action_185 (44) = happyShift action_138
action_185 (45) = happyShift action_139
action_185 _ = happyReduce_54

action_186 (43) = happyShift action_120
action_186 (44) = happyShift action_121
action_186 (45) = happyShift action_122
action_186 _ = happyReduce_56

action_187 (43) = happyShift action_137
action_187 (44) = happyShift action_138
action_187 (45) = happyShift action_139
action_187 _ = happyReduce_50

action_188 (43) = happyShift action_120
action_188 (44) = happyShift action_121
action_188 (45) = happyShift action_122
action_188 _ = happyReduce_52

action_189 (37) = happyShift action_132
action_189 (38) = happyShift action_133
action_189 (41) = happyShift action_135
action_189 (42) = happyShift action_136
action_189 (43) = happyShift action_137
action_189 (44) = happyShift action_138
action_189 (45) = happyShift action_139
action_189 _ = happyReduce_90

action_190 _ = happyReduce_94

action_191 _ = happyReduce_92

action_192 _ = happyReduce_100

action_193 (41) = happyShift action_135
action_193 (42) = happyShift action_136
action_193 (43) = happyShift action_137
action_193 (44) = happyShift action_138
action_193 (45) = happyShift action_139
action_193 _ = happyReduce_82

action_194 (41) = happyShift action_118
action_194 (42) = happyShift action_119
action_194 (43) = happyShift action_120
action_194 (44) = happyShift action_121
action_194 (45) = happyShift action_122
action_194 _ = happyFail (happyExpListPerState 194)

action_195 (41) = happyShift action_135
action_195 (42) = happyShift action_136
action_195 (43) = happyShift action_137
action_195 (44) = happyShift action_138
action_195 (45) = happyShift action_139
action_195 _ = happyReduce_85

action_196 _ = happyReduce_97

action_197 _ = happyReduce_99

action_198 _ = happyReduce_101

action_199 _ = happyReduce_89

action_200 (41) = happyShift action_135
action_200 (42) = happyShift action_136
action_200 (43) = happyShift action_137
action_200 (44) = happyShift action_138
action_200 (45) = happyShift action_139
action_200 (47) = happyShift action_202
action_200 _ = happyFail (happyExpListPerState 200)

action_201 _ = happyReduce_102

action_202 _ = happyReduce_69

action_203 _ = happyReduce_22

action_204 (48) = happyShift action_206
action_204 (55) = happyShift action_207
action_204 (18) = happyGoto action_205
action_204 _ = happyFail (happyExpListPerState 204)

action_205 (47) = happyShift action_223
action_205 _ = happyFail (happyExpListPerState 205)

action_206 (29) = happyShift action_75
action_206 (30) = happyShift action_43
action_206 (31) = happyShift action_44
action_206 (32) = happyShift action_45
action_206 (33) = happyShift action_76
action_206 (34) = happyShift action_77
action_206 (42) = happyShift action_78
action_206 (46) = happyShift action_98
action_206 (50) = happyShift action_80
action_206 (63) = happyShift action_81
action_206 (64) = happyShift action_57
action_206 (17) = happyGoto action_221
action_206 (19) = happyGoto action_222
action_206 (20) = happyGoto action_212
action_206 (21) = happyGoto action_213
action_206 (22) = happyGoto action_214
action_206 (24) = happyGoto action_95
action_206 (25) = happyGoto action_96
action_206 (26) = happyGoto action_97
action_206 (27) = happyGoto action_215
action_206 _ = happyFail (happyExpListPerState 206)

action_207 _ = happyReduce_45

action_208 (54) = happyShift action_220
action_208 _ = happyFail (happyExpListPerState 208)

action_209 _ = happyReduce_15

action_210 (48) = happyShift action_25
action_210 (51) = happyShift action_26
action_210 (13) = happyGoto action_219
action_210 _ = happyFail (happyExpListPerState 210)

action_211 (47) = happyShift action_218
action_211 _ = happyFail (happyExpListPerState 211)

action_212 (37) = happyShift action_132
action_212 (38) = happyShift action_133
action_212 (39) = happyShift action_134
action_212 (41) = happyShift action_135
action_212 (42) = happyShift action_136
action_212 (43) = happyShift action_137
action_212 (44) = happyShift action_138
action_212 (45) = happyShift action_139
action_212 _ = happyReduce_41

action_213 (39) = happyShift action_128
action_213 (61) = happyShift action_130
action_213 (62) = happyShift action_131
action_213 _ = happyReduce_42

action_214 (39) = happyShift action_127
action_214 _ = happyReduce_43

action_215 (39) = happyShift action_114
action_215 _ = happyReduce_44

action_216 (47) = happyShift action_217
action_216 _ = happyFail (happyExpListPerState 216)

action_217 _ = happyReduce_18

action_218 _ = happyReduce_17

action_219 _ = happyReduce_16

action_220 (30) = happyShift action_43
action_220 (31) = happyShift action_44
action_220 (32) = happyShift action_45
action_220 (46) = happyShift action_46
action_220 (15) = happyGoto action_226
action_220 (16) = happyGoto action_39
action_220 (24) = happyGoto action_40
action_220 (25) = happyGoto action_41
action_220 (26) = happyGoto action_42
action_220 _ = happyFail (happyExpListPerState 220)

action_221 (28) = happyShift action_225
action_221 _ = happyReduce_47

action_222 (49) = happyShift action_224
action_222 _ = happyFail (happyExpListPerState 222)

action_223 _ = happyReduce_12

action_224 _ = happyReduce_46

action_225 (29) = happyShift action_75
action_225 (30) = happyShift action_43
action_225 (31) = happyShift action_44
action_225 (32) = happyShift action_45
action_225 (33) = happyShift action_76
action_225 (34) = happyShift action_77
action_225 (42) = happyShift action_78
action_225 (46) = happyShift action_98
action_225 (50) = happyShift action_80
action_225 (63) = happyShift action_81
action_225 (64) = happyShift action_57
action_225 (17) = happyGoto action_221
action_225 (19) = happyGoto action_227
action_225 (20) = happyGoto action_212
action_225 (21) = happyGoto action_213
action_225 (22) = happyGoto action_214
action_225 (24) = happyGoto action_95
action_225 (25) = happyGoto action_96
action_225 (26) = happyGoto action_97
action_225 (27) = happyGoto action_215
action_225 _ = happyFail (happyExpListPerState 225)

action_226 _ = happyReduce_33

action_227 _ = happyReduce_48

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
happyReduction_9 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (IntVar happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (StringVar happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn21  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (BoolVar happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 8 9 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Filter happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Map happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Union happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 7 9 happyReduction_15
happyReduction_15 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (NormalJoin happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 8 9 happyReduction_16
happyReduction_16 ((HappyAbsSyn13  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Join happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 8 9 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Add happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 8 9 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Get happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn10
		 (Any
	)

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (FilteredList happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn11
		 (SimpleUrl happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  11 happyReduction_22
happyReduction_22 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn11
		 (UrlSeq happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  12 happyReduction_23
happyReduction_23 _
	_
	 =  HappyAbsSyn12
		 (BidirectJoin
	)

happyReduce_24 = happySpecReduce_2  12 happyReduction_24
happyReduction_24 _
	_
	 =  HappyAbsSyn12
		 (BidirectJoin
	)

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn12
		 (LeftJoin
	)

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn12
		 (RightJoin
	)

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (StrList happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn13
		 (StrListSingle happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  14 happyReduction_29
happyReduction_29 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn14
		 (SListEl happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn14
		 (SListSeq happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  15 happyReduction_31
happyReduction_31 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Always happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  15 happyReduction_32
happyReduction_32 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (ActionSeq happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 7 15 happyReduction_33
happyReduction_33 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (If happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignSubj happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  16 happyReduction_35
happyReduction_35 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignPred happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  16 happyReduction_36
happyReduction_36 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjUrl happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  16 happyReduction_37
happyReduction_37 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjStr happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  16 happyReduction_38
happyReduction_38 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjInt happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjBool happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  16 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  17 happyReduction_41
happyReduction_41 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn17
		 (IntLit happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (BoolLit happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  17 happyReduction_43
happyReduction_43 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn17
		 (StrLit happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  17 happyReduction_44
happyReduction_44 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn17
		 (UrlLit happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  18 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn18
		 (AnyLit
	)

happyReduce_46 = happySpecReduce_3  18 happyReduction_46
happyReduction_46 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (LiteralLst happy_var_2
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  19 happyReduction_47
happyReduction_47 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (SingleLit happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  19 happyReduction_48
happyReduction_48 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  20 happyReduction_49
happyReduction_49 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  20 happyReduction_52
happyReduction_52 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  20 happyReduction_53
happyReduction_53 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  20 happyReduction_54
happyReduction_54 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  20 happyReduction_55
happyReduction_55 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  20 happyReduction_56
happyReduction_56 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  20 happyReduction_57
happyReduction_57 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  20 happyReduction_58
happyReduction_58 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  20 happyReduction_59
happyReduction_59 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  20 happyReduction_60
happyReduction_60 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  20 happyReduction_61
happyReduction_61 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  20 happyReduction_62
happyReduction_62 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  20 happyReduction_63
happyReduction_63 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  20 happyReduction_64
happyReduction_64 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  20 happyReduction_65
happyReduction_65 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  20 happyReduction_66
happyReduction_66 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  20 happyReduction_67
happyReduction_67 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  20 happyReduction_68
happyReduction_68 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  20 happyReduction_69
happyReduction_69 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_2  20 happyReduction_70
happyReduction_70 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateI happy_var_2
	)
happyReduction_70 _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_2  20 happyReduction_71
happyReduction_71 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateO happy_var_2
	)
happyReduction_71 _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  20 happyReduction_72
happyReduction_72 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn20
		 (QInt happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  20 happyReduction_73
happyReduction_73 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (IntVariable happy_var_1
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  21 happyReduction_74
happyReduction_74 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (And happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  21 happyReduction_75
happyReduction_75 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  21 happyReduction_76
happyReduction_76 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  21 happyReduction_77
happyReduction_77 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (Or happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  21 happyReduction_78
happyReduction_78 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  21 happyReduction_79
happyReduction_79 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  21 happyReduction_80
happyReduction_80 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  21 happyReduction_81
happyReduction_81 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  21 happyReduction_82
happyReduction_82 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  21 happyReduction_83
happyReduction_83 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  21 happyReduction_84
happyReduction_84 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  21 happyReduction_85
happyReduction_85 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  21 happyReduction_86
happyReduction_86 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  21 happyReduction_87
happyReduction_87 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  21 happyReduction_88
happyReduction_88 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  21 happyReduction_89
happyReduction_89 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  21 happyReduction_90
happyReduction_90 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  21 happyReduction_91
happyReduction_91 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  21 happyReduction_92
happyReduction_92 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  21 happyReduction_93
happyReduction_93 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  21 happyReduction_94
happyReduction_94 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  21 happyReduction_95
happyReduction_95 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  21 happyReduction_96
happyReduction_96 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSU happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  21 happyReduction_97
happyReduction_97 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUS happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  21 happyReduction_98
happyReduction_98 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn21
		 (EQPU happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  21 happyReduction_99
happyReduction_99 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUP happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  21 happyReduction_100
happyReduction_100 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOU happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  21 happyReduction_101
happyReduction_101 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUO happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  21 happyReduction_102
happyReduction_102 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_1  21 happyReduction_103
happyReduction_103 _
	 =  HappyAbsSyn21
		 (QTrue
	)

happyReduce_104 = happySpecReduce_1  21 happyReduction_104
happyReduction_104 _
	 =  HappyAbsSyn21
		 (QFalse
	)

happyReduce_105 = happySpecReduce_1  22 happyReduction_105
happyReduction_105 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn22
		 (QString happy_var_1
	)
happyReduction_105 _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_1  23 happyReduction_106
happyReduction_106 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (S happy_var_1
	)
happyReduction_106 _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_1  23 happyReduction_107
happyReduction_107 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn23
		 (P happy_var_1
	)
happyReduction_107 _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_1  23 happyReduction_108
happyReduction_108 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn23
		 (O happy_var_1
	)
happyReduction_108 _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_1  24 happyReduction_109
happyReduction_109 _
	 =  HappyAbsSyn24
		 (Subj
	)

happyReduce_110 = happySpecReduce_1  25 happyReduction_110
happyReduction_110 _
	 =  HappyAbsSyn25
		 (Pred
	)

happyReduce_111 = happySpecReduce_1  26 happyReduction_111
happyReduction_111 _
	 =  HappyAbsSyn26
		 (Obj
	)

happyReduce_112 = happySpecReduce_1  27 happyReduction_112
happyReduction_112 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn27
		 (NewUrl happy_var_1
	)
happyReduction_112 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 67 67 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenComma _ -> cont 28;
	TokenInt _ happy_dollar_dollar -> cont 29;
	TokenSubj _ -> cont 30;
	TokenPred _ -> cont 31;
	TokenObj _ -> cont 32;
	TokenTrue _ -> cont 33;
	TokenFalse _ -> cont 34;
	TokenLJoin _ -> cont 35;
	TokenRJoin _ -> cont 36;
	TokenLT _ -> cont 37;
	TokenGT _ -> cont 38;
	TokenDEQ _ -> cont 39;
	TokenEQ _ -> cont 40;
	TokenPlus _ -> cont 41;
	TokenMinus _ -> cont 42;
	TokenTimes _ -> cont 43;
	TokenDiv _ -> cont 44;
	TokenExp _ -> cont 45;
	TokenLParen _ -> cont 46;
	TokenRParen _ -> cont 47;
	TokenLBrack _ -> cont 48;
	TokenRBrack _ -> cont 49;
	TokenString _ happy_dollar_dollar -> cont 50;
	TokenFilename _ happy_dollar_dollar -> cont 51;
	TokenPipe _ -> cont 52;
	TokenQuestion _ -> cont 53;
	TokenColon _ -> cont 54;
	TokenAll _ -> cont 55;
	TokenFilter _ -> cont 56;
	TokenMap _ -> cont 57;
	TokenUnion _ -> cont 58;
	TokenJoin _ -> cont 59;
	TokenWhere _ -> cont 60;
	TokenAnd _ -> cont 61;
	TokenOr _ -> cont 62;
	TokenVar _ happy_dollar_dollar -> cont 63;
	TokenUrl _ happy_dollar_dollar -> cont 64;
	TokenAdd _ -> cont 65;
	TokenGet _ -> cont 66;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 67 tk tks = happyError' (tks, explist)
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
parseError ((TokenGet (AlexPn _ l c))  : xs) = error (printing l c)
parseError ((TokenUrl (AlexPn _ l c) _ )  : xs) = error (printing l c)
parseError ((TokenFilename (AlexPn _ l c) _ )  : xs) = error (printing l c)

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
              NegateI IntExp |  NegateO Object |
              IntVariable String
     deriving Show
     
-- TODO change Nodes in doc
data BoolExp = And BoolExp BoolExp | AndIO BoolExp Object | AndOI Object BoolExp
             | Or BoolExp BoolExp | OrIO BoolExp Object | OrOI Object BoolExp
             | GTII IntExp IntExp | GTIO IntExp Object | GTOI Object IntExp 
             | LTII IntExp IntExp | LTIO IntExp Object | LTOI Object IntExp
             | EQII IntExp IntExp | EQBB BoolExp BoolExp | EQSS StringExp StringExp | EQUU Url Url
             | EQOS Object StringExp | EQSO StringExp Object
             | EQOI Object IntExp | EQIO IntExp Object
             | EQOB Object BoolExp | EQBO BoolExp Object
             | EQSU Subject Url | EQUS Url Subject
             | EQPU Predicate Url | EQUP Url Predicate
             | EQOU Object Url | EQUO Url Object
            --  | BoolVariable BoolExp | BoolObj Object
             | QTrue | QFalse
     deriving Show

data SList = StrList SListElem | StrListSingle String
     deriving Show
     
data SListElem = SListEl String | SListSeq String SListElem
     deriving Show
     
data CreateVar = IntVar String IntExp | BoolVar String BoolExp | StringVar String StringExp
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
     deriving Show
     
data JoinOption = BidirectJoin | LeftJoin | RightJoin
     deriving Show

data Url = NewUrl String
     deriving Show

data UrlList = SimpleUrl Url | UrlSeq Url UrlList
     deriving Show

data FilterEl = Any | FilteredList UrlList
     deriving Show

data Literal = IntLit IntExp | BoolLit BoolExp | StrLit StringExp | UrlLit Url
     deriving Show

data LiteralList = AnyLit | LiteralLst LiteralElems 
     deriving Show

data LiteralElems = LiteralSeq Literal LiteralElems | SingleLit Literal 
     deriving Show

data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter FilterEl FilterEl LiteralList | Add Url Url Literal | Get FilterEl FilterEl LiteralList
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
