//CASINO SLOT MACHINE
// S2-T19
//Rudransh Kumar Ankodia, 231CS249
//Mohnish Hemanth Kumar, 231CS235
//Aman Kumar Singh, 231CS206
module LFSR_3bit (input clk,input reset,input enable,input [2:0] seed,output reg [2:0] random_num);
    reg [2:0] lfsr;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr <= seed; 
        end else if (enable) begin
            lfsr <= {lfsr[1:0], lfsr[2] ^ lfsr[0]};
        end
    end
    always @(*) begin
        random_num = lfsr;
    end
endmodule



module rng_system (input clk,input reset,input button_press,output reg [2:0] rng1,output reg [2:0] rng2,output reg [2:0] rng3);
    wire clk_enable = button_press;
    wire [2:0] seed1 = 3'b101;
    wire [2:0] seed2 = 3'b110;
    wire [2:0] seed3 = 3'b111;
    reg [3:0] trial_count;
    wire [2:0] rng1_wire;
    wire [2:0] rng2_wire;
    wire [2:0] rng3_wire;
    LFSR_3bit rng_inst1 (.clk(clk),.reset(reset),.enable(clk_enable),.seed(seed1),.random_num(rng1_wire));
    LFSR_3bit rng_inst2 (.clk(clk),.reset(reset),.enable(clk_enable),.seed(seed2),.random_num(rng2_wire));
    LFSR_3bit rng_inst3 (.clk(clk),.reset(reset),.enable(clk_enable),.seed(seed3),.random_num(rng3_wire));
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            trial_count <= 4'd0;
            rng1 <= 3'd0;
            rng2 <= 3'd0;
            rng3 <= 3'd0;
        end
        else if (clk_enable) begin
            if (trial_count == 4'd15 ) begin  
                rng1 <= 3'd7;
                rng2 <= 3'd7;
                rng3 <= 3'd7;
                trial_count <= 4'd0; 
            end else begin
                rng1 <= rng1_wire;
                rng2 <= rng2_wire;
                rng3 <= rng3_wire;
                trial_count <= trial_count + 4'd1;
            end
        end
    end

endmodule





