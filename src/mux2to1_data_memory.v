module MUX2to1_DataMemory (
    input [15:0] input0,  
    input [15:0] input1,  
    input select,         
    output [15:0] out     
);

    assign out = (select) ? input1 : input0; 

endmodule