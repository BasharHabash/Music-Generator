
module ToneGenerator (S, clk, out);
   input [3:0] S;
   input       clk;
   output 	  out;
	
   wire [12:0] tone;
   
   NoTone U0(.clk(clk),.NoTone(tone[0]));
   A	U1(.clk(clk),.A(tone[1]));
   B 	U2(.clk(clk),.B(tone[2]));
   C 	U3(.clk(clk),.C(tone[3]));
   D 	U4(.clk(clk),.D(tone[4]));
   E 	U5(.clk(clk),.E(tone[5]));
   F 	U6(.clk(clk),.F(tone[6]));
   G 	U7(.clk(clk),.G(tone[7]));
   
   B4F 	U8(.clk(clk),.B4F(tone[8]));
   C5		U9(.clk(clk),.C5(tone[9]));
   C5S	U10(.clk(clk),.C5S(tone[10]));
   D5 	U11(.clk(clk),.D5(tone[11]));
   G4S 	U12(.clk(clk),.G4S(tone[12]));
	
	
	FSM U14 (.S(S),.clk(clk),.tone(tone),.out(out));
	
endmodule // ToneGenerator

	