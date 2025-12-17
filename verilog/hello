`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2025 02:02:36
// Design Name: 
// Module Name: fpga_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fpga_top(
    // ----------------------------------------
    // Physical I/O Ports (Connect to XDC File)
    // ----------------------------------------
    input wire clk,         // System Clock (from XDC constraint)
    input wire [15:0] sw,   // 16 Switches (Input)
    output wire [15:0] led  // 16 LEDs (Output)
);
    
    // ----------------------------------------
    // Internal Signals (Wires to connect modules)
    // ----------------------------------------
    wire [4:0] sum_wire;
    wire c5_wire; // C5 is the cout_out from your 5-bit adder

    // ----------------------------------------
    // 1. Instantiate the Brent-Kung Adder (Your Core Design)
    // The module name MUST be 'brent_kung_5bit'
    // ----------------------------------------
    brent_kung_5bit my_adder ( 
        // Clock input
        .clk(clk),
        
        // Data Inputs (5 bits each)
        // Map Switches 0-4 to 'a_in'
        .a_in(sw[4:0]),     
        // Map Switches 5-9 to 'b_in'
        .b_in(sw[9:5]),     
        
        // Data Outputs
        .sum_out(sum_wire), // Connects adder sum to internal wire
        .cout_out(c5_wire)  // Connects adder carry-out (C5) to internal wire
    );

    // ----------------------------------------
    // 2. Output Mapping (Connect internal wires to physical LEDs)
    // ----------------------------------------
    // Map Sum to LEDs 0-4
    assign led[4:0] = sum_wire;
    
    // Map Carry Out (C5) to LED 15 (a visible indicator)
    assign led[15] = c5_wire;

    // Turn off unused LEDs (led[5] through led[14])
    assign led[14:5] = 10'b0;

endmodule

