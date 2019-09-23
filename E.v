module E(clk, E);
	 input clk;
	 output reg E;
	 
	 reg [17:0] count;
	 initial E = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 151685)
		begin
			E <= !E;
			count <= 0;
		end
	 end


endmodule
