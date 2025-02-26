`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 11:09:25 PM
// Design Name: 
// Module Name: module_and_nand_chain
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


module module_and_nand_chain(A, B, C, D, clk, Q);
input A, B, C, D, clk;
output reg Q;
wire AB, ABC, D_out;

assign AB = A & B;
assign ABC = ~(AB & C);
assign D_out = ~(ABC & D);

always @(posedge clk)
    Q <= D_out;
endmodule
