`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:03:58 03/13/2019
// Design Name:   MC14495_ZJU
// Module Name:   D:/3170300180/lab1_2/nihao_test.v
// Project Name:  lab1_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MC14495_ZJU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nihao_test;

	// Inputs
	reg [3:0] in;
	reg LE;
	reg point;
	reg [3:0] num;

	// Outputs
	wire [7:0] o;

	// Instantiate the Unit Under Test (UUT)
	MC14495_ZJU uut (
		.in(in), 
		.LE(LE), 
		.point(point), 
		.o(o)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		LE = 0;
		point = 0;
		for (num = 0; num < 16; num = num+1)begin
			in = num;
			#50;
		end
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

