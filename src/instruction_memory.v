module Instruction_Memory(
    input rst, clk,
    input [15:0] read_address,
    output [15:0] instruction_out
);

    reg [15:0] I_Mem [63:0];
    integer k;
    assign instruction_out = (read_address[7:1] < 64) ? I_Mem[read_address[7:1]] : 16'b0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (k = 0; k < 64; k = k + 1)
                I_Mem[k] = 16'b0;
        end else begin
            // Compressed 16-bit Instructions
            // Format: [15:0]

    I_Mem[0]  = 16'b0000_0000_0000_0001; // c.nop (nop)
    I_Mem[2]  = 16'b0000_1101_1001_0001; // c.add x13, x16, x25  -> approx
    I_Mem[4]  = 16'b1000_0101_0000_0011; // c.sub x5, x8, x3     -> approx
    I_Mem[6]  = 16'b1000_0001_0001_0011; // c.and x1, x2, x3     -> approx
    I_Mem[8]  = 16'b1000_0010_0011_0101; // c.or x4, x3, x5      -> approx
    I_Mem[10] = 16'b1000_0010_0011_1001; // c.xor x4, x3, x5     -> approx
    I_Mem[12] = 16'b1000_0010_0011_1011; // c.sll x4, x3, x5     -> approx
    I_Mem[14] = 16'b1000_0010_0011_1101; // c.srl x4, x3, x5     -> approx
    I_Mem[16] = 16'b1000_0011_0010_1111; // c.sra x5, x3, x2     -> approx
    I_Mem[18] = 16'b1000_0011_0010_1001; // c.slt x5, x3, x2     -> approx

    // I-type
    I_Mem[20] = 16'b0001_0110_1010_0010; // c.addi x22, 2
    I_Mem[22] = 16'b0001_0100_1000_0011; // c.ori x9, 3
    I_Mem[24] = 16'b0001_0101_1000_0100; // c.xori x9, 4
    I_Mem[26] = 16'b0001_0001_0010_0101; // c.andi x1, 5
    I_Mem[28] = 16'b0001_0100_0011_0110; // c.slli x4, 6
    I_Mem[30] = 16'b0001_0100_0011_0111; // c.srli x4, 7
    I_Mem[32] = 16'b0001_0101_0011_1000; // c.srai x5, 8
    I_Mem[34] = 16'b0001_0101_0011_1001; // c.slti x5, 9

    // Load (L-type)
    I_Mem[36] = 16'b0100_1001_0011_0001; // c.lb x9, 5(x3)
    I_Mem[38] = 16'b0100_1001_0011_0010; // c.lh x9, 3(x3)
    I_Mem[40] = 16'b0100_1000_0010_1111; // c.lw x8, 15(x2)

    // Store (S-type)
    I_Mem[42] = 16'b1100_1000_0011_1111; // c.sb x15, 8(x3)
    I_Mem[44] = 16'b1100_1010_0110_1110; // c.sh x14, 10(x6)
    I_Mem[46] = 16'b1100_1100_0110_1110; // c.sw x14, 12(x6)

    // Branch (B-type)
    I_Mem[48] = 16'b1101_1001_1001_0110; // c.beqz x9, 12
    I_Mem[50] = 16'b1110_1001_1001_0111; // c.bnez x9, 14

    // U-type
    I_Mem[52] = 16'b0110_0011_0100_0000; // c.lui x3, 40
    I_Mem[54] = 16'b0110_0101_0100_0000; // c.auipc x5, 20

    // Jump
    I_Mem[56] = 16'b1110_0001_0100_0000; // c.jal x1, 20

end
            // (continue filling if needed)
        end


endmodule