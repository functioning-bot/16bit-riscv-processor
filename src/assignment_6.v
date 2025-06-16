module fsm_counter ( 
input clk, 
input rst,            
// asynchronous reset 
output reg [1:0] state 
); 
always @(posedge clk or posedge rst) begin 
if (rst) 
state <= 2'b01;  // Initial state on reset 
        else begin 
            case (state) 
                2'b01: state <= 2'b10; 
                2'b10: state <= 2'b11; 
                2'b11: state <= 2'b01; 
                default: state <= 2'b01; 
            endcase 
        end 
    end 
 
endmodule

module tb_fsm_counter; 
    reg clk, rst; 
    wire [1:0] state; 
    fsm_counter uut ( 
        .clk(clk), 
        .rst(rst), 
        .state(state) 
    ); 
    // Clock generation 
    initial clk = 0; 
    always #5 clk = ~clk;  // 10 ns period 
    initial begin 
        $dumpfile("fsm_counter.vcd"); 
        $dumpvars(0, tb_fsm_counter); 
        // Reset 
        rst = 1; 
        #12 rst = 0; 
 
        // Run through several transitions 
        #100; 
        $finish; 
    end 
endmodule