`timescale 1ns/1ns
module multiplier(input [5:0] X, Y, input clk, start, rst,output reg [11:0] w, output ready);
  wire ld_X, ld_Y, ld_A, ld_ff, init_A, init_ff, add, sub, shift_y, shift_a, X1, X0;
  datapath dp(X, Y,  clk, ld_X, ld_Y, ld_A, ld_ff, init_A, init_ff, add, sub, shift_x, shift_a, w, X1, X0);
  controller cn(start, clk, X1, X0, rst, ld_X, ld_Y, ld_A, ld_ff, init_A, init_ff, add, sub, ready, shift_x, shift_a);
endmodule