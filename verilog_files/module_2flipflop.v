module module_two_flip_flops(A, B, C, D, clk, Q, Q_T);
input A, B, C, D, clk;
output reg Q, Q_T;
wire D_next, T_next;
assign D_next = (A | B) & (C ^ D);
assign T_next = A ^ B;
always @(posedge clk) Q <= D_next;
always @(posedge clk) if (T_next) Q_T <= ~Q_T;
endmodule