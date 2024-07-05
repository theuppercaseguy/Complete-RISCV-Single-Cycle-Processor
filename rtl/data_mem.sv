`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 02:46:00 PM
// Design Name: 
// Module Name: data_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_mem( 
    input logic clk, rst,MEMR,MEMW,
    input logic [3:0] MEM_Ctrl,
    input logic [31:0] addr, dataW,
    output logic [31:0] dataR
    );

    logic [7:0] DMEM [4095:0];
    logic [31:0] temp;
        
    always_comb
    begin
        if (MEMR == 1'b1)
        begin
           case(MEM_Ctrl)
           0: dataR <= { {24{DMEM[addr][7]}}, {DMEM[addr]} };
           1: dataR <=  { { 16{DMEM[addr+1][7]} } , {DMEM[addr+1]} , DMEM[addr] } ;
           2: dataR <= { DMEM[addr + 3],DMEM[addr + 2],DMEM[addr + 1],DMEM[addr]  };                                          //load word
           3: dataR <=  { { 24{1'b0} } , DMEM[addr] } ;             //load un byte
           4: dataR <=  { { 16{1'b0} } , {DMEM[addr+1]} , DMEM[addr] } ;             //load un half word
           default: begin end        
           endcase
        end
        else dataR <=31'd0;
    end

    always_ff@(posedge clk)
    begin
        if(rst == 1'b1)dataR = 0;
        else begin
        case (MEM_Ctrl)
        5: if (MEMW) begin 
            DMEM[addr] <= dataW[7:0]; 
        end
        6: if (MEMW) begin 
            DMEM[addr] <= dataW[7:0]; 
            DMEM[addr+1] <= dataW[15:8]; 
        end
        7: if (MEMW) begin
            {DMEM[addr+3], DMEM[addr+2], DMEM[addr+1], DMEM[addr]} <= dataW; 
        end
        default: ;  // No action for default
        endcase
        end
    end     
    
    initial begin
        DMEM[0] <= 8'hdd;
        DMEM[1] <= 8'hcc;
        DMEM[2] <= 8'hbb;
        DMEM[3] <= 8'haa;
        DMEM[4] <= 8'h44;
        DMEM[5] <= 8'h33;
        DMEM[6] <= 8'h22;
        DMEM[7] <= 8'h11;
//        DMEM[8] <= 8'h66;
    
    end

endmodule










