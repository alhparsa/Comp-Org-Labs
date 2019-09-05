`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:06 03/04/2019 
// Design Name: 
// Module Name:    Multi_8CH32 
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
module Multi_8CH32(input wire clk,
						 input wire rst,
						 input wire EN,
						 input wire [2:0] Test,
						 input wire [0:63] point_in,
						 input wire [0:63] LES,
						 input wire [0:31] data0,
						 input wire [0:31] data1,
						 input wire [0:31] data2,
						 input wire [0:31] data3,
						 input wire [0:31] data4,
						 input wire [0:31] data5,
						 input wire [0:31] data6,
						 input wire [0:31] data7,
						 output reg [0:31] Disp_num,
						 output reg [0:7] point_out,
						 output reg [0:7] LE_out
    );
always @* begin
	if (EN)
		begin
			if (Test == 0)begin
				Disp_num <= data0;
				LE_out <= LES[0:7];
				point_out <= point_in[0:7];
			end
			else if (Test == 1)begin
				Disp_num <= data1;
				LE_out <= LES[8:15];
				point_out <= point_in[8:15];
			end
			else if (Test == 2)begin
				Disp_num <= data2;
				LE_out <= LES[16:23];
				point_out <= point_in[16:23];
			end
			else if (Test == 3)begin
				Disp_num <= data3;
				LE_out <= LES[24:31];
				point_out <= point_in[24:31];
			end
			else if (Test == 4)begin
				Disp_num <= data4;
				LE_out <= LES[32:39];
				point_out <= point_in[32:39];
			end
			else if (Test == 5)begin
				Disp_num <= data5;
				LE_out <= LES[40:47];
				point_out <= point_in[40:47];
			end
			else if (Test == 6)begin
				Disp_num <= data6;
				LE_out <= LES[48:55];
				point_out <= point_in[48:55];
			end
			else if (Test == 7)begin
				Disp_num <= data7;
				LE_out <= LES[56:63];
				point_out <= point_in[56:63];
			end
		end
	end

endmodule
