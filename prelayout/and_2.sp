.include TSMC_180nm.txt

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 20*LAMBDA*2.5
.param width_N = 20*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

Va A gnd PULSE(0 {SUPPLY} 0 100p 100p 40n 80n)
Vb B gnd PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)
Vclk clk gnd PULSE({SUPPLY} 0 0 100p 100p 10n 20n)


M0  out  clk vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M1  out  A n1   gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2  n1  B n2 gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M3  n2  clk gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Cload out gnd 10f

.control
tran 0.1n 80n
plot v(A)+6 v(B)+4 v(out) v(clk)+2 title '2-Input AND – Prelayout Verification'
.endc

.end
