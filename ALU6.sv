`timescale 1ns/1ns
module ALU6(input [5:0] A, [5:0] B, input clk, add, sub, output reg [5:0] w);
  always@(posedge clk) begin
    if (add)
      w <= A + B;
    else if (sub)
      w <= A - B;
  end
endmodule