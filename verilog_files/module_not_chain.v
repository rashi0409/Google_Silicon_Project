module module_not_chain(A, clk, Q);
input A, clk;
output reg Q;
wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

assign n1 = ~A;
assign n2 = ~n1;
assign n3 = ~n2;
assign n4 = ~n3;
assign n5 = ~n4;
assign n6 = ~n5;
assign n7 = ~n6;
assign n8 = ~n7;
assign n9 = ~n8;
assign n10 = ~n9;

always @(posedge clk)
    Q <= n10;
endmodule
