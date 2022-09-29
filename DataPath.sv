`timescale 1ns/1ns
module datapath(input [5:0] X, Y, input clk, ld_X, ld_Y, ld_A, ld_ff, init_A, init_ff, add, sub, shift_x, shift_a,output reg [11:0] w, output X1, X0);
  wire [5:0] x_out, a_out, alu_out, y_out;
  wire y_co, x_co, a_co;
  
  reg6 Yreg(Y, clk, 0, ld_Y, 0, 0,y_out, y_co);
  reg6 Xreg(X, clk, 0, ld_X, shift_x, a_co, x_out, x_co);
  ff X_1(x_co, clk, init_ff, ld_ff,X0);
  reg6 Areg(alu_out, clk, init_A, ld_A, shift_a, a_out[5], a_out, a_co);
  ALU6 alu(a_out, y_out, clk, add, sub, alu_out);
  assign X1 = x_out[0];
  assign w = {a_out, x_out};
endmodule