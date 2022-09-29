`timescale 1ns/1ns
module reg6 (input [5:0] in, input clk, init, ld, shift, cin,output reg [5:0] w, output reg co);
  always @(posedge clk) begin
    if (init)
      w <= 6'b000000;
    else if (ld)
      w <= in;
    else if (shift) 
      {w, co} <= {cin, w};
  end
endmodule
