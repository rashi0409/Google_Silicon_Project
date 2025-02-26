module module_t_flip_flop(A, B, C, D, clk, Q);
input A, B, C, D, clk;
output reg Q;
wire T;
assign T = (A & B) ^ (C | D);
always @(posedge clk) if (T) Q <= ~Q;
endmodule