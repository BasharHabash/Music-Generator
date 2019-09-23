module C5S(clk, C5S);
    input clk;
	 output reg C5S;
	 
	 reg [17:0] count;
	 initial C5S = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 90193)
		begin
			C5S <= !C5S;
			count <= 0;
		end
	 end


endmodule
