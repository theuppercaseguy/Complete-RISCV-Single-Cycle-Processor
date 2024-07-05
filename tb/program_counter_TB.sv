

module PC_TB();
    logic clk, rst;
    logic [31:0] PC;
    logic [31:0] PC_next;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        PC = 32'd0;
        #5;
        
        rst = 1'b0;
        #10;
        PC = 32'd4;                    
        #10;
        PC = 32'd8;                    
        #10;
        $finish;
    end
    
    always #5 clk = ~clk;
    
    PC dut (
        .clk(clk), 
        .rst(rst),
        .PC(PC),
        .PC_next(PC_next)
    );
endmodule