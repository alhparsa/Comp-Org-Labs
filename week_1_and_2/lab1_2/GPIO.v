`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:57 03/15/2019 
// Design Name: 
// Module Name:    SPIO 
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
//.clk(clk_100mhz), .rst(rst), .EN(1'b1), .Start(U8_div[10]), .P_Data({SW[13:0], U9_SWOK[15:0], 2'b0}), .counter_set(counter_set),
//	.LED_out(led_out_U7), .GPIOf0(GPIOf0), .ledclk(LEDCLK), .ledsout(notLEDDT), .LEDEN(LEDEN), .ledclrn(LEDCLR)

module GPIO(input wire clk,
			  input wire rst,
			  input wire EN,
			  input wire Start,
			  input wire [31:0] P_Data,
			  output reg [1:0] counter_set,
			  output wire [15:0] LED_out,
			  output reg [13:0] GPIOf0,
			  output wire ledclk,
			  output wire ledsout,
			  output wire LEDEN,
			  output wire ledclrn
    );
	 reg [15:0] LED;
	 assign LED_out = LED;
	 always @(negedge clk or posedge rst)begin
		if (rst)begin
			LED <= 8'h2a;
			counter_set <= 2'b00;
		end
		else if (EN)begin 
			{GPIOf0, LED, counter_set} <= P_Data;
		end
		else begin
			LED <= LED; 
			counter_set <= counter_set;
		end
	end
	LEDP2S #(.DATA_BITS(16), .DATA_COUNT_BITS(4)) M1(clk, rst, Start, {LED}, ledclk, ledclrn, ledsout, LEDEN);

endmodule
