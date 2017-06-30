module piscaled (
	input clk,
	output pis);

	assign pis = clk;

endmodule

module testled(output v);
	reg clk;

	always #2 clk <= ~clk;

	wire pis;

	piscaled P(clk, pis);

	initial begin
		$dumpvars(0, P);
		#1;
		clk <= 0;
		#100;
		$finish;
	end
endmodule
