



module IMEM#(
        parameter instr_registers = 1024,
        parameter addr_width = 32        
    )
    (
        input logic [addr_width-1:0] addr,
        input logic rst,clk,
        
        output logic [31:0]dataR
    );
    
    logic [addr_width-1:0]INSTR_REG [instr_registers-1:0];
    
    
    always_comb
    begin
        if(rst ==1'b1)
        begin
            dataR <=32'd0;
        end
        else
        begin
            dataR <= INSTR_REG[addr[31:2]];
        end
    end
    
    initial begin
        $readmemh("../sim/seed/test.hex",INSTR_REG);
    end

  /* initial begin //testing purposes
    INSTR_REG[0] = 32'h00500093;
    INSTR_REG[1] = 32'h00A00113;
    INSTR_REG[2] = 32'h002081B3;
    INSTR_REG[3] = 32'h00014237;
    INSTR_REG[4] = 32'h00014297;
    INSTR_REG[5] = 32'h00400303;
    INSTR_REG[6] = 32'h00201383;
    INSTR_REG[7] = 32'h00402403;
    INSTR_REG[8] = 32'h00204483;
    INSTR_REG[9] = 32'h00405503;
    INSTR_REG[10] = 32'h003004A3;
    INSTR_REG[11] = 32'h00301623;
    INSTR_REG[12] = 32'h00302923;
    INSTR_REG[13] = 32'h0051A593;
    INSTR_REG[14] = 32'h0051B613;
    INSTR_REG[15] = 32'h00519693;
    INSTR_REG[16] = 32'h0051D713;
    INSTR_REG[17] = 32'h4051D793;
    INSTR_REG[18] = 32'h40208833;
    INSTR_REG[19] = 32'h002098B3;
    INSTR_REG[20] = 32'h0020A933;
    INSTR_REG[21] = 32'h0020B933;
    INSTR_REG[22] = 32'h0020C933;
    INSTR_REG[23] = 32'h0020D933;
    INSTR_REG[24] = 32'h4020D933;
    INSTR_REG[25] = 32'h0020E933;
    INSTR_REG[26] = 32'h0020F933;
    
//    INSTR_REG[27] = 32'h0210D663;
    INSTR_REG[27] = 32'h02C00F6F;
    
    INSTR_REG[28] = 32'h0020B933;
    INSTR_REG[29] = 32'h0020C933;
    INSTR_REG[30] = 32'h0020D933;
    INSTR_REG[31] = 32'h4020D933;
    INSTR_REG[32] = 32'h0020E933;
    INSTR_REG[33] = 32'h0020F933;
    INSTR_REG[34] = 32'h0020B933;
    INSTR_REG[35] = 32'h0020C933;
    INSTR_REG[36] = 32'h0020D933;
    INSTR_REG[37] = 32'h4020D933;
    INSTR_REG[38] = 32'h0020E933;
    INSTR_REG[39] = 32'h0020F933;
    
    
    INSTR_REG[40] = 32'h0020B933;
    INSTR_REG[41] = 32'h0020C933;
    INSTR_REG[42] = 32'h0020D933;
    INSTR_REG[43] = 32'h4020D933;
    INSTR_REG[44] = 32'h0020E933;
    INSTR_REG[45] = 32'h0020F933;
    
    INSTR_REG[46] = 32'h0020B933;
    INSTR_REG[47] = 32'h0020C933;
    INSTR_REG[48] = 32'h0020D933;
    INSTR_REG[49] = 32'h4020D933;
    INSTR_REG[50] = 32'h0020E933;
    INSTR_REG[51] = 32'h0020F933;
    
    
    end/*
endmodule









