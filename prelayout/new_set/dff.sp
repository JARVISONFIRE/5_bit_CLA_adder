* .include TSMC_180nm.txt
* 
* .param SUPPLY=1.8
* .param LAMBDA=0.09u
* .param width_P = 4*LAMBDA
* .param width_N = 2*LAMBDA
* 
* .global vdd gnd
* 
* Vdd vdd gnd {SUPPLY}
* 
* Vd D gnd PULSE(0 {SUPPLY} 0 100p 100p 40n 80n)
* 
* 
* Mp0  A D vdd vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* Mp1  B clk A vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* Mn2  B D gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* Mp3  C clk vdd vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* Mn4  C B K gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* Mn5  K clk gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* Mp6  E C vdd vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* Mn7  E clk F gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* Mn8  F C gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* Mp9  Out E vdd vdd CMOSP W={width_P} L={2*LAMBDA}
*  +AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P}
*  +AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}
* 
* Mn10  Out E gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}
*  +AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N}
*  +AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
* 
* C_out Out gnd 1fF
* 
* .control
* tran 0.1n 80n
* plot v(D)+4 v(E)+2 v(Out) title 'Dff – Prelayout Verification'
* .endc
* 
* .end


* Clock-to-Q Delay (tcq) Measurement
.include TSMC_180nm.txt

.param SUPPLY=1.8
.param VTH={SUPPLY/2}
.param LAMBDA=0.09u
.param width_P = 4*LAMBDA
.param width_N = 2*LAMBDA

.global vdd gnd

Vdd vdd gnd {SUPPLY}

* Clock signal: Rising edge at 10ns
Vclk clk gnd PULSE(0 {SUPPLY} 10n 100p 100p 10n 20n)

* Test Case 1: D=1 (Out goes 0 -> 1)
Vd_1 D_1 gnd {SUPPLY} 
* Test Case 2: D=0 (Out goes 1 -> 0, assume initial state is 1, DFF must be precharged)
* Since the DFF is level sensitive, we need to set D=0 before 10ns
Vd_0 D_0 gnd PULSE({SUPPLY} 0 5n 100p 100p 10n 20n) 
* NOTE: To measure Out falling, you must use D_0 signal and ensure Out starts high.

* Use a separate netlist block for 0->1 transition (D=1)

.subckt DFF D clk Out vdd gnd
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
.ends DFF

* Instantiate DFF for D=1 test
X1 D_1 clk Out_1 vdd gnd

* Instantiate DFF for D=0 test (must be precharged high first, assuming it is initially high for this test)
X2 D_0 clk Out_0 vdd gnd

* Output Capacitors (as in your original netlist)
C_out1 Out_1 gnd 1fF
C_out2 Out_0 gnd 1fF

.control
tran 0.1n 30n

* T_CLK: Time of the 1st Rising Clock Edge (50% VDD)
meas tran T_CLK TRIG v(clk) VAL={VTH} RISE=1

* t_pLH (0 -> 1 transition at Out)
meas tran T_Q_LH TRIG v(Out_1) VAL={VTH} RISE=1
meas tran T_CQ_LH PARAM='T_Q_LH - T_CLK'

* t_pHL (1 -> 0 transition at Out)
meas tran T_Q_HL TRIG v(Out_0) VAL={VTH} FALL=1
meas tran T_CQ_HL PARAM='T_Q_HL - T_CLK'

print T_CQ_LH T_CQ_HL
.endc
.end