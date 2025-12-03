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
VA0 preA0 0 PULSE(0 1.8  0n 10p 10p 20n 40n)
VA1 preA1 0 PULSE(0 1.8 10n 10p 10p 20n 40n)
VA2 preA2 0 PULSE(0 1.8 20n 10p 10p 20n 40n)
VA3 preA3 0 PULSE(0 1.8 30n 10p 10p 20n 40n)
VA4 preA4 0 PULSE(0 1.8 40n 10p 10p 20n 40n)

* PRE B INPUTS
VB0 preB0 0 PULSE(0 1.8  0n 10p 10p 30n 60n)
VB1 preB1 0 PULSE(0 1.8 15n 10p 10p 30n 60n)
VB2 preB2 0 PULSE(0 1.8 30n 10p 10p 30n 60n)
VB3 preB3 0 PULSE(0 1.8 45n 10p 10p 30n 60n)
VB4 preB4 0 PULSE(0 1.8 60n 10p 10p 30n 60n)


X_A0 preA0 clk A0 A0_bar vdd gnd width_N width_P LAMBDA DFF
X_A1 preA1 clk A1 A1_bar vdd gnd width_N width_P LAMBDA DFF
X_A2 preA2 clk A2 A2_bar vdd gnd width_N width_P LAMBDA DFF
X_A3 preA3 clk A3 A3_bar vdd gnd width_N width_P LAMBDA DFF
X_A4 preA4 clk A4 A4_bar vdd gnd width_N width_P LAMBDA DFF

X_B0 preB0 clk B0 B0_bar vdd gnd width_N width_P LAMBDA DFF
X_B1 preB1 clk B1 B1_bar vdd gnd width_N width_P LAMBDA DFF
X_B2 preB2 clk B2 B2_bar vdd gnd width_N width_P LAMBDA DFF
X_B3 preB3 clk B3 B3_bar vdd gnd width_N width_P LAMBDA DFF
X_B4 preB4 clk B4 B4_bar vdd gnd width_N width_P LAMBDA DFF

X_P0 A0 B0 A0_bar B0_bar P0_bar P0 gnd width_N width_P LAMBDA XOR2
X_P1 A1 B1 A1_bar B1_bar P1_bar P1 gnd width_N width_P LAMBDA XOR2
X_P2 A2 B2 A2_bar B2_bar P2_bar P2 gnd width_N width_P LAMBDA XOR2
X_P3 A3 B3 A3_bar B3_bar P3_bar P3 gnd width_N width_P LAMBDA XOR2
X_P4 A4 B4 A4_bar B4_bar P4_bar P4 gnd width_N width_P LAMBDA XOR2

X_G0 A0 B0 G0 vdd gnd width_N width_P LAMBDA AND2
X_G1 A1 B1 G1 vdd gnd width_N width_P LAMBDA AND2
X_G2 A2 B2 G2 vdd gnd width_N width_P LAMBDA AND2
X_G3 A3 B3 G3 vdd gnd width_N width_P LAMBDA AND2
X_G4 A4 B4 G4 vdd gnd width_N width_P LAMBDA AND2

X_bc_11 P1 P0 G1 G0 P11 G11 vdd gnd width_N width_P LAMBDA BLACKCELL
X_bc_31 P3 P2 G3 G2 P31 G31 vdd gnd width_N width_P LAMBDA BLACKCELL
X_bc_22 P2 P11 G2 G11 P22 G22 vdd gnd width_N width_P LAMBDA BLACKCELL
X_bc_32 P31 P11 G31 G11 P32 G32 vdd gnd width_N width_P LAMBDA BLACKCELL
X_bc_43 P4 P32 G4 G32 P43 G43 vdd gnd width_N width_P LAMBDA BLACKCELL

X_c0 G0 G0_bar INV 
X_c1 G11 G11_bar INV 
X_c2 G22 G22_bar INV 
X_c3 G32 G32_bar INV 

X_s0 P1 G0 P1_bar G0_bar S1_bar S1 gnd width_N width_P LAMBDA XOR2
X_s1 P2 G11 P2_bar G11_bar S2_bar S2 gnd width_N width_P LAMBDA XOR2
X_s2 P3 G22 P3_bar G22_bar S3_bar S3 gnd width_N width_P LAMBDA XOR2
X_s3 P4 G32 P4_bar G32_bar S4_bar S4 gnd width_N width_P LAMBDA XOR2

*.subckt DFF D clk Out Out_bar vdd gnd width_N width_P LAMBDA

X_S0 P0 clk S_0 S0_bar vdd gnd width_N width_P LAMBDA DFF
X_S1 S1 clk S_1 S1_bar vdd gnd width_N width_P LAMBDA DFF
X_S2 S2 clk S_2 S2_bar vdd gnd width_N width_P LAMBDA DFF
X_S3 S3 clk S_3 S3_bar vdd gnd width_N width_P LAMBDA DFF
X_S4 S4 clk S_4 S4_bar vdd gnd width_N width_P LAMBDA DFF
X_Co G43 clk C_Outm C_Outm_bar vdd gnd width_N width_P LAMBDA DFF

MP0  S_0_inv  S_0 vdd vdd CMOSP W={20*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mn0  S_0_inv  S_0 gnd gnd CMOSN W={10*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}


MP1  S_1_inv  S_1 vdd vdd CMOSP W={20*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mn1  S_1_inv  S_1 gnd gnd CMOSN W={10*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}


MP2  S_2_inv  S_2 vdd vdd CMOSP W={20*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mn2  S_2_inv  S_2 gnd gnd CMOSN W={10*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

MP3  S_3_inv  S_3 vdd vdd CMOSP W={20*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mn3  S_3_inv  S_3 gnd gnd CMOSN W={10*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

MP4  S_4_inv  S_4 vdd vdd CMOSP W={20*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mn4  S_4_inv  S_4 gnd gnd CMOSN W={10*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mout  out  C_Outm vdd vdd CMOSP W={20*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

MnuT  out  C_Outm gnd gnd CMOSN W={10*LAMBDA} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}


* .control
* tran 0.1n 100n
* plot v(clk)+10 v(S_0)+8 v(S_1)+6 v(S_2)+4 v(S_3)+2 v(S_4) v(C_Outm)-2
* .endc

.tran 0.1n 200n


.measure tran t_s0    TRIG v(clk) VAL=0.9 RISE=1  TARG v(P0) VAL=0.9 RISE=1
.measure tran t_s1    TRIG v(clk) VAL=0.9 RISE=1  TARG v(S1) VAL=0.9 RISE=1
.measure tran t_s2    TRIG v(clk) VAL=0.9 RISE=1  TARG v(S2) VAL=0.9 RISE=1
.measure tran t_s3    TRIG v(clk) VAL=0.9 RISE=1  TARG v(S3) VAL=0.9 RISE=1
.measure tran t_s4    TRIG v(clk) VAL=0.9 RISE=1  TARG v(S4) VAL=0.9 RISE=1
.measure tran t_cout  TRIG v(clk) VAL=0.9 RISE=1  TARG v(G43) VAL=0.9 RISE=1

.control
  run
  print t_s0 t_s1 t_s2 t_s3 t_s4 t_cout
.endc


.end
