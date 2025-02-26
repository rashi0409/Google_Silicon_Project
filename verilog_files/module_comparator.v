`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 11:02:34 PM
// Design Name: 
// Module Name: module_comparator
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


module module_comparator(A, B, clk, Greater, Equal, Lesser);
    input [2:0] A, B;
    input clk;
    output reg Greater, Equal, Lesser;
    wire n1, n2, n3;

    assign n1 = (A[2] & ~B[2]) | ((A[2] ~^ B[2]) & A[1] & ~B[1]) | ((A[2] ~^ B[2]) & (A[1] ~^ B[1]) & A[0] & ~B[0]);
    assign n2 = (A[0] ~^ B[0]) & (A[1] ~^ B[1]) & (A[2] ~^ B[2]);
    assign n3 = (B[2] & ~A[2]) | ((B[2] ~^ A[2]) & B[1] & ~A[1]) | ((B[2] ~^ A[2]) & (B[1] ~^ A[1]) & B[0] & ~A[0]);

    always @(posedge clk)
        {Greater, Equal, Lesser} <= {n1, n2, n3};
endmodule
