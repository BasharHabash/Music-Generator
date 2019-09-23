module B(clk, B);
	 input clk;
	 output reg B;
	 
	 reg [17:0] count;
	 initial B = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 101239)
		begin
			B <= !B;
			count <= 0;
		end
	 end

endmodule
