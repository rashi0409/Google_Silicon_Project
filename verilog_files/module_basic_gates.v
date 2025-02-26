`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 11:36:29 PM
// Design Name: 
// Module Name: module_basic_gates
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


module module_basic_gates(
input A, B, clk,
    output reg AND_out, OR_out, NAND_out, NOR_out, XOR_out, XNOR_out, NOT_A_out, NOT_B_out
);

wire AND_out_wire, OR_out_wire, NAND_out_wire, NOR_out_wire, XOR_out_wire;
wire  XNOR_out_wire, NOT_A_out_wire, NOT_B_out_wire;

    assign AND_out_wire  = A & B;
    assign OR_out_wire   = A | B;
    assign NAND_out_wire = ~(A & B);
    assign NOR_out_wire  = ~(A | B);
    assign XOR_out_wire  = A ^ B;
    assign XNOR_out_wire = ~(A ^ B);
    assign NOT_A_out_wire    = ~A;
    assign NOT_B_out_wire    = ~B;

always @(posedge clk)
begin
    AND_out <= AND_out_wire;
    OR_out <= OR_out_wire;
    NAND_out <= NAND_out_wire;
    NOR_out <= NOR_out_wire;
    XOR_out <= XOR_out_wire;
    XNOR_out <= XNOR_out_wire;
    NOT_A_out<= NOT_A_out_wire;
    NOT_B_out<= NOT_B_out_wire;
     
end
endmodule