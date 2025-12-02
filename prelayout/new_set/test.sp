* ---------- SIMPLE DC-ONLY TRUTH TABLE TEST (isolates model issues) ----------
* Do NOT include TSMC_180nm.txt for this run

.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P = 4*LAMBDA
.param width_N = 2*LAMBDA

.global vdd gnd

* single supply
Vdd vdd gnd {SUPPLY}

* ----------------- device models (simple) -----------------
.model CMOSN NMOS (LEVEL=1 VTO=0.6 KP=50u)
.model CMOSP PMOS (LEVEL=1 VTO=-0.6 KP=25u)

* ----------------- transistor/netlist (unchanged names) -----------------
Mp0  A1 P1 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
Mp1  A1 P2 vdd vdd CMOSP W={width_P} L={2*LAMBDA}

Mp2  A1 P1 A2 gnd CMOSN W={2*width_N} L={2*LAMBDA}
Mp3  A2 P2 gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}

Mpinv0  P_out A1 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
Mpinv1  P_out A1 gnd gnd CMOSN W={width_N} L={2*LAMBDA}

Mg0  B1 P1 vdd vdd CMOSP W={2*width_P} L={2*LAMBDA}
Mg1  B1 G2 vdd vdd CMOSP W={2*width_P} L={2*LAMBDA}
Mg2  B2 G1 B1 vdd CMOSP W={2*width_P} L={2*LAMBDA}

Mg3  B2 G1 gnd gnd CMOSN W={width_N} L={2*LAMBDA}
Mg4  B2 P1 B3 gnd CMOSN W={2*width_N} L={2*LAMBDA}
Mg5  B3 G2 gnd gnd CMOSN W={2*width_N} L={2*LAMBDA}

Mginv0  G_out B2 vdd vdd CMOSP W={width_P} L={2*LAMBDA}
Mginv1  G_out B2 gnd gnd CMOSN W={width_N} L={2*LAMBDA}

C_outP P_out gnd 1f
C_outG G_out gnd 1f

* ---------- stabilize internal nodes (always useful) ----------
R_A1 A1 gnd 1e9
R_A2 A2 gnd 1e9
R_B1 B1 gnd 1e9
R_B2 B2 gnd 1e9
R_B3 B3 gnd 1e9

C_A1 A1 gnd 5f
C_A2 A2 gnd 5f
C_B1 B1 gnd 1f
C_B2 B2 gnd 1f
C_B3 B3 gnd 1f

* ---------- DC drive sources (dedicated for DC sweep) ----------
Va_dc P1 gnd DC 0
Vb_dc P2 gnd DC 0
Vc_dc G1 gnd DC 0
Vd_dc G2 gnd DC 0

* ---------- DC sweep over all 16 combos ----------
.DC Va_dc 0 {SUPPLY} {SUPPLY} Vb_dc 0 {SUPPLY} {SUPPLY} Vc_dc 0 {SUPPLY} {SUPPLY} Vd_dc 0 {SUPPLY} {SUPPLY}
.print DC V(P1) V(P2) V(G1) V(G2) V(P_out) V(G_out) V(A1) V(A2) V(B1) V(B2) V(B3)

* solver options for robustness
.options method=gear gmin=1e-12 reltol=1e-3 numdgt=6

.control
  run
.endc

.end
