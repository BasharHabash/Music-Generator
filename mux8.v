module mux8 (S, tone, clk, out); 

input clk;
input [12:0] tone;
input [4:0] S;
output reg out;
  
always @ (posedge clk)
begin
	if (S[3] == 1'b0)
	begin
		case (S)
	       1: out <= tone[1];
	       2: out <= tone[2];
	       3: out <= tone[3];
	       4: out <= tone[4];
	       5: out <= tone[5];
	       6: out <= tone[6];
	       7: out <= tone[7];
	       default: out <= tone[0];
		endcase // case (S)
	end // if (S[3] == 1'b0)
end
endmodule
