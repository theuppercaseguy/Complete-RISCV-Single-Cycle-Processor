


module regfile_TB();

    logic clk, rst, WE;
    logic [4:0] rs1,rs2,rsw;
    logic [31:0]dataW, data1,data2;
    
    reg_file dut(
        clk, rst, WE,
        rs1, rs2, rsw,
        dataW,
            
        data1,data2
    );
    
    
    always #5 clk = ~clk;
    
    initial begin
        rst = 0;
        clk = 0;
        rs1 =0;
        rs2=0;
        rsw=0;
        dataW=0;
        #5 rst = 1'b1;
        
        #10 rs1 = 1;
        #10 rs2 = 2;
        #10 rsw = 3;
        #10 dataW = 32'd9966;
        #10 $finish;
        
        
    
    end


endmodule