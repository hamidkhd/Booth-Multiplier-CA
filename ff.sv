`timescale 1ns/1ns
module ff(input d, clk, init, ld, output reg q);
  always @(posedge clk) begin
    if (init)
      q <= 1'b0;
    else if (ld)
      q <= d;
  end
endmodule
