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
happyExpList = Happy_Data_Array.listArray (0,558) ([0,0,0,4,0,0,0,32,0,0,0,512,0,0,0,0,0,0,0,32768,0,0,0,0,33728,1,0,0,7680,12,0,1024,0,0,0,0,0,8,0,0,16384,0,0,0,2048,0,0,0,16384,0,0,0,0,72,0,0,1536,16,0,0,0,128,0,0,0,1024,0,0,0,32,0,0,0,256,0,0,0,0,4128,0,0,0,0,256,0,0,512,0,0,0,4,0,0,0,16,0,0,0,28,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,49152,16385,0,2,0,0,1032,0,0,0,49152,387,0,0,0,256,0,0,0,0,0,0,0,16384,0,0,1024,0,0,0,0,0,0,0,16,0,0,0,0,0,2048,0,0,0,0,0,0,0,1,0,0,1,0,0,0,32768,0,0,0,0,4,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4032,2184,1792,0,0,1024,0,0,0,0,1,0,16384,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,224,0,0,0,64,0,0,0,0,0,0,0,4096,0,0,0,0,0,64,0,0,0,0,0,0,0,512,1,0,0,0,4096,0,2048,0,0,0,0,7,0,0,0,0,256,0,0,0,0,0,0,0,0,2048,0,0,8192,0,0,0,32192,0,0,0,2048,8,6,0,16384,0,0,0,0,6,0,0,0,48,0,0,0,16352,24576,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,36864,8704,16384,0,32768,4127,17,14,0,0,0,0,0,0,0,0,0,16128,8736,3072,0,0,0,16384,0,0,0,0,2,0,28,4,32,0,0,0,0,0,0,2048,0,0,512,0,0,0,0,0,129,0,0,8255,34,12,0,0,0,0,0,49152,125,0,0,0,8,1536,0,0,64,0,0,0,512,0,0,0,4096,0,0,0,57344,62,96,0,16128,8736,3072,0,1024,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16096,0,0,0,1024,0,3,0,8192,0,0,0,0,1,0,0,0,3054,0,0,0,16448,12288,0,0,0,0,0,0,0,0,0,0,288,68,128,0,3584,0,2048,0,18432,4352,8192,0,16384,34818,0,1,0,16510,68,24,0,144,34,64,0,1152,272,512,0,9216,2176,4096,0,8192,17409,32768,0,0,8201,2,4,0,504,273,96,0,4032,2184,768,0,0,0,4096,0,0,0,32768,0,0,4,16,0,0,33020,136,48,0,0,8192,0,0,16128,8736,3072,0,63488,4353,24577,0,16384,34818,0,1,0,16402,4,8,0,144,34,64,0,1152,272,512,0,9216,2176,4096,0,8192,17409,32768,0,0,8201,2,4,0,72,17,32,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,2,0,0,56,0,0,0,16,0,0,0,128,0,0,0,0,16384,32,0,49152,34831,8,3,0,0,8,0,0,0,1152,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,8,0,0,0,64,0,0,0,512,0,0,0,7168,0,0,0,57344,0,0,0,0,7,0,0,0,56,0,0,0,496,0,0,0,3968,0,0,0,31744,0,0,0,57344,3,0,0,0,31,0,0,0,248,0,0,0,16,1024,0,0,16096,8192,0,0,1024,0,0,0,47104,15,0,0,896,128,1024,0,0,0,0,0,0,7984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,2048,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,1024,0,0,0,8192,0,0,0,0,1,0,0,0,14,0,0,0,112,0,0,0,896,0,0,0,7168,0,0,0,63872,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3968,0,0,0,31744,0,0,0,57344,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,64,0,0,0,2,0,0,33020,136,48,0,0,0,0,0,0,0,2,0,1024,0,0,0,0,0,0,0,0,0,144,0,0,0,64,0,0,32768,251,0,0,0,16,3072,0,0,128,0,0,0,1024,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,4127,17,6,0,56,8,64,0,16,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,16510,68,24,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0
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

action_17 (38) = happyShift action_60
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (48) = happyShift action_36
action_18 (55) = happyShift action_37
action_18 (10) = happyGoto action_59
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (64) = happyShift action_58
action_19 (27) = happyGoto action_57
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (46) = happyShift action_56
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (36) = happyShift action_55
action_21 _ = happyReduce_25

action_22 (35) = happyShift action_54
action_22 _ = happyReduce_26

action_23 (30) = happyShift action_43
action_23 (31) = happyShift action_44
action_23 (32) = happyShift action_45
action_23 (23) = happyGoto action_50
action_23 (24) = happyGoto action_51
action_23 (25) = happyGoto action_52
action_23 (26) = happyGoto action_53
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_14

action_25 (51) = happyShift action_49
action_25 (14) = happyGoto action_48
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_28

action_27 (30) = happyShift action_43
action_27 (31) = happyShift action_44
action_27 (32) = happyShift action_45
action_27 (46) = happyShift action_46
action_27 (65) = happyShift action_47
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
action_32 (7) = happyGoto action_93
action_32 (8) = happyGoto action_32
action_32 _ = happyReduce_7

action_33 (40) = happyShift action_92
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_6

action_35 (28) = happyShift action_91
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (64) = happyShift action_58
action_36 (11) = happyGoto action_89
action_36 (27) = happyGoto action_90
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_19

action_38 (47) = happyShift action_88
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (28) = happyShift action_87
action_39 _ = happyReduce_31

action_40 (40) = happyShift action_86
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (40) = happyShift action_85
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (40) = happyShift action_84
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_110

action_44 _ = happyReduce_111

action_45 _ = happyReduce_112

action_46 (29) = happyShift action_77
action_46 (30) = happyShift action_43
action_46 (31) = happyShift action_44
action_46 (32) = happyShift action_45
action_46 (33) = happyShift action_78
action_46 (34) = happyShift action_79
action_46 (42) = happyShift action_80
action_46 (46) = happyShift action_81
action_46 (50) = happyShift action_82
action_46 (63) = happyShift action_83
action_46 (64) = happyShift action_58
action_46 (65) = happyShift action_47
action_46 (16) = happyGoto action_69
action_46 (20) = happyGoto action_70
action_46 (21) = happyGoto action_71
action_46 (22) = happyGoto action_72
action_46 (24) = happyGoto action_73
action_46 (25) = happyGoto action_74
action_46 (26) = happyGoto action_75
action_46 (27) = happyGoto action_76
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (46) = happyShift action_68
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (49) = happyShift action_67
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (28) = happyShift action_66
action_49 _ = happyReduce_29

action_50 (28) = happyShift action_65
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_107

action_52 _ = happyReduce_108

action_53 _ = happyReduce_109

action_54 _ = happyReduce_23

action_55 _ = happyReduce_24

action_56 (30) = happyShift action_43
action_56 (31) = happyShift action_44
action_56 (32) = happyShift action_45
action_56 (23) = happyGoto action_64
action_56 (24) = happyGoto action_51
action_56 (25) = happyGoto action_52
action_56 (26) = happyGoto action_53
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (28) = happyShift action_63
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_113

action_59 (28) = happyShift action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (51) = happyShift action_61
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_1

action_62 (48) = happyShift action_36
action_62 (55) = happyShift action_37
action_62 (10) = happyGoto action_148
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (64) = happyShift action_58
action_63 (27) = happyGoto action_147
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (28) = happyShift action_146
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (30) = happyShift action_43
action_65 (31) = happyShift action_44
action_65 (32) = happyShift action_45
action_65 (23) = happyGoto action_145
action_65 (24) = happyGoto action_51
action_65 (25) = happyGoto action_52
action_65 (26) = happyGoto action_53
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (51) = happyShift action_49
action_66 (14) = happyGoto action_144
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_27

action_68 (64) = happyShift action_58
action_68 (27) = happyGoto action_143
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (47) = happyShift action_142
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (37) = happyShift action_134
action_70 (38) = happyShift action_135
action_70 (39) = happyShift action_136
action_70 (41) = happyShift action_137
action_70 (42) = happyShift action_138
action_70 (43) = happyShift action_139
action_70 (44) = happyShift action_140
action_70 (45) = happyShift action_141
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (39) = happyShift action_130
action_71 (47) = happyShift action_131
action_71 (61) = happyShift action_132
action_71 (62) = happyShift action_133
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (39) = happyShift action_129
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (39) = happyShift action_128
action_73 (40) = happyShift action_86
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (39) = happyShift action_127
action_74 (40) = happyShift action_85
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (37) = happyShift action_117
action_75 (38) = happyShift action_118
action_75 (39) = happyShift action_119
action_75 (40) = happyShift action_84
action_75 (41) = happyShift action_120
action_75 (42) = happyShift action_121
action_75 (43) = happyShift action_122
action_75 (44) = happyShift action_123
action_75 (45) = happyShift action_124
action_75 (61) = happyShift action_125
action_75 (62) = happyShift action_126
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (39) = happyShift action_116
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_73

action_78 _ = happyReduce_104

action_79 _ = happyReduce_105

action_80 (29) = happyShift action_77
action_80 (32) = happyShift action_45
action_80 (42) = happyShift action_80
action_80 (46) = happyShift action_115
action_80 (63) = happyShift action_83
action_80 (20) = happyGoto action_113
action_80 (26) = happyGoto action_114
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (29) = happyShift action_77
action_81 (30) = happyShift action_43
action_81 (31) = happyShift action_44
action_81 (32) = happyShift action_45
action_81 (33) = happyShift action_78
action_81 (34) = happyShift action_79
action_81 (42) = happyShift action_80
action_81 (46) = happyShift action_81
action_81 (50) = happyShift action_82
action_81 (63) = happyShift action_83
action_81 (64) = happyShift action_58
action_81 (65) = happyShift action_47
action_81 (16) = happyGoto action_69
action_81 (20) = happyGoto action_111
action_81 (21) = happyGoto action_112
action_81 (22) = happyGoto action_72
action_81 (24) = happyGoto action_73
action_81 (25) = happyGoto action_74
action_81 (26) = happyGoto action_75
action_81 (27) = happyGoto action_76
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_106

action_83 _ = happyReduce_74

action_84 (29) = happyShift action_77
action_84 (30) = happyShift action_43
action_84 (31) = happyShift action_44
action_84 (32) = happyShift action_45
action_84 (33) = happyShift action_78
action_84 (34) = happyShift action_79
action_84 (42) = happyShift action_80
action_84 (46) = happyShift action_100
action_84 (50) = happyShift action_82
action_84 (63) = happyShift action_83
action_84 (64) = happyShift action_58
action_84 (20) = happyGoto action_107
action_84 (21) = happyGoto action_108
action_84 (22) = happyGoto action_109
action_84 (24) = happyGoto action_97
action_84 (25) = happyGoto action_98
action_84 (26) = happyGoto action_99
action_84 (27) = happyGoto action_110
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (64) = happyShift action_58
action_85 (27) = happyGoto action_106
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (64) = happyShift action_58
action_86 (27) = happyGoto action_105
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (30) = happyShift action_43
action_87 (31) = happyShift action_44
action_87 (32) = happyShift action_45
action_87 (46) = happyShift action_46
action_87 (65) = happyShift action_47
action_87 (15) = happyGoto action_104
action_87 (16) = happyGoto action_39
action_87 (24) = happyGoto action_40
action_87 (25) = happyGoto action_41
action_87 (26) = happyGoto action_42
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_13

action_89 (49) = happyShift action_103
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (28) = happyShift action_102
action_90 _ = happyReduce_21

action_91 (48) = happyShift action_36
action_91 (55) = happyShift action_37
action_91 (10) = happyGoto action_101
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (29) = happyShift action_77
action_92 (30) = happyShift action_43
action_92 (31) = happyShift action_44
action_92 (32) = happyShift action_45
action_92 (33) = happyShift action_78
action_92 (34) = happyShift action_79
action_92 (42) = happyShift action_80
action_92 (46) = happyShift action_100
action_92 (50) = happyShift action_82
action_92 (63) = happyShift action_83
action_92 (64) = happyShift action_58
action_92 (20) = happyGoto action_94
action_92 (21) = happyGoto action_95
action_92 (22) = happyGoto action_96
action_92 (24) = happyGoto action_97
action_92 (25) = happyGoto action_98
action_92 (26) = happyGoto action_99
action_92 (27) = happyGoto action_76
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_8

action_94 (37) = happyShift action_134
action_94 (38) = happyShift action_135
action_94 (39) = happyShift action_136
action_94 (41) = happyShift action_137
action_94 (42) = happyShift action_138
action_94 (43) = happyShift action_139
action_94 (44) = happyShift action_140
action_94 (45) = happyShift action_141
action_94 _ = happyReduce_9

action_95 (39) = happyShift action_130
action_95 (61) = happyShift action_132
action_95 (62) = happyShift action_133
action_95 _ = happyReduce_11

action_96 (39) = happyShift action_129
action_96 _ = happyReduce_10

action_97 (39) = happyShift action_128
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (39) = happyShift action_127
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (37) = happyShift action_117
action_99 (38) = happyShift action_118
action_99 (39) = happyShift action_119
action_99 (41) = happyShift action_120
action_99 (42) = happyShift action_121
action_99 (43) = happyShift action_122
action_99 (44) = happyShift action_123
action_99 (45) = happyShift action_124
action_99 (61) = happyShift action_125
action_99 (62) = happyShift action_126
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (29) = happyShift action_77
action_100 (30) = happyShift action_43
action_100 (31) = happyShift action_44
action_100 (32) = happyShift action_45
action_100 (33) = happyShift action_78
action_100 (34) = happyShift action_79
action_100 (42) = happyShift action_80
action_100 (46) = happyShift action_100
action_100 (50) = happyShift action_82
action_100 (63) = happyShift action_83
action_100 (64) = happyShift action_58
action_100 (20) = happyGoto action_111
action_100 (21) = happyGoto action_112
action_100 (22) = happyGoto action_72
action_100 (24) = happyGoto action_97
action_100 (25) = happyGoto action_98
action_100 (26) = happyGoto action_99
action_100 (27) = happyGoto action_76
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (28) = happyShift action_208
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (64) = happyShift action_58
action_102 (11) = happyGoto action_207
action_102 (27) = happyGoto action_90
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_20

action_104 _ = happyReduce_32

action_105 _ = happyReduce_34

action_106 _ = happyReduce_35

action_107 (37) = happyShift action_134
action_107 (38) = happyShift action_135
action_107 (39) = happyShift action_136
action_107 (41) = happyShift action_137
action_107 (42) = happyShift action_138
action_107 (43) = happyShift action_139
action_107 (44) = happyShift action_140
action_107 (45) = happyShift action_141
action_107 _ = happyReduce_38

action_108 (39) = happyShift action_130
action_108 (61) = happyShift action_132
action_108 (62) = happyShift action_133
action_108 _ = happyReduce_39

action_109 (39) = happyShift action_129
action_109 _ = happyReduce_37

action_110 (39) = happyShift action_116
action_110 _ = happyReduce_36

action_111 (37) = happyShift action_134
action_111 (38) = happyShift action_135
action_111 (39) = happyShift action_136
action_111 (41) = happyShift action_137
action_111 (42) = happyShift action_138
action_111 (43) = happyShift action_139
action_111 (44) = happyShift action_140
action_111 (45) = happyShift action_141
action_111 (47) = happyShift action_206
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (39) = happyShift action_130
action_112 (47) = happyShift action_205
action_112 (61) = happyShift action_132
action_112 (62) = happyShift action_133
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_71

action_114 _ = happyReduce_72

action_115 (29) = happyShift action_77
action_115 (32) = happyShift action_45
action_115 (42) = happyShift action_80
action_115 (46) = happyShift action_115
action_115 (63) = happyShift action_83
action_115 (20) = happyGoto action_204
action_115 (26) = happyGoto action_198
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (30) = happyShift action_43
action_116 (31) = happyShift action_44
action_116 (32) = happyShift action_45
action_116 (64) = happyShift action_58
action_116 (24) = happyGoto action_200
action_116 (25) = happyGoto action_201
action_116 (26) = happyGoto action_202
action_116 (27) = happyGoto action_203
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (29) = happyShift action_77
action_117 (32) = happyShift action_45
action_117 (42) = happyShift action_80
action_117 (46) = happyShift action_115
action_117 (63) = happyShift action_83
action_117 (20) = happyGoto action_199
action_117 (26) = happyGoto action_198
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (29) = happyShift action_77
action_118 (32) = happyShift action_45
action_118 (42) = happyShift action_80
action_118 (46) = happyShift action_115
action_118 (63) = happyShift action_83
action_118 (20) = happyGoto action_197
action_118 (26) = happyGoto action_198
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (29) = happyShift action_77
action_119 (30) = happyShift action_43
action_119 (31) = happyShift action_44
action_119 (32) = happyShift action_45
action_119 (33) = happyShift action_78
action_119 (34) = happyShift action_79
action_119 (42) = happyShift action_80
action_119 (46) = happyShift action_100
action_119 (50) = happyShift action_82
action_119 (63) = happyShift action_83
action_119 (64) = happyShift action_58
action_119 (20) = happyGoto action_193
action_119 (21) = happyGoto action_194
action_119 (22) = happyGoto action_195
action_119 (24) = happyGoto action_97
action_119 (25) = happyGoto action_98
action_119 (26) = happyGoto action_99
action_119 (27) = happyGoto action_196
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (29) = happyShift action_77
action_120 (32) = happyShift action_45
action_120 (42) = happyShift action_80
action_120 (46) = happyShift action_115
action_120 (63) = happyShift action_83
action_120 (20) = happyGoto action_191
action_120 (26) = happyGoto action_192
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (29) = happyShift action_77
action_121 (32) = happyShift action_45
action_121 (42) = happyShift action_80
action_121 (46) = happyShift action_115
action_121 (63) = happyShift action_83
action_121 (20) = happyGoto action_189
action_121 (26) = happyGoto action_190
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (29) = happyShift action_77
action_122 (32) = happyShift action_45
action_122 (42) = happyShift action_80
action_122 (46) = happyShift action_115
action_122 (63) = happyShift action_83
action_122 (20) = happyGoto action_187
action_122 (26) = happyGoto action_188
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (29) = happyShift action_77
action_123 (32) = happyShift action_45
action_123 (42) = happyShift action_80
action_123 (46) = happyShift action_115
action_123 (63) = happyShift action_83
action_123 (20) = happyGoto action_185
action_123 (26) = happyGoto action_186
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (29) = happyShift action_77
action_124 (32) = happyShift action_45
action_124 (42) = happyShift action_80
action_124 (46) = happyShift action_115
action_124 (63) = happyShift action_83
action_124 (20) = happyGoto action_183
action_124 (26) = happyGoto action_184
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (29) = happyShift action_77
action_125 (30) = happyShift action_43
action_125 (31) = happyShift action_44
action_125 (32) = happyShift action_45
action_125 (33) = happyShift action_78
action_125 (34) = happyShift action_79
action_125 (42) = happyShift action_80
action_125 (46) = happyShift action_100
action_125 (50) = happyShift action_82
action_125 (63) = happyShift action_83
action_125 (64) = happyShift action_58
action_125 (20) = happyGoto action_70
action_125 (21) = happyGoto action_182
action_125 (22) = happyGoto action_72
action_125 (24) = happyGoto action_97
action_125 (25) = happyGoto action_98
action_125 (26) = happyGoto action_99
action_125 (27) = happyGoto action_76
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (29) = happyShift action_77
action_126 (30) = happyShift action_43
action_126 (31) = happyShift action_44
action_126 (32) = happyShift action_45
action_126 (33) = happyShift action_78
action_126 (34) = happyShift action_79
action_126 (42) = happyShift action_80
action_126 (46) = happyShift action_100
action_126 (50) = happyShift action_82
action_126 (63) = happyShift action_83
action_126 (64) = happyShift action_58
action_126 (20) = happyGoto action_70
action_126 (21) = happyGoto action_181
action_126 (22) = happyGoto action_72
action_126 (24) = happyGoto action_97
action_126 (25) = happyGoto action_98
action_126 (26) = happyGoto action_99
action_126 (27) = happyGoto action_76
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (64) = happyShift action_58
action_127 (27) = happyGoto action_180
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (64) = happyShift action_58
action_128 (27) = happyGoto action_179
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (32) = happyShift action_45
action_129 (50) = happyShift action_82
action_129 (22) = happyGoto action_177
action_129 (26) = happyGoto action_178
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (29) = happyShift action_77
action_130 (30) = happyShift action_43
action_130 (31) = happyShift action_44
action_130 (32) = happyShift action_45
action_130 (33) = happyShift action_78
action_130 (34) = happyShift action_79
action_130 (42) = happyShift action_80
action_130 (46) = happyShift action_100
action_130 (50) = happyShift action_82
action_130 (63) = happyShift action_83
action_130 (64) = happyShift action_58
action_130 (20) = happyGoto action_70
action_130 (21) = happyGoto action_175
action_130 (22) = happyGoto action_72
action_130 (24) = happyGoto action_97
action_130 (25) = happyGoto action_98
action_130 (26) = happyGoto action_176
action_130 (27) = happyGoto action_76
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (53) = happyShift action_174
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (29) = happyShift action_77
action_132 (30) = happyShift action_43
action_132 (31) = happyShift action_44
action_132 (32) = happyShift action_45
action_132 (33) = happyShift action_78
action_132 (34) = happyShift action_79
action_132 (42) = happyShift action_80
action_132 (46) = happyShift action_100
action_132 (50) = happyShift action_82
action_132 (63) = happyShift action_83
action_132 (64) = happyShift action_58
action_132 (20) = happyGoto action_70
action_132 (21) = happyGoto action_172
action_132 (22) = happyGoto action_72
action_132 (24) = happyGoto action_97
action_132 (25) = happyGoto action_98
action_132 (26) = happyGoto action_173
action_132 (27) = happyGoto action_76
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (29) = happyShift action_77
action_133 (30) = happyShift action_43
action_133 (31) = happyShift action_44
action_133 (32) = happyShift action_45
action_133 (33) = happyShift action_78
action_133 (34) = happyShift action_79
action_133 (42) = happyShift action_80
action_133 (46) = happyShift action_100
action_133 (50) = happyShift action_82
action_133 (63) = happyShift action_83
action_133 (64) = happyShift action_58
action_133 (20) = happyGoto action_70
action_133 (21) = happyGoto action_170
action_133 (22) = happyGoto action_72
action_133 (24) = happyGoto action_97
action_133 (25) = happyGoto action_98
action_133 (26) = happyGoto action_171
action_133 (27) = happyGoto action_76
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (29) = happyShift action_77
action_134 (32) = happyShift action_45
action_134 (42) = happyShift action_80
action_134 (46) = happyShift action_115
action_134 (63) = happyShift action_83
action_134 (20) = happyGoto action_168
action_134 (26) = happyGoto action_169
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (29) = happyShift action_77
action_135 (32) = happyShift action_45
action_135 (42) = happyShift action_80
action_135 (46) = happyShift action_115
action_135 (63) = happyShift action_83
action_135 (20) = happyGoto action_166
action_135 (26) = happyGoto action_167
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (29) = happyShift action_77
action_136 (32) = happyShift action_45
action_136 (42) = happyShift action_80
action_136 (46) = happyShift action_115
action_136 (63) = happyShift action_83
action_136 (20) = happyGoto action_164
action_136 (26) = happyGoto action_165
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (29) = happyShift action_77
action_137 (32) = happyShift action_45
action_137 (42) = happyShift action_80
action_137 (46) = happyShift action_115
action_137 (63) = happyShift action_83
action_137 (20) = happyGoto action_162
action_137 (26) = happyGoto action_163
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (29) = happyShift action_77
action_138 (32) = happyShift action_45
action_138 (42) = happyShift action_80
action_138 (46) = happyShift action_115
action_138 (63) = happyShift action_83
action_138 (20) = happyGoto action_160
action_138 (26) = happyGoto action_161
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (29) = happyShift action_77
action_139 (32) = happyShift action_45
action_139 (42) = happyShift action_80
action_139 (46) = happyShift action_115
action_139 (63) = happyShift action_83
action_139 (20) = happyGoto action_158
action_139 (26) = happyGoto action_159
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (29) = happyShift action_77
action_140 (32) = happyShift action_45
action_140 (42) = happyShift action_80
action_140 (46) = happyShift action_115
action_140 (63) = happyShift action_83
action_140 (20) = happyGoto action_156
action_140 (26) = happyGoto action_157
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (29) = happyShift action_77
action_141 (32) = happyShift action_45
action_141 (42) = happyShift action_80
action_141 (46) = happyShift action_115
action_141 (63) = happyShift action_83
action_141 (20) = happyGoto action_154
action_141 (26) = happyGoto action_155
action_141 _ = happyFail (happyExpListPerState 141)

action_142 _ = happyReduce_41

action_143 (28) = happyShift action_153
action_143 _ = happyFail (happyExpListPerState 143)

action_144 _ = happyReduce_30

action_145 (47) = happyShift action_152
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (30) = happyShift action_43
action_146 (31) = happyShift action_44
action_146 (32) = happyShift action_45
action_146 (23) = happyGoto action_151
action_146 (24) = happyGoto action_51
action_146 (25) = happyGoto action_52
action_146 (26) = happyGoto action_53
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (28) = happyShift action_150
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (28) = happyShift action_149
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (48) = happyShift action_210
action_149 (55) = happyShift action_211
action_149 (18) = happyGoto action_221
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (29) = happyShift action_77
action_150 (30) = happyShift action_43
action_150 (31) = happyShift action_44
action_150 (32) = happyShift action_45
action_150 (33) = happyShift action_78
action_150 (34) = happyShift action_79
action_150 (42) = happyShift action_80
action_150 (46) = happyShift action_100
action_150 (50) = happyShift action_82
action_150 (63) = happyShift action_83
action_150 (64) = happyShift action_58
action_150 (17) = happyGoto action_216
action_150 (20) = happyGoto action_217
action_150 (21) = happyGoto action_218
action_150 (22) = happyGoto action_219
action_150 (24) = happyGoto action_97
action_150 (25) = happyGoto action_98
action_150 (26) = happyGoto action_99
action_150 (27) = happyGoto action_220
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (47) = happyShift action_215
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (48) = happyShift action_25
action_152 (51) = happyShift action_26
action_152 (13) = happyGoto action_214
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (64) = happyShift action_58
action_153 (27) = happyGoto action_213
action_153 _ = happyFail (happyExpListPerState 153)

action_154 _ = happyReduce_66

action_155 _ = happyReduce_68

action_156 (45) = happyShift action_141
action_156 _ = happyReduce_62

action_157 (45) = happyShift action_124
action_157 _ = happyReduce_64

action_158 (45) = happyShift action_141
action_158 _ = happyReduce_58

action_159 (45) = happyShift action_124
action_159 _ = happyReduce_60

action_160 (43) = happyShift action_139
action_160 (44) = happyShift action_140
action_160 (45) = happyShift action_141
action_160 _ = happyReduce_54

action_161 (43) = happyShift action_122
action_161 (44) = happyShift action_123
action_161 (45) = happyShift action_124
action_161 _ = happyReduce_56

action_162 (43) = happyShift action_139
action_162 (44) = happyShift action_140
action_162 (45) = happyShift action_141
action_162 _ = happyReduce_50

action_163 (43) = happyShift action_122
action_163 (44) = happyShift action_123
action_163 (45) = happyShift action_124
action_163 _ = happyReduce_52

action_164 (41) = happyShift action_137
action_164 (42) = happyShift action_138
action_164 (43) = happyShift action_139
action_164 (44) = happyShift action_140
action_164 (45) = happyShift action_141
action_164 _ = happyReduce_87

action_165 (41) = happyShift action_120
action_165 (42) = happyShift action_121
action_165 (43) = happyShift action_122
action_165 (44) = happyShift action_123
action_165 (45) = happyShift action_124
action_165 _ = happyReduce_92

action_166 (41) = happyShift action_137
action_166 (42) = happyShift action_138
action_166 (43) = happyShift action_139
action_166 (44) = happyShift action_140
action_166 (45) = happyShift action_141
action_166 _ = happyReduce_81

action_167 (41) = happyShift action_120
action_167 (42) = happyShift action_121
action_167 (43) = happyShift action_122
action_167 (44) = happyShift action_123
action_167 (45) = happyShift action_124
action_167 _ = happyReduce_82

action_168 (41) = happyShift action_137
action_168 (42) = happyShift action_138
action_168 (43) = happyShift action_139
action_168 (44) = happyShift action_140
action_168 (45) = happyShift action_141
action_168 _ = happyReduce_84

action_169 (41) = happyShift action_120
action_169 (42) = happyShift action_121
action_169 (43) = happyShift action_122
action_169 (44) = happyShift action_123
action_169 (45) = happyShift action_124
action_169 _ = happyReduce_85

action_170 (39) = happyShift action_130
action_170 (61) = happyShift action_132
action_170 _ = happyReduce_78

action_171 (37) = happyShift action_117
action_171 (38) = happyShift action_118
action_171 (39) = happyShift action_119
action_171 (41) = happyShift action_120
action_171 (42) = happyShift action_121
action_171 (43) = happyShift action_122
action_171 (44) = happyShift action_123
action_171 (45) = happyShift action_124
action_171 (61) = happyShift action_125
action_171 _ = happyReduce_79

action_172 (39) = happyShift action_130
action_172 _ = happyReduce_75

action_173 (37) = happyShift action_117
action_173 (38) = happyShift action_118
action_173 (39) = happyShift action_119
action_173 (41) = happyShift action_120
action_173 (42) = happyShift action_121
action_173 (43) = happyShift action_122
action_173 (44) = happyShift action_123
action_173 (45) = happyShift action_124
action_173 _ = happyReduce_76

action_174 (30) = happyShift action_43
action_174 (31) = happyShift action_44
action_174 (32) = happyShift action_45
action_174 (46) = happyShift action_46
action_174 (65) = happyShift action_47
action_174 (15) = happyGoto action_212
action_174 (16) = happyGoto action_39
action_174 (24) = happyGoto action_40
action_174 (25) = happyGoto action_41
action_174 (26) = happyGoto action_42
action_174 _ = happyFail (happyExpListPerState 174)

action_175 _ = happyReduce_88

action_176 (37) = happyShift action_117
action_176 (38) = happyShift action_118
action_176 (41) = happyShift action_120
action_176 (42) = happyShift action_121
action_176 (43) = happyShift action_122
action_176 (44) = happyShift action_123
action_176 (45) = happyShift action_124
action_176 _ = happyReduce_96

action_177 _ = happyReduce_89

action_178 _ = happyReduce_94

action_179 _ = happyReduce_97

action_180 _ = happyReduce_99

action_181 (39) = happyShift action_130
action_181 (61) = happyShift action_132
action_181 _ = happyReduce_80

action_182 (39) = happyShift action_130
action_182 _ = happyReduce_77

action_183 _ = happyReduce_67

action_184 _ = happyReduce_69

action_185 (45) = happyShift action_141
action_185 _ = happyReduce_63

action_186 (45) = happyShift action_124
action_186 _ = happyReduce_65

action_187 (45) = happyShift action_141
action_187 _ = happyReduce_59

action_188 (45) = happyShift action_124
action_188 _ = happyReduce_61

action_189 (43) = happyShift action_139
action_189 (44) = happyShift action_140
action_189 (45) = happyShift action_141
action_189 _ = happyReduce_55

action_190 (43) = happyShift action_122
action_190 (44) = happyShift action_123
action_190 (45) = happyShift action_124
action_190 _ = happyReduce_57

action_191 (43) = happyShift action_139
action_191 (44) = happyShift action_140
action_191 (45) = happyShift action_141
action_191 _ = happyReduce_51

action_192 (43) = happyShift action_122
action_192 (44) = happyShift action_123
action_192 (45) = happyShift action_124
action_192 _ = happyReduce_53

action_193 (37) = happyShift action_134
action_193 (38) = happyShift action_135
action_193 (41) = happyShift action_137
action_193 (42) = happyShift action_138
action_193 (43) = happyShift action_139
action_193 (44) = happyShift action_140
action_193 (45) = happyShift action_141
action_193 _ = happyReduce_91

action_194 _ = happyReduce_95

action_195 _ = happyReduce_93

action_196 _ = happyReduce_101

action_197 (41) = happyShift action_137
action_197 (42) = happyShift action_138
action_197 (43) = happyShift action_139
action_197 (44) = happyShift action_140
action_197 (45) = happyShift action_141
action_197 _ = happyReduce_83

action_198 (41) = happyShift action_120
action_198 (42) = happyShift action_121
action_198 (43) = happyShift action_122
action_198 (44) = happyShift action_123
action_198 (45) = happyShift action_124
action_198 _ = happyFail (happyExpListPerState 198)

action_199 (41) = happyShift action_137
action_199 (42) = happyShift action_138
action_199 (43) = happyShift action_139
action_199 (44) = happyShift action_140
action_199 (45) = happyShift action_141
action_199 _ = happyReduce_86

action_200 _ = happyReduce_98

action_201 _ = happyReduce_100

action_202 _ = happyReduce_102

action_203 _ = happyReduce_90

action_204 (41) = happyShift action_137
action_204 (42) = happyShift action_138
action_204 (43) = happyShift action_139
action_204 (44) = happyShift action_140
action_204 (45) = happyShift action_141
action_204 (47) = happyShift action_206
action_204 _ = happyFail (happyExpListPerState 204)

action_205 _ = happyReduce_103

action_206 _ = happyReduce_70

action_207 _ = happyReduce_22

action_208 (48) = happyShift action_210
action_208 (55) = happyShift action_211
action_208 (18) = happyGoto action_209
action_208 _ = happyFail (happyExpListPerState 208)

action_209 (47) = happyShift action_229
action_209 _ = happyFail (happyExpListPerState 209)

action_210 (29) = happyShift action_77
action_210 (30) = happyShift action_43
action_210 (31) = happyShift action_44
action_210 (32) = happyShift action_45
action_210 (33) = happyShift action_78
action_210 (34) = happyShift action_79
action_210 (42) = happyShift action_80
action_210 (46) = happyShift action_100
action_210 (50) = happyShift action_82
action_210 (63) = happyShift action_83
action_210 (64) = happyShift action_58
action_210 (17) = happyGoto action_227
action_210 (19) = happyGoto action_228
action_210 (20) = happyGoto action_217
action_210 (21) = happyGoto action_218
action_210 (22) = happyGoto action_219
action_210 (24) = happyGoto action_97
action_210 (25) = happyGoto action_98
action_210 (26) = happyGoto action_99
action_210 (27) = happyGoto action_220
action_210 _ = happyFail (happyExpListPerState 210)

action_211 _ = happyReduce_46

action_212 (54) = happyShift action_226
action_212 _ = happyFail (happyExpListPerState 212)

action_213 (28) = happyShift action_225
action_213 _ = happyFail (happyExpListPerState 213)

action_214 _ = happyReduce_15

action_215 (48) = happyShift action_25
action_215 (51) = happyShift action_26
action_215 (13) = happyGoto action_224
action_215 _ = happyFail (happyExpListPerState 215)

action_216 (47) = happyShift action_223
action_216 _ = happyFail (happyExpListPerState 216)

action_217 (37) = happyShift action_134
action_217 (38) = happyShift action_135
action_217 (39) = happyShift action_136
action_217 (41) = happyShift action_137
action_217 (42) = happyShift action_138
action_217 (43) = happyShift action_139
action_217 (44) = happyShift action_140
action_217 (45) = happyShift action_141
action_217 _ = happyReduce_42

action_218 (39) = happyShift action_130
action_218 (61) = happyShift action_132
action_218 (62) = happyShift action_133
action_218 _ = happyReduce_43

action_219 (39) = happyShift action_129
action_219 _ = happyReduce_44

action_220 (39) = happyShift action_116
action_220 _ = happyReduce_45

action_221 (47) = happyShift action_222
action_221 _ = happyFail (happyExpListPerState 221)

action_222 _ = happyReduce_18

action_223 _ = happyReduce_17

action_224 _ = happyReduce_16

action_225 (29) = happyShift action_77
action_225 (30) = happyShift action_43
action_225 (31) = happyShift action_44
action_225 (32) = happyShift action_45
action_225 (33) = happyShift action_78
action_225 (34) = happyShift action_79
action_225 (42) = happyShift action_80
action_225 (46) = happyShift action_100
action_225 (50) = happyShift action_82
action_225 (63) = happyShift action_83
action_225 (64) = happyShift action_58
action_225 (17) = happyGoto action_233
action_225 (20) = happyGoto action_217
action_225 (21) = happyGoto action_218
action_225 (22) = happyGoto action_219
action_225 (24) = happyGoto action_97
action_225 (25) = happyGoto action_98
action_225 (26) = happyGoto action_99
action_225 (27) = happyGoto action_220
action_225 _ = happyFail (happyExpListPerState 225)

action_226 (30) = happyShift action_43
action_226 (31) = happyShift action_44
action_226 (32) = happyShift action_45
action_226 (46) = happyShift action_46
action_226 (65) = happyShift action_47
action_226 (15) = happyGoto action_232
action_226 (16) = happyGoto action_39
action_226 (24) = happyGoto action_40
action_226 (25) = happyGoto action_41
action_226 (26) = happyGoto action_42
action_226 _ = happyFail (happyExpListPerState 226)

action_227 (28) = happyShift action_231
action_227 _ = happyReduce_48

action_228 (49) = happyShift action_230
action_228 _ = happyFail (happyExpListPerState 228)

action_229 _ = happyReduce_12

action_230 _ = happyReduce_47

action_231 (29) = happyShift action_77
action_231 (30) = happyShift action_43
action_231 (31) = happyShift action_44
action_231 (32) = happyShift action_45
action_231 (33) = happyShift action_78
action_231 (34) = happyShift action_79
action_231 (42) = happyShift action_80
action_231 (46) = happyShift action_100
action_231 (50) = happyShift action_82
action_231 (63) = happyShift action_83
action_231 (64) = happyShift action_58
action_231 (17) = happyGoto action_227
action_231 (19) = happyGoto action_235
action_231 (20) = happyGoto action_217
action_231 (21) = happyGoto action_218
action_231 (22) = happyGoto action_219
action_231 (24) = happyGoto action_97
action_231 (25) = happyGoto action_98
action_231 (26) = happyGoto action_99
action_231 (27) = happyGoto action_220
action_231 _ = happyFail (happyExpListPerState 231)

action_232 _ = happyReduce_33

action_233 (47) = happyShift action_234
action_233 _ = happyFail (happyExpListPerState 233)

action_234 _ = happyReduce_40

action_235 _ = happyReduce_49

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

happyReduce_40 = happyReduce 8 16 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Add happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_3  16 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn17
		 (IntLit happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  17 happyReduction_43
happyReduction_43 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (BoolLit happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  17 happyReduction_44
happyReduction_44 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn17
		 (StrLit happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  17 happyReduction_45
happyReduction_45 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn17
		 (UrlLit happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn18
		 (AnyLit
	)

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (LiteralLst happy_var_2
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  19 happyReduction_48
happyReduction_48 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (SingleLit happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  19 happyReduction_49
happyReduction_49 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  20 happyReduction_52
happyReduction_52 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  20 happyReduction_53
happyReduction_53 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  20 happyReduction_54
happyReduction_54 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  20 happyReduction_55
happyReduction_55 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  20 happyReduction_56
happyReduction_56 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  20 happyReduction_57
happyReduction_57 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  20 happyReduction_58
happyReduction_58 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  20 happyReduction_59
happyReduction_59 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  20 happyReduction_60
happyReduction_60 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  20 happyReduction_61
happyReduction_61 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  20 happyReduction_62
happyReduction_62 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  20 happyReduction_63
happyReduction_63 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  20 happyReduction_64
happyReduction_64 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  20 happyReduction_65
happyReduction_65 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  20 happyReduction_66
happyReduction_66 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  20 happyReduction_67
happyReduction_67 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  20 happyReduction_68
happyReduction_68 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  20 happyReduction_69
happyReduction_69 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  20 happyReduction_70
happyReduction_70 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_2  20 happyReduction_71
happyReduction_71 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateI happy_var_2
	)
happyReduction_71 _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_2  20 happyReduction_72
happyReduction_72 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateO happy_var_2
	)
happyReduction_72 _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  20 happyReduction_73
happyReduction_73 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn20
		 (QInt happy_var_1
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  20 happyReduction_74
happyReduction_74 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (IntVariable happy_var_1
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  21 happyReduction_75
happyReduction_75 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (And happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  21 happyReduction_76
happyReduction_76 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  21 happyReduction_77
happyReduction_77 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  21 happyReduction_78
happyReduction_78 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (Or happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  21 happyReduction_79
happyReduction_79 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  21 happyReduction_80
happyReduction_80 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  21 happyReduction_81
happyReduction_81 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  21 happyReduction_82
happyReduction_82 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  21 happyReduction_83
happyReduction_83 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  21 happyReduction_84
happyReduction_84 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  21 happyReduction_85
happyReduction_85 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  21 happyReduction_86
happyReduction_86 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  21 happyReduction_87
happyReduction_87 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  21 happyReduction_88
happyReduction_88 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  21 happyReduction_89
happyReduction_89 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  21 happyReduction_90
happyReduction_90 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  21 happyReduction_91
happyReduction_91 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  21 happyReduction_92
happyReduction_92 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  21 happyReduction_93
happyReduction_93 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  21 happyReduction_94
happyReduction_94 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  21 happyReduction_95
happyReduction_95 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  21 happyReduction_96
happyReduction_96 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  21 happyReduction_97
happyReduction_97 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSU happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  21 happyReduction_98
happyReduction_98 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUS happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  21 happyReduction_99
happyReduction_99 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn21
		 (EQPU happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  21 happyReduction_100
happyReduction_100 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUP happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  21 happyReduction_101
happyReduction_101 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOU happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  21 happyReduction_102
happyReduction_102 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUO happy_var_1 happy_var_3
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_3  21 happyReduction_103
happyReduction_103 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_103 _ _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_1  21 happyReduction_104
happyReduction_104 _
	 =  HappyAbsSyn21
		 (QTrue
	)

happyReduce_105 = happySpecReduce_1  21 happyReduction_105
happyReduction_105 _
	 =  HappyAbsSyn21
		 (QFalse
	)

happyReduce_106 = happySpecReduce_1  22 happyReduction_106
happyReduction_106 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn22
		 (QString happy_var_1
	)
happyReduction_106 _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_1  23 happyReduction_107
happyReduction_107 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (S happy_var_1
	)
happyReduction_107 _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_1  23 happyReduction_108
happyReduction_108 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn23
		 (P happy_var_1
	)
happyReduction_108 _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_1  23 happyReduction_109
happyReduction_109 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn23
		 (O happy_var_1
	)
happyReduction_109 _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_1  24 happyReduction_110
happyReduction_110 _
	 =  HappyAbsSyn24
		 (Subj
	)

happyReduce_111 = happySpecReduce_1  25 happyReduction_111
happyReduction_111 _
	 =  HappyAbsSyn25
		 (Pred
	)

happyReduce_112 = happySpecReduce_1  26 happyReduction_112
happyReduction_112 _
	 =  HappyAbsSyn26
		 (Obj
	)

happyReduce_113 = happySpecReduce_1  27 happyReduction_113
happyReduction_113 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn27
		 (NewUrl happy_var_1
	)
happyReduction_113 _  = notHappyAtAll 

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
