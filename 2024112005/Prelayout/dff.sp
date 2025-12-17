.include TSMC_180nm.txt

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 20*LAMBDA*2.5
.param width_N = 20*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

Va R_bar gnd PULSE(0 {SUPPLY} 0 100p 100p 80n 80n)
Vb D gnd PULSE(0 {SUPPLY} 0 100p 100p 20n 40n)
Vclk clk gnd PULSE({SUPPLY} 0 0 100p 100p 10n 20n)


M1  n1  D vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2  n2  clk n1 vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M4  n3  clk vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M7  Q_bar  n3 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M10  Q_bar  R_bar vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M11  Q  Q_bar vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}


M3  n2  D gnd   gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M5  n3  n2 n4 gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M6  n4  clk gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M8  Q_bar  clk n6 gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M9  n6  n3 gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M12  Q  Q_bar gnd gnd CMOSN W={width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Cload out gnd 10f

.control
tran 0.1n 80n

* Optional: plot signals for visual check
plot v(R_bar)+6 v(D)+4 v(Q) v(clk)+2 title 'DFF – Prelayout Verification'

* ----------------------------
* Clock-to-Q delay (tcq)
* Measure Q rising after clk rising
meas tran tcq_r TRIG v(clk) VAL={0.5*1.8} RISE=1 TARG v(Q) VAL={0.5*1.8} RISE=1
* Measure Q falling after clk rising
meas tran tcq_f TRIG v(clk) VAL={0.5*1.8} RISE=1 TARG v(Q) VAL={0.5*1.8} FALL=1

* ----------------------------
* Setup time (tsu)
* Measure how early D must be stable before clock edge
meas tran tsu_r TRIG v(Q) VAL={0.5*1.8} RISE=1 TARG v(D) VAL={0.5*1.8} FALL=1
meas tran tsu_f TRIG v(Q) VAL={0.5*1.8} FALL=1 TARG v(D) VAL={0.5*1.8} RISE=1

* ----------------------------
* Hold time (th)
* Measure how long D must remain stable after clock edge
meas tran th_r TRIG v(Q) VAL={0.5*1.8} RISE=1 TARG v(D) VAL={0.5*1.8} RISE=1
meas tran th_f TRIG v(Q) VAL={0.5*1.8} FALL=1 TARG v(D) VAL={0.5*1.8} FALL=1

* ----------------------------
* Display results
show meas
.endc

.end