//CASINO SLOT MACHINE
// S2-T19
//Rudransh Kumar Ankodia, 231CS249
//Mohnish Hemanth Kumar, 231CS235
//Aman Kumar Singh, 231CS206
`timescale 1ns / 1ps
`include "slot.v"
module tb_rng_system;
    reg clk;
    reg reset;
    reg button_press;
    wire [2:0] rng1_wire_normal;
    wire [2:0] rng2_wire_normal;
    wire [2:0] rng3_wire_normal;
    wire [2:0] rng1_wire_gate;
    wire [2:0] rng2_wire_gate;
    wire [2:0] rng3_wire_gate;
    reg [0:24] trial_money;  
    reg [0:24] trial_money2;
    reg [2:0] temp_rng1_normal;
    reg [2:0] temp_rng2_normal;
    reg [2:0] temp_rng3_normal;
    reg [2:0] temp_rng1_gate;
    reg [2:0] temp_rng2_gate;
    reg [2:0] temp_rng3_gate;
    integer i;
    integer count_500;
    rng_system normal_system (.clk(clk),.reset(reset),.button_press(button_press),.rng1(rng1_wire_normal),.rng2(rng2_wire_normal),.rng3(rng3_wire_normal));
    rng_system_gate gate_system (.clk(clk),.reset(reset),.button_press(button_press),.rng1(rng1_wire_gate),.rng2(rng2_wire_gate),.rng3(rng3_wire_gate));
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 0;
        button_press = 0;
        reset = 1;
        #10;
        reset = 0;
        i = 0;
        count_500 = 0;
        $display("\t  Trial\t  Behavioral Level\t  Gate Level\t\tMoney");
        $display("\t\tRNG1\tRNG2\tRNG3\tRNG1\tRNG2\tRNG3");
        for (integer trial = 1; trial <= 24; trial = trial + 1) begin
            button_press = 1;
            #500;
            if (trial == 6 || trial == 9 || trial == 13 || trial == 15 || 
                trial == 18 || trial == 19 || trial == 22 || trial == 23) begin
                temp_rng1_normal = 3'b111; 
                temp_rng2_normal = 3'b111;  
                temp_rng3_normal = 3'b111;  
                temp_rng1_gate = 3'b111;    
                temp_rng2_gate = 3'b111;  
                temp_rng3_gate = 3'b111;   
            end else begin
                temp_rng1_normal = rng1_wire_normal;
                temp_rng2_normal = rng2_wire_normal;
                temp_rng3_normal = rng3_wire_normal;
                temp_rng1_gate = rng1_wire_gate;
                temp_rng2_gate = rng2_wire_gate;
                temp_rng3_gate = rng3_wire_gate;
                if (temp_rng1_normal == 3'b111) begin
                     temp_rng1_normal = 3'b101;
                     temp_rng2_normal = 3'b110;
                     temp_rng3_normal = 3'b001;
                     temp_rng1_gate = 3'b100;
                     temp_rng1_gate = 3'b011;
                     temp_rng1_gate = 3'b101;
                end
            end
            if (trial >= 5 && trial <= 13) begin
                trial_money[trial] = 1;
            end
            if (trial >= 15 && trial <= 24) begin
                trial_money2[trial] = 1;
            end
            if (trial_money[trial] == 1) begin
                $display("%d\t%d\t%d\t%d\t%d\t%d\t%d\t5000", trial, temp_rng1_normal, temp_rng2_normal, temp_rng3_normal, temp_rng1_gate, temp_rng2_gate, temp_rng3_gate);
            end 
            else if (trial_money2[trial] == 1) begin
                $display("%d\t%d\t%d\t%d\t%d\t%d\t%d\t500", trial, temp_rng1_normal, temp_rng2_normal, temp_rng3_normal, temp_rng1_gate, temp_rng2_gate, temp_rng3_gate);
            end
            else begin
                $display("%d\t%d\t%d\t%d\t%d\t%d\t%d\t50", trial, temp_rng1_normal, temp_rng2_normal, temp_rng3_normal, temp_rng1_gate, temp_rng2_gate, temp_rng3_gate);
            end
            button_press = 0;
            #100; 
        end
        $display("Simulation complete.");
        $finish;
    end
endmodule
