module Branch_Adder(
    input [15:0] PC,
    input [15:0] offset,
    output reg [15:0] branch_target
);

    always @(*) begin
        branch_target = PC + offset;
    end

endmodule
