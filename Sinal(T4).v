module pontoTriangulo (
  input [9:0] x1,
  input [9:0] y1,
  input [9:0] x2,
  input [9:0] y2,
  input [9:0] x3,
  input [9:0] y3,
  input [9:0] x,
  input [9:0] y,
  output reg S
  );

  wire signed [20:0] A;
  wire signed [20:0] A1;
  wire signed [20:0] A2;
  wire signed [20:0] A3;

  area a(x1, y1, x2, y2, x3, y3, A);
  area b(x, y, x2, y2, x3, y3, A1);
  area c(x1, y1, x, y, x3, y3, A2);
  area d(x1, y1, x2, y2, x, y, A3);

  always @ (A, A1, A2, A3) begin
    if (A == (A1 + A2 + A3))
      begin
        S <= 1;
      end
    else
      begin
        S <= 0;
      end
  end
endmodule

module area (
	input [9:0] x1,
  input [9:0] y1,
  input [9:0] x2,
  input [9:0] y2,
  input [9:0] x3,
  input [9:0] y3,
  output reg [20:0] abs
  );

  always @ ( abs ) begin
    abs <= ((x1*(y2-y3) + (x2*(y3-y1)) + (x3*(y1-y2))));
  end

endmodule
