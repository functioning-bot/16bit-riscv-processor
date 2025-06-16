module top_ALU_display (
    input clk,
    input [6:0] sw,               // ALU opcode
    input btnR,
    output [6:0] a_to_g,
    output [7:0] an,
    output dp,
    output [15:0] led
);
//    wire [15:0] A = 16'd1485;
//    wire [15:0] B = 16'd1234;
    wire [15:0] Result;
    wire Zero;
//    wire [3:0] ALUcontrol_In = {sw[6],sw[5],sw[4],sw[3]};
    reg [1:0] step = 0;
    reg btnR_prev = 0;
    wire btnR_edge;

    // Button edge detection
    always @(posedge clk)
        btnR_prev <= btnR;

    assign btnR_edge = btnR & ~btnR_prev;
    
     // Step increment and wrap
    always @(posedge clk) begin
        if (btnR_edge)
            step <= (step == 2'd3) ? 0 : step + 1;
    end

    // ALU inputs
    reg [15:0] A, B;
//    reg [3:0] ALUcontrol_In;
    wire [3:0]  ALUcontrol_In;
    always @(*) begin
        case (step)
            2'd0: begin A = 16'd21654; B = 16'd11453; end // ADD
            2'd1: begin A = 16'd5555; B = 16'd455;  end // SUB
            2'd2: begin A = 16'd21112; B = 16'd21211; end // AND
            2'd3: begin A = 16'd11111; B = 16'd2;  end // OR
        endcase
    end
    assign ALUcontrol_In = {sw[6],sw[5],sw[4],sw[3]};  //0011
    // ALU operation (assume it supports 16-bit operands)
    ALU alu_inst (
        .A(A),
        .B(B),
        .ALUcontrol_In(ALUcontrol_In),
        .Zero(Zero),
        .Result(Result)
    );
    assign led = Result;
    // Convert 16-bit binary result to BCD
    wire [19:0] bcd_result;
    binary16_to_bcd bcd_conv (
        .binary(Result),
        .bcd(bcd_result)
    );

    // Use all 5 BCD digits (20 bits)
    wire [19:0] display_value = bcd_result;

    // 7-segment display module (must support 5-digit display)
    seg7decimal display (
        .x({display_value}),  // Pad to 32 bits if needed
        .clk(clk),
        .a_to_g(a_to_g),
        .an(an),
        .dp(dp)
    );
endmodule