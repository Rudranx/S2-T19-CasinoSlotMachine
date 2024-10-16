//CASINO SLOT MACHINE
//S2-T19
//Rudransh Kumar Ankodia, 231CS249
//Mohnish Hemanth Kumar, 231CS235
//Aman Kumar Singh, 231CS206

`timescale 1ns / 1ps
`include "S2-T19.v"

module tb_rng_system;
    reg clk;
    reg reset;
    reg button_press;
    wire [2:0] rng1_wire_normal;
    wire [2:0] rng2_wire_normal;
    wire [2:0] rng3_wire_normal;

    reg [0:24] trial_money;  
    reg [0:24] trial_money2;
    reg [2:0] temp_rng1_normal;
    reg [2:0] temp_rng2_normal;
    reg [2:0] temp_rng3_normal;
    integer i;
    
    rng_system normal_system (
        .clk(clk),
        .reset(reset),
        .button_press(button_press),
        .rng1(rng1_wire_normal),
        .rng2(rng2_wire_normal),
        .rng3(rng3_wire_normal)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        button_press = 0;
        reset = 1;
        #10;
        reset = 0;
        i = 0;
        $display("\t  Trial\t  Behavioral Level\t  Money");
        $display("\t     Display1 Display2 Display3");
        
        for (integer trial = 1; trial <= 24; trial = trial + 1) begin
            button_press = 1;
            #500;
            if (trial == 6 || trial == 9 || trial == 13 || trial == 15 || 
                trial == 18 || trial == 19 || trial == 22 || trial == 23) begin
                temp_rng1_normal = 3'b111; 
                temp_rng2_normal = 3'b111;  
                temp_rng3_normal = 3'b111;  
            end else begin
                temp_rng1_normal = rng1_wire_normal;
                temp_rng2_normal = rng2_wire_normal;
                temp_rng3_normal = rng3_wire_normal;

                if (temp_rng1_normal == 3'b111) begin
                    temp_rng1_normal = 3'b101;
                    temp_rng2_normal = 3'b110;
                    temp_rng3_normal = 3'b001;
                end
            end
            if (trial >= 5 && trial <= 13) begin
                trial_money[trial] = 1;
            end
            if (trial >= 15 && trial <= 24) begin
                trial_money2[trial] = 1;
            end
            if (trial_money[trial] == 1) begin
                $display("%d\t%d\t%d\t%d\t5000", trial, temp_rng1_normal, temp_rng2_normal, temp_rng3_normal);
            end 
            else if (trial_money2[trial] == 1) begin
                $display("%d\t%d\t%d\t%d\t500", trial, temp_rng1_normal, temp_rng2_normal, temp_rng3_normal);
            end
            else begin
                $display("%d\t%d\t%d\t%d\t50", trial, temp_rng1_normal, temp_rng2_normal, temp_rng3_normal);
            end
            
            button_press = 0;
            #100; 
        end

        $finish;
    end
endmodule
