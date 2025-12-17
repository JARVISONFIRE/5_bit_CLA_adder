.include TSMC_180nm.txt

.include and.cir
.include blackcell.cir
.include XOR2.cir
.include dff.cir

*.subckt AND2 P1 P2 P_out vdd gnd width_N width_P LAMBDA
*.subckt BLACKCELL P1 P2 G1 G2 P_out G_out vdd gnd width_N width_P LAMBDA
*.subckt XOR2 A B A_bar B_bar n1 n2 gnd width_N width_P LAMBDA
*.subckt DFF D clk Out Out_bar vdd gnd width_N width_P LAMBDA


.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 4*LAMBDA
.param width_N = 2*LAMBDA

.global vdd gnd
Vdd vdd gnd {SUPPLY}


.subckt INV A_in A_inbar 
M0  A_inbar  A_in vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M1  A_inbar  A_in gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.ends

VCLK clk 0 PULSE(0 1.8 0 10p 10p 5n 10n)

* PRE A INPUTS
VA0 pre_A0 0 PULSE(0 1.8  0n 10p 10p 20n 40n)
VA1 pre_A1 0 PULSE(0 1.8 10n 10p 10p 20n 40n)
VA2 pre_A2 0 PULSE(0 1.8 20n 10p 10p 20n 40n)
VA3 pre_A3 0 PULSE(0 1.8 30n 10p 10p 20n 40n)
VA4 pre_A4 0 PULSE(0 1.8 40n 10p 10p 20n 40n)

* PRE B INPUTS
VB0 pre_B0 0 PULSE(0 1.8  0n 10p 10p 30n 60n)
VB1 pre_B1 0 PULSE(0 1.8 15n 10p 10p 30n 60n)
VB2 pre_B2 0 PULSE(0 1.8 30n 10p 10p 30n 60n)
VB3 pre_B3 0 PULSE(0 1.8 45n 10p 10p 30n 60n)
VB4 pre_B4 0 PULSE(0 1.8 60n 10p 10p 30n 60n)


* SPICE3 file created from adder.ext - technology: scmos

.option scale=90n

