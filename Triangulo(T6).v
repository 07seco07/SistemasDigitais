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

module teste;

  integer entrada;
  integer saida;
  integer resp;
  reg signed [9:0] x1;
  reg signed [9:0] y1;
  reg signed [9:0] x2;
  reg signed [9:0] y2;
  reg signed [9:0] x3;
  reg signed [9:0] y3;
  reg signed [9:0] x;
  reg signed [9:0] y;
  reg signed [9:0] P;
  wire S;

  initial begin
    $dumpvars;

    entrada = $fopen("entradaVerilog.txt", "r");
    saida = $fopen("saidaVerilog.txt", "w");

    if (entrada == 0)
    begin
      $display("O arquivo não pode ser aberto.");
      $finish;
    end
  end

  always #2 begin
    if(!$feof(entrada)) begin
    resp = $fscanf(entrada, "%d %d %d %d %d %d %d %d %d\n", x1, y1, x2, y2, x3, y3, x, y, P);
    //$display("%d %d %d %d %d %d %d %d %d\n", x1, y1, x2, y2, x3, y3, x, y, P);
    #1
      if (S == 1)
        $fwrite(saida, "%.f %.f  %.f %.f  %.f %.f  %.f %.f %.f\n", x1, y1, x2, y2, x3, y3, x, y, S);
      else
        $fwrite(saida, "%.f %.f  %.f %.f  %.f %.f  %.f %.f %.f\n", x1, y1, x2, y2, x3, y3, x, y, S);
    end
    else begin
      $finish;
    end
  end

  pontoTriangulo p(x1, y1, x2, y2, x3, y3, x, y, S);

endmodule
