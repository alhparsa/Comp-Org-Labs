`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:50 05/27/2019 
// Design Name: 
// Module Name:    sign_extension 
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
module sign_extension(input wire [15:0] inp,
					  output wire [31:0] out
    );

	wire sign = inp[15];
	assign out = sign == 1? {16'b1, inp}: {16'b0,inp};
endmodule
