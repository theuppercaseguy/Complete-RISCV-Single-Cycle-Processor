


module TOP(
    input logic clk, rst
    );
    
    logic [31:0] adder_out, pc_mux_out, pc_out, inst_out, imm_out, dataR1, dataR2, dataW_R,
                 mux_out1_1, mux_out1_2, ALUOut, dataR;
    logic  [3:0]ImmSel;
    logic  [3:0]ALUSel;
    logic  [3:0]MEM_Ctrl;
    logic  s0, s1_1, s1_2, MEMW, MEMR, RegWEn, BrUn, Breq, BrLT;
    logic [1:0] WBSel;
    logic [8:0]temp ;
    assign temp = { {inst_out[30]},{inst_out[14:12]},{inst_out[6:2]} } ;
    
    Control_Unit CU(
            .instr( temp ),
            .BrEq(Breq), 
            .BrLT(BrLT),
            
            .PCSel(s0), .BrUn(BrUn),.ASel(s1_1), .BSel(s1_2), .MemR(MEMR),.MemW(MEMW), .RegWEn(RegWEn), 
            .ImmSel(ImmSel),.ALUSel(ALUSel), .WBSel(WBSel),
            .MEM_Ctrl(MEM_Ctrl)
        ); 
    
    mux pc_mux(
        adder_out,
        ALUOut,
        s0,
        
        pc_mux_out
    );
    
    PC pc_inst(
        .clk(clk), 
        .rst(rst),
        .PC(pc_mux_out),     
  
        .PC_next(pc_out)
    );
    
    adder adder_inst(
        .a(pc_out),
        .b(31'd4),
        .rst(rst),
        .s(adder_out)
    );
    

    logic [31:0]temp_pc;
    assign temp_pc = pc_out - 32'h80000000;
    IMEM IMEME_inst(
        .clk(clk),
        .rst(rst),
        .addr(temp_pc),
            
        .dataR(inst_out)
    );

    imm_gen imm_gen_inst(
        .imm(inst_out),
        .CTRL(ImmSel),
        
        .imm_ext(imm_out)
    );
    
    reg_file reg_file_inst(
        .clk(clk), 
        .rst(rst),
        .WE(RegWEn),
        .rs1(inst_out[19:15]),
        .rs2(inst_out[24:20]),
        .rsw(inst_out[11:7]),
        .dataW(dataW_R),
            
        .data1(dataR1),
        .data2(dataR2)
    );
    
    Branch_Comp BRAN_COMP(
        .data1(dataR1), .data2(dataR2),
        .BrUn(BrUn),
        
        .BrEq(Breq), .BrLT(BrLT)
    );
        
    mux Asel(
        .a(dataR1),
        .b(pc_out),
        .s(s1_1),
        
        .c(mux_out1_1)
    );
    
    mux Bsel(
        .a(dataR2),
        .b(imm_out),
        .s(s1_2),
        
        .c(mux_out1_2)
    );    
    
    ALU ALU_inst(
        .clk(clk), 
        .rst(rst),
        .ALUSel(ALUSel),
        .A(mux_out1_1),
        .B(mux_out1_2),
            
        .ALUOut(ALUOut)
    );    
    
    data_mem data_mem_inst(
        .clk(clk), 
        .rst(rst),
        .MEMR(MEMR),
        .MEMW(MEMW),
        .MEM_Ctrl(MEM_Ctrl),
        .addr(ALUOut), 
        .dataW(dataR2),
            
        .dataR(dataR)
            
    );
    
    mux3 dmem_mux(
        .a(dataR),
        .b(ALUOut),
        .c(adder_out),
        .s(WBSel),
        
        .d(dataW_R)
    );
    
    // The below code is for testing the processor on IP Tracer
    
    // tracer tracer_ip (
    // .clk_i(clk),
    // .rst_ni(rst),
    
    // .hart_id_i(32'b0),
    
    // .rvfi_valid(RegWEn),
    // .rvfi_insn_t(inst_out),
    // .rvfi_rs1_addr_t(inst_out[19:15]),
    // .rvfi_rs2_addr_t(inst_out[24:20]),
    // .rvfi_rs1_rdata_t(dataR1),
    // .rvfi_rs2_rdata_t(dataR2),
    // .rvfi_rd_addr_t(inst_out[11:7]) ,
    // .rvfi_rd_wdata_t(dataW_R),
    // .rvfi_pc_rdata_t(pc_out), //curr
    // .rvfi_pc_wdata_t(pc_mux_out), //next
    
    // .rvfi_mem_addr(0),
    // .rvfi_mem_rmask(0),
    // .rvfi_mem_wmask(0),
    // .rvfi_mem_rdata(0),
    // .rvfi_mem_wdata(0)
    // );

    
endmodule
