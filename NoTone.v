module NoTone(clk, NoTone);
	input clk;
	output reg NoTone;

	 
	 always@ (posedge clk)
		begin
			NoTone <= 1'b0;
		end


endmodule
