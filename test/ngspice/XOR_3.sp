.include TSMC_180nm.txt
.option scale=90n

.param SUPPLY=1.8
.global vdd gnd

Vdd vdd 0 {SUPPLY}

Va A 0 PULSE(0 {SUPPLY} 0 100p 100p 40n 80n)
Vb B 0 PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)
Vc C 0 PULSE(0 {SUPPLY} 0 100p 100p 10n 20n)

EA_bar A_bar 0 VOL='SUPPLY - V(A)'
EB_bar B_bar 0 VOL='SUPPLY - V(B)'
EC_bar C_bar 0 VOL='SUPPLY - V(C)'


M1000 out_XOR_3 C_bar a_63_n348# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1001 a_63_n238# A_bar B Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1002 a_63_n348# A B_bar vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1003 a_63_n238# A B vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1004 a_63_n238# A B_bar Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1005 out_XOR_3 C_bar a_63_n238# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1006 a_63_n348# A_bar B_bar Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1007 a_63_n348# A B Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1008 a_63_n238# A_bar B_bar vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1009 out_XOR_3 C a_63_n238# vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1010 a_63_n348# A_bar B vdd CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1011 out_XOR_3 C a_63_n348# Gnd CMOSN w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
C0 a_63_n348# B 0.16495f
C1 vdd C 0.02517f
C2 vdd A_bar 0.05034f
C3 a_63_n238# out_XOR_3 0.16495f
C4 a_63_n348# out_XOR_3 0.16495f
C5 vdd B 0.04912f
C6 a_63_n348# a_63_n238# 0.0214f
C7 vdd C_bar 0.02517f
C8 B_bar a_63_n238# 0.16495f
C9 vdd out_XOR_3 0.24306f
C10 B_bar a_63_n348# 0.16495f
C11 vdd a_63_n238# 0.24993f
C12 vdd a_63_n348# 0.2695f
C13 vdd B_bar 0.03707f
C14 vdd A 0.05042f
C15 a_63_n238# B 0.16495f
C16 A 0 0.67244f 
C17 C 0 0.29611f 
C18 A_bar 0 0.818f 
C19 B 0 0.79625f 
C20 C_bar 0 0.409f 
C21 out_XOR_3 0 0.7809f 
C22 a_63_n238# 0 1.06341f 
C23 a_63_n348# 0 5.15021f 
C24 B_bar 0 0.8083f 
C25 vdd 0 4.3175f 


Cload out_XOR_3 0 10f

.control
tran 0.1n 80n

plot v(A)+6 v(B)+4 v(C)+2 v(out_XOR_3) title '3-Input XOR Final Layout Verification'
.endc
.end