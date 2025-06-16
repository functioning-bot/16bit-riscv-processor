module Register_File(
    input clk, rst, RegWrite,
    input [4:0] Rs1, Rs2, Rd,
    input [15:0] Write_data,
    output [15:0] read_data1, read_data2
);

    reg [15:0] Registers [31:0];
    integer k;


    always @(posedge clk) begin
        if (rst) begin
              Registers[0]  = 16'd0;
  Registers[1]  = 16'd3;
  Registers[2]  = 16'd2;
  Registers[3]  = 16'd12;
  Registers[4]  = 16'd20;
  Registers[5]  = 16'd3;
  Registers[6]  = 16'd44;
  Registers[7]  = 16'd4;
  Registers[8]  = 16'd2;
  Registers[9]  = 16'd1;
  Registers[10] = 16'd23;
  Registers[11] = 16'd4;
  Registers[12] = 16'd90;
  Registers[13] = 16'd10;
  Registers[14] = 16'd20;
  Registers[15] = 16'd30;
  Registers[16] = 16'd40;
  Registers[17] = 16'd50;
  Registers[18] = 16'd60;
  Registers[19] = 16'd70;
  Registers[20] = 16'd80;
  Registers[21] = 16'd80;
  Registers[22] = 16'd90;
  Registers[23] = 16'd70;
  Registers[24] = 16'd60;
  Registers[25] = 16'd65;
  Registers[26] = 16'd4;
  Registers[27] = 16'd32;
  Registers[28] = 16'd12;
  Registers[29] = 16'd34;
  Registers[30] = 16'd5;
  Registers[31] = 16'd10;
//            for (k = 0; k < 32; k = k + 1)
//                Registers[k] = 16'b0;
        end else if (RegWrite) begin
            Registers[Rd] = Write_data;
        end
    end

    assign read_data1 = Registers[Rs1];
    assign read_data2 = Registers[Rs2];

endmodule