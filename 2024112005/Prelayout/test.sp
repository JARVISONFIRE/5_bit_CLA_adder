.include TSMC_180nm.txt

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 20*LAMBDA*2.5
.param width_N = 20*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

Va D gnd PULSE(0 {SUPPLY} 0 100p 100p 35n 75n)
*Vb G1 gnd PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)
Vc clk gnd PULSE(0 {SUPPLY} 0 100p 100p 10n 20n)




Cload out gnd 10f

.control
tran 0.1n 80n
plot v(clk)+4 v(D)+2 v(out) title '2-Input AND – layout Verification'
.endc

.end
