// ========================================
// D Flip-Flop
// ========================================
module dff (input clk, input d, output reg q);
    always @(posedge clk)
        q <= d;
endmodule


// ========================================
// Black Cell  (P,G) combine
// ========================================
module black_cell(
    input  p_kj, g_kj,
    input  p_ji, g_ji,
    output p_ki, g_ki
);
    assign p_ki = p_kj & p_ji;
    assign g_ki = g_kj | (p_kj & g_ji);
endmodule


// ========================================
// Gray Cell  (G only combine)
// ========================================
module gray_cell(
    input p_kj, g_kj,
    input g_ji,
    output g_ki
);
    assign g_ki = g_kj | (p_kj & g_ji);
endmodule



// ========================================
// 5-bit Brent–Kung Adder (NO Cin)
// ========================================
module brent_kung_5bit(
    input clk,
    input [4:0] a_in,
    input [4:0] b_in,
    output [4:0] sum_out,
    output cout_out
);

    // ----------------------------------------
    // Register inputs
    // ----------------------------------------
    wire [4:0] a, b;

    dff da0 (clk, a_in[0], a[0]);
    dff da1 (clk, a_in[1], a[1]);
    dff da2 (clk, a_in[2], a[2]);
    dff da3 (clk, a_in[3], a[3]);
    dff da4 (clk, a_in[4], a[4]);

    dff db0 (clk, b_in[0], b[0]);
    dff db1 (clk, b_in[1], b[1]);
    dff db2 (clk, b_in[2], b[2]);
    dff db3 (clk, b_in[3], b[3]);
    dff db4 (clk, b_in[4], b[4]);



    // ----------------------------------------
    // P, G generation
    // ----------------------------------------
    wire [4:0] P, G;
    assign P = a ^ b;
    assign G = a & b;


    // ----------------------------------------
    // Brent–Kung Prefix Network
    // (No Cin, so carry-in = 0)
    // ----------------------------------------

    // ---- Level 1 ----
    wire p11, g11;
    black_cell L1_10 (P[1], G[1], P[0], G[0], p11, g11);

    wire p31, g31;
    black_cell L1_32 (P[3], G[3], P[2], G[2], p31, g31);


    // ---- Level 2 ----
    wire p22, g22;
    black_cell L2_210 (P[2], G[2], p11, g11, p22, g22);

    wire p32, g32;
    black_cell L2_310 (p31, g31, p11, g11, p32, g32);


    // ---- Level 3 ----
    wire p43, g43;
    black_cell L3_40123 (P[4], G[4], p32, g32, p43, g43);


    // ----------------------------------------
    // Carry Outputs (C0 = 0)
    // ----------------------------------------
    wire C1 = G[0];
    wire C2 = g11;
    wire C3 = g22;
    wire C4 = g32;
    wire C5 = g43;


    // ----------------------------------------
    // Sum computation
    // ----------------------------------------
    wire [4:0] sum;
    assign sum[0] = P[0];
    assign sum[1] = P[1] ^ C1;
    assign sum[2] = P[2] ^ C2;
    assign sum[3] = P[3] ^ C3;
    assign sum[4] = P[4] ^ C4;

    // ----------------------------------------
    // Register outputs (explicit DFFs)
    // ----------------------------------------
    dff ds0 (.clk(clk), .d(sum[0]), .q(sum_out[0]));
    dff ds1 (.clk(clk), .d(sum[1]), .q(sum_out[1]));
    dff ds2 (.clk(clk), .d(sum[2]), .q(sum_out[2]));
    dff ds3 (.clk(clk), .d(sum[3]), .q(sum_out[3]));
    dff ds4 (.clk(clk), .d(sum[4]), .q(sum_out[4]));

    // DFF for final carry
    dff dcout (.clk(clk), .d(C5), .q(cout_out));

endmodule
