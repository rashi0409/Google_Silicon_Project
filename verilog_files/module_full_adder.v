`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 10:50:42 PM
// Design Name: 
// Module Name: module_full_adder
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


module module_full_adder (A, B, Cin, clk, Sum, Cout);

input A, B, Cin;
input clk;
output reg Sum, Cout;
  
    always @(posedge clk)
     begin
        Sum <= A ^ B ^ Cin;
        Cout <= (A & B) | (B & Cin) | (A & Cin);
    end
endmodule

