`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//
// Exhaustive Testbench for 5-bit Carry Lookahead Adder (cla_5bit)
//
// This testbench iterates through all 2048 possible input combinations
// (2^5 for A * 2^5 for B * 2^1 for C_in) to fully verify the adder's
// functionality.
//
////////////////////////////////////////////////////////////////////////////////

module cla_5bit_tb;

    // Inputs to the UUT (Unit Under Test) are declared as 'reg'
    reg [4:0] A_tb;
    reg [4:0] B_tb;
    reg C_in_tb;

    // Outputs from the UUT are declared as 'wire'
    wire [4:0] Sum_tb;
    wire C_out_tb;

    // Instantiation of the Unit Under Test (UUT)
    // This connects our testbench regs/wires to the adder module
    cla_5bit uut (
        .A(A_tb),
        .B(B_tb),
        .C_in(C_in_tb),
        .Sum(Sum_tb),
        .C_out(C_out_tb)
    );

    // --- Verification Logic ---
    
    // Create a 6-bit "expected" value.
    // Verilog's built-in '+' operator is a perfect reference model for addition.
    wire [5:0] expected_result = A_tb + B_tb + C_in_tb;
    
    // Create a 6-bit "actual" value by combining the adder's outputs
    wire [5:0] actual_result = {C_out_tb, Sum_tb};

    // Test sequence
    integer i, j, k; // Loop counters
    integer error_count = 0; // Error counter

    initial begin
        // --- Setup ---
        // Setup waveform dumping (VCD)
        $dumpfile("cla_5bit.vcd");
        $dumpvars(0, cla_5bit_tb);

        // Setup a monitor to print changes. %d displays values as decimals.
        $monitor("Time=%t | A=%d B=%d Cin=%b | Cout=%b Sum=%b (Actual=%d, Expected=%d)",
                 $time, A_tb, B_tb, C_in_tb, C_out_tb, Sum_tb, actual_result, expected_result);

        // Initialize all inputs to 0
        A_tb = 5'd0;
        B_tb = 5'd0;
        C_in_tb = 1'b0;
        error_count = 0;
        
        #20; // Wait 20ns for initial propagation

        // --- Test Execution ---
        
        // Loop through all 2 possibilities for C_in (0 to 1)
        for (k = 0; k < 2; k = k + 1) begin
            C_in_tb = k;
            
            // Loop through all 2^5=32 possibilities for A (0 to 31)
            for (i = 0; i < 32; i = i + 1) begin
                A_tb = i;
                
                // Loop through all 2^5=32 possibilities for B (0 to 31)
                for (j = 0; j < 32; j = j + 1) begin
                    B_tb = j;
                    
                    #10; // Wait 10ns for the adder logic to settle
                    
                    // --- Check ---
                    // Compare the actual result with the expected result
                    if (actual_result !== expected_result) begin
                        $display("ERROR! A=%d B=%d Cin=%b | Actual=%b Expected=%b",
                                 A_tb, B_tb, C_in_tb, actual_result, expected_result);
                        error_count = error_count + 1;
                    end
                end
            end
        end

        #20; // Wait a little longer at the end

        // --- Reporting ---
        if (error_count == 0) begin
            $display("***************************************************");
            $display("SUCCESS: All %d test cases passed!", 2048);
            $display("***************************************************");
        end else begin
            $display("***************************************************");
            $display("FAILURE: %d errors found out of %d test cases.", error_count, 2048);
            $display("***************************************************");
        end
        
        $finish; // End the simulation
    end

endmodule