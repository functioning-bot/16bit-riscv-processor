module seg7decimal (
    input [19:0] x,           // 5 BCD digits (each 4 bits)
    input clk,
    output reg [6:0] a_to_g,
    output reg [7:0] an,
    output wire dp 
);
    wire [2:0] s;
    reg [3:0] digit;
    reg [19:0] clkdiv;

    assign dp = 1;
    assign s = clkdiv[19:17];  // 3-bit selector
    wire [4:0] active_digit = s[2:0];  // limit to 0-4

    always @(posedge clk)
        clkdiv <= clkdiv + 1;

    // Select digit to display (only 5 digits needed)
    always @(*) begin
        case (active_digit)
            3'd0: digit = x[3:0];
            3'd1: digit = x[7:4];
            3'd2: digit = x[11:8];
            3'd3: digit = x[15:12];
            3'd4: digit = x[19:16];
            default: digit = 4'b1111;  // blank
        endcase
    end

    // 7-segment encoding
    always @(*) begin
        case (digit)
            4'h0: a_to_g = 7'b1000000;
            4'h1: a_to_g = 7'b1111001;
            4'h2: a_to_g = 7'b0100100;
            4'h3: a_to_g = 7'b0110000;
            4'h4: a_to_g = 7'b0011001;
            4'h5: a_to_g = 7'b0010010;
            4'h6: a_to_g = 7'b0000010;
            4'h7: a_to_g = 7'b1111000;
            4'h8: a_to_g = 7'b0000000;
            4'h9: a_to_g = 7'b0010000;
            default: a_to_g = 7'b1111111;
        endcase
    end

    // Activate one of the 5 digits (others off)
    always @(*) begin
        an = 8'b11111111; // all digits off
        case (active_digit)
            3'd0: an[0] = 0;
            3'd1: an[1] = 0;
            3'd2: an[2] = 0;
            3'd3: an[3] = 0;
            3'd4: an[4] = 0;
            default: an = 8'b11111111;
        endcase
    end
endmodule
