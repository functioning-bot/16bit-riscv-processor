module ALU(
    input [15:0] A, B,
    input [3:0] ALUcontrol_In,
    output reg [15:0] Result,
    output reg Zero
);

    always @(*) begin
        case (ALUcontrol_In)
            4'b0000: Result = A + B;
            4'b0001: Result = A - B;
            4'b0010: Result = A & B;
            4'b0011: Result = A | B;
            4'b0100: Result = A ^ B;
            4'b0101: Result = A << B[3:0];
            4'b0110: Result = A >> B[3:0];
            4'b0111: Result = $signed(A) >>> B[3:0];
            4'b1000: Result = ($signed(A) < $signed(B)) ? 16'b1 : 16'b0;
            default: Result = 16'b0;
        endcase
        Zero = (Result == 16'b0) ? 1 : 0;
    end

endmodule