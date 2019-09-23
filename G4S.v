module G4S(clk, G4S);
    input clk;
	 output reg G4S;
	 
	 reg [17:0] count;
	 initial G4S = 1'b0;
	 
	 always@ (posedge clk)
	 begin
		count <= count + 1'b1;
		
		if (count == 120395)
		begin
			G4S <= !G4S;
			count <= 0;
		end
	 end


endmodule
