module module_and(A, B, C, D, clk, Q); 
input A, B, C, D, clk;
output reg Q;
wire AB, ABC, D_out;

assign AB = A & B; 
assign ABC = AB & C; 
assign D_out = ABC & D; 

always @(posedge clk)
    Q <= D_out;
endmodule
