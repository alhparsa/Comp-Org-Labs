`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:33 05/27/2019 
// Design Name: 
// Module Name:    mux2_1 
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
module mux2_1(input wire s,
			  input[31:0] inp_0, inp_1,
			  output reg [31:0] out
    );

	always @* begin
		if (s==0)
			out = inp_0;
		else
			out = inp_1;
	end


endmodule
