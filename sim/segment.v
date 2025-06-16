module seg7decimal_tb;
    reg [19:0] x;
    reg clk;
    wire [6:0] a_to_g;
    wire [7:0] an;
    wire dp;

    // Instantiate the 7-segment display driver
    seg7decimal uut (
        .x(x),
        .clk(clk),
        .a_to_g(a_to_g),
        .an(an),
        .dp(dp)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        x = 20'b0000_0001_0010_0011_0100; // BCD value for 1234

        // Display the value for several clock cycles
        #50;
        $display("7-segment Display: a_to_g = %b, an = %b, dp = %b", a_to_g, an, dp);

        // Change input value
        x = 20'b0001_0010_0011_0100_0101; // BCD value for 12345
        #50;
        $display("7-segment Display: a_to_g = %b, an = %b, dp = %b", a_to_g, an, dp);

        $finish;
    end
endmodule
