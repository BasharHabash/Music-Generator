`timescale 1ms/1ps;

module tb_ToneGenerator;

   reg [3:0] S;
   reg       clk;
   wire 	  	out;
	
	ToneGenerator uut (.S(S),.clk(clk),.out(out));
	
	initial begin
	
	clk = 0;
	S = 4'b0000; #10;
	S = 4'b0001; #1000;
	S = 4'b0111; #1000;
	S = 4'b1000; #1000;
	S = 4'b1100; #1000;
	
	end
	
	always #5 clk = ~clk;
	
endmodule 