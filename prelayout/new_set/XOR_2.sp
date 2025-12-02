.include TSMC_180nm.txt

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 4*LAMBDA
.param width_N = 2*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

Va A gnd PULSE(0 {SUPPLY} 0 100p 100p 15n 35n)
Vb B gnd PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)

EA_bar A_bar gnd VOL='SUPPLY - V(A)'
EB_bar B_bar gnd VOL='SUPPLY - V(B)'


M1  n2  A_bar B   gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2  n1  A B_bar   vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M3  n2  A B       vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M4  n2  A B_bar   gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M6  n1  A_bar B_bar gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M7  n1  A B       gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M8  n2  A_bar B_bar vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M10 n1  A_bar B   vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Cload out gnd 10f

.control
tran 0.1n 80n
plot v(A)+6 v(B)+4 v(n2) title '2-Input XOR – Prelayout Verification'
.endc

.end
