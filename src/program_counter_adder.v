module pc_adder(
    input [15:0] pc_in,       
    output reg [15:0] pc_next 
);

    always @(*) begin
        pc_next = pc_in + 2;  // 16-bit instruction is 2 bytes
    end

endmodule