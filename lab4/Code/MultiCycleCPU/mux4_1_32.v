`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:55 05/27/2019 
// Design Name: 
// Module Name:    mux4_1_32 
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
module mux4_1_32(input [1:0] switch,
				  input [31:0] in_1,
				  in_2, in_3, in_4,
				  output reg [31:0] o
    );

	always @* begin
		if (switch == 2'd0) 
			o = in_1;
		else if (switch == 2'd1)
			o = in_2;
		else if (switch == 2'd2)
			o = in_3;
		else
			o = in_4;
	end

endmodule

