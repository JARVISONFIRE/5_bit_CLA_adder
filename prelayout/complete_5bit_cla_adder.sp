.include TSMC_180nm.txt

.include and2.cir
.include dff.cir
.include or2.cir
.include XOR2.cir

*.subckt NAND2 clk A B out vdd gnd width_N width_P LAMBDA
*.subckt DFF clk D Q Q_bar R_bar vdd gnd width_N width_P LAMBDA
*.subckt NOR2 clk A B out vdd gnd width_N width_P LAMBDA
*.subckt XOR2 A B A_bar B_bar n1 n2 gnd width_N width_P LAMBDA

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 20*LAMBDA*2.5
.param width_N = 20*LAMBDA

.global vdd gnd

.subckt INV A_in A_inbar 
M0  A_inbar  A_in vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M1  A_inbar  A_in gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.ends


Vdd vdd gnd {SUPPLY}
Vcin cin gnd PULSE({SUPPLY} 0 0 100p 100p 0.1n 100n)
Vr R_bar gnd PULSE(0 {SUPPLY} 0 100p 100p 100n 100n)


Va A gnd PULSE(0 {SUPPLY} 0 100p 100p 40n 80n)
Vb B gnd PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)
Vclk clk gnd PULSE({SUPPLY} 0 0 100p 100p 10n 20n)

X_Cin clk cin cin_out cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_A0 clk cin A0 cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_A1 clk cin A1 cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_A2 clk cin A2 cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_A3 clk cin A3 cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_A4 clk cin A4 cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF

X_B0 clk cin B0 cin_out cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_B1 clk cin B1 cin_out cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_B2 clk cin B2 cin_out cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_B3 clk cin B3 cin_out cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF
X_B4 clk cin B4 cin_out cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF

X_invA0 A0 A0_bar INV
X_invA1 A1 A1_bar INV
X_invA2 A2 A2_bar INV
X_invA3 A3 A3_bar INV
X_invA4 A4 A4_bar INV

X_invB0 A0 A0_bar INV
X_invB1 B1 A1_bar INV
X_invB2 B2 A2_bar INV
X_invB3 B3 A3_bar INV
X_invB4 B4 A4_bar INV

X_P0 A0 B0 B4 cin_out cin_out_bar R_bar vdd gnd width_N width_P LAMBDA DFF


*Cload out gnd 10f

.control
tran 0.1n 80n
plot v(cin)+6 v(R_bar)+8 v(cin_out_bar)+4 v(cin_out) v(clk)+2 title '2-Input AND – Prelayout Verification'
.endc

.end
