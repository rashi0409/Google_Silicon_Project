`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/24/2025 07:26:42 PM
// Design Name:
// Module Name: module_design_block
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


module module_design_block(A, B, C, D, clk, Q);

input A, B, C, D, clk;
output reg Q;

wire AB_temp, ABC_temp, D_int;

assign AB_temp= A | B;
assign ABC_temp = AB_temp | C;
assign D_int = ABC_temp | D;

always @(posedge clk)
    begin
            Q<= D_int;
    end
endmodule