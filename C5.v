module C5(clk, C5);
    input clk;
	 output reg C5;
	 
	 reg [17:0] count;
	 initial C5 = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 95557)
		begin
			C5 <= !C5;
			count <= 0;
		end
	 end



endmodule
