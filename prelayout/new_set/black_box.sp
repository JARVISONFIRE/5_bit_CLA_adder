.include TSMC_180nm.txt

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 4*LAMBDA
.param width_N = 2*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

Vp1 P1 gnd PULSE(0 {SUPPLY} 0 100p 100p 40n 80n)
Vp2 P2 gnd PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)
Vg1 G1 gnd PULSE(0 {SUPPLY} 0 100p 100p 10n 20n)
Vg2 G2 gnd PULSE(0 {SUPPLY} 0 100p 100p 5n 10n)


Mp0  A1 P1 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mp1  A1 P2 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}


Mp2  A1  P1 A2 gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mp3  A2  P2 gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mpinv0  P_out  A1 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mpinv1  P_out  A1 gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}


Mg0  B1 P1 vdd vdd CMOSP W={2*width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mg1  B1 G2 vdd vdd CMOSP W={2*width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mg2  B2 G1 B1 vdd CMOSP W={2*width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}


Mg3  B2  G1 gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mg4  B2  P1 B3 gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}


Mg5  B3  G2 gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mginv0  G_out  B2 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mginv1  G_out  B2 gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

C_outP P_out gnd 1fF
C_outG G_out gnd 1fF

.control
tran 0.1n 80n
plot v(P1)+6 v(P2)+4 v(G1)+2 v(G2) v(P_out)-2 v(G_out)-4 title 'Dff – Prelayout Verification'
.endc

.end
