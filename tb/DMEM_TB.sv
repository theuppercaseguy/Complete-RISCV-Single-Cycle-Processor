`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2024 11:34:33 AM
// Design Name: 
// Module Name: DMEM_TB
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


module DMEM_TB();

    logic clk, rst, MEMR,MEMW;
    logic [3:0] MEM_Ctrl;
    logic [31:0] addr, dataW;
    logic [31:0] dataR;


    data_mem dut(
        clk, rst,MEMR,MEMW,
        MEM_Ctrl,
        addr, dataW,
        dataR
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk =0;
        rst = 1'b0;
        MEMR = 1'b1;
        MEMW = 1'b0;
        MEM_Ctrl = 0;
        addr = 32'd1;
        dataW = 32'h12345678;
        #5 rst = 1'b0;
        
        #10 MEM_Ctrl = 0;
        #10 MEM_Ctrl = 1;
        #10 MEM_Ctrl = 2; addr = 4;
        #10 MEM_Ctrl = 3;
        #10 MEM_Ctrl = 4;
        
        #10 MEM_Ctrl = 5; addr = 8; MEMW = 1'b1;
        #10 MEM_Ctrl = 6; addr = 12;
        #10 MEM_Ctrl = 7; addr = 16;
        
        #10 $finish;
    end
    










    


endmodule


















