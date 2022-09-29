`timescale 1ns/1ns
module TestBench();
  logic [5:0] X, Y;
  logic [11:0] out;
  logic Start, Done, clk, rst;
  multiplier mul(X, Y, clk, Start, rst, out, Done);
  initial begin
    X = 6'b001011; //11
    Y = 6'b110011; // -13 = -143
    clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #10 Start = 1;
    #100 clk = 1;
    #100 clk = 0;
    #10 Start = 0;
    #100 clk = 1;
    repeat(70) #100 clk = ~clk;
    clk = 0;
    rst = 1;
    #100 clk = 1;
    #10 rst = 0;
    #90 clk = 0;
    X = 6'b000101; //5
    Y = 6'b000110; //6 = 30
    #100 clk = 1;
    #100 clk = 0;
    #10 Start = 1;
    #100 clk = 1;
    #100 clk = 0;
    #10 Start = 0;
    #100 clk = 1;
    repeat(70) #100 clk = ~clk;
    clk = 0;
    rst = 1;
    #100 clk = 1;
    #10 rst = 0;
    #90 clk = 0;
    X = 6'b110001; // -15
    Y = 6'b110100; // -12 = 180
    #100 clk = 1;
    #100 clk = 0;
    #10 Start = 1;
    #100 clk = 1;
    #100 clk = 0;
    #10 Start = 0;
    #100 clk = 1;
    repeat(70) #100 clk = ~clk;
    #100 $stop;
  end
endmodule