module pc_mux(
    input [15:0] pc_in,       
    input [15:0] pc_branch,   
    input pc_select,          
    output reg [15:0] pc_out  
);

    always @(*) begin
        if (pc_select == 1'b0)
            pc_out = pc_in;  
        else
            pc_out = pc_branch;      
    end

endmodule