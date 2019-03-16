`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:46 03/13/2019 
// Design Name: 
// Module Name:    SSeg_map 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SSeg_map(input wire [31:0] Hexs,
					 output wire [0:63] Seg_map
    );
	
	 assign Seg_map = 
			  {Hexs[0], Hexs[4],Hexs[16], Hexs[25], Hexs[17], Hexs[5], Hexs[12], Hexs[24],
			  Hexs[1], Hexs[6],Hexs[18], Hexs[27], Hexs[19], Hexs[7], Hexs[13], Hexs[26],
			  Hexs[2], Hexs[8],Hexs[20], Hexs[29], Hexs[21], Hexs[9], Hexs[14], Hexs[28],
			  Hexs[3], Hexs[10],Hexs[22], Hexs[31], Hexs[23], Hexs[11], Hexs[15], Hexs[30],
			  
			  Hexs[0], Hexs[4],Hexs[16], Hexs[25], Hexs[17], Hexs[5], Hexs[12], Hexs[24],
			  Hexs[1], Hexs[6],Hexs[18], Hexs[27], Hexs[19], Hexs[7], Hexs[13], Hexs[26],
			  Hexs[2], Hexs[8],Hexs[20], Hexs[29], Hexs[21], Hexs[9], Hexs[14], Hexs[28],
			  Hexs[3], Hexs[10],Hexs[22], Hexs[31], Hexs[23], Hexs[11], Hexs[15], Hexs[30]};

endmodule
