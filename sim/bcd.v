module binary16_to_bcd_tb;
    reg [15:0] binary;
    wire [19:0] bcd;

    // Instantiate the binary to BCD converter
    binary16_to_bcd uut (
        .binary(binary),
        .bcd(bcd)
    );

    initial begin
        // Test with a few binary values
        binary = 16'd5555; #10;
        $display("Binary: %d, BCD: %h", binary, bcd);

        binary = 16'd1234; #10;
        $display("Binary: %d, BCD: %h", binary, bcd);

        binary = 16'd9876; #10;
        $display("Binary: %d, BCD: %h", binary, bcd);

        binary = 16'd2025; #10;
        $display("Binary: %d, BCD: %h", binary, bcd);

        $finish;
    end
endmodule
