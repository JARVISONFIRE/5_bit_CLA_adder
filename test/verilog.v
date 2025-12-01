`timescale 1ns / 1ps

module cla_pg_unit(A, B, P, G); 
    input A, B; 
    output P, G;

xor G_XOR(P, A, B);
and G_AND(G, A, B);

endmodule

module carry_lookahead_unit_5bit(P, G, C_in, C); 
    input [4:0] P; 
    input [4:0] G; 
    input C_in; 
    output [4:0] C;

    wire t1, t2_a, t2_b, t3_a, t3_b, t3_c, t3_d;
    wire t4_a, t4_b, t4_c, t4_d;
    wire t5_a, t5_b, t5_c, t5_d, t5_e;

and G_C1_A(t1, P[0], C_in);
or  G_C1(C[0], G[0], t1);

and G_C2_A(t2_a, P[1], G[0]);
and G_C2_B(t2_b, P[1], P[0], C_in);
or  G_C2(C[1], G[1], t2_a, t2_b);

and G_C3_A(t3_a, P[2], G[1]);
and G_C3_B(t3_b, P[2], P[1], G[0]);
and G_C3_C(t3_c, P[2], P[1], P[0], C_in);
or  G_C3(C[2], G[2], t3_a, t3_b, t3_c);

and G_C4_A(t4_a, P[3], G[2]);
and G_C4_B(t4_b, P[3], P[2], G[1]);
and G_C4_C(t4_c, P[3], P[2], P[1], G[0]);
and G_C4_D(t4_d, P[3], P[2], P[1], P[0], C_in);
or  G_C4(C[3], G[3], t4_a, t4_b, t4_c, t4_d);

and G_C5_A(t5_a, P[4], G[3]);
and G_C5_B(t5_b, P[4], P[3], G[2]);
and G_C5_C(t5_c, P[4], P[3], P[2], G[1]);
and G_C5_D(t5_d, P[4], P[3], P[2], P[1],G[0]);
and G_C5_E(t5_e, P[4], P[3], P[2], P[1], P[0], C_in);
or  G_C5(C[4], G[4], t5_a, t5_b, t5_c, t5_d, t5_e);

endmodule

module cla_5bit(A, B, C_in, Sum, C_out); 
    input [4:0] A; 
    input [4:0] B; 
    input C_in; 
    output [4:0] Sum; 
    output C_out;

    wire [4:0] P;
    wire [4:0] G;
    wire [4:0] C;

cla_pg_unit PGU0 (
    .A(A[0]), .B(B[0]), .P(P[0]), .G(G[0])
);
cla_pg_unit PGU1 (
    .A(A[1]), .B(B[1]), .P(P[1]), .G(G[1])
);
cla_pg_unit PGU2 (
    .A(A[2]), .B(B[2]), .P(P[2]), .G(G[2])
);
cla_pg_unit PGU3 (
    .A(A[3]), .B(B[3]), .P(P[3]), .G(G[3])
);
cla_pg_unit PGU4 (
    .A(A[4]), .B(B[4]), .P(P[4]), .G(G[4])
);


carry_lookahead_unit_5bit CLU (
    .P(P),
    .G(G),
    .C_in(C_in),
    .C({C_out, C[3], C[2], C[1], C[0]})
);

xor G_SUM0(Sum[0], P[0], C_in);
xor G_SUM1(Sum[1], P[1], C[0]);
xor G_SUM2(Sum[2], P[2], C[1]);
xor G_SUM3(Sum[3], P[3], C[2]);
xor G_SUM4(Sum[4], P[4], C[3]);

endmodule