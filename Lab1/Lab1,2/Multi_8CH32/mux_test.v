`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:54:39 03/15/2019
// Design Name:   Multi_8CH32
// Module Name:   D:/3170300180/mux/mux_test.v
// Project Name:  mux
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multi_8CH32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_test;

	// Inputs
	reg clk;
	reg rst;
	reg EN;
	reg [2:0] Test;
	reg [63:0] point_in;
	reg [63:0] LES;
	reg [31:0] data0;
	reg [31:0] data1;
	reg [31:0] data2;
	reg [31:0] data3;
	reg [31:0] data4;
	reg [31:0] data5;
	reg [31:0] data6;
	reg [31:0] data7;

	// Outputs
	wire [31:0] Disp_num;
	wire [7:0] point_out;
	wire [7:0] LE_out;

	// Instantiate the Unit Under Test (UUT)
	Multi_8CH32 uut (
		.clk(clk), 
		.rst(rst), 
		.EN(EN), 
		.Test(Test), 
		.point_in(point_in), 
		.LES(LES), 
		.data0(data0), 
		.data1(data1), 
		.data2(data2), 
		.data3(data3), 
		.data4(data4), 
		.data5(data5), 
		.data6(data6), 
		.data7(data7), 
		.Disp_num(Disp_num), 
		.point_out(point_out), 
		.LE_out(LE_out)
	);
	reg [2:0] num;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		EN = 1;
		Test = 0;
		point_in = 64'haa_bb_cc_dd_ee_ff_ac_fa;
		LES = 64'hab_bc_cd_ed_aa_ba_ff_da;
		data0 = 8'hab;
		data1 = 8'hac;
		data2 = 8'had;
		data3 = 8'hae;
		data4 = 8'haf;
		data5 = 8'hbb;
		data6 = 8'hbc;
		data7 = 8'hbd;
		for (num = 0; num<8; num = num+1)begin
			#50;
			Test=num;
		end
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

