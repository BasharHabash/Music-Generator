module G(clk, G);
    input clk;
	 output reg G;
	 
	 reg [17:0] count;
	 initial G = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 127551)
		begin
			G <= !G;
			count <= 0;
		end
	 end

endmodule
