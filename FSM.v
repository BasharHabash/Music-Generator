module FSM(S, tone, clk, out);
	input clk;
	input [3:0] S;
	input [12:0] tone;
	
	output reg out;
	
   reg [5:0]   state;
   initial state = 6'b1;
   
   reg [26:0]  count;
   initial count = 27'b0;  
	
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
	else
	  begin // play hanabera
	     case (state)
	       1: // Rest 
		 if (count < 27'b101_1111_0101_1110_0001_0000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[0]; 
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 2;
		   end
	       2: // D5
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[11];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 3;
		   end
	       3: // C5S
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[10];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 4;
		   end
	       4: // C5 3x.33
		 if (count < 27'b101_1111_0101_1110_0001_0000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[9];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 5;
		   end
	       5: // B4 
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[2];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 7;
		   end
	       7: // B4F
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[8];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 8;
		   end
	       8: // A4 1x.5 2x.25
		 if (count < 27'b101_1111_0101_1110_0001_0000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[1];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 9;
		   end
	       9: // G4S
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[12];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 10;
		   end
	       10: // G4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[7];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 11;
		   end
	       11: // F4
		 if (count < 27'b000_1111_1110_0101_0000_0010_1011)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[6];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 12;
		   end
	       12: // G4
		 if (count < 27'b000_1111_1110_0101_0000_0010_1011)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[7];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 13;
		   end
	       13: // F4
		 if (count < 27'b000_1111_1110_0101_0000_0010_1011)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[6];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 14;
		   end
	       14: // E4
		 if (count < 27'b001_0111_1101_0111_1000_0100_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[5];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 15;
		   end
	       15: // F4
		 if (count < 27'b001_0111_1101_0111_1000_0100_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[6];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 16;
		   end
	       16: // G4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[7];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 17;
		   end
	       17: // F4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[6];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 18;
		   end
	       18: // E4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[5];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 19;
		   end
	       19: // Rest
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[0];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 20;
		   end
	       20: // D5
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[11];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 21;
		   end
	       21: // C5S
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[10];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 22;
		   end
	       22: // C5 3x.33
		 if (count < 27'b101_1111_0101_1110_0001_0000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[9];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 23;
		   end
	       23: // B4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[2];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 24;
		   end
	       24: // B4F
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[8];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 25;
		   end
	       25: // A4 2x.25
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[1];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 26;
		   end
	       26: // Rest
		 if (count < 27'b001_0111_1101_0111_1000_0100_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[0];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 27;
		   end
	       27: // A4
		 if (count < 27'b001_0111_1101_0111_1000_0100_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[1];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 28;
		   end
	       28: // G4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[7];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 29;
		   end
	       29: // F4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[6];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 30;
		   end
	       30: // E4
		 if (count < 27'b000_1111_1110_0101_0000_0010_1011)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[5];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 31;
		   end
	       31: // F4
		 if (count < 27'b000_1111_1110_0101_0000_0010_1011)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[6];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 32;
		   end
	       32: // E4 
		 if (count < 27'b000_1111_1110_0101_0000_0010_1011)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[5];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 33;
		   end
	       33: // D4
		 if (count < 27'b001_0111_1101_0111_1000_0100_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[4];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 34;
		   end
	       34: // E4
		 if (count < 27'b001_0111_1101_0111_1000_0100_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[5];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 35;
		   end
	       35: // F4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[6];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 36;
		   end
	       36: // E4
		 if (count < 27'b010_1111_1010_1111_0000_1000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[5];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 37;
		   end
	       37: // D4
		 if (count < 27'b101_1111_0101_1110_0001_0000_0000)
		   begin
		      count <= count + {26'b0, 1'b1};
		      out <= tone[4];
		   end
		 else
		   begin
		      count <= 27'b0;
		      state = 1;
		   end
	       default: out <= tone[0];
	     endcase // case (state)
	  end // else: !if(S[3] == 1'b0)
     end // always @ (posedge clk)
endmodule // ToneGenerator
