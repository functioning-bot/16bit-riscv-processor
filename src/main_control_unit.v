module main_control_unit(
    input [6:0] opcode,
    output reg RegWrite, MemRead, MemWrite, MemToReg, ALUSrc, Branch,
    output reg [1:0] ALUOp
);

    always @(*) begin
        case (opcode)
            7'b0110011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10}; // R-type
            7'b0010011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10}; // I-type
            7'b0000011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00}; // Load
            7'b0100011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00}; // Store
            7'b1100011: {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 2'b11}; // Branch
            default:   begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00};
                    $display("Warning: Unknown opcode %b", opcode);
end
        endcase
    end

endmodule