`timescale 1ns/1ns
module controller(input Start, clk, X1, X0, rst ,output reg ld_X, ld_Y, ld_A, ld_ff, init_A, init_ff, add, sub, Done, shift_x, shift_a);
  logic [3:0] ps, ns;
  reg [2:0] counter;
  reg c_up, init_cnt;
  Counter cnt(c_up, clk, init_cnt, counter);
  parameter [3:0]A = 4'b0000;
  parameter [3:0]B = 4'b0001;
  parameter [3:0]C = 4'b0010;
  parameter [3:0]E = 4'b0100;
  parameter [3:0]F = 4'b0101;
  parameter [3:0]G = 4'b0110;
  parameter [3:0]H = 4'b0111;
  parameter [3:0]I = 4'b1000;
  parameter [3:0]J = 4'b1001;
  parameter [3:0]K = 4'b1010;

  always @(Start, X1, X0, ps) begin
    case (ps)
      A : if (Start) ns = B;
      B : ns = C;
      C : ns = ({X1, X0} == 2'b01) ? E : ({X1, X0} == 2'b10) ? F : I;
      E : ns = H; 
      F : ns = H;
      G : ns = (counter >= 3'b110) ? A : ({X1, X0} == 2'b01) ? E : ({X1, X0} == 2'b10) ? F : I;
      H : ns = I;
      I : ns = J;
      J : ns = K;
      K : ns = G;
      default : ns = A;
    endcase
  end

  always @(ps) begin
    {ld_X, ld_Y, ld_A, ld_ff, init_A, init_ff, add, sub, Done, shift_x, shift_a, c_up, init_cnt} = 13'b0;
    case (ps)
      A : {Done, init_cnt} = 2'b11;
      B : {ld_X, init_A, init_ff} = 3'b111;
      C : ld_Y = 1;
      E : add = 1'b1;
      F : sub = 1'b1;
      H : ld_A = 1'b1;
      I : shift_a = 1'b1;
      J : shift_x = 1'b1;
      K : {ld_ff, c_up} = 2'b11;
    endcase
  end

  always @(posedge clk) begin
    if (rst)
      ps = 0;
    else
      ps <= ns;
  end

endmodule