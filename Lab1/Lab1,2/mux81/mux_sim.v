`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:33:08 03/04/2019
// Design Name:   mux81
// Module Name:   D:/3170300180/mux8-1/mux-sim.v
// Project Name:  mux8-1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux81
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_sim;

	// Inputs
	reg [7:0] in;
	reg [2:0] s;
	reg [4:0] counter;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	mux81 uut (
		.in(in), 
		.s(s), 
		.out(out)
	);

	initial begin
		in = 8'b1101_0101;
		s = 3'b000;
		for (counter = 0; counter < 10; counter = counter + 1) begin
			#100; 
			s = s + 1'b1;
      end

	end
      
endmodule

