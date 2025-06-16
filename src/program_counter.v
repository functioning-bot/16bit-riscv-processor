module program_counter(
    input clk,                
    input rst,                
    input [15:0] pc_in,       
    output reg [15:0] pc_out 
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc_out <= 16'b0;  
        else
            pc_out <= pc_in;  
    end

endmodule