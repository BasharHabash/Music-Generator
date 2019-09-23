module D5(clk, D5);
    input clk;
	 output reg D5;
	 
	 reg [17:0] count;
	 initial D5 = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 85131)
		begin
			D5 <= !D5;
			count <= 0;
		end
	 end



endmodule