M1000 S0 a_1199_746# vdd w_1224_741# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1001 a_97_n464# clk a_97_n481# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1002 a_97_n94# a_59_n94# vdd w_84_n100# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1003 vdd a_310_n230# a_686_n95# w_710_n81# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1004 a_16_n464# pre_B3 vdd w_3_n470# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1005 a_466_n138# A1 vdd w_490_n124# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1006 a_16_n284# pre_B0 vdd w_3_n290# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1007 A2 a_97_n94# vdd w_122_n99# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1008 a_1231_n360# a_1187_n343# a_1177_n195# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1009 a_1439_n1157# a_1396_n1174# a_1439_n1174# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1010 a_256_366# a_250_373# vdd w_242_378# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1011 a_1439_226# clk a_1389_226# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1012 a_879_n202# a_858_36# vdd w_905_47# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1013 a_723_n167# a_310_n230# a_686_n170# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1014 a_1477_243# clk a_1477_226# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1015 a_1439_n527# a_1396_n544# a_1439_n544# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1016 a_1477_243# a_1439_243# vdd w_1464_237# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1017 a_870_n292# a_858_n198# vdd w_905_n187# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1018 vdd B3 a_466_n258# w_490_n244# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1019 a_59_n284# clk vdd w_46_n290# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1020 a_59_n464# clk vdd w_46_n470# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1021 a_1396_n544# a_919_n277# a_1389_n544# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1022 P2 a_266_n213# a_256_n65# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1023 a_16_n51# pre_A1 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1024 a_310_n230# A2 a_256_n65# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1025 A3 a_97_n154# vdd w_122_n159# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1026 a_16_n421# clk a_16_n404# w_3_n410# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1027 a_1189_n1291# a_1145_n1274# a_1135_n1126# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1028 a_310_632# A0 B0 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1029 a_97_n94# clk a_97_n111# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1030 a_870_n292# a_858_n198# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1031 P1 A1 B1 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1032 a_723_n17# a_709_n17# a_686_n20# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1033 A3 a_97_n154# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1034 a_463_n58# B0 vdd w_450_n64# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1035 S3 a_1477_n677# vdd w_1502_n682# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1036 a_466_n258# A3 vdd w_490_n244# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1037 a_1189_n1291# a_310_n1092# a_1135_n1126# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1038 a_310_201# a_266_218# B1 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1039 a_16_n51# clk a_16_n34# w_3_n40# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1040 a_1231_n470# a_1187_n343# a_879_n202# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1041 a_256_n65# a_250_n58# vdd w_242_n53# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1042 a_1439_n237# clk vdd w_1426_n243# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1043 a_16_n301# pre_B0 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1044 S3 a_1477_n677# a_1389_n694# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1045 a_59_9# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1046 a_256_n65# a_250_n58# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1047 vdd B2 a_466_n198# w_490_n184# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1048 gnd a_461_n315# a_858_n276# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1049 P3 A3 a_256_n496# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1050 a_1118_746# a_310_632# vdd w_1105_740# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1051 P2 A2 B2 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1052 a_256_797# B0 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1053 a_16_n361# clk a_16_n344# w_3_n350# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1054 a_1189_n1401# a_1145_n1274# a_870_n292# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1055 a_1477_n544# a_1439_n527# a_1389_n544# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1056 a_16_n541# clk a_16_n524# w_3_n530# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1057 P0 A0 a_256_797# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1058 a_865_n25# a_461_n255# a_858_n42# w_852_n31# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1059 a_266_n213# A2 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1060 a_97_n214# clk a_97_n231# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1061 a_59_n301# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1062 P3 a_266_n644# a_256_n496# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1063 a_16_n214# pre_A4 vdd w_3_n220# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1064 P1 a_266_218# a_256_366# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1065 a_466_n198# A2 vdd w_490_n184# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1066 a_16_9# pre_A0 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1067 a_506_n75# a_463_n58# a_499_n56# w_492_n63# CMOSP w=6 l=2
+  ad=30p pd=22u as=30p ps=22u
M1068 vdd a_686_n170# a_681_n167# w_675_n155# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1069 a_97_n51# a_59_n34# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1070 a_16_n421# pre_B2 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1071 gnd a_686_n170# a_681_n167# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1072 a_59_n214# clk vdd w_46_n220# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1073 a_1396_n1174# a_1189_n1291# a_1389_n1174# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1074 a_1439_n677# a_1396_n694# a_1439_n694# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1075 a_506_n75# a_463_n58# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1076 vdd B4 a_466_n318# w_490_n304# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1077 a_97_n404# a_59_n404# vdd w_84_n410# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1078 a_1396_n694# a_1204_n782# a_1389_n694# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1079 a_310_n661# A3 B3 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1080 a_266_218# A1 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1081 a_1233_92# a_506_n75# a_310_201# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1082 a_16_n481# clk a_16_n464# w_3_n470# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1083 a_59_n34# clk vdd w_46_n40# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1084 a_97_n154# clk a_97_n171# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1085 a_16_n301# clk a_16_n284# w_3_n290# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1086 a_59_n421# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1087 a_310_n661# a_266_n644# B3 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1088 vdd a_506_n75# a_865_53# w_852_47# CMOSP w=8 l=2
+  ad=24p pd=14u as=24p ps=14u
M1089 a_16_n154# pre_A3 vdd w_3_n160# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1090 a_1161_729# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1091 a_466_n318# A4 vdd w_490_n304# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1092 a_1204_n782# a_1160_n765# a_1150_n617# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1093 a_1396_226# a_1233_92# a_1389_226# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1094 a_310_n230# A2 B2 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1095 a_1199_746# a_1161_746# vdd w_1186_740# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1096 a_723_58# a_310_201# a_686_55# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1097 a_97_26# clk a_97_9# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1098 a_16_n111# clk a_16_n94# w_3_n100# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1099 a_16_n541# pre_B4 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1100 a_16_n361# pre_B1 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1101 a_310_n1092# A4 B4 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1102 a_1204_n782# a_310_n661# a_1150_n617# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1103 a_310_632# a_266_649# B0 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1104 a_59_n154# clk vdd w_46_n160# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1105 a_1396_n254# clk a_1396_n237# w_1383_n243# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1106 a_97_n344# a_59_n344# vdd w_84_n350# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1107 a_97_n524# a_59_n524# vdd w_84_n530# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1108 a_1233_n18# a_506_n75# a_1179_257# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1109 a_858_n276# a_310_n1092# a_873_n276# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1110 a_1477_n1174# a_1439_n1157# a_1389_n1174# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1111 a_266_218# A1 vdd w_252_230# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1112 a_310_n1092# a_266_n1075# B4 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1113 a_1477_n694# a_1439_n677# a_1389_n694# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1114 a_1396_226# clk a_1396_243# w_1383_237# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1115 a_858_n42# a_310_n661# a_873_n42# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1116 gnd B4 a_503_n315# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1117 a_59_n361# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1118 a_59_n541# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1119 gnd B1 a_503_n135# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1120 P4 A4 a_256_n927# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1121 a_266_n644# A3 vdd w_252_n632# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1122 a_16_26# pre_A0 vdd w_3_20# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1123 a_1396_n237# a_1231_n360# vdd w_1383_n243# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1124 a_256_n927# a_250_n920# vdd w_242_n915# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1125 a_1204_n892# a_1160_n765# a_919_n121# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1126 a_1179_257# a_310_201# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1127 a_1439_n1157# clk vdd w_1426_n1163# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1128 a_1135_n1126# a_870_n292# gnd w_1121_n1114# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1129 a_873_n276# a_870_n292# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=12p ps=10u
M1130 a_256_n927# a_250_n920# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1131 P4 a_266_n1075# a_256_n927# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1132 a_266_n644# A3 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1133 a_1135_n1126# a_870_n292# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1134 gnd a_310_n230# a_723_n92# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1135 a_503_n315# A4 a_466_n318# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1136 a_1204_n892# a_310_n661# a_919_n121# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1137 a_16_n481# pre_B3 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1138 P0 a_266_649# a_256_797# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1139 a_1233_92# a_506_n75# a_1179_257# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1140 a_503_n135# A1 a_466_n138# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1141 a_59_n284# a_16_n301# a_59_n301# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1142 a_97_n464# a_59_n464# vdd w_84_n470# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1143 a_1477_n527# clk a_1477_n544# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1144 a_266_n213# A2 vdd w_252_n201# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1145 a_97_n284# a_59_n284# vdd w_84_n290# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1146 vdd a_709_n17# a_686_55# w_710_69# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1147 a_1231_n470# a_1187_n343# a_1177_n195# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1148 a_16_n231# clk a_16_n214# w_3_n220# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1149 a_256_n496# a_250_n489# vdd w_242_n484# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1150 gnd B3 a_503_n255# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1151 a_59_n481# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1152 vdd a_310_n230# a_686_n20# w_710_n6# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1153 a_59_n94# clk vdd w_46_n100# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1154 a_256_n496# a_250_n489# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1155 a_1179_257# a_310_201# vdd w_1165_269# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1156 P2 a_266_n213# B2 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1157 a_266_649# A0 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1158 gnd a_686_55# a_310_632# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1159 a_1439_243# a_1396_226# a_1439_226# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1160 a_16_n111# pre_A2 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1161 a_1477_n237# a_1439_n237# vdd w_1464_n243# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1162 a_1439_243# clk vdd w_1426_237# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1163 a_463_n75# B0 gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1164 a_503_n255# A3 a_466_n258# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1165 a_59_n404# a_16_n421# a_59_n421# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1166 a_1439_n254# clk a_1389_n254# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1167 a_1231_n360# a_1187_n343# a_879_n202# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1168 P4 A4 B4 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1169 a_16_n171# clk a_16_n154# w_3_n160# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1170 a_865_n181# a_851_n195# a_858_n198# w_852_n187# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1171 a_59_n111# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1172 a_97_n301# a_59_n284# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1173 gnd B2 a_503_n195# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1174 a_266_649# A0 vdd w_252_661# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1175 a_97_n34# clk a_97_n51# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1176 a_919_n121# a_858_n120# vdd w_905_n109# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1177 a_1439_n527# clk vdd w_1426_n533# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1178 vdd a_686_55# a_310_632# w_675_70# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1179 gnd a_461_n255# a_858_n42# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1180 P1 a_266_218# B1 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1181 gnd a_310_n230# a_723_n17# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1182 a_919_n121# a_858_n120# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1183 gnd a_851_n195# a_858_n198# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1184 a_16_n231# pre_A4 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1185 a_1233_n18# a_1189_109# a_1179_257# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1186 a_851_n195# a_858_n42# vdd w_905_n31# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1187 vdd a_466_n138# a_461_n135# w_455_n123# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1188 a_97_n214# a_59_n214# vdd w_84_n220# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1189 a_310_n661# a_266_n644# a_256_n496# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1190 a_1199_746# clk a_1199_729# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1191 vdd A0 a_463_n58# w_450_n64# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1192 a_503_n195# A2 a_466_n198# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1193 a_1477_n677# clk a_1477_n694# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1194 a_59_n524# a_16_n541# a_59_n541# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1195 a_1118_729# clk a_1118_746# w_1105_740# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1196 a_851_n195# a_858_n42# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1197 gnd a_466_n138# a_461_n135# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1198 gnd a_466_n318# a_461_n315# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1199 a_59_n344# a_16_n361# a_59_n361# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1200 vdd a_461_n195# a_865_n25# w_852_n31# CMOSP w=8 l=2
+  ad=24p pd=14u as=24p ps=14u
M1201 a_59_n231# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1202 a_97_n421# a_59_n404# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1203 a_310_n661# A3 a_256_n496# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1204 a_1396_n1174# clk a_1396_n1157# w_1383_n1163# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1205 a_858_36# a_310_201# a_873_36# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1206 S2 a_1477_n237# vdd w_1502_n242# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1207 vdd a_686_n95# a_310_n230# w_675_n80# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1208 a_1145_n1274# a_310_n1092# gnd w_1131_n1262# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1209 a_16_9# clk a_16_26# w_3_20# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1210 a_59_n51# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1211 S2 a_1477_n237# a_1389_n254# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1212 a_310_201# a_266_218# a_256_366# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1213 gnd a_686_n95# a_310_n230# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1214 a_16_n171# pre_A3 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1215 gnd a_461_n135# a_858_36# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1216 a_97_9# a_59_26# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1217 a_686_n95# a_310_n661# vdd w_710_n81# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1218 a_865_n103# a_461_n195# a_858_n120# w_852_n109# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1219 vdd a_466_n258# a_461_n255# w_455_n243# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1220 a_1145_n1274# a_310_n1092# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1221 P3 a_266_n644# B3 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1222 a_1189_109# a_506_n75# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1223 a_97_n154# a_59_n154# vdd w_84_n160# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1224 a_59_n464# a_16_n481# a_59_n481# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1225 vdd a_686_n20# a_681_n17# w_675_n5# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1226 gnd a_466_n258# a_461_n255# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1227 B0 a_97_n284# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1228 a_59_n171# clk gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1229 a_865_n181# a_879_n202# vdd w_852_n187# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1230 P3 A3 B3 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1231 a_97_n541# a_59_n524# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1232 a_97_n361# a_59_n344# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1233 gnd a_461_n195# a_858_n120# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1234 a_1150_n617# a_919_n121# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1235 a_1161_746# a_1118_729# a_1161_729# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1236 a_1231_n470# a_1228_n478# a_1177_n195# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1237 vdd a_709_n17# a_686_n170# w_710_n156# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1238 a_1161_746# clk vdd w_1148_740# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1239 a_1477_226# a_1439_243# a_1389_226# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1240 a_1477_n1157# clk a_1477_n1174# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1241 a_1439_n677# clk vdd w_1426_n683# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1242 a_1396_243# a_1233_92# vdd w_1383_237# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1243 a_1439_n237# a_1396_n254# a_1439_n254# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1244 P4 a_266_n1075# B4 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1245 a_1189_109# a_506_n75# vdd w_1175_121# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1246 a_686_55# a_310_201# vdd w_710_69# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1247 vdd a_466_n198# a_461_n195# w_455_n183# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1248 vdd a_310_n230# a_865_n181# w_852_n187# CMOSP w=8 l=2
+  ad=24p pd=14u as=24p ps=14u
M1249 a_858_n198# a_879_n202# a_873_n198# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1250 a_1396_n254# a_1231_n360# a_1389_n254# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1251 B2 a_97_n404# vdd w_122_n409# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1252 a_1439_n1174# clk a_1389_n1174# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1253 a_1396_n544# clk a_1396_n527# w_1383_n533# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1254 a_59_n94# a_16_n111# a_59_n111# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1255 a_919_n277# a_858_n276# vdd w_905_n265# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1256 gnd a_466_n198# a_461_n195# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1257 a_1189_n1401# a_310_n1092# a_1135_n1126# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1258 P0 a_266_649# B0 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1259 a_686_n170# a_310_n230# vdd w_710_n156# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1260 B2 a_97_n404# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1261 a_59_26# a_16_9# a_59_9# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1262 a_919_n277# a_858_n276# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1263 a_310_n1092# a_266_n1075# a_256_n927# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1264 a_1189_n1401# a_1145_n1274# a_1135_n1126# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1265 a_1396_n527# a_919_n277# vdd w_1383_n533# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1266 a_97_n481# a_59_n464# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1267 S1 a_1477_243# a_1389_226# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1268 a_97_26# a_59_26# vdd w_84_20# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1269 a_873_n198# a_310_n230# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=12p ps=10u
M1270 a_16_n34# pre_A1 vdd w_3_n40# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1271 a_1231_n360# a_310_n230# a_879_n202# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1272 a_310_n1092# A4 a_256_n927# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1273 a_1118_729# a_310_632# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1274 gnd a_686_n20# a_681_n17# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1275 vdd a_466_n318# a_461_n315# w_455_n303# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1276 a_266_n1075# A4 vdd w_252_n1063# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1277 B4 a_97_n524# vdd w_122_n529# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1278 a_1233_n18# a_506_n75# a_310_201# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1279 a_59_n214# a_16_n231# a_59_n231# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1280 a_310_n230# a_266_n213# B2 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1281 B1 a_97_n344# vdd w_122_n349# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1282 a_1189_n1291# a_310_n1092# a_870_n292# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1283 a_310_632# a_266_649# a_256_797# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1284 a_865_n103# a_310_n230# vdd w_852_n109# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1285 a_1231_n360# a_310_n230# a_1177_n195# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1286 a_97_n284# clk a_97_n301# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1287 a_266_n1075# A4 gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1288 a_1477_n254# a_1439_n237# a_1389_n254# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1289 B1 a_97_n344# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1290 B4 a_97_n524# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1291 a_97_n111# a_59_n94# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1292 S1 a_1477_243# vdd w_1502_238# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1293 a_865_n259# a_461_n315# a_858_n276# w_852_n265# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1294 a_1189_n1291# a_1145_n1274# a_870_n292# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1295 a_310_201# A1 a_256_366# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1296 a_1160_n765# a_310_n661# gnd w_1146_n753# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1297 a_1233_92# a_1189_109# a_310_201# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1298 a_858_n120# a_310_n230# a_873_n120# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1299 vdd a_461_n135# a_865_n103# w_852_n109# CMOSP w=8 l=2
+  ad=24p pd=14u as=24p ps=14u
M1300 a_1477_n527# a_1439_n527# vdd w_1464_n533# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1301 a_1160_n765# a_310_n661# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1302 A0 a_97_26# vdd w_122_21# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1303 a_1396_n694# clk a_1396_n677# w_1383_n683# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1304 a_59_n154# a_16_n171# a_59_n171# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1305 B0 a_97_n284# vdd w_122_n289# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1306 a_1187_n343# a_310_n230# vdd w_1173_n331# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1307 B3 a_97_n464# vdd w_122_n469# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1308 a_1439_n544# clk a_1389_n544# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1309 a_873_36# a_506_n75# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=12p ps=10u
M1310 a_97_n404# clk a_97_n421# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1311 a_1231_n470# a_1228_n478# a_879_n202# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1312 a_873_n120# a_461_n135# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=12p ps=10u
M1313 B3 a_97_n464# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1314 A0 a_97_26# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1315 a_97_n34# a_59_n34# vdd w_84_n40# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1316 a_97_n231# a_59_n214# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1317 a_1187_n343# a_310_n230# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1318 a_16_n404# pre_B2 vdd w_3_n410# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1319 a_1396_n1157# a_1189_n1291# vdd w_1383_n1163# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1320 a_1150_n617# a_919_n121# vdd w_1136_n605# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1321 a_686_n20# a_709_n17# vdd w_710_n6# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1322 a_463_n58# A0 a_463_n75# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1323 a_1396_n677# a_1204_n782# vdd w_1383_n683# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1324 a_1204_n892# a_310_n661# a_1150_n617# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1325 a_1199_729# a_1161_746# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1326 A1 a_97_n34# vdd w_122_n39# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1327 a_873_n42# a_461_n195# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=12p ps=10u
M1328 a_16_n94# pre_A2 vdd w_3_n100# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1329 a_310_201# A1 B1 vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1330 A1 a_97_n34# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1331 a_59_n404# clk vdd w_46_n410# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1332 a_1177_n195# a_879_n202# vdd w_1163_n183# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1333 a_1204_n892# a_1160_n765# a_1150_n617# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1334 P0 A0 B0 Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1335 a_1233_92# a_1189_109# a_1179_257# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1336 P2 A2 a_256_n65# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1337 A2 a_97_n94# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1338 a_1177_n195# a_879_n202# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1339 a_97_n524# clk a_97_n541# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1340 a_723_n92# a_310_n661# a_686_n95# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1341 a_97_n344# clk a_97_n361# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1342 a_1189_n1401# a_310_n1092# a_870_n292# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1343 S0 a_1199_746# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1344 a_59_26# clk vdd w_46_20# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1345 a_97_n171# a_59_n154# gnd Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1346 a_16_n344# pre_B1 vdd w_3_n350# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1347 C_out a_1477_n527# vdd w_1502_n532# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1348 a_16_n524# pre_B4 vdd w_3_n530# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1349 S4 a_1477_n1157# vdd w_1502_n1162# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1350 a_1204_n782# a_310_n661# a_919_n121# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1351 a_865_53# a_310_201# vdd w_852_47# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1352 a_310_n230# a_266_n213# a_256_n65# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1353 a_865_n259# a_310_n1092# vdd w_852_n265# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1354 a_256_366# a_250_373# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1355 a_59_n34# a_16_n51# a_59_n51# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1356 S4 a_1477_n1157# a_1389_n1174# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1357 a_1477_n1157# a_1439_n1157# vdd w_1464_n1163# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1358 C_out a_1477_n527# a_1389_n544# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1359 P1 A1 a_256_366# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1360 a_879_n202# a_858_36# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1361 a_1233_n18# a_1189_109# a_310_201# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1362 a_1477_n677# a_1439_n677# vdd w_1464_n683# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1363 a_59_n524# clk vdd w_46_n530# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1364 a_256_797# B0 vdd w_242_809# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1365 a_865_n25# a_310_n661# vdd w_852_n31# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1366 vdd B1 a_466_n138# w_490_n124# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1367 a_59_n344# clk vdd w_46_n350# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1368 a_1204_n782# a_1160_n765# a_919_n121# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1369 a_310_632# A0 a_256_797# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1370 A4 a_97_n214# vdd w_122_n219# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1371 a_1477_n237# clk a_1477_n254# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1372 gnd a_709_n17# a_723_58# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1373 a_865_53# a_461_n135# a_858_36# w_852_47# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1374 gnd a_709_n17# a_723_n167# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1375 a_1439_n694# clk a_1389_n694# Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1376 A4 a_97_n214# gnd Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
M1377 vdd a_870_n292# a_865_n259# w_852_n265# CMOSP w=8 l=2
+  ad=24p pd=14u as=24p ps=14u
C0 vdd clk 2.9221f
C1 a_1145_n1274# 0 3.623f 
C2 a_1189_n1401# 0 4.7787f 
C3 a_266_n1075# 0 3.623f 
C4 P4 0 4.7787f 
C5 a_1160_n765# 0 3.623f 
C6 a_1204_n892# 0 4.7787f 
C7 a_266_n644# 0 3.623f 
C8 P3 0 4.7725f 
C9 B4 0 9.2908f 
C10 a_310_n1092# 0 12.1689f 
C11 a_461_n315# 0 5.86857f 
C12 B3 0 5.06636f 
C13 a_870_n292# 0 19.1198f 
C14 A4 0 11.0146f 
C15 B2 0 3.09415f 
C16 a_1187_n343# 0 3.58992f 
C17 A3 0 6.27326f 
C18 a_1231_n470# 0 4.7787f 
C19 a_919_n121# 0 12.5724f 
C20 a_851_n195# 0 2.25728f 
C21 a_310_n661# 0 17.0221f 
C22 a_461_n195# 0 6.28324f 
C23 a_461_n255# 0 5.87706f 
C24 a_266_n213# 0 3.61612f 
C25 a_310_n230# 0 9.04023f 
C26 P2 0 4.77126f 
C27 A2 0 4.08455f 
C28 a_879_n202# 0 5.72461f 
C29 a_461_n135# 0 4.28293f 
C30 a_709_n17# 0 3.64394f 
C31 B1 0 8.35217f 
C32 a_1189_109# 0 3.623f 
C33 a_1233_n18# 0 4.7787f 
C34 a_310_201# 0 19.9983f 
C35 a_506_n75# 0 12.5067f 
C36 a_266_218# 0 3.623f 
C37 P1 0 4.53625f 
C38 A1 0 13.1347f 
C39 clk 0 34.654f 
C40 a_310_632# 0 8.62111f 
C41 gnd 0 77.6336f 
C42 vdd 0 62.72967f 
C43 B0 0 3.9782f 
C44 a_266_649# 0 3.623f 
C45 P0 0 4.7787f 
C46 A0 0 12.1487f 


.tran 0.1n 200n


.measure tran t_s0    TRIG v(clk) VAL=0.9 RISE=1  TARG v(P0) VAL=0.9 RISE=1
.measure tran t_s1    TRIG v(clk) VAL=0.9 RISE=1  TARG v(P1) VAL=0.9 RISE=1
.measure tran t_s2    TRIG v(clk) VAL=0.9 RISE=1  TARG v(P2) VAL=0.9 RISE=1
.measure tran t_s3    TRIG v(clk) VAL=0.9 RISE=1  TARG v(P3) VAL=0.9 RISE=1
.measure tran t_s4    TRIG v(clk) VAL=0.9 RISE=1  TARG v(P4) VAL=0.9 RISE=1
.measure tran t_cout  TRIG v(clk) VAL=0.9 RISE=1  TARG v(C_out) VAL=0.9 RISE=1

.control
  run
  print t_s0 t_s1 t_s2 t_s3 t_s4 t_cout
  plot v(P0)+10 v(P1)+8 v(P2)+6 v(P3)+4 v(P4)+2 v(C_out)
.endc


.end
