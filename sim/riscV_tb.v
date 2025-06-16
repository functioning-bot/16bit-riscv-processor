`timescale 1ns / 1ps
module Risc_ToP_Tb;

    reg clk, rst;
   
 // Instantiate the Unit Under Test (UUT)
    
    RISCV_Top UUT (
        .clk(clk), 
        .rst(rst)
  
    );

    // Clock generation
    initial begin
        clk = 0;
    end

    always #50 clk = ~clk; 

    // Reset generation
    initial begin
        rst = 1'b1;
        #50;
        rst = 1'b0; 
        #5200; 
        $finish; 
    end

    
//    initial begin
//        $dumpfile("waveform.vcd");  
//        $dumpvars(0, UUT);          
//    end

endmodule


