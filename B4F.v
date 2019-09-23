module B4F(clk, B4F);
	 input clk;
	 output reg B4F;
	 
	 reg [17:0] count;
	 initial B4F = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 107260)
		begin
			B4F <= !B4F;
			count <= 0;
		end
	 end

endmodule
