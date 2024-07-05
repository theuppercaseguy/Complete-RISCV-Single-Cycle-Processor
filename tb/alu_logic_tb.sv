

module alu_TB();
    
    logic clk, rst;
    logic [4:0] ALUSel;
    logic [31:0] A,B;
    logic [31:0]ALUOut;
    
    ALU dut(
    clk, 
    rst,
    ALUSel,
    A,
    B,
            
    ALUOut 
    );
    
    
    initial begin
    clk =0;
    rst =1;
    A = 5;
    B = 10;
    ALUSel = 0;
    #5;
    rst = 0;
    #10 ALUSel = 0;
    #10 ALUSel = 1;
    #10 ALUSel = 2;
    #10 ALUSel = 3;
    #10 ALUSel = 4;
    #10 ALUSel = 5;
    #10 ALUSel = 6;
    #10 $finish;
   end
    
    always #5 clk = ~clk;
   
endmodule