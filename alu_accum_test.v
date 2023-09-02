`timescale 1ns/1ns
`include "alu_accum.v"

module alu_accum_test;

    //Inputs
    reg [7:0] D;
    reg [7:0] B;

    //Controls
    reg CLR;
    reg S;
    reg E;

    //Counter
    reg [7:0] CNT = 0;

    //Outputs
    wire [7:0] Q;

    //CLK setup
    reg CLK = 1'b0;
    always
    begin
        CLK <= ~CLK;
        #5;
    end

     //Unit Under Test
    TOP UUT(B, Q, S, E, CLR, CLK);

    initial begin
        //Testing Parameters
        $dumpfile("alu_accum.vcd");
        $display("Initializing test");
        $dumpvars(0, alu_accum_test);
        E = 1;
        S = 0;
        CLR = 0;
        B = 0;
        #10;
        B = 3;
        #10;
        B = 7;
        #10;
        B = 10;
        #50;

        S = 1;
        while (Q != 0) begin //Division loop
            B = 12;
            CNT = CNT + 1;
            #10;
        end
        #50;

        $display("Test completed");
        $display("((3+7)*6)/12) = ", CNT);
        $finish;
    end
endmodule