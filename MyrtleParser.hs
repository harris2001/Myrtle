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
happyExpList = Happy_Data_Array.listArray (0,570) ([0,0,0,4,0,0,0,64,0,0,0,2048,0,0,0,0,0,0,0,0,8,0,0,0,26624,16,0,0,32768,262,0,0,2,0,0,0,0,2048,0,0,0,128,0,0,0,32,0,0,0,18432,0,0,0,8204,0,0,0,0,2,0,0,8192,0,0,0,0,2,0,0,0,0,32768,0,0,0,2,0,0,2048,0,0,0,16384,0,0,0,57344,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,32768,64,0,0,0,26624,16,0,0,0,64,0,0,0,0,0,0,0,16384,0,0,2048,0,0,0,0,0,0,0,128,0,0,0,0,0,32768,0,0,0,0,0,0,0,256,0,0,128,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,8,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,128,0,128,0,0,0,57344,0,0,0,0,0,64,0,0,0,0,0,0,0,4096,0,0,2048,0,0,0,0,0,1032,0,0,1008,546,1728,0,0,0,0,0,0,8048,0,0,0,1024,0,3,0,16384,0,0,0,0,4,0,0,0,64,0,0,0,63232,1,3,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,34,576,0,16128,8736,27648,0,0,0,0,0,0,61440,1,0,0,0,32,0,0,0,512,0,0,2048,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,14,0,0,0,8,0,0,0,16128,8736,27648,0,0,16384,0,0,0,0,72,0,0,0,0,0,0,0,2048,4,0,0,0,2,0,0,8,32,0,0,144,34,576,0,2304,544,9216,0,36864,8704,16384,2,0,8201,2,36,0,144,34,576,0,0,1527,0,0,0,16448,12288,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,36864,8704,16384,2,0,0,0,0,0,224,0,128,0,2304,544,9216,0,36864,8704,16384,2,0,8255,34,108,0,144,34,576,0,2304,544,9216,0,36864,8704,16384,2,0,8201,2,36,0,144,34,576,0,16128,8736,27648,0,61440,8707,49154,6,0,0,0,8,0,0,0,128,0,2048,8192,0,0,61440,8707,49154,6,0,8255,34,108,0,1008,546,1728,0,2304,544,9216,0,36864,8704,16384,2,0,8201,2,36,0,144,34,576,0,2304,544,9216,0,36864,8704,16384,2,0,8201,2,36,0,144,34,576,0,0,0,0,0,0,0,0,0,0,61440,1,0,0,0,16,0,0,0,256,0,0,0,7936,0,0,0,0,1,0,0,0,16,0,0,0,496,0,0,0,7168,0,0,0,49152,1,0,0,0,31,0,0,0,448,0,0,0,7168,0,0,0,61440,1,0,0,0,31,0,0,0,496,0,0,0,7936,0,0,0,61440,1,0,0,0,31,0,0,0,496,0,0,0,8048,0,0,0,1024,0,1,0,28672,31,16,0,0,4,0,0,0,8048,0,0,0,0,0,0,0,12288,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,256,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,496,0,0,0,4096,0,0,0,0,1,0,0,0,31,0,0,0,256,0,0,0,4096,0,0,0,61440,1,0,0,0,28,0,0,0,448,0,0,0,7936,0,0,0,49152,1,0,0,0,28,0,0,0,496,0,0,0,7984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,0,0,0,61440,1,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1520,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,1,0,0,0,16,0,0,0,256,0,0,0,7168,0,0,0,49152,1,0,0,0,28,0,0,0,448,0,0,0,16384,0,0,0,0,4,0,0,8,0,0,0,0,1024,0,0,61440,8707,49154,6,0,0,0,0,0,0,0,0,0,0,18432,0,0,0,16384,0,0,0,63232,1,0,0,16384,0,48,0,0,4,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,1,0,0,0,0,0,0,128,512,128,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,64,0,0,0,1024,0,0,0,0,0,0,0,8255,34,108,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","Query","FilteredQuery","BasicQuery","CreateVars","CreateVar","Func","FilterEl","UrlList","JoinOption","SList","SListElem","Cond","Action","Literal","LiteralList","LiteralElems","IntExp","BoolExp","StringExp","Node","Subject","Predicate","Object","Url","','","int","subj","pred","obj","true","false","'-l'","'-r'","'<'","'>'","deq","'='","'+'","'-'","'*'","'/'","'^'","'('","')'","'['","']'","string","filename","'|'","'?'","':'","'_'","filter","map","union","join","where","and","or","var","url","add","length","startsWith","%eof"]
        bit_start = st Prelude.* 68
        bit_end = (st Prelude.+ 1) Prelude.* 68
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..67]
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

action_3 (68) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (52) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (56) = happyShift action_10
action_5 (58) = happyShift action_11
action_5 (59) = happyShift action_12
action_5 (65) = happyShift action_13
action_5 (5) = happyGoto action_14
action_5 (6) = happyGoto action_8
action_5 (9) = happyGoto action_9
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (56) = happyShift action_10
action_6 (58) = happyShift action_11
action_6 (59) = happyShift action_12
action_6 (65) = happyShift action_13
action_6 (5) = happyGoto action_7
action_6 (6) = happyGoto action_8
action_6 (9) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (38) = happyShift action_15
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (60) = happyShift action_26
action_8 _ = happyReduce_3

action_9 (52) = happyShift action_25
action_9 _ = happyReduce_5

action_10 (46) = happyShift action_24
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (48) = happyShift action_22
action_11 (51) = happyShift action_23
action_11 (13) = happyGoto action_21
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (35) = happyShift action_18
action_12 (36) = happyShift action_19
action_12 (46) = happyShift action_20
action_12 (12) = happyGoto action_17
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (46) = happyShift action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (38) = happyShift action_15
action_14 _ = happyReduce_2

action_15 (38) = happyShift action_48
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (64) = happyShift action_47
action_16 (27) = happyGoto action_46
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (46) = happyShift action_45
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (36) = happyShift action_44
action_18 _ = happyReduce_23

action_19 (35) = happyShift action_43
action_19 _ = happyReduce_24

action_20 (30) = happyShift action_40
action_20 (31) = happyShift action_41
action_20 (32) = happyShift action_42
action_20 (23) = happyGoto action_36
action_20 (24) = happyGoto action_37
action_20 (25) = happyGoto action_38
action_20 (26) = happyGoto action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_13

action_22 (51) = happyShift action_35
action_22 (14) = happyGoto action_34
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_26

action_24 (48) = happyShift action_32
action_24 (55) = happyShift action_33
action_24 (10) = happyGoto action_31
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (56) = happyShift action_10
action_25 (58) = happyShift action_11
action_25 (59) = happyShift action_12
action_25 (65) = happyShift action_13
action_25 (6) = happyGoto action_30
action_25 (9) = happyGoto action_9
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (63) = happyShift action_29
action_26 (7) = happyGoto action_27
action_26 (8) = happyGoto action_28
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_4

action_28 (63) = happyShift action_29
action_28 (7) = happyGoto action_59
action_28 (8) = happyGoto action_28
action_28 _ = happyReduce_7

action_29 (40) = happyShift action_58
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_6

action_31 (28) = happyShift action_57
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (64) = happyShift action_47
action_32 (11) = happyGoto action_55
action_32 (27) = happyGoto action_56
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_17

action_34 (49) = happyShift action_54
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (28) = happyShift action_53
action_35 _ = happyReduce_27

action_36 (28) = happyShift action_52
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_130

action_38 _ = happyReduce_131

action_39 _ = happyReduce_132

action_40 _ = happyReduce_133

action_41 _ = happyReduce_134

action_42 _ = happyReduce_135

action_43 _ = happyReduce_21

action_44 _ = happyReduce_22

action_45 (30) = happyShift action_40
action_45 (31) = happyShift action_41
action_45 (32) = happyShift action_42
action_45 (23) = happyGoto action_51
action_45 (24) = happyGoto action_37
action_45 (25) = happyGoto action_38
action_45 (26) = happyGoto action_39
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (28) = happyShift action_50
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_136

action_48 (51) = happyShift action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_1

action_50 (64) = happyShift action_47
action_50 (27) = happyGoto action_82
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (28) = happyShift action_81
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (30) = happyShift action_40
action_52 (31) = happyShift action_41
action_52 (32) = happyShift action_42
action_52 (23) = happyGoto action_80
action_52 (24) = happyGoto action_37
action_52 (25) = happyGoto action_38
action_52 (26) = happyGoto action_39
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (51) = happyShift action_35
action_53 (14) = happyGoto action_79
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_25

action_55 (49) = happyShift action_78
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (28) = happyShift action_77
action_56 _ = happyReduce_19

action_57 (48) = happyShift action_32
action_57 (55) = happyShift action_33
action_57 (10) = happyGoto action_76
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (29) = happyShift action_67
action_58 (30) = happyShift action_40
action_58 (31) = happyShift action_41
action_58 (32) = happyShift action_42
action_58 (33) = happyShift action_68
action_58 (34) = happyShift action_69
action_58 (42) = happyShift action_70
action_58 (46) = happyShift action_71
action_58 (50) = happyShift action_72
action_58 (63) = happyShift action_73
action_58 (64) = happyShift action_47
action_58 (66) = happyShift action_74
action_58 (67) = happyShift action_75
action_58 (20) = happyGoto action_60
action_58 (21) = happyGoto action_61
action_58 (22) = happyGoto action_62
action_58 (24) = happyGoto action_63
action_58 (25) = happyGoto action_64
action_58 (26) = happyGoto action_65
action_58 (27) = happyGoto action_66
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_8

action_60 (37) = happyShift action_119
action_60 (38) = happyShift action_120
action_60 (39) = happyShift action_121
action_60 (41) = happyShift action_122
action_60 (42) = happyShift action_123
action_60 (43) = happyShift action_124
action_60 (44) = happyShift action_125
action_60 (45) = happyShift action_126
action_60 _ = happyReduce_9

action_61 (39) = happyShift action_116
action_61 (61) = happyShift action_117
action_61 (62) = happyShift action_118
action_61 _ = happyReduce_11

action_62 (39) = happyShift action_115
action_62 _ = happyReduce_10

action_63 (39) = happyShift action_114
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (39) = happyShift action_113
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (37) = happyShift action_103
action_65 (38) = happyShift action_104
action_65 (39) = happyShift action_105
action_65 (41) = happyShift action_106
action_65 (42) = happyShift action_107
action_65 (43) = happyShift action_108
action_65 (44) = happyShift action_109
action_65 (45) = happyShift action_110
action_65 (61) = happyShift action_111
action_65 (62) = happyShift action_112
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (39) = happyShift action_102
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_92

action_68 _ = happyReduce_124

action_69 _ = happyReduce_125

action_70 (29) = happyShift action_67
action_70 (32) = happyShift action_42
action_70 (42) = happyShift action_70
action_70 (46) = happyShift action_100
action_70 (63) = happyShift action_101
action_70 (66) = happyShift action_74
action_70 (20) = happyGoto action_98
action_70 (26) = happyGoto action_99
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (29) = happyShift action_67
action_71 (30) = happyShift action_40
action_71 (31) = happyShift action_41
action_71 (32) = happyShift action_42
action_71 (33) = happyShift action_68
action_71 (34) = happyShift action_69
action_71 (42) = happyShift action_70
action_71 (46) = happyShift action_71
action_71 (50) = happyShift action_72
action_71 (63) = happyShift action_73
action_71 (64) = happyShift action_47
action_71 (66) = happyShift action_74
action_71 (67) = happyShift action_75
action_71 (20) = happyGoto action_95
action_71 (21) = happyGoto action_96
action_71 (22) = happyGoto action_97
action_71 (24) = happyGoto action_63
action_71 (25) = happyGoto action_64
action_71 (26) = happyGoto action_65
action_71 (27) = happyGoto action_66
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_129

action_73 (41) = happyShift action_90
action_73 (42) = happyShift action_91
action_73 (43) = happyShift action_92
action_73 (44) = happyShift action_93
action_73 (45) = happyShift action_94
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (46) = happyShift action_89
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (46) = happyShift action_88
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (28) = happyShift action_87
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (64) = happyShift action_47
action_77 (11) = happyGoto action_86
action_77 (27) = happyGoto action_56
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_18

action_79 _ = happyReduce_28

action_80 (47) = happyShift action_85
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (30) = happyShift action_40
action_81 (31) = happyShift action_41
action_81 (32) = happyShift action_42
action_81 (23) = happyGoto action_84
action_81 (24) = happyGoto action_37
action_81 (25) = happyGoto action_38
action_81 (26) = happyGoto action_39
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (28) = happyShift action_83
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (29) = happyShift action_67
action_83 (30) = happyShift action_40
action_83 (31) = happyShift action_41
action_83 (32) = happyShift action_42
action_83 (33) = happyShift action_68
action_83 (34) = happyShift action_69
action_83 (42) = happyShift action_70
action_83 (46) = happyShift action_71
action_83 (50) = happyShift action_72
action_83 (63) = happyShift action_73
action_83 (64) = happyShift action_47
action_83 (66) = happyShift action_74
action_83 (67) = happyShift action_75
action_83 (17) = happyGoto action_208
action_83 (20) = happyGoto action_209
action_83 (21) = happyGoto action_210
action_83 (22) = happyGoto action_211
action_83 (24) = happyGoto action_63
action_83 (25) = happyGoto action_64
action_83 (26) = happyGoto action_65
action_83 (27) = happyGoto action_212
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (47) = happyShift action_207
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (48) = happyShift action_22
action_85 (51) = happyShift action_23
action_85 (13) = happyGoto action_206
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_20

action_87 (48) = happyShift action_204
action_87 (55) = happyShift action_205
action_87 (18) = happyGoto action_203
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (50) = happyShift action_202
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (32) = happyShift action_42
action_89 (50) = happyShift action_201
action_89 (26) = happyGoto action_200
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (29) = happyShift action_67
action_90 (32) = happyShift action_42
action_90 (42) = happyShift action_70
action_90 (46) = happyShift action_100
action_90 (63) = happyShift action_73
action_90 (66) = happyShift action_74
action_90 (20) = happyGoto action_198
action_90 (26) = happyGoto action_199
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (29) = happyShift action_67
action_91 (32) = happyShift action_42
action_91 (42) = happyShift action_70
action_91 (46) = happyShift action_100
action_91 (63) = happyShift action_73
action_91 (66) = happyShift action_74
action_91 (20) = happyGoto action_196
action_91 (26) = happyGoto action_197
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (29) = happyShift action_67
action_92 (32) = happyShift action_42
action_92 (42) = happyShift action_70
action_92 (46) = happyShift action_100
action_92 (63) = happyShift action_73
action_92 (66) = happyShift action_74
action_92 (20) = happyGoto action_194
action_92 (26) = happyGoto action_195
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (29) = happyShift action_67
action_93 (32) = happyShift action_42
action_93 (42) = happyShift action_70
action_93 (46) = happyShift action_100
action_93 (63) = happyShift action_73
action_93 (66) = happyShift action_74
action_93 (20) = happyGoto action_192
action_93 (26) = happyGoto action_193
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (29) = happyShift action_67
action_94 (32) = happyShift action_42
action_94 (42) = happyShift action_70
action_94 (46) = happyShift action_100
action_94 (63) = happyShift action_73
action_94 (66) = happyShift action_74
action_94 (20) = happyGoto action_190
action_94 (26) = happyGoto action_191
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (37) = happyShift action_119
action_95 (38) = happyShift action_120
action_95 (39) = happyShift action_121
action_95 (41) = happyShift action_122
action_95 (42) = happyShift action_123
action_95 (43) = happyShift action_124
action_95 (44) = happyShift action_125
action_95 (45) = happyShift action_126
action_95 (47) = happyShift action_189
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (39) = happyShift action_116
action_96 (47) = happyShift action_188
action_96 (61) = happyShift action_117
action_96 (62) = happyShift action_118
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (39) = happyShift action_115
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_89

action_99 _ = happyReduce_90

action_100 (29) = happyShift action_67
action_100 (32) = happyShift action_42
action_100 (42) = happyShift action_70
action_100 (46) = happyShift action_100
action_100 (63) = happyShift action_73
action_100 (66) = happyShift action_74
action_100 (20) = happyGoto action_187
action_100 (26) = happyGoto action_181
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_91

action_102 (30) = happyShift action_40
action_102 (31) = happyShift action_41
action_102 (32) = happyShift action_42
action_102 (64) = happyShift action_47
action_102 (24) = happyGoto action_183
action_102 (25) = happyGoto action_184
action_102 (26) = happyGoto action_185
action_102 (27) = happyGoto action_186
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (29) = happyShift action_67
action_103 (32) = happyShift action_42
action_103 (42) = happyShift action_70
action_103 (46) = happyShift action_100
action_103 (63) = happyShift action_73
action_103 (66) = happyShift action_74
action_103 (20) = happyGoto action_182
action_103 (26) = happyGoto action_181
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (29) = happyShift action_67
action_104 (32) = happyShift action_42
action_104 (42) = happyShift action_70
action_104 (46) = happyShift action_100
action_104 (63) = happyShift action_73
action_104 (66) = happyShift action_74
action_104 (20) = happyGoto action_180
action_104 (26) = happyGoto action_181
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (29) = happyShift action_67
action_105 (30) = happyShift action_40
action_105 (31) = happyShift action_41
action_105 (32) = happyShift action_42
action_105 (33) = happyShift action_68
action_105 (34) = happyShift action_69
action_105 (42) = happyShift action_70
action_105 (46) = happyShift action_71
action_105 (50) = happyShift action_72
action_105 (63) = happyShift action_73
action_105 (64) = happyShift action_47
action_105 (66) = happyShift action_74
action_105 (67) = happyShift action_75
action_105 (20) = happyGoto action_176
action_105 (21) = happyGoto action_177
action_105 (22) = happyGoto action_178
action_105 (24) = happyGoto action_63
action_105 (25) = happyGoto action_64
action_105 (26) = happyGoto action_65
action_105 (27) = happyGoto action_179
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (29) = happyShift action_67
action_106 (32) = happyShift action_42
action_106 (42) = happyShift action_70
action_106 (46) = happyShift action_100
action_106 (63) = happyShift action_175
action_106 (66) = happyShift action_74
action_106 (20) = happyGoto action_173
action_106 (26) = happyGoto action_174
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (29) = happyShift action_67
action_107 (32) = happyShift action_42
action_107 (42) = happyShift action_70
action_107 (46) = happyShift action_100
action_107 (63) = happyShift action_172
action_107 (66) = happyShift action_74
action_107 (20) = happyGoto action_170
action_107 (26) = happyGoto action_171
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (29) = happyShift action_67
action_108 (32) = happyShift action_42
action_108 (42) = happyShift action_70
action_108 (46) = happyShift action_100
action_108 (63) = happyShift action_169
action_108 (66) = happyShift action_74
action_108 (20) = happyGoto action_167
action_108 (26) = happyGoto action_168
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (29) = happyShift action_67
action_109 (32) = happyShift action_42
action_109 (42) = happyShift action_70
action_109 (46) = happyShift action_100
action_109 (63) = happyShift action_166
action_109 (66) = happyShift action_74
action_109 (20) = happyGoto action_164
action_109 (26) = happyGoto action_165
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (29) = happyShift action_67
action_110 (32) = happyShift action_42
action_110 (42) = happyShift action_70
action_110 (46) = happyShift action_100
action_110 (63) = happyShift action_163
action_110 (66) = happyShift action_74
action_110 (20) = happyGoto action_161
action_110 (26) = happyGoto action_162
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (29) = happyShift action_67
action_111 (30) = happyShift action_40
action_111 (31) = happyShift action_41
action_111 (32) = happyShift action_42
action_111 (33) = happyShift action_68
action_111 (34) = happyShift action_69
action_111 (42) = happyShift action_70
action_111 (46) = happyShift action_71
action_111 (50) = happyShift action_72
action_111 (63) = happyShift action_73
action_111 (64) = happyShift action_47
action_111 (66) = happyShift action_74
action_111 (67) = happyShift action_75
action_111 (20) = happyGoto action_148
action_111 (21) = happyGoto action_160
action_111 (22) = happyGoto action_97
action_111 (24) = happyGoto action_63
action_111 (25) = happyGoto action_64
action_111 (26) = happyGoto action_65
action_111 (27) = happyGoto action_66
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (29) = happyShift action_67
action_112 (30) = happyShift action_40
action_112 (31) = happyShift action_41
action_112 (32) = happyShift action_42
action_112 (33) = happyShift action_68
action_112 (34) = happyShift action_69
action_112 (42) = happyShift action_70
action_112 (46) = happyShift action_71
action_112 (50) = happyShift action_72
action_112 (63) = happyShift action_73
action_112 (64) = happyShift action_47
action_112 (66) = happyShift action_74
action_112 (67) = happyShift action_75
action_112 (20) = happyGoto action_148
action_112 (21) = happyGoto action_159
action_112 (22) = happyGoto action_97
action_112 (24) = happyGoto action_63
action_112 (25) = happyGoto action_64
action_112 (26) = happyGoto action_65
action_112 (27) = happyGoto action_66
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (64) = happyShift action_47
action_113 (27) = happyGoto action_158
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (64) = happyShift action_47
action_114 (27) = happyGoto action_157
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (32) = happyShift action_42
action_115 (50) = happyShift action_72
action_115 (22) = happyGoto action_155
action_115 (26) = happyGoto action_156
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (29) = happyShift action_67
action_116 (30) = happyShift action_40
action_116 (31) = happyShift action_41
action_116 (32) = happyShift action_42
action_116 (33) = happyShift action_68
action_116 (34) = happyShift action_69
action_116 (42) = happyShift action_70
action_116 (46) = happyShift action_71
action_116 (50) = happyShift action_72
action_116 (63) = happyShift action_73
action_116 (64) = happyShift action_47
action_116 (66) = happyShift action_74
action_116 (67) = happyShift action_75
action_116 (20) = happyGoto action_148
action_116 (21) = happyGoto action_153
action_116 (22) = happyGoto action_97
action_116 (24) = happyGoto action_63
action_116 (25) = happyGoto action_64
action_116 (26) = happyGoto action_154
action_116 (27) = happyGoto action_66
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (29) = happyShift action_67
action_117 (30) = happyShift action_40
action_117 (31) = happyShift action_41
action_117 (32) = happyShift action_42
action_117 (33) = happyShift action_68
action_117 (34) = happyShift action_69
action_117 (42) = happyShift action_70
action_117 (46) = happyShift action_71
action_117 (50) = happyShift action_72
action_117 (63) = happyShift action_73
action_117 (64) = happyShift action_47
action_117 (66) = happyShift action_74
action_117 (67) = happyShift action_75
action_117 (20) = happyGoto action_148
action_117 (21) = happyGoto action_151
action_117 (22) = happyGoto action_97
action_117 (24) = happyGoto action_63
action_117 (25) = happyGoto action_64
action_117 (26) = happyGoto action_152
action_117 (27) = happyGoto action_66
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (29) = happyShift action_67
action_118 (30) = happyShift action_40
action_118 (31) = happyShift action_41
action_118 (32) = happyShift action_42
action_118 (33) = happyShift action_68
action_118 (34) = happyShift action_69
action_118 (42) = happyShift action_70
action_118 (46) = happyShift action_71
action_118 (50) = happyShift action_72
action_118 (63) = happyShift action_73
action_118 (64) = happyShift action_47
action_118 (66) = happyShift action_74
action_118 (67) = happyShift action_75
action_118 (20) = happyGoto action_148
action_118 (21) = happyGoto action_149
action_118 (22) = happyGoto action_97
action_118 (24) = happyGoto action_63
action_118 (25) = happyGoto action_64
action_118 (26) = happyGoto action_150
action_118 (27) = happyGoto action_66
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (29) = happyShift action_67
action_119 (32) = happyShift action_42
action_119 (42) = happyShift action_70
action_119 (46) = happyShift action_100
action_119 (63) = happyShift action_73
action_119 (66) = happyShift action_74
action_119 (20) = happyGoto action_146
action_119 (26) = happyGoto action_147
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (29) = happyShift action_67
action_120 (32) = happyShift action_42
action_120 (42) = happyShift action_70
action_120 (46) = happyShift action_100
action_120 (63) = happyShift action_73
action_120 (66) = happyShift action_74
action_120 (20) = happyGoto action_144
action_120 (26) = happyGoto action_145
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (29) = happyShift action_67
action_121 (32) = happyShift action_42
action_121 (42) = happyShift action_70
action_121 (46) = happyShift action_100
action_121 (63) = happyShift action_73
action_121 (66) = happyShift action_74
action_121 (20) = happyGoto action_142
action_121 (26) = happyGoto action_143
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (29) = happyShift action_67
action_122 (32) = happyShift action_42
action_122 (42) = happyShift action_70
action_122 (46) = happyShift action_100
action_122 (63) = happyShift action_141
action_122 (66) = happyShift action_74
action_122 (20) = happyGoto action_139
action_122 (26) = happyGoto action_140
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (29) = happyShift action_67
action_123 (32) = happyShift action_42
action_123 (42) = happyShift action_70
action_123 (46) = happyShift action_100
action_123 (63) = happyShift action_138
action_123 (66) = happyShift action_74
action_123 (20) = happyGoto action_136
action_123 (26) = happyGoto action_137
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (29) = happyShift action_67
action_124 (32) = happyShift action_42
action_124 (42) = happyShift action_70
action_124 (46) = happyShift action_100
action_124 (63) = happyShift action_135
action_124 (66) = happyShift action_74
action_124 (20) = happyGoto action_133
action_124 (26) = happyGoto action_134
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (29) = happyShift action_67
action_125 (32) = happyShift action_42
action_125 (42) = happyShift action_70
action_125 (46) = happyShift action_100
action_125 (63) = happyShift action_132
action_125 (66) = happyShift action_74
action_125 (20) = happyGoto action_130
action_125 (26) = happyGoto action_131
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (29) = happyShift action_67
action_126 (32) = happyShift action_42
action_126 (42) = happyShift action_70
action_126 (46) = happyShift action_100
action_126 (63) = happyShift action_129
action_126 (66) = happyShift action_74
action_126 (20) = happyGoto action_127
action_126 (26) = happyGoto action_128
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_80

action_128 _ = happyReduce_82

action_129 (41) = happyShift action_90
action_129 (42) = happyShift action_91
action_129 (43) = happyShift action_92
action_129 (44) = happyShift action_93
action_129 (45) = happyShift action_94
action_129 _ = happyReduce_87

action_130 (45) = happyShift action_126
action_130 _ = happyReduce_72

action_131 (45) = happyShift action_110
action_131 _ = happyReduce_74

action_132 (41) = happyShift action_90
action_132 (42) = happyShift action_91
action_132 (43) = happyShift action_92
action_132 (44) = happyShift action_93
action_132 (45) = happyShift action_94
action_132 _ = happyReduce_79

action_133 (45) = happyShift action_126
action_133 _ = happyReduce_64

action_134 (45) = happyShift action_110
action_134 _ = happyReduce_66

action_135 (41) = happyShift action_90
action_135 (42) = happyShift action_91
action_135 (43) = happyShift action_92
action_135 (44) = happyShift action_93
action_135 (45) = happyShift action_94
action_135 _ = happyReduce_71

action_136 (43) = happyShift action_124
action_136 (44) = happyShift action_125
action_136 (45) = happyShift action_126
action_136 _ = happyReduce_56

action_137 (43) = happyShift action_108
action_137 (44) = happyShift action_109
action_137 (45) = happyShift action_110
action_137 _ = happyReduce_58

action_138 (41) = happyShift action_90
action_138 (42) = happyShift action_91
action_138 (43) = happyShift action_92
action_138 (44) = happyShift action_93
action_138 (45) = happyShift action_94
action_138 _ = happyReduce_63

action_139 (43) = happyShift action_124
action_139 (44) = happyShift action_125
action_139 (45) = happyShift action_126
action_139 _ = happyReduce_48

action_140 (43) = happyShift action_108
action_140 (44) = happyShift action_109
action_140 (45) = happyShift action_110
action_140 _ = happyReduce_50

action_141 (41) = happyShift action_90
action_141 (42) = happyShift action_91
action_141 (43) = happyShift action_92
action_141 (44) = happyShift action_93
action_141 (45) = happyShift action_94
action_141 _ = happyReduce_55

action_142 (41) = happyShift action_122
action_142 (42) = happyShift action_123
action_142 (43) = happyShift action_124
action_142 (44) = happyShift action_125
action_142 (45) = happyShift action_126
action_142 _ = happyReduce_107

action_143 (41) = happyShift action_106
action_143 (42) = happyShift action_107
action_143 (43) = happyShift action_108
action_143 (44) = happyShift action_109
action_143 (45) = happyShift action_110
action_143 _ = happyReduce_112

action_144 (41) = happyShift action_122
action_144 (42) = happyShift action_123
action_144 (43) = happyShift action_124
action_144 (44) = happyShift action_125
action_144 (45) = happyShift action_126
action_144 _ = happyReduce_101

action_145 (41) = happyShift action_106
action_145 (42) = happyShift action_107
action_145 (43) = happyShift action_108
action_145 (44) = happyShift action_109
action_145 (45) = happyShift action_110
action_145 _ = happyReduce_102

action_146 (41) = happyShift action_122
action_146 (42) = happyShift action_123
action_146 (43) = happyShift action_124
action_146 (44) = happyShift action_125
action_146 (45) = happyShift action_126
action_146 _ = happyReduce_104

action_147 (41) = happyShift action_106
action_147 (42) = happyShift action_107
action_147 (43) = happyShift action_108
action_147 (44) = happyShift action_109
action_147 (45) = happyShift action_110
action_147 _ = happyReduce_105

action_148 (37) = happyShift action_119
action_148 (38) = happyShift action_120
action_148 (39) = happyShift action_121
action_148 (41) = happyShift action_122
action_148 (42) = happyShift action_123
action_148 (43) = happyShift action_124
action_148 (44) = happyShift action_125
action_148 (45) = happyShift action_126
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (39) = happyShift action_116
action_149 (61) = happyShift action_117
action_149 _ = happyReduce_98

action_150 (37) = happyShift action_103
action_150 (38) = happyShift action_104
action_150 (39) = happyShift action_105
action_150 (41) = happyShift action_106
action_150 (42) = happyShift action_107
action_150 (43) = happyShift action_108
action_150 (44) = happyShift action_109
action_150 (45) = happyShift action_110
action_150 (61) = happyShift action_111
action_150 _ = happyReduce_99

action_151 (39) = happyShift action_116
action_151 _ = happyReduce_95

action_152 (37) = happyShift action_103
action_152 (38) = happyShift action_104
action_152 (39) = happyShift action_105
action_152 (41) = happyShift action_106
action_152 (42) = happyShift action_107
action_152 (43) = happyShift action_108
action_152 (44) = happyShift action_109
action_152 (45) = happyShift action_110
action_152 _ = happyReduce_96

action_153 _ = happyReduce_108

action_154 (37) = happyShift action_103
action_154 (38) = happyShift action_104
action_154 (41) = happyShift action_106
action_154 (42) = happyShift action_107
action_154 (43) = happyShift action_108
action_154 (44) = happyShift action_109
action_154 (45) = happyShift action_110
action_154 _ = happyReduce_116

action_155 _ = happyReduce_109

action_156 _ = happyReduce_114

action_157 _ = happyReduce_117

action_158 _ = happyReduce_119

action_159 (39) = happyShift action_116
action_159 (61) = happyShift action_117
action_159 _ = happyReduce_100

action_160 (39) = happyShift action_116
action_160 _ = happyReduce_97

action_161 _ = happyReduce_81

action_162 _ = happyReduce_83

action_163 (41) = happyShift action_90
action_163 (42) = happyShift action_91
action_163 (43) = happyShift action_92
action_163 (44) = happyShift action_93
action_163 (45) = happyShift action_94
action_163 _ = happyReduce_85

action_164 (45) = happyShift action_126
action_164 _ = happyReduce_73

action_165 (45) = happyShift action_110
action_165 _ = happyReduce_75

action_166 (41) = happyShift action_90
action_166 (42) = happyShift action_91
action_166 (43) = happyShift action_92
action_166 (44) = happyShift action_93
action_166 (45) = happyShift action_94
action_166 _ = happyReduce_77

action_167 (45) = happyShift action_126
action_167 _ = happyReduce_65

action_168 (45) = happyShift action_110
action_168 _ = happyReduce_67

action_169 (41) = happyShift action_90
action_169 (42) = happyShift action_91
action_169 (43) = happyShift action_92
action_169 (44) = happyShift action_93
action_169 (45) = happyShift action_94
action_169 _ = happyReduce_69

action_170 (43) = happyShift action_124
action_170 (44) = happyShift action_125
action_170 (45) = happyShift action_126
action_170 _ = happyReduce_57

action_171 (43) = happyShift action_108
action_171 (44) = happyShift action_109
action_171 (45) = happyShift action_110
action_171 _ = happyReduce_59

action_172 (41) = happyShift action_90
action_172 (42) = happyShift action_91
action_172 (43) = happyShift action_92
action_172 (44) = happyShift action_93
action_172 (45) = happyShift action_94
action_172 _ = happyReduce_61

action_173 (43) = happyShift action_124
action_173 (44) = happyShift action_125
action_173 (45) = happyShift action_126
action_173 _ = happyReduce_49

action_174 (43) = happyShift action_108
action_174 (44) = happyShift action_109
action_174 (45) = happyShift action_110
action_174 _ = happyReduce_51

action_175 (41) = happyShift action_90
action_175 (42) = happyShift action_91
action_175 (43) = happyShift action_92
action_175 (44) = happyShift action_93
action_175 (45) = happyShift action_94
action_175 _ = happyReduce_53

action_176 (37) = happyShift action_119
action_176 (38) = happyShift action_120
action_176 (41) = happyShift action_122
action_176 (42) = happyShift action_123
action_176 (43) = happyShift action_124
action_176 (44) = happyShift action_125
action_176 (45) = happyShift action_126
action_176 _ = happyReduce_111

action_177 _ = happyReduce_115

action_178 _ = happyReduce_113

action_179 _ = happyReduce_121

action_180 (41) = happyShift action_122
action_180 (42) = happyShift action_123
action_180 (43) = happyShift action_124
action_180 (44) = happyShift action_125
action_180 (45) = happyShift action_126
action_180 _ = happyReduce_103

action_181 (41) = happyShift action_106
action_181 (42) = happyShift action_107
action_181 (43) = happyShift action_108
action_181 (44) = happyShift action_109
action_181 (45) = happyShift action_110
action_181 _ = happyFail (happyExpListPerState 181)

action_182 (41) = happyShift action_122
action_182 (42) = happyShift action_123
action_182 (43) = happyShift action_124
action_182 (44) = happyShift action_125
action_182 (45) = happyShift action_126
action_182 _ = happyReduce_106

action_183 _ = happyReduce_118

action_184 _ = happyReduce_120

action_185 _ = happyReduce_122

action_186 _ = happyReduce_110

action_187 (41) = happyShift action_122
action_187 (42) = happyShift action_123
action_187 (43) = happyShift action_124
action_187 (44) = happyShift action_125
action_187 (45) = happyShift action_126
action_187 (47) = happyShift action_189
action_187 _ = happyFail (happyExpListPerState 187)

action_188 _ = happyReduce_123

action_189 _ = happyReduce_88

action_190 _ = happyReduce_86

action_191 _ = happyReduce_84

action_192 (45) = happyShift action_126
action_192 _ = happyReduce_78

action_193 (45) = happyShift action_110
action_193 _ = happyReduce_76

action_194 (45) = happyShift action_126
action_194 _ = happyReduce_70

action_195 (45) = happyShift action_110
action_195 _ = happyReduce_68

action_196 (43) = happyShift action_124
action_196 (44) = happyShift action_125
action_196 (45) = happyShift action_126
action_196 _ = happyReduce_62

action_197 (43) = happyShift action_108
action_197 (44) = happyShift action_109
action_197 (45) = happyShift action_110
action_197 _ = happyReduce_60

action_198 (43) = happyShift action_124
action_198 (44) = happyShift action_125
action_198 (45) = happyShift action_126
action_198 _ = happyReduce_54

action_199 (43) = happyShift action_108
action_199 (44) = happyShift action_109
action_199 (45) = happyShift action_110
action_199 _ = happyReduce_52

action_200 (47) = happyShift action_220
action_200 _ = happyFail (happyExpListPerState 200)

action_201 (47) = happyShift action_219
action_201 _ = happyFail (happyExpListPerState 201)

action_202 (28) = happyShift action_218
action_202 _ = happyFail (happyExpListPerState 202)

action_203 (47) = happyShift action_217
action_203 _ = happyFail (happyExpListPerState 203)

action_204 (29) = happyShift action_67
action_204 (30) = happyShift action_40
action_204 (31) = happyShift action_41
action_204 (32) = happyShift action_42
action_204 (33) = happyShift action_68
action_204 (34) = happyShift action_69
action_204 (42) = happyShift action_70
action_204 (46) = happyShift action_71
action_204 (50) = happyShift action_72
action_204 (63) = happyShift action_73
action_204 (64) = happyShift action_47
action_204 (66) = happyShift action_74
action_204 (67) = happyShift action_75
action_204 (17) = happyGoto action_215
action_204 (19) = happyGoto action_216
action_204 (20) = happyGoto action_209
action_204 (21) = happyGoto action_210
action_204 (22) = happyGoto action_211
action_204 (24) = happyGoto action_63
action_204 (25) = happyGoto action_64
action_204 (26) = happyGoto action_65
action_204 (27) = happyGoto action_212
action_204 _ = happyFail (happyExpListPerState 204)

action_205 _ = happyReduce_44

action_206 _ = happyReduce_14

action_207 (48) = happyShift action_22
action_207 (51) = happyShift action_23
action_207 (13) = happyGoto action_214
action_207 _ = happyFail (happyExpListPerState 207)

action_208 (47) = happyShift action_213
action_208 _ = happyFail (happyExpListPerState 208)

action_209 (37) = happyShift action_119
action_209 (38) = happyShift action_120
action_209 (39) = happyShift action_121
action_209 (41) = happyShift action_122
action_209 (42) = happyShift action_123
action_209 (43) = happyShift action_124
action_209 (44) = happyShift action_125
action_209 (45) = happyShift action_126
action_209 _ = happyReduce_40

action_210 (39) = happyShift action_116
action_210 (61) = happyShift action_117
action_210 (62) = happyShift action_118
action_210 _ = happyReduce_41

action_211 (39) = happyShift action_115
action_211 _ = happyReduce_42

action_212 (39) = happyShift action_102
action_212 _ = happyReduce_43

action_213 _ = happyReduce_16

action_214 _ = happyReduce_15

action_215 (28) = happyShift action_225
action_215 _ = happyReduce_46

action_216 (49) = happyShift action_224
action_216 _ = happyFail (happyExpListPerState 216)

action_217 _ = happyReduce_12

action_218 (32) = happyShift action_42
action_218 (50) = happyShift action_223
action_218 (64) = happyShift action_47
action_218 (26) = happyGoto action_221
action_218 (27) = happyGoto action_222
action_218 _ = happyFail (happyExpListPerState 218)

action_219 _ = happyReduce_93

action_220 _ = happyReduce_94

action_221 (47) = happyShift action_229
action_221 _ = happyFail (happyExpListPerState 221)

action_222 (47) = happyShift action_228
action_222 _ = happyFail (happyExpListPerState 222)

action_223 (47) = happyShift action_227
action_223 _ = happyFail (happyExpListPerState 223)

action_224 _ = happyReduce_45

action_225 (29) = happyShift action_67
action_225 (30) = happyShift action_40
action_225 (31) = happyShift action_41
action_225 (32) = happyShift action_42
action_225 (33) = happyShift action_68
action_225 (34) = happyShift action_69
action_225 (42) = happyShift action_70
action_225 (46) = happyShift action_71
action_225 (50) = happyShift action_72
action_225 (63) = happyShift action_73
action_225 (64) = happyShift action_47
action_225 (66) = happyShift action_74
action_225 (67) = happyShift action_75
action_225 (17) = happyGoto action_215
action_225 (19) = happyGoto action_226
action_225 (20) = happyGoto action_209
action_225 (21) = happyGoto action_210
action_225 (22) = happyGoto action_211
action_225 (24) = happyGoto action_63
action_225 (25) = happyGoto action_64
action_225 (26) = happyGoto action_65
action_225 (27) = happyGoto action_212
action_225 _ = happyFail (happyExpListPerState 225)

action_226 _ = happyReduce_47

action_227 _ = happyReduce_126

action_228 _ = happyReduce_127

action_229 _ = happyReduce_128

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

happyReduce_13 = happySpecReduce_2  9 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Union happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 7 9 happyReduction_14
happyReduction_14 ((HappyAbsSyn13  happy_var_7) `HappyStk`
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

happyReduce_15 = happyReduce 8 9 happyReduction_15
happyReduction_15 ((HappyAbsSyn13  happy_var_8) `HappyStk`
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

happyReduce_16 = happyReduce 8 9 happyReduction_16
happyReduction_16 (_ `HappyStk`
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

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn10
		 (Any
	)

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (FilteredList happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn11
		 (SimpleUrl happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn11
		 (UrlSeq happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  12 happyReduction_21
happyReduction_21 _
	_
	 =  HappyAbsSyn12
		 (BidirectJoin
	)

happyReduce_22 = happySpecReduce_2  12 happyReduction_22
happyReduction_22 _
	_
	 =  HappyAbsSyn12
		 (BidirectJoin
	)

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn12
		 (LeftJoin
	)

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn12
		 (RightJoin
	)

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (StrList happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  13 happyReduction_26
happyReduction_26 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn13
		 (StrListSingle happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  14 happyReduction_27
happyReduction_27 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn14
		 (SListEl happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  14 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn14
		 (SListSeq happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Always happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (ActionSeq happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 7 15 happyReduction_31
happyReduction_31 ((HappyAbsSyn15  happy_var_7) `HappyStk`
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

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignSubj happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  16 happyReduction_33
happyReduction_33 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignPred happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjUrl happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  16 happyReduction_35
happyReduction_35 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjStr happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  16 happyReduction_36
happyReduction_36 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjInt happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  16 happyReduction_37
happyReduction_37 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjBool happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happyReduce 8 16 happyReduction_38
happyReduction_38 (_ `HappyStk`
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

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  17 happyReduction_40
happyReduction_40 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn17
		 (IntLit happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  17 happyReduction_41
happyReduction_41 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (BoolLit happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn17
		 (StrLit happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  17 happyReduction_43
happyReduction_43 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn17
		 (UrlLit happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  18 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn18
		 (AnyLit
	)

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
happyReduction_52 (HappyAbsSyn26  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (PlusVO happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  20 happyReduction_53
happyReduction_53 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOV happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  20 happyReduction_54
happyReduction_54 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (PlusVI happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  20 happyReduction_55
happyReduction_55 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusIV happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  20 happyReduction_56
happyReduction_56 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  20 happyReduction_57
happyReduction_57 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  20 happyReduction_58
happyReduction_58 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  20 happyReduction_59
happyReduction_59 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  20 happyReduction_60
happyReduction_60 (HappyAbsSyn26  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (MinusVO happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  20 happyReduction_61
happyReduction_61 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOV happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  20 happyReduction_62
happyReduction_62 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (MinusVI happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  20 happyReduction_63
happyReduction_63 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusIV happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  20 happyReduction_64
happyReduction_64 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  20 happyReduction_65
happyReduction_65 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  20 happyReduction_66
happyReduction_66 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  20 happyReduction_67
happyReduction_67 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  20 happyReduction_68
happyReduction_68 (HappyAbsSyn26  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (TimesVO happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  20 happyReduction_69
happyReduction_69 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOV happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  20 happyReduction_70
happyReduction_70 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (TimesVI happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  20 happyReduction_71
happyReduction_71 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesIV happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  20 happyReduction_72
happyReduction_72 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  20 happyReduction_73
happyReduction_73 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  20 happyReduction_74
happyReduction_74 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  20 happyReduction_75
happyReduction_75 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  20 happyReduction_76
happyReduction_76 (HappyAbsSyn26  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (DivVO happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  20 happyReduction_77
happyReduction_77 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOV happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  20 happyReduction_78
happyReduction_78 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (DivVI happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  20 happyReduction_79
happyReduction_79 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivIV happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  20 happyReduction_80
happyReduction_80 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  20 happyReduction_81
happyReduction_81 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  20 happyReduction_82
happyReduction_82 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  20 happyReduction_83
happyReduction_83 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  20 happyReduction_84
happyReduction_84 (HappyAbsSyn26  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (ExpoVO happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  20 happyReduction_85
happyReduction_85 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOV happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  20 happyReduction_86
happyReduction_86 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (ExpoVI happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  20 happyReduction_87
happyReduction_87 (HappyTerminal (TokenVar _ happy_var_3))
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoIV happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  20 happyReduction_88
happyReduction_88 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_2  20 happyReduction_89
happyReduction_89 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateI happy_var_2
	)
happyReduction_89 _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_2  20 happyReduction_90
happyReduction_90 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateO happy_var_2
	)
happyReduction_90 _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_2  20 happyReduction_91
happyReduction_91 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn20
		 (NegateV happy_var_2
	)
happyReduction_91 _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_1  20 happyReduction_92
happyReduction_92 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn20
		 (QInt happy_var_1
	)
happyReduction_92 _  = notHappyAtAll 

happyReduce_93 = happyReduce 4 20 happyReduction_93
happyReduction_93 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (Length happy_var_3
	) `HappyStk` happyRest

happyReduce_94 = happyReduce 4 20 happyReduction_94
happyReduction_94 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (LengthObj
	) `HappyStk` happyRest

happyReduce_95 = happySpecReduce_3  21 happyReduction_95
happyReduction_95 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (And happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  21 happyReduction_96
happyReduction_96 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  21 happyReduction_97
happyReduction_97 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  21 happyReduction_98
happyReduction_98 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (Or happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  21 happyReduction_99
happyReduction_99 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  21 happyReduction_100
happyReduction_100 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  21 happyReduction_101
happyReduction_101 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  21 happyReduction_102
happyReduction_102 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_3  21 happyReduction_103
happyReduction_103 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_103 _ _ _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_3  21 happyReduction_104
happyReduction_104 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_104 _ _ _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_3  21 happyReduction_105
happyReduction_105 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_105 _ _ _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_3  21 happyReduction_106
happyReduction_106 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_106 _ _ _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_3  21 happyReduction_107
happyReduction_107 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_107 _ _ _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_3  21 happyReduction_108
happyReduction_108 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_108 _ _ _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_3  21 happyReduction_109
happyReduction_109 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_109 _ _ _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_3  21 happyReduction_110
happyReduction_110 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_110 _ _ _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_3  21 happyReduction_111
happyReduction_111 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_111 _ _ _  = notHappyAtAll 

happyReduce_112 = happySpecReduce_3  21 happyReduction_112
happyReduction_112 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_112 _ _ _  = notHappyAtAll 

happyReduce_113 = happySpecReduce_3  21 happyReduction_113
happyReduction_113 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_113 _ _ _  = notHappyAtAll 

happyReduce_114 = happySpecReduce_3  21 happyReduction_114
happyReduction_114 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_114 _ _ _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_3  21 happyReduction_115
happyReduction_115 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_115 _ _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_3  21 happyReduction_116
happyReduction_116 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_116 _ _ _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_3  21 happyReduction_117
happyReduction_117 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSU happy_var_1 happy_var_3
	)
happyReduction_117 _ _ _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_3  21 happyReduction_118
happyReduction_118 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUS happy_var_1 happy_var_3
	)
happyReduction_118 _ _ _  = notHappyAtAll 

happyReduce_119 = happySpecReduce_3  21 happyReduction_119
happyReduction_119 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn21
		 (EQPU happy_var_1 happy_var_3
	)
happyReduction_119 _ _ _  = notHappyAtAll 

happyReduce_120 = happySpecReduce_3  21 happyReduction_120
happyReduction_120 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUP happy_var_1 happy_var_3
	)
happyReduction_120 _ _ _  = notHappyAtAll 

happyReduce_121 = happySpecReduce_3  21 happyReduction_121
happyReduction_121 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOU happy_var_1 happy_var_3
	)
happyReduction_121 _ _ _  = notHappyAtAll 

happyReduce_122 = happySpecReduce_3  21 happyReduction_122
happyReduction_122 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUO happy_var_1 happy_var_3
	)
happyReduction_122 _ _ _  = notHappyAtAll 

happyReduce_123 = happySpecReduce_3  21 happyReduction_123
happyReduction_123 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_123 _ _ _  = notHappyAtAll 

happyReduce_124 = happySpecReduce_1  21 happyReduction_124
happyReduction_124 _
	 =  HappyAbsSyn21
		 (QTrue
	)

happyReduce_125 = happySpecReduce_1  21 happyReduction_125
happyReduction_125 _
	 =  HappyAbsSyn21
		 (QFalse
	)

happyReduce_126 = happyReduce 6 21 happyReduction_126
happyReduction_126 (_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (StartsWithStr happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_127 = happyReduce 6 21 happyReduction_127
happyReduction_127 (_ `HappyStk`
	(HappyAbsSyn27  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (StartsWithUrl happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_128 = happyReduce 6 21 happyReduction_128
happyReduction_128 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (StartsWithObj happy_var_3
	) `HappyStk` happyRest

happyReduce_129 = happySpecReduce_1  22 happyReduction_129
happyReduction_129 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn22
		 (QString happy_var_1
	)
happyReduction_129 _  = notHappyAtAll 

happyReduce_130 = happySpecReduce_1  23 happyReduction_130
happyReduction_130 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (S happy_var_1
	)
happyReduction_130 _  = notHappyAtAll 

happyReduce_131 = happySpecReduce_1  23 happyReduction_131
happyReduction_131 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn23
		 (P happy_var_1
	)
happyReduction_131 _  = notHappyAtAll 

happyReduce_132 = happySpecReduce_1  23 happyReduction_132
happyReduction_132 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn23
		 (O happy_var_1
	)
happyReduction_132 _  = notHappyAtAll 

happyReduce_133 = happySpecReduce_1  24 happyReduction_133
happyReduction_133 _
	 =  HappyAbsSyn24
		 (Subj
	)

happyReduce_134 = happySpecReduce_1  25 happyReduction_134
happyReduction_134 _
	 =  HappyAbsSyn25
		 (Pred
	)

happyReduce_135 = happySpecReduce_1  26 happyReduction_135
happyReduction_135 _
	 =  HappyAbsSyn26
		 (Obj
	)

happyReduce_136 = happySpecReduce_1  27 happyReduction_136
happyReduction_136 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn27
		 (NewUrl happy_var_1
	)
happyReduction_136 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 68 68 notHappyAtAll (HappyState action) sts stk []

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
	TokenLength _ -> cont 66;
	TokenStarts _ -> cont 67;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 68 tk tks = happyError' (tks, explist)
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
              PlusVO String Object | PlusOV Object String | PlusVI String IntExp | PlusIV IntExp String |
              MinusVO String Object | MinusOV Object String | MinusVI String IntExp | MinusIV IntExp String |
              TimesVO String Object | TimesOV Object String | TimesVI String IntExp | TimesIV IntExp String |
              DivVO String Object | DivOV Object String | DivVI String IntExp | DivIV IntExp String |
              ExpoVO String Object | ExpoOV Object String | ExpoVI String IntExp | ExpoIV IntExp String 
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
             | EQOV Object String
            --  | BoolVariable BoolExp | BoolObj Object
             | QTrue | QFalse
             | StartsWithStr String String | StartsWithUrl String Url
             | StartsWithObj String
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

data LiteralList = LiteralLst LiteralElems | AnyLit
     deriving Show

data LiteralElems = LiteralSeq Literal LiteralElems | SingleLit Literal 
     deriving Show

data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter FilterEl FilterEl LiteralList | Add Url Url Literal
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
