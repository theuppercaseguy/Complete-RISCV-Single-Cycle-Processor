


module imem_gen_tb();
    
    logic [11:0] imm;
    logic [31:0] imm_ext;
    
    imm_gen dut(
    imm,
    imm_ext
    );

    initial begin
         imm = 12'd4;
     #10 imm = 12'd8;
     #10 imm = 12'd16;
     #10 imm = -4;
     #10 imm = -8;
     #10 imm = -16;
     #10;
     $finish;
     
    
    end


endmodule