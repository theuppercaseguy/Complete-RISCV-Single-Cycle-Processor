`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2024 03:37:22 PM
// Design Name: 
// Module Name: Ctrl_Unit_TB
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


module tb_Control_Unit;
    // Inputs
    logic [8:0] instr;
    logic Breq, BrLT;

    // Outputs
    logic PCSel, BrUn, ASel, BSel, MemR, MemW, RegWEn;
    logic [2:0] ImmSel;
    logic [3:0] ALUSel, MEM_Ctrl;
    logic [1:0] WBSel;

    // Instantiate the Unit Under Test (UUT)
    Control_Unit uut (
        .instr(instr), 
        .Breq(Breq), 
        .BrLT(BrLT), 
        .PCSel(PCSel), 
        .BrUn(BrUn), 
        .ASel(ASel), 
        .BSel(BSel), 
        .MemR(MemR), 
        .MemW(MemW), 
        .RegWEn(RegWEn), 
        .ImmSel(ImmSel), 
        .ALUSel(ALUSel), 
        .WBSel(WBSel),
        .MEM_Ctrl(MEM_Ctrl)
    );

    // Test stimulus
    initial begin
        // Initialize Inputs
        instr = 9'b0;
        Breq = 0;
        BrLT = 0;
        
        // Apply test vectors
        // Test LUI instruction
        instr = 9'b00001101; // LUI
        #10;
        
        // Test AUIPC instruction
        instr = 9'b00000101; // AUIPC
        #10;
        
        // Test JAL instruction
        instr = 9'b0011011; // JAL
        #10;
        
        // Test JALR instruction
        instr = 9'b00011001; // JALR
        #10;
        
        // Test BEQ instruction (fail case)
        instr = 9'b00011000; Breq = 1'b0; // BEQ fail
        #10;
        
        // Test BEQ instruction (pass case)
        instr = 9'b00011000; Breq = 1'b1; // BEQ pass
        #10;
        
        // Test BNE instruction (fail case)
        instr = 9'b00111000; Breq = 1'b1; // BNE fail
        #10;
        
        // Test BNE instruction (pass case)
        instr = 9'b00111000; Breq = 1'b0; // BNE pass
        #10;
        
        // Test BLT instruction
        instr = 9'b10011000; BrLT = 1'b1; // BLT
        #10;
        
        // Test BLTU instruction
        instr = 9'b11011000; BrLT = 1'b1; // BLTU
        #10;
        
        // Test LB instruction
        instr = 9'b00000000; // LB
        #10;
        
        // Test LH instruction
        instr = 9'b00100000; // LH
        #10;
        
        // Test LW instruction
        instr = 9'b01000000; // LW
        #10;
        
        // Test LBU instruction
        instr = 9'b10000000; // LBU
        #10;
        
        // Test LHU instruction
        instr = 9'b10100000; // LHU
        #10;
        
        // Test SB instruction
        instr = 9'b00001000; // SB
        #10;
        
        // Test SH instruction
        instr = 9'b00101000; // SH
        #10;
        
        // Test SW instruction
        instr = 9'b01001000; // SW
        #10;
        
        // Test ADDI instruction
        instr = 9'b00000100; // ADDI
        #10;
        
        // Test SLTI instruction
        instr = 9'b01000100; // SLTI
        #10;
        
        // Test SLTIU instruction
        instr = 9'b01100100; // SLTIU
        #10;
        
        // Test XORI instruction
        instr = 9'b10000100; // XORI
        #10;
        
        // Test ORI instruction
        instr = 9'b11000100; // ORI
        #10;
        
        // Test ANDI instruction
        instr = 9'b11100100; // ANDI
        #10;
        
        // Test SLLI instruction
        instr = 9'b000100100; // SLLI
        #10;
        
        // Test SRLI instruction
        instr = 9'b010100100; // SRLI
        #10;
        
        // Test SRAI instruction
        instr = 9'b110100100; // SRAI
        #10;
        
        // Test ADD instruction
        instr = 9'b000001100; // ADD
        #10;
        
        // Test SUB instruction
        instr = 9'b100001100; // SUB
        #10;
        
        // Test SLL instruction
        instr = 9'b001001100; // SLL
        #10;
        
        // Test SLT instruction
        instr = 9'b010001100; // SLT
        #10;
        
        // Test SLTU instruction
        instr = 9'b011001100; // SLTU
        #10;
        
        // Test XOR instruction
        instr = 9'b100001100; // XOR
        #10;
        
        // Test SRL instruction
        instr = 9'b010101100; // SRL
        #10;
        
        // Test SRA instruction
        instr = 9'b110101100; // SRA
        #10;
        
        // Test OR instruction
        instr = 9'b011001100; // OR
        #10;
        
        // Test AND instruction
        instr = 9'b111001100; // AND
        #10;
        
        // End simulation
        $stop;
    end
endmodule
