.include TSMC_180nm.txt

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 4*LAMBDA
.param width_N = 2*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

Vd D gnd PULSE(0 {SUPPLY} 0 100p 100p 40n 80n)


Mp0  A D vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mp1  B clk A vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mn2  B D gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mp3  C clk vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mn4  C B K gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mn5  K clk gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mp6  E C vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mn7  E clk F gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mn8  F C gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

Mp9  Out E vdd vdd CMOSP W={width_P} L={2*LAMBDA}
 +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
 +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

Mn10  Out E gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
 +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
 +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

C_out Out gnd 1fF

.control
tran 0.1n 80n
plot v(D)+4 v(E)+2 v(Out) title 'Dff – Prelayout Verification'
.endc

.end
