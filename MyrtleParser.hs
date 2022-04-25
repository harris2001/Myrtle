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
happyExpList = Happy_Data_Array.listArray (0,538) ([0,0,0,4,0,0,0,16,0,0,0,128,0,0,0,0,0,0,0,2048,0,0,0,0,1054,0,0,0,4216,0,0,8,0,0,0,0,2048,0,0,0,32,0,0,0,2,0,0,0,8,0,0,0,1152,0,0,12288,128,0,0,0,512,0,0,0,8,0,0,0,32,0,0,0,0,258,0,0,0,2,0,0,512,0,0,0,1024,0,0,0,896,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,32768,32771,0,0,0,0,1032,0,0,0,57344,65,0,0,0,64,0,0,0,0,0,0,0,1024,0,0,32,0,0,0,0,0,0,8192,0,0,0,0,0,0,8,0,0,0,0,0,0,64,0,0,32,0,0,0,0,8,0,0,0,32,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1008,546,192,0,0,1024,0,0,128,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,896,0,0,0,128,0,0,0,0,0,1,0,0,0,0,0,0,0,258,0,32768,0,0,0,0,56,0,0,0,0,1024,0,0,0,0,0,0,0,1024,0,0,0,2012,0,0,0,16448,12288,0,0,256,0,0,0,3072,0,0,0,12288,0,0,0,61440,31,48,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,34818,0,1,0,8255,34,12,0,0,0,0,0,0,0,0,0,0,0,0,0,16128,8736,3072,0,0,0,8192,0,0,0,32768,0,32768,32771,0,0,0,0,0,0,0,0,64,0,0,8,0,0,0,0,512,1,0,16128,8736,3072,0,0,0,0,0,0,8048,0,0,0,256,49152,0,0,1024,0,0,0,4096,0,0,0,16384,0,0,0,49152,125,192,0,16128,8736,3072,0,512,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,125,0,0,0,4,768,0,0,16,0,0,0,64,0,0,0,32192,1,0,0,1024,4,3,0,0,0,0,0,0,0,0,0,576,136,256,0,3584,0,2048,0,9216,2176,4096,0,36864,8704,16384,0,49152,34831,8,3,0,8201,2,4,0,32804,8,16,0,144,34,64,0,576,136,256,0,2304,544,1024,0,64512,34944,12288,0,61440,8707,49154,0,0,0,0,2,0,0,0,8,0,32,128,0,0,1008,546,192,0,0,16384,0,0,16128,8736,3072,0,64512,34944,12288,0,36864,8704,16384,0,16384,34818,0,1,0,8201,2,4,0,32804,8,16,0,144,34,64,0,576,136,256,0,2304,544,1024,0,9216,2176,4096,0,0,0,0,0,0,0,0,0,0,0,4,0,0,56,0,0,0,8,0,0,0,0,512,0,0,0,1024,0,0,0,8192,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,4,0,0,0,16,0,0,0,64,0,0,0,448,0,0,0,1792,0,0,0,7168,0,0,0,28672,0,0,0,61440,1,0,0,49152,7,0,0,0,31,0,0,0,124,0,0,0,496,0,0,0,1984,0,0,0,64,4096,0,0,32192,16384,0,0,1024,0,0,0,56320,7,0,0,224,32,0,0,0,0,0,0,0,499,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,4,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,4096,0,0,0,16384,0,0,0,0,1,0,0,0,7,0,0,0,28,0,0,0,112,0,0,0,448,0,0,0,1996,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,7,0,0,0,31,0,0,0,124,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,4096,0,0,61440,8707,49218,0,0,0,128,0,0,0,0,0,0,0,288,0,0,0,64,0,0,0,0,0,0,0,0,0,0,14336,2048,0,0,2048,0,0,0,0,0,4,0,0,63232,1,0,0,4096,0,12,0,16384,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,34831,264,3,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","Query","FilteredQuery","BasicQuery","CreateVars","CreateVar","Func","FilterEl","UrlList","JoinOption","SList","SListElem","Cond","Action","Literal","LiteralList","LiteralElems","IntExp","BoolExp","StringExp","Node","Subject","Predicate","Object","Url","','","int","subj","pred","obj","true","false","'-l'","'-r'","'<'","'>'","deq","'='","'+'","'-'","'*'","'/'","'^'","'('","')'","'['","']'","string","filename","'|'","'?'","':'","'_'","filter","map","union","join","where","and","or","var","url","get","%eof"]
        bit_start = st Prelude.* 66
        bit_end = (st Prelude.+ 1) Prelude.* 66
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..65]
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

action_3 (66) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (52) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (56) = happyShift action_10
action_5 (57) = happyShift action_11
action_5 (58) = happyShift action_12
action_5 (59) = happyShift action_13
action_5 (65) = happyShift action_14
action_5 (5) = happyGoto action_15
action_5 (6) = happyGoto action_8
action_5 (9) = happyGoto action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (56) = happyShift action_10
action_6 (57) = happyShift action_11
action_6 (58) = happyShift action_12
action_6 (59) = happyShift action_13
action_6 (65) = happyShift action_14
action_6 (5) = happyGoto action_7
action_6 (6) = happyGoto action_8
action_6 (9) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (38) = happyShift action_16
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (60) = happyShift action_28
action_8 _ = happyReduce_3

action_9 (52) = happyShift action_27
action_9 _ = happyReduce_5

action_10 (46) = happyShift action_26
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (46) = happyShift action_25
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (48) = happyShift action_23
action_12 (51) = happyShift action_24
action_12 (13) = happyGoto action_22
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (35) = happyShift action_19
action_13 (36) = happyShift action_20
action_13 (46) = happyShift action_21
action_13 (12) = happyGoto action_18
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (46) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (38) = happyShift action_16
action_15 _ = happyReduce_2

action_16 (38) = happyShift action_55
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (48) = happyShift action_34
action_17 (55) = happyShift action_35
action_17 (10) = happyGoto action_54
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (46) = happyShift action_53
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (36) = happyShift action_52
action_19 _ = happyReduce_24

action_20 (35) = happyShift action_51
action_20 _ = happyReduce_25

action_21 (30) = happyShift action_41
action_21 (31) = happyShift action_42
action_21 (32) = happyShift action_43
action_21 (23) = happyGoto action_47
action_21 (24) = happyGoto action_48
action_21 (25) = happyGoto action_49
action_21 (26) = happyGoto action_50
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_14

action_23 (51) = happyShift action_46
action_23 (14) = happyGoto action_45
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_27

action_25 (30) = happyShift action_41
action_25 (31) = happyShift action_42
action_25 (32) = happyShift action_43
action_25 (46) = happyShift action_44
action_25 (15) = happyGoto action_36
action_25 (16) = happyGoto action_37
action_25 (24) = happyGoto action_38
action_25 (25) = happyGoto action_39
action_25 (26) = happyGoto action_40
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (48) = happyShift action_34
action_26 (55) = happyShift action_35
action_26 (10) = happyGoto action_33
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (56) = happyShift action_10
action_27 (57) = happyShift action_11
action_27 (58) = happyShift action_12
action_27 (59) = happyShift action_13
action_27 (65) = happyShift action_14
action_27 (6) = happyGoto action_32
action_27 (9) = happyGoto action_9
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (63) = happyShift action_31
action_28 (7) = happyGoto action_29
action_28 (8) = happyGoto action_30
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_4

action_30 (63) = happyShift action_31
action_30 (7) = happyGoto action_87
action_30 (8) = happyGoto action_30
action_30 _ = happyReduce_7

action_31 (40) = happyShift action_86
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_6

action_33 (28) = happyShift action_85
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (64) = happyShift action_77
action_34 (11) = happyGoto action_83
action_34 (27) = happyGoto action_84
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_18

action_36 (47) = happyShift action_82
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (28) = happyShift action_81
action_37 _ = happyReduce_30

action_38 (40) = happyShift action_80
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (40) = happyShift action_79
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (40) = happyShift action_78
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_108

action_42 _ = happyReduce_109

action_43 _ = happyReduce_110

action_44 (29) = happyShift action_70
action_44 (30) = happyShift action_41
action_44 (31) = happyShift action_42
action_44 (32) = happyShift action_43
action_44 (33) = happyShift action_71
action_44 (34) = happyShift action_72
action_44 (42) = happyShift action_73
action_44 (46) = happyShift action_74
action_44 (50) = happyShift action_75
action_44 (63) = happyShift action_76
action_44 (64) = happyShift action_77
action_44 (16) = happyGoto action_62
action_44 (20) = happyGoto action_63
action_44 (21) = happyGoto action_64
action_44 (22) = happyGoto action_65
action_44 (24) = happyGoto action_66
action_44 (25) = happyGoto action_67
action_44 (26) = happyGoto action_68
action_44 (27) = happyGoto action_69
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (49) = happyShift action_61
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (28) = happyShift action_60
action_46 _ = happyReduce_28

action_47 (28) = happyShift action_59
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_105

action_49 _ = happyReduce_106

action_50 _ = happyReduce_107

action_51 _ = happyReduce_22

action_52 _ = happyReduce_23

action_53 (30) = happyShift action_41
action_53 (31) = happyShift action_42
action_53 (32) = happyShift action_43
action_53 (23) = happyGoto action_58
action_53 (24) = happyGoto action_48
action_53 (25) = happyGoto action_49
action_53 (26) = happyGoto action_50
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (28) = happyShift action_57
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (51) = happyShift action_56
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_1

action_57 (48) = happyShift action_34
action_57 (55) = happyShift action_35
action_57 (10) = happyGoto action_140
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (28) = happyShift action_139
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (30) = happyShift action_41
action_59 (31) = happyShift action_42
action_59 (32) = happyShift action_43
action_59 (23) = happyGoto action_138
action_59 (24) = happyGoto action_48
action_59 (25) = happyGoto action_49
action_59 (26) = happyGoto action_50
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (51) = happyShift action_46
action_60 (14) = happyGoto action_137
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_26

action_62 (47) = happyShift action_136
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (37) = happyShift action_128
action_63 (38) = happyShift action_129
action_63 (39) = happyShift action_130
action_63 (41) = happyShift action_131
action_63 (42) = happyShift action_132
action_63 (43) = happyShift action_133
action_63 (44) = happyShift action_134
action_63 (45) = happyShift action_135
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (39) = happyShift action_124
action_64 (47) = happyShift action_125
action_64 (61) = happyShift action_126
action_64 (62) = happyShift action_127
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (39) = happyShift action_123
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (39) = happyShift action_122
action_66 (40) = happyShift action_80
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (39) = happyShift action_121
action_67 (40) = happyShift action_79
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (37) = happyShift action_111
action_68 (38) = happyShift action_112
action_68 (39) = happyShift action_113
action_68 (40) = happyShift action_78
action_68 (41) = happyShift action_114
action_68 (42) = happyShift action_115
action_68 (43) = happyShift action_116
action_68 (44) = happyShift action_117
action_68 (45) = happyShift action_118
action_68 (61) = happyShift action_119
action_68 (62) = happyShift action_120
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (39) = happyShift action_110
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_71

action_71 _ = happyReduce_102

action_72 _ = happyReduce_103

action_73 (29) = happyShift action_70
action_73 (32) = happyShift action_43
action_73 (42) = happyShift action_73
action_73 (46) = happyShift action_109
action_73 (63) = happyShift action_76
action_73 (20) = happyGoto action_107
action_73 (26) = happyGoto action_108
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (29) = happyShift action_70
action_74 (30) = happyShift action_41
action_74 (31) = happyShift action_42
action_74 (32) = happyShift action_43
action_74 (33) = happyShift action_71
action_74 (34) = happyShift action_72
action_74 (42) = happyShift action_73
action_74 (46) = happyShift action_74
action_74 (50) = happyShift action_75
action_74 (63) = happyShift action_76
action_74 (64) = happyShift action_77
action_74 (16) = happyGoto action_62
action_74 (20) = happyGoto action_105
action_74 (21) = happyGoto action_106
action_74 (22) = happyGoto action_65
action_74 (24) = happyGoto action_66
action_74 (25) = happyGoto action_67
action_74 (26) = happyGoto action_68
action_74 (27) = happyGoto action_69
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_104

action_76 _ = happyReduce_72

action_77 _ = happyReduce_111

action_78 (29) = happyShift action_70
action_78 (30) = happyShift action_41
action_78 (31) = happyShift action_42
action_78 (32) = happyShift action_43
action_78 (33) = happyShift action_71
action_78 (34) = happyShift action_72
action_78 (42) = happyShift action_73
action_78 (46) = happyShift action_94
action_78 (50) = happyShift action_75
action_78 (63) = happyShift action_76
action_78 (64) = happyShift action_77
action_78 (20) = happyGoto action_101
action_78 (21) = happyGoto action_102
action_78 (22) = happyGoto action_103
action_78 (24) = happyGoto action_91
action_78 (25) = happyGoto action_92
action_78 (26) = happyGoto action_93
action_78 (27) = happyGoto action_104
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (64) = happyShift action_77
action_79 (27) = happyGoto action_100
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (64) = happyShift action_77
action_80 (27) = happyGoto action_99
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (30) = happyShift action_41
action_81 (31) = happyShift action_42
action_81 (32) = happyShift action_43
action_81 (46) = happyShift action_44
action_81 (15) = happyGoto action_98
action_81 (16) = happyGoto action_37
action_81 (24) = happyGoto action_38
action_81 (25) = happyGoto action_39
action_81 (26) = happyGoto action_40
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_13

action_83 (49) = happyShift action_97
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (28) = happyShift action_96
action_84 _ = happyReduce_20

action_85 (48) = happyShift action_34
action_85 (55) = happyShift action_35
action_85 (10) = happyGoto action_95
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (29) = happyShift action_70
action_86 (30) = happyShift action_41
action_86 (31) = happyShift action_42
action_86 (32) = happyShift action_43
action_86 (33) = happyShift action_71
action_86 (34) = happyShift action_72
action_86 (42) = happyShift action_73
action_86 (46) = happyShift action_94
action_86 (50) = happyShift action_75
action_86 (63) = happyShift action_76
action_86 (64) = happyShift action_77
action_86 (20) = happyGoto action_88
action_86 (21) = happyGoto action_89
action_86 (22) = happyGoto action_90
action_86 (24) = happyGoto action_91
action_86 (25) = happyGoto action_92
action_86 (26) = happyGoto action_93
action_86 (27) = happyGoto action_69
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_8

action_88 (37) = happyShift action_128
action_88 (38) = happyShift action_129
action_88 (39) = happyShift action_130
action_88 (41) = happyShift action_131
action_88 (42) = happyShift action_132
action_88 (43) = happyShift action_133
action_88 (44) = happyShift action_134
action_88 (45) = happyShift action_135
action_88 _ = happyReduce_9

action_89 (39) = happyShift action_124
action_89 (61) = happyShift action_126
action_89 (62) = happyShift action_127
action_89 _ = happyReduce_11

action_90 (39) = happyShift action_123
action_90 _ = happyReduce_10

action_91 (39) = happyShift action_122
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (39) = happyShift action_121
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (37) = happyShift action_111
action_93 (38) = happyShift action_112
action_93 (39) = happyShift action_113
action_93 (41) = happyShift action_114
action_93 (42) = happyShift action_115
action_93 (43) = happyShift action_116
action_93 (44) = happyShift action_117
action_93 (45) = happyShift action_118
action_93 (61) = happyShift action_119
action_93 (62) = happyShift action_120
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (29) = happyShift action_70
action_94 (30) = happyShift action_41
action_94 (31) = happyShift action_42
action_94 (32) = happyShift action_43
action_94 (33) = happyShift action_71
action_94 (34) = happyShift action_72
action_94 (42) = happyShift action_73
action_94 (46) = happyShift action_94
action_94 (50) = happyShift action_75
action_94 (63) = happyShift action_76
action_94 (64) = happyShift action_77
action_94 (20) = happyGoto action_105
action_94 (21) = happyGoto action_106
action_94 (22) = happyGoto action_65
action_94 (24) = happyGoto action_91
action_94 (25) = happyGoto action_92
action_94 (26) = happyGoto action_93
action_94 (27) = happyGoto action_69
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (28) = happyShift action_198
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (64) = happyShift action_77
action_96 (11) = happyGoto action_197
action_96 (27) = happyGoto action_84
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_19

action_98 _ = happyReduce_31

action_99 _ = happyReduce_33

action_100 _ = happyReduce_34

action_101 (37) = happyShift action_128
action_101 (38) = happyShift action_129
action_101 (39) = happyShift action_130
action_101 (41) = happyShift action_131
action_101 (42) = happyShift action_132
action_101 (43) = happyShift action_133
action_101 (44) = happyShift action_134
action_101 (45) = happyShift action_135
action_101 _ = happyReduce_37

action_102 (39) = happyShift action_124
action_102 (61) = happyShift action_126
action_102 (62) = happyShift action_127
action_102 _ = happyReduce_38

action_103 (39) = happyShift action_123
action_103 _ = happyReduce_36

action_104 (39) = happyShift action_110
action_104 _ = happyReduce_35

action_105 (37) = happyShift action_128
action_105 (38) = happyShift action_129
action_105 (39) = happyShift action_130
action_105 (41) = happyShift action_131
action_105 (42) = happyShift action_132
action_105 (43) = happyShift action_133
action_105 (44) = happyShift action_134
action_105 (45) = happyShift action_135
action_105 (47) = happyShift action_196
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (39) = happyShift action_124
action_106 (47) = happyShift action_195
action_106 (61) = happyShift action_126
action_106 (62) = happyShift action_127
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_69

action_108 _ = happyReduce_70

action_109 (29) = happyShift action_70
action_109 (32) = happyShift action_43
action_109 (42) = happyShift action_73
action_109 (46) = happyShift action_109
action_109 (63) = happyShift action_76
action_109 (20) = happyGoto action_194
action_109 (26) = happyGoto action_188
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (30) = happyShift action_41
action_110 (31) = happyShift action_42
action_110 (32) = happyShift action_43
action_110 (64) = happyShift action_77
action_110 (24) = happyGoto action_190
action_110 (25) = happyGoto action_191
action_110 (26) = happyGoto action_192
action_110 (27) = happyGoto action_193
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (29) = happyShift action_70
action_111 (32) = happyShift action_43
action_111 (42) = happyShift action_73
action_111 (46) = happyShift action_109
action_111 (63) = happyShift action_76
action_111 (20) = happyGoto action_189
action_111 (26) = happyGoto action_188
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (29) = happyShift action_70
action_112 (32) = happyShift action_43
action_112 (42) = happyShift action_73
action_112 (46) = happyShift action_109
action_112 (63) = happyShift action_76
action_112 (20) = happyGoto action_187
action_112 (26) = happyGoto action_188
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (29) = happyShift action_70
action_113 (30) = happyShift action_41
action_113 (31) = happyShift action_42
action_113 (32) = happyShift action_43
action_113 (33) = happyShift action_71
action_113 (34) = happyShift action_72
action_113 (42) = happyShift action_73
action_113 (46) = happyShift action_94
action_113 (50) = happyShift action_75
action_113 (63) = happyShift action_76
action_113 (64) = happyShift action_77
action_113 (20) = happyGoto action_183
action_113 (21) = happyGoto action_184
action_113 (22) = happyGoto action_185
action_113 (24) = happyGoto action_91
action_113 (25) = happyGoto action_92
action_113 (26) = happyGoto action_93
action_113 (27) = happyGoto action_186
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (29) = happyShift action_70
action_114 (32) = happyShift action_43
action_114 (42) = happyShift action_73
action_114 (46) = happyShift action_109
action_114 (63) = happyShift action_76
action_114 (20) = happyGoto action_181
action_114 (26) = happyGoto action_182
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (29) = happyShift action_70
action_115 (32) = happyShift action_43
action_115 (42) = happyShift action_73
action_115 (46) = happyShift action_109
action_115 (63) = happyShift action_76
action_115 (20) = happyGoto action_179
action_115 (26) = happyGoto action_180
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (29) = happyShift action_70
action_116 (32) = happyShift action_43
action_116 (42) = happyShift action_73
action_116 (46) = happyShift action_109
action_116 (63) = happyShift action_76
action_116 (20) = happyGoto action_177
action_116 (26) = happyGoto action_178
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (29) = happyShift action_70
action_117 (32) = happyShift action_43
action_117 (42) = happyShift action_73
action_117 (46) = happyShift action_109
action_117 (63) = happyShift action_76
action_117 (20) = happyGoto action_175
action_117 (26) = happyGoto action_176
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (29) = happyShift action_70
action_118 (32) = happyShift action_43
action_118 (42) = happyShift action_73
action_118 (46) = happyShift action_109
action_118 (63) = happyShift action_76
action_118 (20) = happyGoto action_173
action_118 (26) = happyGoto action_174
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (29) = happyShift action_70
action_119 (30) = happyShift action_41
action_119 (31) = happyShift action_42
action_119 (32) = happyShift action_43
action_119 (33) = happyShift action_71
action_119 (34) = happyShift action_72
action_119 (42) = happyShift action_73
action_119 (46) = happyShift action_94
action_119 (50) = happyShift action_75
action_119 (63) = happyShift action_76
action_119 (64) = happyShift action_77
action_119 (20) = happyGoto action_63
action_119 (21) = happyGoto action_172
action_119 (22) = happyGoto action_65
action_119 (24) = happyGoto action_91
action_119 (25) = happyGoto action_92
action_119 (26) = happyGoto action_93
action_119 (27) = happyGoto action_69
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (29) = happyShift action_70
action_120 (30) = happyShift action_41
action_120 (31) = happyShift action_42
action_120 (32) = happyShift action_43
action_120 (33) = happyShift action_71
action_120 (34) = happyShift action_72
action_120 (42) = happyShift action_73
action_120 (46) = happyShift action_94
action_120 (50) = happyShift action_75
action_120 (63) = happyShift action_76
action_120 (64) = happyShift action_77
action_120 (20) = happyGoto action_63
action_120 (21) = happyGoto action_171
action_120 (22) = happyGoto action_65
action_120 (24) = happyGoto action_91
action_120 (25) = happyGoto action_92
action_120 (26) = happyGoto action_93
action_120 (27) = happyGoto action_69
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (64) = happyShift action_77
action_121 (27) = happyGoto action_170
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (64) = happyShift action_77
action_122 (27) = happyGoto action_169
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (32) = happyShift action_43
action_123 (50) = happyShift action_75
action_123 (22) = happyGoto action_167
action_123 (26) = happyGoto action_168
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (29) = happyShift action_70
action_124 (30) = happyShift action_41
action_124 (31) = happyShift action_42
action_124 (32) = happyShift action_43
action_124 (33) = happyShift action_71
action_124 (34) = happyShift action_72
action_124 (42) = happyShift action_73
action_124 (46) = happyShift action_94
action_124 (50) = happyShift action_75
action_124 (63) = happyShift action_76
action_124 (64) = happyShift action_77
action_124 (20) = happyGoto action_63
action_124 (21) = happyGoto action_165
action_124 (22) = happyGoto action_65
action_124 (24) = happyGoto action_91
action_124 (25) = happyGoto action_92
action_124 (26) = happyGoto action_166
action_124 (27) = happyGoto action_69
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (53) = happyShift action_164
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (29) = happyShift action_70
action_126 (30) = happyShift action_41
action_126 (31) = happyShift action_42
action_126 (32) = happyShift action_43
action_126 (33) = happyShift action_71
action_126 (34) = happyShift action_72
action_126 (42) = happyShift action_73
action_126 (46) = happyShift action_94
action_126 (50) = happyShift action_75
action_126 (63) = happyShift action_76
action_126 (64) = happyShift action_77
action_126 (20) = happyGoto action_63
action_126 (21) = happyGoto action_162
action_126 (22) = happyGoto action_65
action_126 (24) = happyGoto action_91
action_126 (25) = happyGoto action_92
action_126 (26) = happyGoto action_163
action_126 (27) = happyGoto action_69
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (29) = happyShift action_70
action_127 (30) = happyShift action_41
action_127 (31) = happyShift action_42
action_127 (32) = happyShift action_43
action_127 (33) = happyShift action_71
action_127 (34) = happyShift action_72
action_127 (42) = happyShift action_73
action_127 (46) = happyShift action_94
action_127 (50) = happyShift action_75
action_127 (63) = happyShift action_76
action_127 (64) = happyShift action_77
action_127 (20) = happyGoto action_63
action_127 (21) = happyGoto action_160
action_127 (22) = happyGoto action_65
action_127 (24) = happyGoto action_91
action_127 (25) = happyGoto action_92
action_127 (26) = happyGoto action_161
action_127 (27) = happyGoto action_69
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (29) = happyShift action_70
action_128 (32) = happyShift action_43
action_128 (42) = happyShift action_73
action_128 (46) = happyShift action_109
action_128 (63) = happyShift action_76
action_128 (20) = happyGoto action_158
action_128 (26) = happyGoto action_159
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (29) = happyShift action_70
action_129 (32) = happyShift action_43
action_129 (42) = happyShift action_73
action_129 (46) = happyShift action_109
action_129 (63) = happyShift action_76
action_129 (20) = happyGoto action_156
action_129 (26) = happyGoto action_157
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (29) = happyShift action_70
action_130 (32) = happyShift action_43
action_130 (42) = happyShift action_73
action_130 (46) = happyShift action_109
action_130 (63) = happyShift action_76
action_130 (20) = happyGoto action_154
action_130 (26) = happyGoto action_155
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (29) = happyShift action_70
action_131 (32) = happyShift action_43
action_131 (42) = happyShift action_73
action_131 (46) = happyShift action_109
action_131 (63) = happyShift action_76
action_131 (20) = happyGoto action_152
action_131 (26) = happyGoto action_153
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (29) = happyShift action_70
action_132 (32) = happyShift action_43
action_132 (42) = happyShift action_73
action_132 (46) = happyShift action_109
action_132 (63) = happyShift action_76
action_132 (20) = happyGoto action_150
action_132 (26) = happyGoto action_151
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (29) = happyShift action_70
action_133 (32) = happyShift action_43
action_133 (42) = happyShift action_73
action_133 (46) = happyShift action_109
action_133 (63) = happyShift action_76
action_133 (20) = happyGoto action_148
action_133 (26) = happyGoto action_149
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (29) = happyShift action_70
action_134 (32) = happyShift action_43
action_134 (42) = happyShift action_73
action_134 (46) = happyShift action_109
action_134 (63) = happyShift action_76
action_134 (20) = happyGoto action_146
action_134 (26) = happyGoto action_147
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (29) = happyShift action_70
action_135 (32) = happyShift action_43
action_135 (42) = happyShift action_73
action_135 (46) = happyShift action_109
action_135 (63) = happyShift action_76
action_135 (20) = happyGoto action_144
action_135 (26) = happyGoto action_145
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_39

action_137 _ = happyReduce_29

action_138 (47) = happyShift action_143
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (30) = happyShift action_41
action_139 (31) = happyShift action_42
action_139 (32) = happyShift action_43
action_139 (23) = happyGoto action_142
action_139 (24) = happyGoto action_48
action_139 (25) = happyGoto action_49
action_139 (26) = happyGoto action_50
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (28) = happyShift action_141
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (48) = happyShift action_200
action_141 (18) = happyGoto action_204
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (47) = happyShift action_203
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (48) = happyShift action_23
action_143 (51) = happyShift action_24
action_143 (13) = happyGoto action_202
action_143 _ = happyFail (happyExpListPerState 143)

action_144 _ = happyReduce_64

action_145 _ = happyReduce_66

action_146 (45) = happyShift action_135
action_146 _ = happyReduce_60

action_147 (45) = happyShift action_118
action_147 _ = happyReduce_62

action_148 (45) = happyShift action_135
action_148 _ = happyReduce_56

action_149 (45) = happyShift action_118
action_149 _ = happyReduce_58

action_150 (43) = happyShift action_133
action_150 (44) = happyShift action_134
action_150 (45) = happyShift action_135
action_150 _ = happyReduce_52

action_151 (43) = happyShift action_116
action_151 (44) = happyShift action_117
action_151 (45) = happyShift action_118
action_151 _ = happyReduce_54

action_152 (43) = happyShift action_133
action_152 (44) = happyShift action_134
action_152 (45) = happyShift action_135
action_152 _ = happyReduce_48

action_153 (43) = happyShift action_116
action_153 (44) = happyShift action_117
action_153 (45) = happyShift action_118
action_153 _ = happyReduce_50

action_154 (41) = happyShift action_131
action_154 (42) = happyShift action_132
action_154 (43) = happyShift action_133
action_154 (44) = happyShift action_134
action_154 (45) = happyShift action_135
action_154 _ = happyReduce_85

action_155 (41) = happyShift action_114
action_155 (42) = happyShift action_115
action_155 (43) = happyShift action_116
action_155 (44) = happyShift action_117
action_155 (45) = happyShift action_118
action_155 _ = happyReduce_90

action_156 (41) = happyShift action_131
action_156 (42) = happyShift action_132
action_156 (43) = happyShift action_133
action_156 (44) = happyShift action_134
action_156 (45) = happyShift action_135
action_156 _ = happyReduce_79

action_157 (41) = happyShift action_114
action_157 (42) = happyShift action_115
action_157 (43) = happyShift action_116
action_157 (44) = happyShift action_117
action_157 (45) = happyShift action_118
action_157 _ = happyReduce_80

action_158 (41) = happyShift action_131
action_158 (42) = happyShift action_132
action_158 (43) = happyShift action_133
action_158 (44) = happyShift action_134
action_158 (45) = happyShift action_135
action_158 _ = happyReduce_82

action_159 (41) = happyShift action_114
action_159 (42) = happyShift action_115
action_159 (43) = happyShift action_116
action_159 (44) = happyShift action_117
action_159 (45) = happyShift action_118
action_159 _ = happyReduce_83

action_160 (39) = happyShift action_124
action_160 (61) = happyShift action_126
action_160 _ = happyReduce_76

action_161 (37) = happyShift action_111
action_161 (38) = happyShift action_112
action_161 (39) = happyShift action_113
action_161 (41) = happyShift action_114
action_161 (42) = happyShift action_115
action_161 (43) = happyShift action_116
action_161 (44) = happyShift action_117
action_161 (45) = happyShift action_118
action_161 (61) = happyShift action_119
action_161 _ = happyReduce_77

action_162 (39) = happyShift action_124
action_162 _ = happyReduce_73

action_163 (37) = happyShift action_111
action_163 (38) = happyShift action_112
action_163 (39) = happyShift action_113
action_163 (41) = happyShift action_114
action_163 (42) = happyShift action_115
action_163 (43) = happyShift action_116
action_163 (44) = happyShift action_117
action_163 (45) = happyShift action_118
action_163 _ = happyReduce_74

action_164 (30) = happyShift action_41
action_164 (31) = happyShift action_42
action_164 (32) = happyShift action_43
action_164 (46) = happyShift action_44
action_164 (15) = happyGoto action_201
action_164 (16) = happyGoto action_37
action_164 (24) = happyGoto action_38
action_164 (25) = happyGoto action_39
action_164 (26) = happyGoto action_40
action_164 _ = happyFail (happyExpListPerState 164)

action_165 _ = happyReduce_86

action_166 (37) = happyShift action_111
action_166 (38) = happyShift action_112
action_166 (41) = happyShift action_114
action_166 (42) = happyShift action_115
action_166 (43) = happyShift action_116
action_166 (44) = happyShift action_117
action_166 (45) = happyShift action_118
action_166 _ = happyReduce_94

action_167 _ = happyReduce_87

action_168 _ = happyReduce_92

action_169 _ = happyReduce_95

action_170 _ = happyReduce_97

action_171 (39) = happyShift action_124
action_171 (61) = happyShift action_126
action_171 _ = happyReduce_78

action_172 (39) = happyShift action_124
action_172 _ = happyReduce_75

action_173 _ = happyReduce_65

action_174 _ = happyReduce_67

action_175 (45) = happyShift action_135
action_175 _ = happyReduce_61

action_176 (45) = happyShift action_118
action_176 _ = happyReduce_63

action_177 (45) = happyShift action_135
action_177 _ = happyReduce_57

action_178 (45) = happyShift action_118
action_178 _ = happyReduce_59

action_179 (43) = happyShift action_133
action_179 (44) = happyShift action_134
action_179 (45) = happyShift action_135
action_179 _ = happyReduce_53

action_180 (43) = happyShift action_116
action_180 (44) = happyShift action_117
action_180 (45) = happyShift action_118
action_180 _ = happyReduce_55

action_181 (43) = happyShift action_133
action_181 (44) = happyShift action_134
action_181 (45) = happyShift action_135
action_181 _ = happyReduce_49

action_182 (43) = happyShift action_116
action_182 (44) = happyShift action_117
action_182 (45) = happyShift action_118
action_182 _ = happyReduce_51

action_183 (37) = happyShift action_128
action_183 (38) = happyShift action_129
action_183 (41) = happyShift action_131
action_183 (42) = happyShift action_132
action_183 (43) = happyShift action_133
action_183 (44) = happyShift action_134
action_183 (45) = happyShift action_135
action_183 _ = happyReduce_89

action_184 _ = happyReduce_93

action_185 _ = happyReduce_91

action_186 _ = happyReduce_99

action_187 (41) = happyShift action_131
action_187 (42) = happyShift action_132
action_187 (43) = happyShift action_133
action_187 (44) = happyShift action_134
action_187 (45) = happyShift action_135
action_187 _ = happyReduce_81

action_188 (41) = happyShift action_114
action_188 (42) = happyShift action_115
action_188 (43) = happyShift action_116
action_188 (44) = happyShift action_117
action_188 (45) = happyShift action_118
action_188 _ = happyFail (happyExpListPerState 188)

action_189 (41) = happyShift action_131
action_189 (42) = happyShift action_132
action_189 (43) = happyShift action_133
action_189 (44) = happyShift action_134
action_189 (45) = happyShift action_135
action_189 _ = happyReduce_84

action_190 _ = happyReduce_96

action_191 _ = happyReduce_98

action_192 _ = happyReduce_100

action_193 _ = happyReduce_88

action_194 (41) = happyShift action_131
action_194 (42) = happyShift action_132
action_194 (43) = happyShift action_133
action_194 (44) = happyShift action_134
action_194 (45) = happyShift action_135
action_194 (47) = happyShift action_196
action_194 _ = happyFail (happyExpListPerState 194)

action_195 _ = happyReduce_101

action_196 _ = happyReduce_68

action_197 _ = happyReduce_21

action_198 (48) = happyShift action_200
action_198 (18) = happyGoto action_199
action_198 _ = happyFail (happyExpListPerState 198)

action_199 (47) = happyShift action_215
action_199 _ = happyFail (happyExpListPerState 199)

action_200 (29) = happyShift action_70
action_200 (30) = happyShift action_41
action_200 (31) = happyShift action_42
action_200 (32) = happyShift action_43
action_200 (33) = happyShift action_71
action_200 (34) = happyShift action_72
action_200 (42) = happyShift action_73
action_200 (46) = happyShift action_94
action_200 (50) = happyShift action_75
action_200 (55) = happyShift action_214
action_200 (63) = happyShift action_76
action_200 (64) = happyShift action_77
action_200 (17) = happyGoto action_208
action_200 (19) = happyGoto action_209
action_200 (20) = happyGoto action_210
action_200 (21) = happyGoto action_211
action_200 (22) = happyGoto action_212
action_200 (24) = happyGoto action_91
action_200 (25) = happyGoto action_92
action_200 (26) = happyGoto action_93
action_200 (27) = happyGoto action_213
action_200 _ = happyFail (happyExpListPerState 200)

action_201 (54) = happyShift action_207
action_201 _ = happyFail (happyExpListPerState 201)

action_202 _ = happyReduce_15

action_203 (48) = happyShift action_23
action_203 (51) = happyShift action_24
action_203 (13) = happyGoto action_206
action_203 _ = happyFail (happyExpListPerState 203)

action_204 (47) = happyShift action_205
action_204 _ = happyFail (happyExpListPerState 204)

action_205 _ = happyReduce_17

action_206 _ = happyReduce_16

action_207 (30) = happyShift action_41
action_207 (31) = happyShift action_42
action_207 (32) = happyShift action_43
action_207 (46) = happyShift action_44
action_207 (15) = happyGoto action_218
action_207 (16) = happyGoto action_37
action_207 (24) = happyGoto action_38
action_207 (25) = happyGoto action_39
action_207 (26) = happyGoto action_40
action_207 _ = happyFail (happyExpListPerState 207)

action_208 (28) = happyShift action_217
action_208 _ = happyReduce_46

action_209 (49) = happyShift action_216
action_209 _ = happyFail (happyExpListPerState 209)

action_210 (37) = happyShift action_128
action_210 (38) = happyShift action_129
action_210 (39) = happyShift action_130
action_210 (41) = happyShift action_131
action_210 (42) = happyShift action_132
action_210 (43) = happyShift action_133
action_210 (44) = happyShift action_134
action_210 (45) = happyShift action_135
action_210 _ = happyReduce_41

action_211 (39) = happyShift action_124
action_211 (61) = happyShift action_126
action_211 (62) = happyShift action_127
action_211 _ = happyReduce_42

action_212 (39) = happyShift action_123
action_212 _ = happyReduce_43

action_213 (39) = happyShift action_110
action_213 _ = happyReduce_44

action_214 _ = happyReduce_40

action_215 _ = happyReduce_12

action_216 _ = happyReduce_45

action_217 (29) = happyShift action_70
action_217 (30) = happyShift action_41
action_217 (31) = happyShift action_42
action_217 (32) = happyShift action_43
action_217 (33) = happyShift action_71
action_217 (34) = happyShift action_72
action_217 (42) = happyShift action_73
action_217 (46) = happyShift action_94
action_217 (50) = happyShift action_75
action_217 (55) = happyShift action_214
action_217 (63) = happyShift action_76
action_217 (64) = happyShift action_77
action_217 (17) = happyGoto action_208
action_217 (19) = happyGoto action_219
action_217 (20) = happyGoto action_210
action_217 (21) = happyGoto action_211
action_217 (22) = happyGoto action_212
action_217 (24) = happyGoto action_91
action_217 (25) = happyGoto action_92
action_217 (26) = happyGoto action_93
action_217 (27) = happyGoto action_213
action_217 _ = happyFail (happyExpListPerState 217)

action_218 _ = happyReduce_32

action_219 _ = happyReduce_47

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
		 (NewQuery happy_var_1 $ 3
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

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn10
		 (Any
	)

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (FilteredList happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn11
		 (SimpleUrl happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  11 happyReduction_21
happyReduction_21 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn11
		 (UrlSeq happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  12 happyReduction_22
happyReduction_22 _
	_
	 =  HappyAbsSyn12
		 (BidirectJoin
	)

happyReduce_23 = happySpecReduce_2  12 happyReduction_23
happyReduction_23 _
	_
	 =  HappyAbsSyn12
		 (BidirectJoin
	)

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn12
		 (LeftJoin
	)

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn12
		 (RightJoin
	)

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (StrList happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn13
		 (StrListSingle happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn14
		 (SListEl happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn14
		 (SListSeq happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  15 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Always happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  15 happyReduction_31
happyReduction_31 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (ActionSeq happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 7 15 happyReduction_32
happyReduction_32 ((HappyAbsSyn15  happy_var_7) `HappyStk`
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

happyReduce_33 = happySpecReduce_3  16 happyReduction_33
happyReduction_33 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignSubj happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignPred happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  16 happyReduction_35
happyReduction_35 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjUrl happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  16 happyReduction_36
happyReduction_36 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjStr happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  16 happyReduction_37
happyReduction_37 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjInt happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  16 happyReduction_38
happyReduction_38 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjBool happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  17 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn17
		 (AnyLit
	)

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

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (LiteralLst happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  19 happyReduction_46
happyReduction_46 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (SingleLit happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  19 happyReduction_47
happyReduction_47 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  20 happyReduction_48
happyReduction_48 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  20 happyReduction_49
happyReduction_49 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  20 happyReduction_52
happyReduction_52 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  20 happyReduction_53
happyReduction_53 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  20 happyReduction_54
happyReduction_54 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  20 happyReduction_55
happyReduction_55 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  20 happyReduction_56
happyReduction_56 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  20 happyReduction_57
happyReduction_57 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  20 happyReduction_58
happyReduction_58 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  20 happyReduction_59
happyReduction_59 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  20 happyReduction_60
happyReduction_60 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  20 happyReduction_61
happyReduction_61 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  20 happyReduction_62
happyReduction_62 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  20 happyReduction_63
happyReduction_63 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  20 happyReduction_64
happyReduction_64 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  20 happyReduction_65
happyReduction_65 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  20 happyReduction_66
happyReduction_66 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  20 happyReduction_67
happyReduction_67 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  20 happyReduction_68
happyReduction_68 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_2  20 happyReduction_69
happyReduction_69 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateI happy_var_2
	)
happyReduction_69 _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_2  20 happyReduction_70
happyReduction_70 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateO happy_var_2
	)
happyReduction_70 _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  20 happyReduction_71
happyReduction_71 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn20
		 (QInt happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  20 happyReduction_72
happyReduction_72 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (IntVariable happy_var_1
	)
happyReduction_72 _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  21 happyReduction_73
happyReduction_73 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (And happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  21 happyReduction_74
happyReduction_74 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  21 happyReduction_75
happyReduction_75 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  21 happyReduction_76
happyReduction_76 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (Or happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  21 happyReduction_77
happyReduction_77 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  21 happyReduction_78
happyReduction_78 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  21 happyReduction_79
happyReduction_79 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  21 happyReduction_80
happyReduction_80 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  21 happyReduction_81
happyReduction_81 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  21 happyReduction_82
happyReduction_82 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  21 happyReduction_83
happyReduction_83 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  21 happyReduction_84
happyReduction_84 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  21 happyReduction_85
happyReduction_85 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  21 happyReduction_86
happyReduction_86 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  21 happyReduction_87
happyReduction_87 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  21 happyReduction_88
happyReduction_88 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  21 happyReduction_89
happyReduction_89 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  21 happyReduction_90
happyReduction_90 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  21 happyReduction_91
happyReduction_91 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  21 happyReduction_92
happyReduction_92 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  21 happyReduction_93
happyReduction_93 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  21 happyReduction_94
happyReduction_94 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  21 happyReduction_95
happyReduction_95 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSU happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  21 happyReduction_96
happyReduction_96 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUS happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  21 happyReduction_97
happyReduction_97 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn21
		 (EQPU happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  21 happyReduction_98
happyReduction_98 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUP happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  21 happyReduction_99
happyReduction_99 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOU happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  21 happyReduction_100
happyReduction_100 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUO happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  21 happyReduction_101
happyReduction_101 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_1  21 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn21
		 (QTrue
	)

happyReduce_103 = happySpecReduce_1  21 happyReduction_103
happyReduction_103 _
	 =  HappyAbsSyn21
		 (QFalse
	)

happyReduce_104 = happySpecReduce_1  22 happyReduction_104
happyReduction_104 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn22
		 (QString happy_var_1
	)
happyReduction_104 _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_1  23 happyReduction_105
happyReduction_105 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (S happy_var_1
	)
happyReduction_105 _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_1  23 happyReduction_106
happyReduction_106 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn23
		 (P happy_var_1
	)
happyReduction_106 _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_1  23 happyReduction_107
happyReduction_107 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn23
		 (O happy_var_1
	)
happyReduction_107 _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_1  24 happyReduction_108
happyReduction_108 _
	 =  HappyAbsSyn24
		 (Subj
	)

happyReduce_109 = happySpecReduce_1  25 happyReduction_109
happyReduction_109 _
	 =  HappyAbsSyn25
		 (Pred
	)

happyReduce_110 = happySpecReduce_1  26 happyReduction_110
happyReduction_110 _
	 =  HappyAbsSyn26
		 (Obj
	)

happyReduce_111 = happySpecReduce_1  27 happyReduction_111
happyReduction_111 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn27
		 (NewUrl happy_var_1
	)
happyReduction_111 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 66 66 notHappyAtAll (HappyState action) sts stk []

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
	TokenGet _ -> cont 65;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 66 tk tks = happyError' (tks, explist)
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
-- Added these 3 lines
parseError ((TokenGet (AlexPn _ l c) _ )  : xs) = error (printing l c)
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

data Literal = IntLit IntExp | BoolLit BoolExp | StrLit StringExp | UrlLit Url | AnyLit 
     deriving Show

data LiteralList = LiteralLst LiteralElems 
     deriving Show

data LiteralElems = LiteralSeq Literal LiteralElems | SingleLit Literal 
     deriving Show

data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter FilterEl FilterEl LiteralList | Get FilterEl FilterEl LiteralList
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
