

module imem_tb();
        logic rst;
        logic [31:0] addr, dataR;

        IMEM dut(
        addr,
        rst,
        
        dataR
        );
        
        
        initial begin
        rst =1'b1;
        addr = 32'd2;
        #5;
        rst = 1'b0; 
        #10;
        $finish;
        
        end
        
        
endmodule