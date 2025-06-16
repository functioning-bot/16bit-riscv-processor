module immediate_generator(
    input [15:0] instruction,
    output reg [15:0] imm_out
);

    always @(*) begin
        case (instruction[6:0])
            7'b0010011: imm_out = {{8{instruction[15]}}, instruction[15:8]}; // I-type (example)
            7'b0000011: imm_out = {{8{instruction[15]}}, instruction[15:8]}; // Load
            7'b0100011: imm_out = {{8{instruction[15]}}, instruction[15:8]}; // Store
            7'b1100011: imm_out = {{7{instruction[15]}}, instruction[14:8], 1'b0}; // Branch
            default:    imm_out = 16'b0;
        endcase
    end

endmodule
