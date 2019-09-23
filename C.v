module C(clk, C);
	 input clk;
	 output reg C;
	 
	 reg [17:0] count;
	 initial C = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 191110)
		begin
			C <= !C;
			count <= 0;
		end
	 end


endmodule
