`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 11:54:20 PM
// Design Name: 
// Module Name: module_logic_developed
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


module module_logic_developed(
input A, B, C, clk,
output reg Dout
    );
    
    wire NOR_out_wire, NAND_out_wire, XNOR_out_wire, NOT_out_wire, AND_out_wire, OR_out_wire, D_input_wire;
    
        assign NOR_out_wire  = ~(A | B);      
        assign NAND_out_wire = ~(NOR_out_wire & B);  
        assign XNOR_out_wire = ~(NAND_out_wire ^ A);
        assign NOT_out_wire  = ~XNOR_out_wire;      
        assign AND_out_wire  = C & NOT_out_wire;    
        assign OR_out_wire   = AND_out_wire | XNOR_out_wire;  
        assign D_input_wire  = NOR_out_wire ^ OR_out_wire;  
       
 always @(posedge clk)
 begin
        Dout<=  D_input_wire;
   end           
endmodule
