`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:00 05/30/2019 
// Design Name: 
// Module Name:    controller 
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


module controller(input  clk,
					input  reset,
					input  [31:0] Inst_in,
					input  zero,
					input  overflow,
					input  MIO_ready,
					output reg MemRead,
					output reg MemWrite,
					output reg[2:0]ALU_operation,
					output reg CPU_MIO,
					output reg IorD,
					output reg IRWrite,
					output reg [1:0]RegDst,
					output reg RegWrite,
					output reg [1:0]MemtoReg,
					output reg ALUSrcA,
					output reg [1:0]ALUSrcB,
					output reg [1:0]PCSource,
					output reg PCWrite,
					output reg PCWriteCond,
					output reg Branch);


    wire [5:0] op_code = Inst_in[31:26];
    wire R_type = (op_code == 6'b0) ? 1:0;
    reg [2:0] step;
    reg [16:0] ctrl;
    always @(posedge clk or posedge reset) begin
        {PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,PCSource,ALUSrcB,ALUSrcA,RegWrite,RegDst, CPU_MIO} = ctrl;
        if (reset == 0)begin
            ctrl = 17'h12821; 
            ALU_operation = 3'b010;
            step = 3'b0; // instruction fetch
        end
        case (step)
            3'b000: begin // instruction fetch
                if (MIO_ready == 1)begin
                    ALU_operation = 3'b010;
                    step = 3'b001;
                end else step = 3'b000;
            end
            3'b001: begin //instruction decode
                        if (R_type == 1)begin
                            step = 3'b011; // execute
                            ctrl = 17'h00010;
                            case (Inst_in[5:0])
                                6'd32: ALU_operation = 3'b010; // ADD
                                6'd34: ALU_operation = 3'b110; // SUB
                                6'd36: ALU_operation = 3'b000; // AND
                                6'd37: ALU_operation = 3'b001; // OR
                                6'd38: ALU_operation = 3'b011; // XOR
                                6'd39: ALU_operation = 3'b100; // NOR
                                6'd42: ALU_operation = 3'b111; // SLT
                                6'd02: ALU_operation = 3'b101; // SRL
                                6'd08: begin  // JR
                                    ctrl = 17'h10010;
                                    ALU_operation = 3'b010; step = 3'b010; //execute
                                    end
                                default: ALU_operation = 3'b010; // ADD
                            endcase 
                            end
                        else
                            case(op_code)
                                6'h23:begin // lw
                                    ctrl = 17'h00050;
                                    ALU_operation = 3'b010; // ADD
                                    step = 3'b011; // execute
                                end
                                6'h2B: begin // sw
                                    ctrl = 17'h00050;
                                    ALU_operation = 3'b010; //ADD
                                    step = 3'b011; // execute
                                end
                                6'h02:begin // j
                                    ctrl = 17'h10160;
                                    step = 3'b011; //execute
                                end
                                6'h03: begin // jal
                                    ctrl = 17'h1076c;
                                    step = 3'b011; // execute
                                end
                                6'h05: begin // bne
                                    ctrl = 17'h08090; 
                                    Branch = 0;
                                    ALU_operation = 3'b110; //SUB
                                    step = 3'b011; // execute
                                end
                                6'h04: begin // beq
                                    ctrl = 17'h08090;
                                    Branch = 1;
                                    ALU_operation = 3'b110; //SUB
                                    step = 3'b011; //execute
                                end
                                6'h08: begin // addi
                                    ctrl = 17'h00050;
                                    ALU_operation = 3'b010; // ADD
                                    step = 3'b011; // execute
                                end

                                6'h0A: begin // slti
                                    ctrl =  17'h00050;
                                    ALU_operation = 3'b111; // SLT
                                    step = 3'b011; // execute
                                end

                                6'h0C: begin // andi
                                    ctrl = 17'h00050;
                                    ALU_operation = 3'b0; //AND
                                    step = 3'b011; // execute
                                end
                                6'h0D: begin // ori
                                    ctrl = 17'h00050;
                                    ALU_operation = 3'b001; // or
                                    step = 3'b011; // execute
                                end
                                6'h0F: begin // lui
                                    ctrl = 17'h00468;
                                    step = 3'b101; // write back lui
                                end
                                default: step = 3'b111; //error
                            endcase

                end
            3'b010: begin // memory
                    case (op_code)
                                6'h23:begin // lw
                                    if (MIO_ready)begin
                                        step = 3'b100; // write back
                                        ctrl = 17'h00208;
                                    end
                                    else begin
                                        step = 3'b010; // memory
                                        ctrl = 17'h06050;
                                    end
                                end
                                6'h2B: begin // sw
                                    if (MIO_ready)begin
                                        step = 3'b000; // instruction fetch
                                        ctrl = 17'h12821;
                                    end
                                    else begin
                                        step = 3'b010; // memory
                                        ctrl  = 17'h05050;
                                    end
                                end
                    endcase
                end
            3'b011: begin // execute
                if (R_type==1)begin
                    step = 3'b100; // write back
                    ctrl = 17'h0001a;
                end
                case(op_code)
                        6'h23:begin // lw
                            step = 3'b010; // memory
                            ctrl = 17'h06051;
                        end
                        6'h2B: begin // sw
                            step = 3'b010; // memory
                            ctrl = 17'h05051;
                        end
                        6'h02:begin // j
                            step = 3'b000; //instruction fetch
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h12821;
                        end
                        6'h03: begin // jal
                            step = 3'b000; // instruction fetch
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h12821;
                        end
                        6'h05: begin // bne
                            step = 3'b000; // instruction fetch
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h12821;
                        end
                        6'h04: begin // beq
                            step = 3'b000; //instruction fetch
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h12821;
                        end
                        6'h08: begin // addi
                            step = 3'b101; // write back imm
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h00058;
                        end

                        6'h0A: begin // slti
                            step = 3'b101; // write back imm
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h00058;
                        end

                        6'h0C: begin // andi
                            step = 3'b101; // write back imm
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h00058;
                        end
                        6'h0D: begin // ori
                            step = 3'b101; // write back imm
                            ALU_operation = 3'b010; // ADD
                            ctrl = 17'h00058;
                        end
                        default: step = 3'b111; //error
                endcase
            end

            3'b100: begin // write back
                if (R_type == 1) begin
                    ctrl = 17'h12821;
                    ALU_operation = 3'b010; // add
                    step = 3'b000; // instruction fetch
                end
                else begin
                    ctrl = 17'h12821;
                    ALU_operation = 3'b010; // ADD
                    step = 3'b000; // instruction fetch
                end
            end

            3'b101: begin // write back for immediates
                ctrl = 17'h12821;
                ALU_operation = 3'b010; step = 3'b000; // instruction fetch
            end

            3'b110: begin // write back for lui
                step = 3'b000;
                ALU_operation = 3'b010; // ADD
                ctrl = 17'h12821;
            end

            3'b111: begin // error
                step = 3'b111;
            end
            default: begin Branch = 0; ALU_operation = 3'b010; step = 3'b111; end
        endcase
    end
endmodule