module somador(input clock,
	       input [43:0] a,
	       input [43:0] b,
	       output[43:0] s
		);
reg [43:0] saida;
assign s = saida;
always @(posedge clock) begin
	saida <= a + b;
end
endmodule

module teste;
	
	reg clock;
	reg[43:0] a, b;
	
	wire[43:0] s;
	
	always #2 clock = ~clock;
	
	somador B(clock, a, b, s);
	
	initial begin
	$dumpvars(0, B);
		
	#0 clock <= 0;
	a <= 4;
	b <= 8;
		
	#30
	a <= 11;
	b <= 40;
		
	#60
	a <= 4;
	b <= 5;
		
	#90;
	a <= 38;
	b <= 62;
		
	#500;
	$finish;
end
endmodule
