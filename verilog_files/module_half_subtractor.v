`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 11:14:54 PM
// Design Name: 
// Module Name: module_half_subtractor
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


module module_half_subtractor(
    input a,
    input b,
    input clk,
    output reg d,  
    output reg borrow
);
    wire d_comb, borrow_comb;

    assign d_comb = a ^ b;      
    assign borrow_comb = ~a & b;  

    always @(posedge clk) begin
        d <= d_comb;
        borrow <= borrow_comb;
    end

endmodule