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
happyExpList = Happy_Data_Array.listArray (0,500) ([0,0,0,1920,1,0,0,7680,4,0,512,0,0,0,0,0,2,0,0,2048,0,0,0,128,0,0,0,512,0,0,0,8192,1,0,0,8204,0,0,0,32768,0,0,0,0,0,0,0,2048,0,0,0,8192,0,0,0,0,512,1,0,0,512,0,0,0,2,0,0,0,4,0,0,32768,3,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,896,128,0,0,0,2048,4,0,0,0,16864,0,0,0,16384,0,0,0,0,0,0,0,0,4,0,8192,0,0,0,0,0,0,0,32,0,0,0,0,0,2048,0,0,0,0,0,0,16384,0,0,8192,0,0,0,0,2048,0,0,0,8192,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,8707,49154,0,0,0,4,0,32768,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,3,0,0,32768,0,0,0,0,0,256,0,0,0,0,0,0,0,512,1,0,128,0,0,0,14336,0,0,0,0,0,4,0,0,0,0,0,0,63232,1,0,0,4096,16,12,0,16384,0,0,0,0,1,0,0,0,4,0,0,0,2012,3072,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,144,34,64,0,4032,2184,768,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,34831,8,3,0,0,0,8,0,0,0,32,0,224,0,0,0,0,0,0,0,0,4096,0,0,512,0,0,0,0,32768,64,0,49152,34831,8,3,0,0,0,0,0,56320,7,0,0,16384,0,48,0,0,1,0,0,128,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28672,31,0,0,0,1,192,0,0,4,0,0,0,16,0,0,0,24432,0,0,0,256,49153,0,0,0,0,0,0,0,0,0,0,144,34,64,0,896,0,512,0,2304,544,1024,0,9216,2176,4096,0,61440,8707,49154,0,16384,34818,0,1,0,8201,2,4,0,32804,8,16,0,144,34,64,0,576,136,256,0,16128,8736,3072,0,64512,34944,12288,0,0,0,32768,0,0,0,0,2,0,8,32,0,0,33020,136,48,0,0,4096,0,0,4032,2184,768,0,16128,8736,3072,0,9216,2176,4096,0,36864,8704,16384,0,16384,34818,0,1,0,8201,2,4,0,32804,8,16,0,144,34,64,0,576,136,256,0,2304,544,1024,0,0,0,0,0,0,16384,0,0,32768,3,0,0,32768,0,0,0,0,0,32,0,0,0,64,0,0,0,4608,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,16384,0,0,0,0,1,0,0,0,4,0,0,0,28,0,0,0,112,0,0,0,448,0,0,0,1792,0,0,0,7936,0,0,0,31744,0,0,0,61440,1,0,0,49152,7,0,0,0,31,0,0,0,124,0,0,0,4,256,0,0,2012,1024,0,0,64,0,0,0,32192,0,0,0,14,2,0,0,0,0,0,0,12288,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,16384,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,256,0,0,0,1024,0,0,0,4096,0,0,0,28672,0,0,0,49152,1,0,0,0,7,0,0,0,28,0,0,49152,124,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31744,0,0,0,61440,1,0,0,49152,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,256,0,0,16128,8736,3076,0,0,0,8,0,0,0,0,0,0,0,18,0,0,0,4,0,0,0,0,0,0,0,0,0,0,896,128,0,0,128,0,0,0,0,16384,0,0,0,8048,0,0,0,256,49152,0,0,1024,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64512,34944,12304,0,0,0,0,0,0,0,0,0,0
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

action_0 (56) = happyShift action_5
action_0 (57) = happyShift action_6
action_0 (58) = happyShift action_7
action_0 (59) = happyShift action_8
action_0 (65) = happyShift action_9
action_0 (4) = happyGoto action_10
action_0 (5) = happyGoto action_11
action_0 (6) = happyGoto action_3
action_0 (9) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (56) = happyShift action_5
action_1 (57) = happyShift action_6
action_1 (58) = happyShift action_7
action_1 (59) = happyShift action_8
action_1 (65) = happyShift action_9
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (9) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (38) = happyShift action_12
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (60) = happyShift action_24
action_3 _ = happyReduce_3

action_4 (52) = happyShift action_23
action_4 _ = happyReduce_5

action_5 (46) = happyShift action_22
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (46) = happyShift action_21
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (48) = happyShift action_19
action_7 (51) = happyShift action_20
action_7 (13) = happyGoto action_18
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (35) = happyShift action_15
action_8 (36) = happyShift action_16
action_8 (46) = happyShift action_17
action_8 (12) = happyGoto action_14
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (46) = happyShift action_13
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (66) = happyAccept
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (38) = happyShift action_12
action_11 _ = happyReduce_2

action_12 (38) = happyShift action_51
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (48) = happyShift action_30
action_13 (55) = happyShift action_31
action_13 (10) = happyGoto action_50
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (46) = happyShift action_49
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (36) = happyShift action_48
action_15 _ = happyReduce_24

action_16 (35) = happyShift action_47
action_16 _ = happyReduce_25

action_17 (30) = happyShift action_37
action_17 (31) = happyShift action_38
action_17 (32) = happyShift action_39
action_17 (23) = happyGoto action_43
action_17 (24) = happyGoto action_44
action_17 (25) = happyGoto action_45
action_17 (26) = happyGoto action_46
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_14

action_19 (51) = happyShift action_42
action_19 (14) = happyGoto action_41
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_27

action_21 (30) = happyShift action_37
action_21 (31) = happyShift action_38
action_21 (32) = happyShift action_39
action_21 (46) = happyShift action_40
action_21 (15) = happyGoto action_32
action_21 (16) = happyGoto action_33
action_21 (24) = happyGoto action_34
action_21 (25) = happyGoto action_35
action_21 (26) = happyGoto action_36
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (48) = happyShift action_30
action_22 (55) = happyShift action_31
action_22 (10) = happyGoto action_29
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (56) = happyShift action_5
action_23 (57) = happyShift action_6
action_23 (58) = happyShift action_7
action_23 (59) = happyShift action_8
action_23 (65) = happyShift action_9
action_23 (6) = happyGoto action_28
action_23 (9) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (63) = happyShift action_27
action_24 (7) = happyGoto action_25
action_24 (8) = happyGoto action_26
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_4

action_26 (63) = happyShift action_27
action_26 (7) = happyGoto action_82
action_26 (8) = happyGoto action_26
action_26 _ = happyReduce_7

action_27 (40) = happyShift action_81
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_6

action_29 (28) = happyShift action_80
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (64) = happyShift action_72
action_30 (11) = happyGoto action_78
action_30 (27) = happyGoto action_79
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_18

action_32 (47) = happyShift action_77
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (28) = happyShift action_76
action_33 _ = happyReduce_30

action_34 (40) = happyShift action_75
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (40) = happyShift action_74
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (40) = happyShift action_73
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_107

action_38 _ = happyReduce_108

action_39 _ = happyReduce_109

action_40 (29) = happyShift action_65
action_40 (30) = happyShift action_37
action_40 (31) = happyShift action_38
action_40 (32) = happyShift action_39
action_40 (33) = happyShift action_66
action_40 (34) = happyShift action_67
action_40 (42) = happyShift action_68
action_40 (46) = happyShift action_69
action_40 (50) = happyShift action_70
action_40 (63) = happyShift action_71
action_40 (64) = happyShift action_72
action_40 (20) = happyGoto action_58
action_40 (21) = happyGoto action_59
action_40 (22) = happyGoto action_60
action_40 (24) = happyGoto action_61
action_40 (25) = happyGoto action_62
action_40 (26) = happyGoto action_63
action_40 (27) = happyGoto action_64
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (49) = happyShift action_57
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (28) = happyShift action_56
action_42 _ = happyReduce_28

action_43 (28) = happyShift action_55
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_104

action_45 _ = happyReduce_105

action_46 _ = happyReduce_106

action_47 _ = happyReduce_22

action_48 _ = happyReduce_23

action_49 (30) = happyShift action_37
action_49 (31) = happyShift action_38
action_49 (32) = happyShift action_39
action_49 (23) = happyGoto action_54
action_49 (24) = happyGoto action_44
action_49 (25) = happyGoto action_45
action_49 (26) = happyGoto action_46
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (28) = happyShift action_53
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (51) = happyShift action_52
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_1

action_53 (48) = happyShift action_30
action_53 (55) = happyShift action_31
action_53 (10) = happyGoto action_130
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (28) = happyShift action_129
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (30) = happyShift action_37
action_55 (31) = happyShift action_38
action_55 (32) = happyShift action_39
action_55 (23) = happyGoto action_128
action_55 (24) = happyGoto action_44
action_55 (25) = happyGoto action_45
action_55 (26) = happyGoto action_46
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (51) = happyShift action_42
action_56 (14) = happyGoto action_127
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_26

action_58 (37) = happyShift action_119
action_58 (38) = happyShift action_120
action_58 (39) = happyShift action_121
action_58 (41) = happyShift action_122
action_58 (42) = happyShift action_123
action_58 (43) = happyShift action_124
action_58 (44) = happyShift action_125
action_58 (45) = happyShift action_126
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (39) = happyShift action_115
action_59 (47) = happyShift action_116
action_59 (61) = happyShift action_117
action_59 (62) = happyShift action_118
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (39) = happyShift action_114
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (39) = happyShift action_113
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (39) = happyShift action_112
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (37) = happyShift action_102
action_63 (38) = happyShift action_103
action_63 (39) = happyShift action_104
action_63 (41) = happyShift action_105
action_63 (42) = happyShift action_106
action_63 (43) = happyShift action_107
action_63 (44) = happyShift action_108
action_63 (45) = happyShift action_109
action_63 (61) = happyShift action_110
action_63 (62) = happyShift action_111
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (39) = happyShift action_101
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_70

action_66 _ = happyReduce_101

action_67 _ = happyReduce_102

action_68 (29) = happyShift action_65
action_68 (32) = happyShift action_39
action_68 (42) = happyShift action_68
action_68 (46) = happyShift action_100
action_68 (63) = happyShift action_71
action_68 (20) = happyGoto action_98
action_68 (26) = happyGoto action_99
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (29) = happyShift action_65
action_69 (30) = happyShift action_37
action_69 (31) = happyShift action_38
action_69 (32) = happyShift action_39
action_69 (33) = happyShift action_66
action_69 (34) = happyShift action_67
action_69 (42) = happyShift action_68
action_69 (46) = happyShift action_69
action_69 (50) = happyShift action_70
action_69 (63) = happyShift action_71
action_69 (64) = happyShift action_72
action_69 (20) = happyGoto action_96
action_69 (21) = happyGoto action_97
action_69 (22) = happyGoto action_60
action_69 (24) = happyGoto action_61
action_69 (25) = happyGoto action_62
action_69 (26) = happyGoto action_63
action_69 (27) = happyGoto action_64
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_103

action_71 _ = happyReduce_71

action_72 _ = happyReduce_110

action_73 (29) = happyShift action_65
action_73 (30) = happyShift action_37
action_73 (31) = happyShift action_38
action_73 (32) = happyShift action_39
action_73 (33) = happyShift action_66
action_73 (34) = happyShift action_67
action_73 (42) = happyShift action_68
action_73 (46) = happyShift action_69
action_73 (50) = happyShift action_70
action_73 (63) = happyShift action_71
action_73 (64) = happyShift action_72
action_73 (20) = happyGoto action_92
action_73 (21) = happyGoto action_93
action_73 (22) = happyGoto action_94
action_73 (24) = happyGoto action_61
action_73 (25) = happyGoto action_62
action_73 (26) = happyGoto action_63
action_73 (27) = happyGoto action_95
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (64) = happyShift action_72
action_74 (27) = happyGoto action_91
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (64) = happyShift action_72
action_75 (27) = happyGoto action_90
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (30) = happyShift action_37
action_76 (31) = happyShift action_38
action_76 (32) = happyShift action_39
action_76 (16) = happyGoto action_89
action_76 (24) = happyGoto action_34
action_76 (25) = happyGoto action_35
action_76 (26) = happyGoto action_36
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_13

action_78 (49) = happyShift action_88
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (28) = happyShift action_87
action_79 _ = happyReduce_20

action_80 (48) = happyShift action_30
action_80 (55) = happyShift action_31
action_80 (10) = happyGoto action_86
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (29) = happyShift action_65
action_81 (30) = happyShift action_37
action_81 (31) = happyShift action_38
action_81 (32) = happyShift action_39
action_81 (33) = happyShift action_66
action_81 (34) = happyShift action_67
action_81 (42) = happyShift action_68
action_81 (46) = happyShift action_69
action_81 (50) = happyShift action_70
action_81 (63) = happyShift action_71
action_81 (64) = happyShift action_72
action_81 (20) = happyGoto action_83
action_81 (21) = happyGoto action_84
action_81 (22) = happyGoto action_85
action_81 (24) = happyGoto action_61
action_81 (25) = happyGoto action_62
action_81 (26) = happyGoto action_63
action_81 (27) = happyGoto action_64
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_8

action_83 (37) = happyShift action_119
action_83 (38) = happyShift action_120
action_83 (39) = happyShift action_121
action_83 (41) = happyShift action_122
action_83 (42) = happyShift action_123
action_83 (43) = happyShift action_124
action_83 (44) = happyShift action_125
action_83 (45) = happyShift action_126
action_83 _ = happyReduce_9

action_84 (39) = happyShift action_115
action_84 (61) = happyShift action_117
action_84 (62) = happyShift action_118
action_84 _ = happyReduce_11

action_85 (39) = happyShift action_114
action_85 _ = happyReduce_10

action_86 (28) = happyShift action_188
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (64) = happyShift action_72
action_87 (11) = happyGoto action_187
action_87 (27) = happyGoto action_79
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_19

action_89 _ = happyReduce_31

action_90 _ = happyReduce_33

action_91 _ = happyReduce_34

action_92 (37) = happyShift action_119
action_92 (38) = happyShift action_120
action_92 (39) = happyShift action_121
action_92 (41) = happyShift action_122
action_92 (42) = happyShift action_123
action_92 (43) = happyShift action_124
action_92 (44) = happyShift action_125
action_92 (45) = happyShift action_126
action_92 _ = happyReduce_37

action_93 (39) = happyShift action_115
action_93 (61) = happyShift action_117
action_93 (62) = happyShift action_118
action_93 _ = happyReduce_38

action_94 (39) = happyShift action_114
action_94 _ = happyReduce_36

action_95 (39) = happyShift action_101
action_95 _ = happyReduce_35

action_96 (37) = happyShift action_119
action_96 (38) = happyShift action_120
action_96 (39) = happyShift action_121
action_96 (41) = happyShift action_122
action_96 (42) = happyShift action_123
action_96 (43) = happyShift action_124
action_96 (44) = happyShift action_125
action_96 (45) = happyShift action_126
action_96 (47) = happyShift action_186
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (39) = happyShift action_115
action_97 (47) = happyShift action_185
action_97 (61) = happyShift action_117
action_97 (62) = happyShift action_118
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_68

action_99 _ = happyReduce_69

action_100 (29) = happyShift action_65
action_100 (32) = happyShift action_39
action_100 (42) = happyShift action_68
action_100 (46) = happyShift action_100
action_100 (63) = happyShift action_71
action_100 (20) = happyGoto action_184
action_100 (26) = happyGoto action_178
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (30) = happyShift action_37
action_101 (31) = happyShift action_38
action_101 (32) = happyShift action_39
action_101 (64) = happyShift action_72
action_101 (24) = happyGoto action_180
action_101 (25) = happyGoto action_181
action_101 (26) = happyGoto action_182
action_101 (27) = happyGoto action_183
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (29) = happyShift action_65
action_102 (32) = happyShift action_39
action_102 (42) = happyShift action_68
action_102 (46) = happyShift action_100
action_102 (63) = happyShift action_71
action_102 (20) = happyGoto action_179
action_102 (26) = happyGoto action_178
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (29) = happyShift action_65
action_103 (32) = happyShift action_39
action_103 (42) = happyShift action_68
action_103 (46) = happyShift action_100
action_103 (63) = happyShift action_71
action_103 (20) = happyGoto action_177
action_103 (26) = happyGoto action_178
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (29) = happyShift action_65
action_104 (30) = happyShift action_37
action_104 (31) = happyShift action_38
action_104 (32) = happyShift action_39
action_104 (33) = happyShift action_66
action_104 (34) = happyShift action_67
action_104 (42) = happyShift action_68
action_104 (46) = happyShift action_69
action_104 (50) = happyShift action_70
action_104 (63) = happyShift action_71
action_104 (64) = happyShift action_72
action_104 (20) = happyGoto action_173
action_104 (21) = happyGoto action_174
action_104 (22) = happyGoto action_175
action_104 (24) = happyGoto action_61
action_104 (25) = happyGoto action_62
action_104 (26) = happyGoto action_63
action_104 (27) = happyGoto action_176
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (29) = happyShift action_65
action_105 (32) = happyShift action_39
action_105 (42) = happyShift action_68
action_105 (46) = happyShift action_100
action_105 (63) = happyShift action_71
action_105 (20) = happyGoto action_171
action_105 (26) = happyGoto action_172
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (29) = happyShift action_65
action_106 (32) = happyShift action_39
action_106 (42) = happyShift action_68
action_106 (46) = happyShift action_100
action_106 (63) = happyShift action_71
action_106 (20) = happyGoto action_169
action_106 (26) = happyGoto action_170
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (29) = happyShift action_65
action_107 (32) = happyShift action_39
action_107 (42) = happyShift action_68
action_107 (46) = happyShift action_100
action_107 (63) = happyShift action_71
action_107 (20) = happyGoto action_167
action_107 (26) = happyGoto action_168
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (29) = happyShift action_65
action_108 (32) = happyShift action_39
action_108 (42) = happyShift action_68
action_108 (46) = happyShift action_100
action_108 (63) = happyShift action_71
action_108 (20) = happyGoto action_165
action_108 (26) = happyGoto action_166
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (29) = happyShift action_65
action_109 (32) = happyShift action_39
action_109 (42) = happyShift action_68
action_109 (46) = happyShift action_100
action_109 (63) = happyShift action_71
action_109 (20) = happyGoto action_163
action_109 (26) = happyGoto action_164
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (29) = happyShift action_65
action_110 (30) = happyShift action_37
action_110 (31) = happyShift action_38
action_110 (32) = happyShift action_39
action_110 (33) = happyShift action_66
action_110 (34) = happyShift action_67
action_110 (42) = happyShift action_68
action_110 (46) = happyShift action_69
action_110 (50) = happyShift action_70
action_110 (63) = happyShift action_71
action_110 (64) = happyShift action_72
action_110 (20) = happyGoto action_58
action_110 (21) = happyGoto action_162
action_110 (22) = happyGoto action_60
action_110 (24) = happyGoto action_61
action_110 (25) = happyGoto action_62
action_110 (26) = happyGoto action_63
action_110 (27) = happyGoto action_64
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (29) = happyShift action_65
action_111 (30) = happyShift action_37
action_111 (31) = happyShift action_38
action_111 (32) = happyShift action_39
action_111 (33) = happyShift action_66
action_111 (34) = happyShift action_67
action_111 (42) = happyShift action_68
action_111 (46) = happyShift action_69
action_111 (50) = happyShift action_70
action_111 (63) = happyShift action_71
action_111 (64) = happyShift action_72
action_111 (20) = happyGoto action_58
action_111 (21) = happyGoto action_161
action_111 (22) = happyGoto action_60
action_111 (24) = happyGoto action_61
action_111 (25) = happyGoto action_62
action_111 (26) = happyGoto action_63
action_111 (27) = happyGoto action_64
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (64) = happyShift action_72
action_112 (27) = happyGoto action_160
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (64) = happyShift action_72
action_113 (27) = happyGoto action_159
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (32) = happyShift action_39
action_114 (50) = happyShift action_70
action_114 (22) = happyGoto action_157
action_114 (26) = happyGoto action_158
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (29) = happyShift action_65
action_115 (30) = happyShift action_37
action_115 (31) = happyShift action_38
action_115 (32) = happyShift action_39
action_115 (33) = happyShift action_66
action_115 (34) = happyShift action_67
action_115 (42) = happyShift action_68
action_115 (46) = happyShift action_69
action_115 (50) = happyShift action_70
action_115 (63) = happyShift action_71
action_115 (64) = happyShift action_72
action_115 (20) = happyGoto action_58
action_115 (21) = happyGoto action_155
action_115 (22) = happyGoto action_60
action_115 (24) = happyGoto action_61
action_115 (25) = happyGoto action_62
action_115 (26) = happyGoto action_156
action_115 (27) = happyGoto action_64
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (53) = happyShift action_154
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (29) = happyShift action_65
action_117 (30) = happyShift action_37
action_117 (31) = happyShift action_38
action_117 (32) = happyShift action_39
action_117 (33) = happyShift action_66
action_117 (34) = happyShift action_67
action_117 (42) = happyShift action_68
action_117 (46) = happyShift action_69
action_117 (50) = happyShift action_70
action_117 (63) = happyShift action_71
action_117 (64) = happyShift action_72
action_117 (20) = happyGoto action_58
action_117 (21) = happyGoto action_152
action_117 (22) = happyGoto action_60
action_117 (24) = happyGoto action_61
action_117 (25) = happyGoto action_62
action_117 (26) = happyGoto action_153
action_117 (27) = happyGoto action_64
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (29) = happyShift action_65
action_118 (30) = happyShift action_37
action_118 (31) = happyShift action_38
action_118 (32) = happyShift action_39
action_118 (33) = happyShift action_66
action_118 (34) = happyShift action_67
action_118 (42) = happyShift action_68
action_118 (46) = happyShift action_69
action_118 (50) = happyShift action_70
action_118 (63) = happyShift action_71
action_118 (64) = happyShift action_72
action_118 (20) = happyGoto action_58
action_118 (21) = happyGoto action_150
action_118 (22) = happyGoto action_60
action_118 (24) = happyGoto action_61
action_118 (25) = happyGoto action_62
action_118 (26) = happyGoto action_151
action_118 (27) = happyGoto action_64
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (29) = happyShift action_65
action_119 (32) = happyShift action_39
action_119 (42) = happyShift action_68
action_119 (46) = happyShift action_100
action_119 (63) = happyShift action_71
action_119 (20) = happyGoto action_148
action_119 (26) = happyGoto action_149
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (29) = happyShift action_65
action_120 (32) = happyShift action_39
action_120 (42) = happyShift action_68
action_120 (46) = happyShift action_100
action_120 (63) = happyShift action_71
action_120 (20) = happyGoto action_146
action_120 (26) = happyGoto action_147
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (29) = happyShift action_65
action_121 (32) = happyShift action_39
action_121 (42) = happyShift action_68
action_121 (46) = happyShift action_100
action_121 (63) = happyShift action_71
action_121 (20) = happyGoto action_144
action_121 (26) = happyGoto action_145
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (29) = happyShift action_65
action_122 (32) = happyShift action_39
action_122 (42) = happyShift action_68
action_122 (46) = happyShift action_100
action_122 (63) = happyShift action_71
action_122 (20) = happyGoto action_142
action_122 (26) = happyGoto action_143
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (29) = happyShift action_65
action_123 (32) = happyShift action_39
action_123 (42) = happyShift action_68
action_123 (46) = happyShift action_100
action_123 (63) = happyShift action_71
action_123 (20) = happyGoto action_140
action_123 (26) = happyGoto action_141
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (29) = happyShift action_65
action_124 (32) = happyShift action_39
action_124 (42) = happyShift action_68
action_124 (46) = happyShift action_100
action_124 (63) = happyShift action_71
action_124 (20) = happyGoto action_138
action_124 (26) = happyGoto action_139
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (29) = happyShift action_65
action_125 (32) = happyShift action_39
action_125 (42) = happyShift action_68
action_125 (46) = happyShift action_100
action_125 (63) = happyShift action_71
action_125 (20) = happyGoto action_136
action_125 (26) = happyGoto action_137
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (29) = happyShift action_65
action_126 (32) = happyShift action_39
action_126 (42) = happyShift action_68
action_126 (46) = happyShift action_100
action_126 (63) = happyShift action_71
action_126 (20) = happyGoto action_134
action_126 (26) = happyGoto action_135
action_126 _ = happyFail (happyExpListPerState 126)

action_127 _ = happyReduce_29

action_128 (47) = happyShift action_133
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (30) = happyShift action_37
action_129 (31) = happyShift action_38
action_129 (32) = happyShift action_39
action_129 (23) = happyGoto action_132
action_129 (24) = happyGoto action_44
action_129 (25) = happyGoto action_45
action_129 (26) = happyGoto action_46
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (28) = happyShift action_131
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (48) = happyShift action_190
action_131 (18) = happyGoto action_194
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (47) = happyShift action_193
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (48) = happyShift action_19
action_133 (51) = happyShift action_20
action_133 (13) = happyGoto action_192
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_63

action_135 _ = happyReduce_65

action_136 (45) = happyShift action_126
action_136 _ = happyReduce_59

action_137 (45) = happyShift action_109
action_137 _ = happyReduce_61

action_138 (45) = happyShift action_126
action_138 _ = happyReduce_55

action_139 (45) = happyShift action_109
action_139 _ = happyReduce_57

action_140 (43) = happyShift action_124
action_140 (44) = happyShift action_125
action_140 (45) = happyShift action_126
action_140 _ = happyReduce_51

action_141 (43) = happyShift action_107
action_141 (44) = happyShift action_108
action_141 (45) = happyShift action_109
action_141 _ = happyReduce_53

action_142 (43) = happyShift action_124
action_142 (44) = happyShift action_125
action_142 (45) = happyShift action_126
action_142 _ = happyReduce_47

action_143 (43) = happyShift action_107
action_143 (44) = happyShift action_108
action_143 (45) = happyShift action_109
action_143 _ = happyReduce_49

action_144 (41) = happyShift action_122
action_144 (42) = happyShift action_123
action_144 (43) = happyShift action_124
action_144 (44) = happyShift action_125
action_144 (45) = happyShift action_126
action_144 _ = happyReduce_84

action_145 (41) = happyShift action_105
action_145 (42) = happyShift action_106
action_145 (43) = happyShift action_107
action_145 (44) = happyShift action_108
action_145 (45) = happyShift action_109
action_145 _ = happyReduce_89

action_146 (41) = happyShift action_122
action_146 (42) = happyShift action_123
action_146 (43) = happyShift action_124
action_146 (44) = happyShift action_125
action_146 (45) = happyShift action_126
action_146 _ = happyReduce_78

action_147 (41) = happyShift action_105
action_147 (42) = happyShift action_106
action_147 (43) = happyShift action_107
action_147 (44) = happyShift action_108
action_147 (45) = happyShift action_109
action_147 _ = happyReduce_79

action_148 (41) = happyShift action_122
action_148 (42) = happyShift action_123
action_148 (43) = happyShift action_124
action_148 (44) = happyShift action_125
action_148 (45) = happyShift action_126
action_148 _ = happyReduce_81

action_149 (41) = happyShift action_105
action_149 (42) = happyShift action_106
action_149 (43) = happyShift action_107
action_149 (44) = happyShift action_108
action_149 (45) = happyShift action_109
action_149 _ = happyReduce_82

action_150 (39) = happyShift action_115
action_150 (61) = happyShift action_117
action_150 _ = happyReduce_75

action_151 (37) = happyShift action_102
action_151 (38) = happyShift action_103
action_151 (39) = happyShift action_104
action_151 (41) = happyShift action_105
action_151 (42) = happyShift action_106
action_151 (43) = happyShift action_107
action_151 (44) = happyShift action_108
action_151 (45) = happyShift action_109
action_151 (61) = happyShift action_110
action_151 _ = happyReduce_76

action_152 (39) = happyShift action_115
action_152 _ = happyReduce_72

action_153 (37) = happyShift action_102
action_153 (38) = happyShift action_103
action_153 (39) = happyShift action_104
action_153 (41) = happyShift action_105
action_153 (42) = happyShift action_106
action_153 (43) = happyShift action_107
action_153 (44) = happyShift action_108
action_153 (45) = happyShift action_109
action_153 _ = happyReduce_73

action_154 (30) = happyShift action_37
action_154 (31) = happyShift action_38
action_154 (32) = happyShift action_39
action_154 (46) = happyShift action_40
action_154 (15) = happyGoto action_191
action_154 (16) = happyGoto action_33
action_154 (24) = happyGoto action_34
action_154 (25) = happyGoto action_35
action_154 (26) = happyGoto action_36
action_154 _ = happyFail (happyExpListPerState 154)

action_155 _ = happyReduce_85

action_156 (37) = happyShift action_102
action_156 (38) = happyShift action_103
action_156 (41) = happyShift action_105
action_156 (42) = happyShift action_106
action_156 (43) = happyShift action_107
action_156 (44) = happyShift action_108
action_156 (45) = happyShift action_109
action_156 _ = happyReduce_93

action_157 _ = happyReduce_86

action_158 _ = happyReduce_91

action_159 _ = happyReduce_94

action_160 _ = happyReduce_96

action_161 (39) = happyShift action_115
action_161 (61) = happyShift action_117
action_161 _ = happyReduce_77

action_162 (39) = happyShift action_115
action_162 _ = happyReduce_74

action_163 _ = happyReduce_64

action_164 _ = happyReduce_66

action_165 (45) = happyShift action_126
action_165 _ = happyReduce_60

action_166 (45) = happyShift action_109
action_166 _ = happyReduce_62

action_167 (45) = happyShift action_126
action_167 _ = happyReduce_56

action_168 (45) = happyShift action_109
action_168 _ = happyReduce_58

action_169 (43) = happyShift action_124
action_169 (44) = happyShift action_125
action_169 (45) = happyShift action_126
action_169 _ = happyReduce_52

action_170 (43) = happyShift action_107
action_170 (44) = happyShift action_108
action_170 (45) = happyShift action_109
action_170 _ = happyReduce_54

action_171 (43) = happyShift action_124
action_171 (44) = happyShift action_125
action_171 (45) = happyShift action_126
action_171 _ = happyReduce_48

action_172 (43) = happyShift action_107
action_172 (44) = happyShift action_108
action_172 (45) = happyShift action_109
action_172 _ = happyReduce_50

action_173 (37) = happyShift action_119
action_173 (38) = happyShift action_120
action_173 (41) = happyShift action_122
action_173 (42) = happyShift action_123
action_173 (43) = happyShift action_124
action_173 (44) = happyShift action_125
action_173 (45) = happyShift action_126
action_173 _ = happyReduce_88

action_174 _ = happyReduce_92

action_175 _ = happyReduce_90

action_176 _ = happyReduce_98

action_177 (41) = happyShift action_122
action_177 (42) = happyShift action_123
action_177 (43) = happyShift action_124
action_177 (44) = happyShift action_125
action_177 (45) = happyShift action_126
action_177 _ = happyReduce_80

action_178 (41) = happyShift action_105
action_178 (42) = happyShift action_106
action_178 (43) = happyShift action_107
action_178 (44) = happyShift action_108
action_178 (45) = happyShift action_109
action_178 _ = happyFail (happyExpListPerState 178)

action_179 (41) = happyShift action_122
action_179 (42) = happyShift action_123
action_179 (43) = happyShift action_124
action_179 (44) = happyShift action_125
action_179 (45) = happyShift action_126
action_179 _ = happyReduce_83

action_180 _ = happyReduce_95

action_181 _ = happyReduce_97

action_182 _ = happyReduce_99

action_183 _ = happyReduce_87

action_184 (41) = happyShift action_122
action_184 (42) = happyShift action_123
action_184 (43) = happyShift action_124
action_184 (44) = happyShift action_125
action_184 (45) = happyShift action_126
action_184 (47) = happyShift action_186
action_184 _ = happyFail (happyExpListPerState 184)

action_185 _ = happyReduce_100

action_186 _ = happyReduce_67

action_187 _ = happyReduce_21

action_188 (48) = happyShift action_190
action_188 (18) = happyGoto action_189
action_188 _ = happyFail (happyExpListPerState 188)

action_189 (47) = happyShift action_205
action_189 _ = happyFail (happyExpListPerState 189)

action_190 (29) = happyShift action_65
action_190 (30) = happyShift action_37
action_190 (31) = happyShift action_38
action_190 (32) = happyShift action_39
action_190 (33) = happyShift action_66
action_190 (34) = happyShift action_67
action_190 (42) = happyShift action_68
action_190 (46) = happyShift action_69
action_190 (50) = happyShift action_70
action_190 (55) = happyShift action_204
action_190 (63) = happyShift action_71
action_190 (64) = happyShift action_72
action_190 (17) = happyGoto action_198
action_190 (19) = happyGoto action_199
action_190 (20) = happyGoto action_200
action_190 (21) = happyGoto action_201
action_190 (22) = happyGoto action_202
action_190 (24) = happyGoto action_61
action_190 (25) = happyGoto action_62
action_190 (26) = happyGoto action_63
action_190 (27) = happyGoto action_203
action_190 _ = happyFail (happyExpListPerState 190)

action_191 (54) = happyShift action_197
action_191 _ = happyFail (happyExpListPerState 191)

action_192 _ = happyReduce_15

action_193 (48) = happyShift action_19
action_193 (51) = happyShift action_20
action_193 (13) = happyGoto action_196
action_193 _ = happyFail (happyExpListPerState 193)

action_194 (47) = happyShift action_195
action_194 _ = happyFail (happyExpListPerState 194)

action_195 _ = happyReduce_17

action_196 _ = happyReduce_16

action_197 (30) = happyShift action_37
action_197 (31) = happyShift action_38
action_197 (32) = happyShift action_39
action_197 (46) = happyShift action_40
action_197 (15) = happyGoto action_208
action_197 (16) = happyGoto action_33
action_197 (24) = happyGoto action_34
action_197 (25) = happyGoto action_35
action_197 (26) = happyGoto action_36
action_197 _ = happyFail (happyExpListPerState 197)

action_198 (28) = happyShift action_207
action_198 _ = happyReduce_45

action_199 (49) = happyShift action_206
action_199 _ = happyFail (happyExpListPerState 199)

action_200 (37) = happyShift action_119
action_200 (38) = happyShift action_120
action_200 (39) = happyShift action_121
action_200 (41) = happyShift action_122
action_200 (42) = happyShift action_123
action_200 (43) = happyShift action_124
action_200 (44) = happyShift action_125
action_200 (45) = happyShift action_126
action_200 _ = happyReduce_40

action_201 (39) = happyShift action_115
action_201 (61) = happyShift action_117
action_201 (62) = happyShift action_118
action_201 _ = happyReduce_41

action_202 (39) = happyShift action_114
action_202 _ = happyReduce_42

action_203 (39) = happyShift action_101
action_203 _ = happyReduce_43

action_204 _ = happyReduce_39

action_205 _ = happyReduce_12

action_206 _ = happyReduce_44

action_207 (29) = happyShift action_65
action_207 (30) = happyShift action_37
action_207 (31) = happyShift action_38
action_207 (32) = happyShift action_39
action_207 (33) = happyShift action_66
action_207 (34) = happyShift action_67
action_207 (42) = happyShift action_68
action_207 (46) = happyShift action_69
action_207 (50) = happyShift action_70
action_207 (55) = happyShift action_204
action_207 (63) = happyShift action_71
action_207 (64) = happyShift action_72
action_207 (17) = happyGoto action_198
action_207 (19) = happyGoto action_209
action_207 (20) = happyGoto action_200
action_207 (21) = happyGoto action_201
action_207 (22) = happyGoto action_202
action_207 (24) = happyGoto action_61
action_207 (25) = happyGoto action_62
action_207 (26) = happyGoto action_63
action_207 (27) = happyGoto action_203
action_207 _ = happyFail (happyExpListPerState 207)

action_208 _ = happyReduce_32

action_209 _ = happyReduce_46

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 ((HappyTerminal (TokenFilename _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (WriteQuery happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (OutputQuery happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

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
happyReduction_31 (HappyAbsSyn16  happy_var_3)
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

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn17
		 (AnyLit
	)

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

happyReduce_44 = happySpecReduce_3  18 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (LiteralLst happy_var_2
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  19 happyReduction_45
happyReduction_45 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (SingleLit happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  19 happyReduction_46
happyReduction_46 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 (LiteralSeq happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  20 happyReduction_47
happyReduction_47 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  20 happyReduction_48
happyReduction_48 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  20 happyReduction_49
happyReduction_49 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  20 happyReduction_50
happyReduction_50 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  20 happyReduction_51
happyReduction_51 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  20 happyReduction_52
happyReduction_52 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  20 happyReduction_53
happyReduction_53 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  20 happyReduction_54
happyReduction_54 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  20 happyReduction_55
happyReduction_55 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  20 happyReduction_56
happyReduction_56 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  20 happyReduction_57
happyReduction_57 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  20 happyReduction_58
happyReduction_58 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  20 happyReduction_59
happyReduction_59 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  20 happyReduction_60
happyReduction_60 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  20 happyReduction_61
happyReduction_61 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  20 happyReduction_62
happyReduction_62 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  20 happyReduction_63
happyReduction_63 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  20 happyReduction_64
happyReduction_64 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  20 happyReduction_65
happyReduction_65 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  20 happyReduction_66
happyReduction_66 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn20
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  20 happyReduction_67
happyReduction_67 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_2  20 happyReduction_68
happyReduction_68 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateI happy_var_2
	)
happyReduction_68 _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_2  20 happyReduction_69
happyReduction_69 (HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (NegateO happy_var_2
	)
happyReduction_69 _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  20 happyReduction_70
happyReduction_70 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn20
		 (QInt happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  20 happyReduction_71
happyReduction_71 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn20
		 (IntVariable happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  21 happyReduction_72
happyReduction_72 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (And happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  21 happyReduction_73
happyReduction_73 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  21 happyReduction_74
happyReduction_74 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  21 happyReduction_75
happyReduction_75 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (Or happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  21 happyReduction_76
happyReduction_76 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  21 happyReduction_77
happyReduction_77 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  21 happyReduction_78
happyReduction_78 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  21 happyReduction_79
happyReduction_79 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  21 happyReduction_80
happyReduction_80 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  21 happyReduction_81
happyReduction_81 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  21 happyReduction_82
happyReduction_82 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  21 happyReduction_83
happyReduction_83 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  21 happyReduction_84
happyReduction_84 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  21 happyReduction_85
happyReduction_85 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  21 happyReduction_86
happyReduction_86 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  21 happyReduction_87
happyReduction_87 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  21 happyReduction_88
happyReduction_88 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  21 happyReduction_89
happyReduction_89 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  21 happyReduction_90
happyReduction_90 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  21 happyReduction_91
happyReduction_91 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  21 happyReduction_92
happyReduction_92 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  21 happyReduction_93
happyReduction_93 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  21 happyReduction_94
happyReduction_94 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn21
		 (EQSU happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  21 happyReduction_95
happyReduction_95 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUS happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  21 happyReduction_96
happyReduction_96 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn21
		 (EQPU happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_3  21 happyReduction_97
happyReduction_97 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUP happy_var_1 happy_var_3
	)
happyReduction_97 _ _ _  = notHappyAtAll 

happyReduce_98 = happySpecReduce_3  21 happyReduction_98
happyReduction_98 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn21
		 (EQOU happy_var_1 happy_var_3
	)
happyReduction_98 _ _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_3  21 happyReduction_99
happyReduction_99 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn21
		 (EQUO happy_var_1 happy_var_3
	)
happyReduction_99 _ _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_3  21 happyReduction_100
happyReduction_100 _
	(HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_100 _ _ _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_1  21 happyReduction_101
happyReduction_101 _
	 =  HappyAbsSyn21
		 (QTrue
	)

happyReduce_102 = happySpecReduce_1  21 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn21
		 (QFalse
	)

happyReduce_103 = happySpecReduce_1  22 happyReduction_103
happyReduction_103 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn22
		 (QString happy_var_1
	)
happyReduction_103 _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_1  23 happyReduction_104
happyReduction_104 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (S happy_var_1
	)
happyReduction_104 _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_1  23 happyReduction_105
happyReduction_105 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn23
		 (P happy_var_1
	)
happyReduction_105 _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_1  23 happyReduction_106
happyReduction_106 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn23
		 (O happy_var_1
	)
happyReduction_106 _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_1  24 happyReduction_107
happyReduction_107 _
	 =  HappyAbsSyn24
		 (Subj
	)

happyReduce_108 = happySpecReduce_1  25 happyReduction_108
happyReduction_108 _
	 =  HappyAbsSyn25
		 (Pred
	)

happyReduce_109 = happySpecReduce_1  26 happyReduction_109
happyReduction_109 _
	 =  HappyAbsSyn26
		 (Obj
	)

happyReduce_110 = happySpecReduce_1  27 happyReduction_110
happyReduction_110 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn27
		 (NewUrl happy_var_1
	)
happyReduction_110 _  = notHappyAtAll 

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
     
data Query = OutputQuery FilteredQuery | WriteQuery FilteredQuery String
     deriving Show

data FilteredQuery = NewQuery BasicQuery | WhereQuery BasicQuery CreateVars
     deriving Show
     
data BasicQuery = FuncStack Func | FuncStackSeq Func BasicQuery
     deriving Show

data Cond = Always Action | ActionSeq Action Action | If BoolExp Cond Cond
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
