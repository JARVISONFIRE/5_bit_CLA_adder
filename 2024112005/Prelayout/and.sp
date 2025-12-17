.include TSMC_180nm.txt

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 4*LAMBDA
.param width_N = 2*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

Vp1 P1 gnd PULSE(0 {SUPPLY} 0 100p 100p 40n 80n)
Vp2 P2 gnd PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)


* Mp0  A1 P1 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* Mp1  A1 P2 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* 
* Mp2  A1  P1 A2 gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* Mp3  A2  P2 gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* Mpinv0  P_out  A1 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* Mpinv1  P_out  A1 gnd gnd CMOSN W={width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* C_outP P_out gnd 1fF
* 

* SPICE3 file created from AND.ext - technology: scmos

.option scale=90n

M1000 vdd in out w_n29_25# CMOSP w=8 l=2
+  ad=40p pd=26u as=40p ps=26u
M1001 vdd P2 in w_6_24# CMOSP w=8 l=2
+  ad=40p pd=26u as=24p ps=14u
M1002 a_19_13# P1 in Gnd CMOSN w=4 l=2
+  ad=12p pd=10u as=20p ps=18u
M1003 gnd P2 a_19_13# Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=12p ps=10u
M1004 in P1 vdd w_6_24# CMOSP w=8 l=2
+  ad=24p pd=14u as=40p ps=26u
M1005 gnd in out Gnd CMOSN w=4 l=2
+  ad=20p pd=18u as=20p ps=18u
C0 in vdd 0.21756f
C1 P1 in 0.19608f
C2 P2 w_6_24# 0.02045f
C3 out w_n29_25# 0.00935f
C4 out vdd 0.11548f
C5 P2 in 0.05757f
C6 vdd w_n29_25# 0.03084f
C7 P1 vdd 0.00169f
C8 gnd in 0.08969f
C9 gnd out 0.0825f
C10 P2 vdd 0.02919f
C11 a_19_13# in 0.09624f
C12 P1 P2 0.07932f
C13 P1 gnd 0.07512f
C14 P2 gnd 0.05684f
C15 w_6_24# in 0.00821f
C16 gnd a_19_13# 0.07426f
C17 w_6_24# vdd 0.01634f
C18 in out 0.0591f
C19 P1 w_6_24# 0.02119f
C20 in w_n29_25# 0.02111f
C21 a_19_13# 0 0 
C22 gnd 0 0.24554f 
C23 P2 0 0.12473f 
C24 P1 0 0.1896f 
C25 vdd 0 0.25038f 
C26 out 0 0.07735f 
C27 in 0 0.26098f 
C28 w_6_24# 0 0.64282f 
C29 w_n29_25# 0 0.57753f 

.control
tran 0.1n 80n
plot v(P1)+4 v(P2)+2 v(out) title 'AND – Postlayout Verification'
.endc

.end
