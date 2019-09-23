module F(clk, F);
	 input clk;
	 output reg F;
	 
	 reg [17:0] count;
	 initial F = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 143172)
		begin
			F <= !F;
			count <= 0;
		end
	 end


endmodule
