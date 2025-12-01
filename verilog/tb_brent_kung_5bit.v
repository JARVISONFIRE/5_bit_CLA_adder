`timescale 1ns / 1ps

module tb_brent_kung_5bit;

    reg clk;
    reg [4:0] a_in;
    reg [4:0] b_in;

    wire [4:0] sum_out;
    wire cout_out;

    brent_kung_5bit uut (
        .clk(clk),
        .a_in(a_in),
        .b_in(b_in),
        .sum_out(sum_out),
        .cout_out(cout_out)
    );


    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("brent_kung_5bit_tb.vcd");
        $dumpvars(0, tb_brent_kung_5bit);

        a_in = 5'b00001; b_in = 5'b00010; #20;

        a_in = 5'b00101; b_in = 5'b00011; #20;

        a_in = 5'b11111; b_in = 5'b00001; #20;

        a_in = 5'b10101; b_in = 5'b01010; #20;

        a_in = 5'b01111; b_in = 5'b00101; #20;

        $finish;
    end

    

   reg [4:0] a_d1, b_d1;
reg [4:0] a_d2, b_d2;

always @(posedge clk) begin
    a_d1 <= a_in;
    b_d1 <= b_in;
    a_d2 <= a_d1;
    b_d2 <= b_d1;
    $display("time=%0t | a=%b b=%b | sum=%b cout=%b",
             $time, a_d2, b_d2, sum_out, cout_out);
end



endmodule
