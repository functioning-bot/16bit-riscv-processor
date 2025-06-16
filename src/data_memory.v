module Data_Memory(
    input clk, rst,
    input MemRead, MemWrite,
    input [15:0] address,
    input [15:0] write_data,
    output [15:0] read_data
);

    reg [15:0] D_Memory [63:0];
    integer k;

    assign read_data = (MemRead) ? D_Memory[address] : 16'b0;

    // Initialization moved to reset block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (k = 0; k < 64; k = k + 1)
                D_Memory[k] = 16'b0;
            D_Memory[17] = 56;
            D_Memory[15] = 65;
        end else if (MemWrite) begin
            D_Memory[address] = write_data;
        end
    end

endmodule
