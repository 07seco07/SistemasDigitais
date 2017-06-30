module multv(

input clock, 
input [9:0] k, 
input [9:0] l, 
output [21:0] o);

wire [19:0] a; 
wire [21:0] b; 
wire [21:0] s;

reg [21:0] acc = 0;

assign a = k * l; 
assign s = a + b;

assign b = acc; 
assign o = acc;

always @( posedge clock ) begin acc <= s; 

end

endmodule

module test;

reg [9:0] k; reg [9:0] l;

wire [21:0] o;

multv (clock, k, l, o);

always #2 clock <= ~clock;

initial begin 

$dumpvars; 

k<= 3; 

l<=6; 

#4; 

k<=4; 

l<=7; 

#4; 

k<=5; 

l<=8;

#4; 

$finish 

end 

endmodule
