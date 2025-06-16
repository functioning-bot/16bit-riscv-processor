module ALU_display_tb;
    reg clk;
    reg [6:0] sw;
    reg btnR;
    wire [6:0] a_to_g;
    wire [7:0] an;
    wire dp;
    wire [15:0] led;

    // Instantiate the top-level ALU display module
    top_ALU_display uut (
        .clk(clk),
        .sw(sw),
        .btnR(btnR),
        .a_to_g(a_to_g),
        .an(an),
        .dp(dp),
        .led(led)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        btnR = 0;
        sw = 7'b0000001; // ALU control signals

        // Test ALU operation sequence (ADD, SUB, AND, OR)
        #50;
        $display("ALU Operation Results: led = %d", led);
        sw = 7'b0000010; // Test with different ALU control signals (e.g., SUB)
        #50;
        $display("ALU Operation Results: led = %d", led);
        
        // Test button press (btnR)
        btnR = 1; // Press button to change step
        #50;
        $display("Step changed, ALU Operation Results: led = %d", led);

        $finish;
    end
endmodule
