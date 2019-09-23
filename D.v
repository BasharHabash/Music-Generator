module D(clk, D);
	 input clk;
	 output reg D;
	 
	 reg [17:0] count;
	 initial D = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 170265)
		begin
			D <= !D;
			count <= 0;
		end
	 end


endmodule
