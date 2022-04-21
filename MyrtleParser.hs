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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,469) ([0,0,0,480,0,0,0,240,0,0,2,0,0,0,0,64,0,0,8192,0,0,0,64,0,0,0,32,0,0,0,576,0,0,768,8,0,0,0,0,0,0,512,0,0,0,256,0,0,0,32768,0,0,0,16,0,0,0,4,0,0,28672,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,1792,256,0,0,0,512,1,0,0,0,15,0,0,0,64,0,0,0,0,0,0,0,16,0,4096,0,0,0,0,0,0,16384,0,0,0,0,0,0,2,0,0,0,0,0,16384,0,0,1024,0,0,0,0,32,0,0,0,16,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1008,546,192,0,0,128,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28672,0,0,0,0,0,1,0,0,0,0,0,128,0,0,0,1792,0,0,0,0,4096,0,0,0,0,0,0,28672,31,0,0,8192,32,24,0,4096,0,0,0,2048,0,0,0,1024,0,0,0,64384,32768,1,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9216,2176,4096,0,32256,17472,6144,0,0,0,0,0,0,0,0,0,0,0,0,0,2016,1092,384,0,0,0,128,0,0,0,64,0,56,0,0,0,0,0,0,0,0,16,0,16384,0,0,0,0,0,258,0,57344,17415,32772,1,0,0,0,0,0,4024,0,0,0,16,3072,0,0,8,0,0,128,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56320,7,0,0,2048,0,6,0,1024,0,0,0,512,0,0,0,32192,1,0,0,32896,24576,0,0,0,0,0,0,0,0,0,9216,2176,4096,0,7168,0,4096,0,2304,544,1024,0,1152,272,512,0,4032,2184,768,0,288,68,128,0,144,34,64,0,72,17,32,0,32804,8,16,0,16402,4,8,0,8255,34,12,32768,4127,17,6,0,0,0,2,0,0,0,1,32768,0,2,0,63488,4353,24577,0,0,0,4,0,32256,17472,6144,0,16128,8736,3072,0,1152,272,512,0,576,136,256,0,288,68,128,0,144,34,64,0,72,17,32,0,32804,8,16,0,16402,4,8,0,8201,2,4,0,0,0,0,0,0,1,0,49152,1,0,0,0,16384,0,0,0,16384,2,0,0,0,0,0,0,0,0,0,0,256,0,0,0,128,0,0,0,64,0,0,0,32,0,0,0,28,0,0,0,14,0,0,0,7,0,0,32768,3,0,0,61440,1,0,0,63488,0,0,0,31744,0,0,0,15872,0,0,0,7936,0,0,0,3968,0,0,0,16,1024,0,0,1006,512,0,0,4,0,0,32768,251,0,0,896,128,0,0,0,0,0,0,12288,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,32768,0,0,256,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,1024,0,0,0,512,0,0,0,256,0,0,0,224,0,0,0,112,0,0,0,56,0,0,0,28,0,0,38912,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63488,0,0,0,31744,0,0,0,15872,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1520,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1008,16930,192,0,0,32,0,0,56320,7,0,0,2048,0,6,0,1024,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,32768,4,0,0,0,0,0,14336,2048,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","Query","FilteredQuery","BasicQuery","CreateVars","CreateVar","Func","FilterEl","UrlList","JoinOption","SList","SListElem","Cond","Action","Literal","IntExp","BoolExp","StringExp","Node","Subject","Predicate","Object","Url","','","int","subj","pred","obj","true","false","'-l'","'-r'","'<'","'>'","deq","'='","'+'","'-'","'*'","'/'","'^'","'('","')'","'['","']'","string","filename","'|'","'?'","':'","'_'","filter","map","union","join","where","and","or","var","url","%eof"]
        bit_start = st Prelude.* 63
        bit_end = (st Prelude.+ 1) Prelude.* 63
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..62]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (54) = happyShift action_5
action_0 (55) = happyShift action_6
action_0 (56) = happyShift action_7
action_0 (57) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (5) = happyGoto action_10
action_0 (6) = happyGoto action_3
action_0 (9) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (54) = happyShift action_5
action_1 (55) = happyShift action_6
action_1 (56) = happyShift action_7
action_1 (57) = happyShift action_8
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (9) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (36) = happyShift action_11
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (58) = happyShift action_22
action_3 _ = happyReduce_3

action_4 (50) = happyShift action_21
action_4 _ = happyReduce_5

action_5 (44) = happyShift action_20
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (44) = happyShift action_19
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (46) = happyShift action_17
action_7 (49) = happyShift action_18
action_7 (13) = happyGoto action_16
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (33) = happyShift action_13
action_8 (34) = happyShift action_14
action_8 (44) = happyShift action_15
action_8 (12) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (63) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (36) = happyShift action_11
action_10 _ = happyReduce_2

action_11 (36) = happyShift action_48
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (44) = happyShift action_47
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (34) = happyShift action_46
action_13 _ = happyReduce_23

action_14 (33) = happyShift action_45
action_14 _ = happyReduce_24

action_15 (28) = happyShift action_35
action_15 (29) = happyShift action_36
action_15 (30) = happyShift action_37
action_15 (21) = happyGoto action_41
action_15 (22) = happyGoto action_42
action_15 (23) = happyGoto action_43
action_15 (24) = happyGoto action_44
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_14

action_17 (49) = happyShift action_40
action_17 (14) = happyGoto action_39
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_26

action_19 (28) = happyShift action_35
action_19 (29) = happyShift action_36
action_19 (30) = happyShift action_37
action_19 (44) = happyShift action_38
action_19 (15) = happyGoto action_30
action_19 (16) = happyGoto action_31
action_19 (22) = happyGoto action_32
action_19 (23) = happyGoto action_33
action_19 (24) = happyGoto action_34
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (46) = happyShift action_28
action_20 (53) = happyShift action_29
action_20 (10) = happyGoto action_27
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (54) = happyShift action_5
action_21 (55) = happyShift action_6
action_21 (56) = happyShift action_7
action_21 (57) = happyShift action_8
action_21 (6) = happyGoto action_26
action_21 (9) = happyGoto action_4
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (61) = happyShift action_25
action_22 (7) = happyGoto action_23
action_22 (8) = happyGoto action_24
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_4

action_24 (61) = happyShift action_25
action_24 (7) = happyGoto action_78
action_24 (8) = happyGoto action_24
action_24 _ = happyReduce_7

action_25 (38) = happyShift action_77
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_6

action_27 (26) = happyShift action_76
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (62) = happyShift action_68
action_28 (11) = happyGoto action_74
action_28 (25) = happyGoto action_75
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_17

action_30 (45) = happyShift action_73
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (26) = happyShift action_72
action_31 _ = happyReduce_29

action_32 (38) = happyShift action_71
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (38) = happyShift action_70
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (38) = happyShift action_69
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_102

action_36 _ = happyReduce_103

action_37 _ = happyReduce_104

action_38 (27) = happyShift action_61
action_38 (28) = happyShift action_35
action_38 (29) = happyShift action_36
action_38 (30) = happyShift action_37
action_38 (31) = happyShift action_62
action_38 (32) = happyShift action_63
action_38 (40) = happyShift action_64
action_38 (44) = happyShift action_65
action_38 (48) = happyShift action_66
action_38 (61) = happyShift action_67
action_38 (62) = happyShift action_68
action_38 (18) = happyGoto action_54
action_38 (19) = happyGoto action_55
action_38 (20) = happyGoto action_56
action_38 (22) = happyGoto action_57
action_38 (23) = happyGoto action_58
action_38 (24) = happyGoto action_59
action_38 (25) = happyGoto action_60
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (47) = happyShift action_53
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (26) = happyShift action_52
action_40 _ = happyReduce_27

action_41 (26) = happyShift action_51
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_99

action_43 _ = happyReduce_100

action_44 _ = happyReduce_101

action_45 _ = happyReduce_21

action_46 _ = happyReduce_22

action_47 (28) = happyShift action_35
action_47 (29) = happyShift action_36
action_47 (30) = happyShift action_37
action_47 (21) = happyGoto action_50
action_47 (22) = happyGoto action_42
action_47 (23) = happyGoto action_43
action_47 (24) = happyGoto action_44
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (49) = happyShift action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_1

action_50 (26) = happyShift action_125
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (28) = happyShift action_35
action_51 (29) = happyShift action_36
action_51 (30) = happyShift action_37
action_51 (21) = happyGoto action_124
action_51 (22) = happyGoto action_42
action_51 (23) = happyGoto action_43
action_51 (24) = happyGoto action_44
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (49) = happyShift action_40
action_52 (14) = happyGoto action_123
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_25

action_54 (35) = happyShift action_115
action_54 (36) = happyShift action_116
action_54 (37) = happyShift action_117
action_54 (39) = happyShift action_118
action_54 (40) = happyShift action_119
action_54 (41) = happyShift action_120
action_54 (42) = happyShift action_121
action_54 (43) = happyShift action_122
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (37) = happyShift action_111
action_55 (45) = happyShift action_112
action_55 (59) = happyShift action_113
action_55 (60) = happyShift action_114
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (37) = happyShift action_110
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (37) = happyShift action_109
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (37) = happyShift action_108
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (35) = happyShift action_98
action_59 (36) = happyShift action_99
action_59 (37) = happyShift action_100
action_59 (39) = happyShift action_101
action_59 (40) = happyShift action_102
action_59 (41) = happyShift action_103
action_59 (42) = happyShift action_104
action_59 (43) = happyShift action_105
action_59 (59) = happyShift action_106
action_59 (60) = happyShift action_107
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (37) = happyShift action_97
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_65

action_62 _ = happyReduce_96

action_63 _ = happyReduce_97

action_64 (27) = happyShift action_61
action_64 (30) = happyShift action_37
action_64 (40) = happyShift action_64
action_64 (44) = happyShift action_96
action_64 (61) = happyShift action_67
action_64 (18) = happyGoto action_94
action_64 (24) = happyGoto action_95
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (27) = happyShift action_61
action_65 (28) = happyShift action_35
action_65 (29) = happyShift action_36
action_65 (30) = happyShift action_37
action_65 (31) = happyShift action_62
action_65 (32) = happyShift action_63
action_65 (40) = happyShift action_64
action_65 (44) = happyShift action_65
action_65 (48) = happyShift action_66
action_65 (61) = happyShift action_67
action_65 (62) = happyShift action_68
action_65 (18) = happyGoto action_92
action_65 (19) = happyGoto action_93
action_65 (20) = happyGoto action_56
action_65 (22) = happyGoto action_57
action_65 (23) = happyGoto action_58
action_65 (24) = happyGoto action_59
action_65 (25) = happyGoto action_60
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_98

action_67 _ = happyReduce_66

action_68 _ = happyReduce_105

action_69 (27) = happyShift action_61
action_69 (28) = happyShift action_35
action_69 (29) = happyShift action_36
action_69 (30) = happyShift action_37
action_69 (31) = happyShift action_62
action_69 (32) = happyShift action_63
action_69 (40) = happyShift action_64
action_69 (44) = happyShift action_65
action_69 (48) = happyShift action_66
action_69 (61) = happyShift action_67
action_69 (62) = happyShift action_68
action_69 (18) = happyGoto action_88
action_69 (19) = happyGoto action_89
action_69 (20) = happyGoto action_90
action_69 (22) = happyGoto action_57
action_69 (23) = happyGoto action_58
action_69 (24) = happyGoto action_59
action_69 (25) = happyGoto action_91
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (62) = happyShift action_68
action_70 (25) = happyGoto action_87
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (62) = happyShift action_68
action_71 (25) = happyGoto action_86
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (28) = happyShift action_35
action_72 (29) = happyShift action_36
action_72 (30) = happyShift action_37
action_72 (16) = happyGoto action_85
action_72 (22) = happyGoto action_32
action_72 (23) = happyGoto action_33
action_72 (24) = happyGoto action_34
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_13

action_74 (47) = happyShift action_84
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (26) = happyShift action_83
action_75 _ = happyReduce_19

action_76 (46) = happyShift action_28
action_76 (53) = happyShift action_29
action_76 (10) = happyGoto action_82
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (27) = happyShift action_61
action_77 (28) = happyShift action_35
action_77 (29) = happyShift action_36
action_77 (30) = happyShift action_37
action_77 (31) = happyShift action_62
action_77 (32) = happyShift action_63
action_77 (40) = happyShift action_64
action_77 (44) = happyShift action_65
action_77 (48) = happyShift action_66
action_77 (61) = happyShift action_67
action_77 (62) = happyShift action_68
action_77 (18) = happyGoto action_79
action_77 (19) = happyGoto action_80
action_77 (20) = happyGoto action_81
action_77 (22) = happyGoto action_57
action_77 (23) = happyGoto action_58
action_77 (24) = happyGoto action_59
action_77 (25) = happyGoto action_60
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_8

action_79 (35) = happyShift action_115
action_79 (36) = happyShift action_116
action_79 (37) = happyShift action_117
action_79 (39) = happyShift action_118
action_79 (40) = happyShift action_119
action_79 (41) = happyShift action_120
action_79 (42) = happyShift action_121
action_79 (43) = happyShift action_122
action_79 _ = happyReduce_9

action_80 (37) = happyShift action_111
action_80 (59) = happyShift action_113
action_80 (60) = happyShift action_114
action_80 _ = happyReduce_11

action_81 (37) = happyShift action_110
action_81 _ = happyReduce_10

action_82 (26) = happyShift action_182
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (62) = happyShift action_68
action_83 (11) = happyGoto action_181
action_83 (25) = happyGoto action_75
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_18

action_85 _ = happyReduce_30

action_86 _ = happyReduce_32

action_87 _ = happyReduce_33

action_88 (35) = happyShift action_115
action_88 (36) = happyShift action_116
action_88 (37) = happyShift action_117
action_88 (39) = happyShift action_118
action_88 (40) = happyShift action_119
action_88 (41) = happyShift action_120
action_88 (42) = happyShift action_121
action_88 (43) = happyShift action_122
action_88 _ = happyReduce_36

action_89 (37) = happyShift action_111
action_89 (59) = happyShift action_113
action_89 (60) = happyShift action_114
action_89 _ = happyReduce_37

action_90 (37) = happyShift action_110
action_90 _ = happyReduce_35

action_91 (37) = happyShift action_97
action_91 _ = happyReduce_34

action_92 (35) = happyShift action_115
action_92 (36) = happyShift action_116
action_92 (37) = happyShift action_117
action_92 (39) = happyShift action_118
action_92 (40) = happyShift action_119
action_92 (41) = happyShift action_120
action_92 (42) = happyShift action_121
action_92 (43) = happyShift action_122
action_92 (45) = happyShift action_180
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (37) = happyShift action_111
action_93 (45) = happyShift action_179
action_93 (59) = happyShift action_113
action_93 (60) = happyShift action_114
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_63

action_95 _ = happyReduce_64

action_96 (27) = happyShift action_61
action_96 (30) = happyShift action_37
action_96 (40) = happyShift action_64
action_96 (44) = happyShift action_96
action_96 (61) = happyShift action_67
action_96 (18) = happyGoto action_178
action_96 (24) = happyGoto action_172
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (28) = happyShift action_35
action_97 (29) = happyShift action_36
action_97 (30) = happyShift action_37
action_97 (62) = happyShift action_68
action_97 (22) = happyGoto action_174
action_97 (23) = happyGoto action_175
action_97 (24) = happyGoto action_176
action_97 (25) = happyGoto action_177
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (27) = happyShift action_61
action_98 (30) = happyShift action_37
action_98 (40) = happyShift action_64
action_98 (44) = happyShift action_96
action_98 (61) = happyShift action_67
action_98 (18) = happyGoto action_173
action_98 (24) = happyGoto action_172
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (27) = happyShift action_61
action_99 (30) = happyShift action_37
action_99 (40) = happyShift action_64
action_99 (44) = happyShift action_96
action_99 (61) = happyShift action_67
action_99 (18) = happyGoto action_171
action_99 (24) = happyGoto action_172
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (27) = happyShift action_61
action_100 (28) = happyShift action_35
action_100 (29) = happyShift action_36
action_100 (30) = happyShift action_37
action_100 (31) = happyShift action_62
action_100 (32) = happyShift action_63
action_100 (40) = happyShift action_64
action_100 (44) = happyShift action_65
action_100 (48) = happyShift action_66
action_100 (61) = happyShift action_67
action_100 (62) = happyShift action_68
action_100 (18) = happyGoto action_167
action_100 (19) = happyGoto action_168
action_100 (20) = happyGoto action_169
action_100 (22) = happyGoto action_57
action_100 (23) = happyGoto action_58
action_100 (24) = happyGoto action_59
action_100 (25) = happyGoto action_170
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (27) = happyShift action_61
action_101 (30) = happyShift action_37
action_101 (40) = happyShift action_64
action_101 (44) = happyShift action_96
action_101 (61) = happyShift action_67
action_101 (18) = happyGoto action_165
action_101 (24) = happyGoto action_166
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (27) = happyShift action_61
action_102 (30) = happyShift action_37
action_102 (40) = happyShift action_64
action_102 (44) = happyShift action_96
action_102 (61) = happyShift action_67
action_102 (18) = happyGoto action_163
action_102 (24) = happyGoto action_164
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (27) = happyShift action_61
action_103 (30) = happyShift action_37
action_103 (40) = happyShift action_64
action_103 (44) = happyShift action_96
action_103 (61) = happyShift action_67
action_103 (18) = happyGoto action_161
action_103 (24) = happyGoto action_162
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (27) = happyShift action_61
action_104 (30) = happyShift action_37
action_104 (40) = happyShift action_64
action_104 (44) = happyShift action_96
action_104 (61) = happyShift action_67
action_104 (18) = happyGoto action_159
action_104 (24) = happyGoto action_160
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (27) = happyShift action_61
action_105 (30) = happyShift action_37
action_105 (40) = happyShift action_64
action_105 (44) = happyShift action_96
action_105 (61) = happyShift action_67
action_105 (18) = happyGoto action_157
action_105 (24) = happyGoto action_158
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (27) = happyShift action_61
action_106 (28) = happyShift action_35
action_106 (29) = happyShift action_36
action_106 (30) = happyShift action_37
action_106 (31) = happyShift action_62
action_106 (32) = happyShift action_63
action_106 (40) = happyShift action_64
action_106 (44) = happyShift action_65
action_106 (48) = happyShift action_66
action_106 (61) = happyShift action_67
action_106 (62) = happyShift action_68
action_106 (18) = happyGoto action_54
action_106 (19) = happyGoto action_156
action_106 (20) = happyGoto action_56
action_106 (22) = happyGoto action_57
action_106 (23) = happyGoto action_58
action_106 (24) = happyGoto action_59
action_106 (25) = happyGoto action_60
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (27) = happyShift action_61
action_107 (28) = happyShift action_35
action_107 (29) = happyShift action_36
action_107 (30) = happyShift action_37
action_107 (31) = happyShift action_62
action_107 (32) = happyShift action_63
action_107 (40) = happyShift action_64
action_107 (44) = happyShift action_65
action_107 (48) = happyShift action_66
action_107 (61) = happyShift action_67
action_107 (62) = happyShift action_68
action_107 (18) = happyGoto action_54
action_107 (19) = happyGoto action_155
action_107 (20) = happyGoto action_56
action_107 (22) = happyGoto action_57
action_107 (23) = happyGoto action_58
action_107 (24) = happyGoto action_59
action_107 (25) = happyGoto action_60
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (62) = happyShift action_68
action_108 (25) = happyGoto action_154
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (62) = happyShift action_68
action_109 (25) = happyGoto action_153
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (30) = happyShift action_37
action_110 (48) = happyShift action_66
action_110 (20) = happyGoto action_151
action_110 (24) = happyGoto action_152
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (27) = happyShift action_61
action_111 (28) = happyShift action_35
action_111 (29) = happyShift action_36
action_111 (30) = happyShift action_37
action_111 (31) = happyShift action_62
action_111 (32) = happyShift action_63
action_111 (40) = happyShift action_64
action_111 (44) = happyShift action_65
action_111 (48) = happyShift action_66
action_111 (61) = happyShift action_67
action_111 (62) = happyShift action_68
action_111 (18) = happyGoto action_54
action_111 (19) = happyGoto action_149
action_111 (20) = happyGoto action_56
action_111 (22) = happyGoto action_57
action_111 (23) = happyGoto action_58
action_111 (24) = happyGoto action_150
action_111 (25) = happyGoto action_60
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (51) = happyShift action_148
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (27) = happyShift action_61
action_113 (28) = happyShift action_35
action_113 (29) = happyShift action_36
action_113 (30) = happyShift action_37
action_113 (31) = happyShift action_62
action_113 (32) = happyShift action_63
action_113 (40) = happyShift action_64
action_113 (44) = happyShift action_65
action_113 (48) = happyShift action_66
action_113 (61) = happyShift action_67
action_113 (62) = happyShift action_68
action_113 (18) = happyGoto action_54
action_113 (19) = happyGoto action_146
action_113 (20) = happyGoto action_56
action_113 (22) = happyGoto action_57
action_113 (23) = happyGoto action_58
action_113 (24) = happyGoto action_147
action_113 (25) = happyGoto action_60
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (27) = happyShift action_61
action_114 (28) = happyShift action_35
action_114 (29) = happyShift action_36
action_114 (30) = happyShift action_37
action_114 (31) = happyShift action_62
action_114 (32) = happyShift action_63
action_114 (40) = happyShift action_64
action_114 (44) = happyShift action_65
action_114 (48) = happyShift action_66
action_114 (61) = happyShift action_67
action_114 (62) = happyShift action_68
action_114 (18) = happyGoto action_54
action_114 (19) = happyGoto action_144
action_114 (20) = happyGoto action_56
action_114 (22) = happyGoto action_57
action_114 (23) = happyGoto action_58
action_114 (24) = happyGoto action_145
action_114 (25) = happyGoto action_60
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (27) = happyShift action_61
action_115 (30) = happyShift action_37
action_115 (40) = happyShift action_64
action_115 (44) = happyShift action_96
action_115 (61) = happyShift action_67
action_115 (18) = happyGoto action_142
action_115 (24) = happyGoto action_143
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (27) = happyShift action_61
action_116 (30) = happyShift action_37
action_116 (40) = happyShift action_64
action_116 (44) = happyShift action_96
action_116 (61) = happyShift action_67
action_116 (18) = happyGoto action_140
action_116 (24) = happyGoto action_141
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (27) = happyShift action_61
action_117 (30) = happyShift action_37
action_117 (40) = happyShift action_64
action_117 (44) = happyShift action_96
action_117 (61) = happyShift action_67
action_117 (18) = happyGoto action_138
action_117 (24) = happyGoto action_139
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (27) = happyShift action_61
action_118 (30) = happyShift action_37
action_118 (40) = happyShift action_64
action_118 (44) = happyShift action_96
action_118 (61) = happyShift action_67
action_118 (18) = happyGoto action_136
action_118 (24) = happyGoto action_137
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (27) = happyShift action_61
action_119 (30) = happyShift action_37
action_119 (40) = happyShift action_64
action_119 (44) = happyShift action_96
action_119 (61) = happyShift action_67
action_119 (18) = happyGoto action_134
action_119 (24) = happyGoto action_135
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (27) = happyShift action_61
action_120 (30) = happyShift action_37
action_120 (40) = happyShift action_64
action_120 (44) = happyShift action_96
action_120 (61) = happyShift action_67
action_120 (18) = happyGoto action_132
action_120 (24) = happyGoto action_133
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (27) = happyShift action_61
action_121 (30) = happyShift action_37
action_121 (40) = happyShift action_64
action_121 (44) = happyShift action_96
action_121 (61) = happyShift action_67
action_121 (18) = happyGoto action_130
action_121 (24) = happyGoto action_131
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (27) = happyShift action_61
action_122 (30) = happyShift action_37
action_122 (40) = happyShift action_64
action_122 (44) = happyShift action_96
action_122 (61) = happyShift action_67
action_122 (18) = happyGoto action_128
action_122 (24) = happyGoto action_129
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_28

action_124 (45) = happyShift action_127
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (28) = happyShift action_35
action_125 (29) = happyShift action_36
action_125 (30) = happyShift action_37
action_125 (21) = happyGoto action_126
action_125 (22) = happyGoto action_42
action_125 (23) = happyGoto action_43
action_125 (24) = happyGoto action_44
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (45) = happyShift action_190
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (46) = happyShift action_17
action_127 (49) = happyShift action_18
action_127 (13) = happyGoto action_189
action_127 _ = happyFail (happyExpListPerState 127)

action_128 _ = happyReduce_58

action_129 _ = happyReduce_60

action_130 (43) = happyShift action_122
action_130 _ = happyReduce_54

action_131 (43) = happyShift action_105
action_131 _ = happyReduce_56

action_132 (43) = happyShift action_122
action_132 _ = happyReduce_50

action_133 (43) = happyShift action_105
action_133 _ = happyReduce_52

action_134 (41) = happyShift action_120
action_134 (42) = happyShift action_121
action_134 (43) = happyShift action_122
action_134 _ = happyReduce_46

action_135 (41) = happyShift action_103
action_135 (42) = happyShift action_104
action_135 (43) = happyShift action_105
action_135 _ = happyReduce_48

action_136 (41) = happyShift action_120
action_136 (42) = happyShift action_121
action_136 (43) = happyShift action_122
action_136 _ = happyReduce_42

action_137 (41) = happyShift action_103
action_137 (42) = happyShift action_104
action_137 (43) = happyShift action_105
action_137 _ = happyReduce_44

action_138 (39) = happyShift action_118
action_138 (40) = happyShift action_119
action_138 (41) = happyShift action_120
action_138 (42) = happyShift action_121
action_138 (43) = happyShift action_122
action_138 _ = happyReduce_79

action_139 (39) = happyShift action_101
action_139 (40) = happyShift action_102
action_139 (41) = happyShift action_103
action_139 (42) = happyShift action_104
action_139 (43) = happyShift action_105
action_139 _ = happyReduce_84

action_140 (39) = happyShift action_118
action_140 (40) = happyShift action_119
action_140 (41) = happyShift action_120
action_140 (42) = happyShift action_121
action_140 (43) = happyShift action_122
action_140 _ = happyReduce_73

action_141 (39) = happyShift action_101
action_141 (40) = happyShift action_102
action_141 (41) = happyShift action_103
action_141 (42) = happyShift action_104
action_141 (43) = happyShift action_105
action_141 _ = happyReduce_74

action_142 (39) = happyShift action_118
action_142 (40) = happyShift action_119
action_142 (41) = happyShift action_120
action_142 (42) = happyShift action_121
action_142 (43) = happyShift action_122
action_142 _ = happyReduce_76

action_143 (39) = happyShift action_101
action_143 (40) = happyShift action_102
action_143 (41) = happyShift action_103
action_143 (42) = happyShift action_104
action_143 (43) = happyShift action_105
action_143 _ = happyReduce_77

action_144 (37) = happyShift action_111
action_144 (59) = happyShift action_113
action_144 _ = happyReduce_70

action_145 (35) = happyShift action_98
action_145 (36) = happyShift action_99
action_145 (37) = happyShift action_100
action_145 (39) = happyShift action_101
action_145 (40) = happyShift action_102
action_145 (41) = happyShift action_103
action_145 (42) = happyShift action_104
action_145 (43) = happyShift action_105
action_145 (59) = happyShift action_106
action_145 _ = happyReduce_71

action_146 (37) = happyShift action_111
action_146 _ = happyReduce_67

action_147 (35) = happyShift action_98
action_147 (36) = happyShift action_99
action_147 (37) = happyShift action_100
action_147 (39) = happyShift action_101
action_147 (40) = happyShift action_102
action_147 (41) = happyShift action_103
action_147 (42) = happyShift action_104
action_147 (43) = happyShift action_105
action_147 _ = happyReduce_68

action_148 (28) = happyShift action_35
action_148 (29) = happyShift action_36
action_148 (30) = happyShift action_37
action_148 (44) = happyShift action_38
action_148 (15) = happyGoto action_188
action_148 (16) = happyGoto action_31
action_148 (22) = happyGoto action_32
action_148 (23) = happyGoto action_33
action_148 (24) = happyGoto action_34
action_148 _ = happyFail (happyExpListPerState 148)

action_149 _ = happyReduce_80

action_150 (35) = happyShift action_98
action_150 (36) = happyShift action_99
action_150 (39) = happyShift action_101
action_150 (40) = happyShift action_102
action_150 (41) = happyShift action_103
action_150 (42) = happyShift action_104
action_150 (43) = happyShift action_105
action_150 _ = happyReduce_88

action_151 _ = happyReduce_81

action_152 _ = happyReduce_86

action_153 _ = happyReduce_89

action_154 _ = happyReduce_91

action_155 (37) = happyShift action_111
action_155 (59) = happyShift action_113
action_155 _ = happyReduce_72

action_156 (37) = happyShift action_111
action_156 _ = happyReduce_69

action_157 _ = happyReduce_59

action_158 _ = happyReduce_61

action_159 (43) = happyShift action_122
action_159 _ = happyReduce_55

action_160 (43) = happyShift action_105
action_160 _ = happyReduce_57

action_161 (43) = happyShift action_122
action_161 _ = happyReduce_51

action_162 (43) = happyShift action_105
action_162 _ = happyReduce_53

action_163 (41) = happyShift action_120
action_163 (42) = happyShift action_121
action_163 (43) = happyShift action_122
action_163 _ = happyReduce_47

action_164 (41) = happyShift action_103
action_164 (42) = happyShift action_104
action_164 (43) = happyShift action_105
action_164 _ = happyReduce_49

action_165 (41) = happyShift action_120
action_165 (42) = happyShift action_121
action_165 (43) = happyShift action_122
action_165 _ = happyReduce_43

action_166 (41) = happyShift action_103
action_166 (42) = happyShift action_104
action_166 (43) = happyShift action_105
action_166 _ = happyReduce_45

action_167 (35) = happyShift action_115
action_167 (36) = happyShift action_116
action_167 (39) = happyShift action_118
action_167 (40) = happyShift action_119
action_167 (41) = happyShift action_120
action_167 (42) = happyShift action_121
action_167 (43) = happyShift action_122
action_167 _ = happyReduce_83

action_168 _ = happyReduce_87

action_169 _ = happyReduce_85

action_170 _ = happyReduce_93

action_171 (39) = happyShift action_118
action_171 (40) = happyShift action_119
action_171 (41) = happyShift action_120
action_171 (42) = happyShift action_121
action_171 (43) = happyShift action_122
action_171 _ = happyReduce_75

action_172 (39) = happyShift action_101
action_172 (40) = happyShift action_102
action_172 (41) = happyShift action_103
action_172 (42) = happyShift action_104
action_172 (43) = happyShift action_105
action_172 _ = happyFail (happyExpListPerState 172)

action_173 (39) = happyShift action_118
action_173 (40) = happyShift action_119
action_173 (41) = happyShift action_120
action_173 (42) = happyShift action_121
action_173 (43) = happyShift action_122
action_173 _ = happyReduce_78

action_174 _ = happyReduce_90

action_175 _ = happyReduce_92

action_176 _ = happyReduce_94

action_177 _ = happyReduce_82

action_178 (39) = happyShift action_118
action_178 (40) = happyShift action_119
action_178 (41) = happyShift action_120
action_178 (42) = happyShift action_121
action_178 (43) = happyShift action_122
action_178 (45) = happyShift action_180
action_178 _ = happyFail (happyExpListPerState 178)

action_179 _ = happyReduce_95

action_180 _ = happyReduce_62

action_181 _ = happyReduce_20

action_182 (27) = happyShift action_61
action_182 (28) = happyShift action_35
action_182 (29) = happyShift action_36
action_182 (30) = happyShift action_37
action_182 (31) = happyShift action_62
action_182 (32) = happyShift action_63
action_182 (40) = happyShift action_64
action_182 (44) = happyShift action_65
action_182 (48) = happyShift action_66
action_182 (53) = happyShift action_187
action_182 (61) = happyShift action_67
action_182 (62) = happyShift action_68
action_182 (17) = happyGoto action_183
action_182 (18) = happyGoto action_184
action_182 (19) = happyGoto action_185
action_182 (20) = happyGoto action_186
action_182 (22) = happyGoto action_57
action_182 (23) = happyGoto action_58
action_182 (24) = happyGoto action_59
action_182 (25) = happyGoto action_60
action_182 _ = happyFail (happyExpListPerState 182)

action_183 (45) = happyShift action_193
action_183 _ = happyFail (happyExpListPerState 183)

action_184 (35) = happyShift action_115
action_184 (36) = happyShift action_116
action_184 (37) = happyShift action_117
action_184 (39) = happyShift action_118
action_184 (40) = happyShift action_119
action_184 (41) = happyShift action_120
action_184 (42) = happyShift action_121
action_184 (43) = happyShift action_122
action_184 _ = happyReduce_39

action_185 (37) = happyShift action_111
action_185 (59) = happyShift action_113
action_185 (60) = happyShift action_114
action_185 _ = happyReduce_40

action_186 (37) = happyShift action_110
action_186 _ = happyReduce_41

action_187 _ = happyReduce_38

action_188 (52) = happyShift action_192
action_188 _ = happyFail (happyExpListPerState 188)

action_189 _ = happyReduce_15

action_190 (46) = happyShift action_17
action_190 (49) = happyShift action_18
action_190 (13) = happyGoto action_191
action_190 _ = happyFail (happyExpListPerState 190)

action_191 _ = happyReduce_16

action_192 (28) = happyShift action_35
action_192 (29) = happyShift action_36
action_192 (30) = happyShift action_37
action_192 (44) = happyShift action_38
action_192 (15) = happyGoto action_194
action_192 (16) = happyGoto action_31
action_192 (22) = happyGoto action_32
action_192 (23) = happyGoto action_33
action_192 (24) = happyGoto action_34
action_192 _ = happyFail (happyExpListPerState 192)

action_193 _ = happyReduce_12

action_194 _ = happyReduce_31

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
happyReduction_9 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (IntVar happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (StringVar happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn19  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn8
		 (BoolVar happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 8 9 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_7) `HappyStk`
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
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (NormalJoin happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 8 9 happyReduction_16
happyReduction_16 ((HappyAbsSyn13  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Join happy_var_2 happy_var_4 happy_var_6 happy_var_8
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
happyReduction_19 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn11
		 (SimpleUrl happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
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
happyReduction_30 (HappyAbsSyn16  happy_var_3)
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
	(HappyAbsSyn19  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (If happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignSubj happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  16 happyReduction_33
happyReduction_33 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignPred happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjUrl happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  16 happyReduction_35
happyReduction_35 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjStr happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  16 happyReduction_36
happyReduction_36 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjInt happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  16 happyReduction_37
happyReduction_37 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn16
		 (AssignObjBool happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  17 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn17
		 (AnyLit
	)

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (IntLit happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  17 happyReduction_40
happyReduction_40 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn17
		 (BoolLit happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  17 happyReduction_41
happyReduction_41 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn17
		 (StrLit happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  18 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (PlusII happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  18 happyReduction_43
happyReduction_43 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (PlusOI happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  18 happyReduction_44
happyReduction_44 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (PlusIO happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (PlusOO happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  18 happyReduction_46
happyReduction_46 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (MinusII happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (MinusOI happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  18 happyReduction_48
happyReduction_48 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (MinusIO happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  18 happyReduction_49
happyReduction_49 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (MinusOO happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  18 happyReduction_50
happyReduction_50 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (TimesII happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  18 happyReduction_51
happyReduction_51 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (TimesOI happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  18 happyReduction_52
happyReduction_52 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (TimesIO happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  18 happyReduction_53
happyReduction_53 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (TimesOO happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  18 happyReduction_54
happyReduction_54 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (DivII happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  18 happyReduction_55
happyReduction_55 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (DivOI happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  18 happyReduction_56
happyReduction_56 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (DivIO happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  18 happyReduction_57
happyReduction_57 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (DivOO happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  18 happyReduction_58
happyReduction_58 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (ExpoII happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  18 happyReduction_59
happyReduction_59 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (ExpoOI happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  18 happyReduction_60
happyReduction_60 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (ExpoIO happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  18 happyReduction_61
happyReduction_61 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn18
		 (ExpoOO happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  18 happyReduction_62
happyReduction_62 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  18 happyReduction_63
happyReduction_63 (HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (NegateI happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_2  18 happyReduction_64
happyReduction_64 (HappyAbsSyn24  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (NegateO happy_var_2
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  18 happyReduction_65
happyReduction_65 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn18
		 (QInt happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  18 happyReduction_66
happyReduction_66 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn18
		 (IntVariable happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  19 happyReduction_67
happyReduction_67 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (And happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  19 happyReduction_68
happyReduction_68 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AndIO happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  19 happyReduction_69
happyReduction_69 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (AndOI happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  19 happyReduction_70
happyReduction_70 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (Or happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  19 happyReduction_71
happyReduction_71 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (OrIO happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  19 happyReduction_72
happyReduction_72 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (OrOI happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  19 happyReduction_73
happyReduction_73 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn19
		 (GTII happy_var_1 happy_var_3
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  19 happyReduction_74
happyReduction_74 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn19
		 (GTIO happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_3  19 happyReduction_75
happyReduction_75 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (GTOI happy_var_1 happy_var_3
	)
happyReduction_75 _ _ _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  19 happyReduction_76
happyReduction_76 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn19
		 (LTII happy_var_1 happy_var_3
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  19 happyReduction_77
happyReduction_77 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn19
		 (LTIO happy_var_1 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  19 happyReduction_78
happyReduction_78 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (LTOI happy_var_1 happy_var_3
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_3  19 happyReduction_79
happyReduction_79 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn19
		 (EQII happy_var_1 happy_var_3
	)
happyReduction_79 _ _ _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  19 happyReduction_80
happyReduction_80 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (EQBB happy_var_1 happy_var_3
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_3  19 happyReduction_81
happyReduction_81 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (EQSS happy_var_1 happy_var_3
	)
happyReduction_81 _ _ _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_3  19 happyReduction_82
happyReduction_82 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn19
		 (EQUU happy_var_1 happy_var_3
	)
happyReduction_82 _ _ _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  19 happyReduction_83
happyReduction_83 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (EQOI happy_var_1 happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_3  19 happyReduction_84
happyReduction_84 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn19
		 (EQIO happy_var_1 happy_var_3
	)
happyReduction_84 _ _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_3  19 happyReduction_85
happyReduction_85 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (EQOS happy_var_1 happy_var_3
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  19 happyReduction_86
happyReduction_86 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (EQSO happy_var_1 happy_var_3
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_3  19 happyReduction_87
happyReduction_87 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (EQOB happy_var_1 happy_var_3
	)
happyReduction_87 _ _ _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  19 happyReduction_88
happyReduction_88 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (EQBO happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_3  19 happyReduction_89
happyReduction_89 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn19
		 (EQSU happy_var_1 happy_var_3
	)
happyReduction_89 _ _ _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  19 happyReduction_90
happyReduction_90 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn19
		 (EQUS happy_var_1 happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  19 happyReduction_91
happyReduction_91 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn19
		 (EQPU happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  19 happyReduction_92
happyReduction_92 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn19
		 (EQUP happy_var_1 happy_var_3
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_3  19 happyReduction_93
happyReduction_93 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn19
		 (EQOU happy_var_1 happy_var_3
	)
happyReduction_93 _ _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  19 happyReduction_94
happyReduction_94 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn19
		 (EQUO happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  19 happyReduction_95
happyReduction_95 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (happy_var_2
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_1  19 happyReduction_96
happyReduction_96 _
	 =  HappyAbsSyn19
		 (QTrue
	)

happyReduce_97 = happySpecReduce_1  19 happyReduction_97
happyReduction_97 _
	 =  HappyAbsSyn19
		 (QFalse
	)

happyReduce_98 = happySpecReduce_1  20 happyReduction_98
happyReduction_98 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn20
		 (QString happy_var_1
	)
happyReduction_98 _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_1  21 happyReduction_99
happyReduction_99 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (S happy_var_1
	)
happyReduction_99 _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_1  21 happyReduction_100
happyReduction_100 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn21
		 (P happy_var_1
	)
happyReduction_100 _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_1  21 happyReduction_101
happyReduction_101 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn21
		 (O happy_var_1
	)
happyReduction_101 _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_1  22 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn22
		 (Subj
	)

happyReduce_103 = happySpecReduce_1  23 happyReduction_103
happyReduction_103 _
	 =  HappyAbsSyn23
		 (Pred
	)

happyReduce_104 = happySpecReduce_1  24 happyReduction_104
happyReduction_104 _
	 =  HappyAbsSyn24
		 (Obj
	)

happyReduce_105 = happySpecReduce_1  25 happyReduction_105
happyReduction_105 (HappyTerminal (TokenUrl _ happy_var_1))
	 =  HappyAbsSyn25
		 (NewUrl happy_var_1
	)
happyReduction_105 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 63 63 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenComma _ -> cont 26;
	TokenInt _ happy_dollar_dollar -> cont 27;
	TokenSubj _ -> cont 28;
	TokenPred _ -> cont 29;
	TokenObj _ -> cont 30;
	TokenTrue _ -> cont 31;
	TokenFalse _ -> cont 32;
	TokenLJoin _ -> cont 33;
	TokenRJoin _ -> cont 34;
	TokenLT _ -> cont 35;
	TokenGT _ -> cont 36;
	TokenDEQ _ -> cont 37;
	TokenEQ _ -> cont 38;
	TokenPlus _ -> cont 39;
	TokenMinus _ -> cont 40;
	TokenTimes _ -> cont 41;
	TokenDiv _ -> cont 42;
	TokenExp _ -> cont 43;
	TokenLParen _ -> cont 44;
	TokenRParen _ -> cont 45;
	TokenLBrack _ -> cont 46;
	TokenRBrack _ -> cont 47;
	TokenString _ happy_dollar_dollar -> cont 48;
	TokenFilename _ happy_dollar_dollar -> cont 49;
	TokenPipe _ -> cont 50;
	TokenQuestion _ -> cont 51;
	TokenColon _ -> cont 52;
	TokenAll _ -> cont 53;
	TokenFilter _ -> cont 54;
	TokenMap _ -> cont 55;
	TokenUnion _ -> cont 56;
	TokenJoin _ -> cont 57;
	TokenWhere _ -> cont 58;
	TokenAnd _ -> cont 59;
	TokenOr _ -> cont 60;
	TokenVar _ happy_dollar_dollar -> cont 61;
	TokenUrl _ happy_dollar_dollar -> cont 62;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 63 tk tks = happyError' (tks, explist)
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

data Literal = IntLit IntExp | BoolLit BoolExp | StrLit StringExp | AnyLit
     deriving Show

data Func = Map Cond | Union SList | NormalJoin Node Node SList | Join JoinOption Node Node SList |
            Filter FilterEl FilterEl Literal
     deriving Show
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
