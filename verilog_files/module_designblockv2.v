module module_design_block_v2(A, B, C, D, clk, Q);
input A, B, C, D, clk;
output reg Q;
wire AB_temp, ABC_temp, D_int;
assign AB_temp = ~(A & B);
assign ABC_temp = ~(AB_temp | C);
assign D_int = ~(ABC_temp & D);
always @(posedge clk) Q <= D_int;
endmodule