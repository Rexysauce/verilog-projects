`timescale 1ns/1ns
`include "divider.v"

module test;
    
    //Inputs
    reg st;
    reg [3:0] Div;
    reg [8:0] inX;

    //Outputs
    wire [8:0] bit;
    wire D;

    //CLK setup
    reg clk = 1'b0;
    always 
    begin
        clk <= ~clk;
        #5;
    end

    top UUT(st, clk, D, bit, Div, inX);

    initial begin
        
        $dumpfile("divider.vcd");
        $dumpvars(0, test);
        $display("Start of Test.");

        //Setting 135 / 13
        UUT.bit = 9'd135;
        inX = bit;
        Div = 4'd13;
        st = 1;
        
        $display(" DIVIDEND    DIVISOR    DONE");
        $display("_____________________________");
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5; #15;
        $display(" %b    %b       %b", bit, Div, D);
        st = 0;#10;
        st = 1;
        $display(" ");
        $display("135 / 13 = %d Remainder %d", bit[3:0], bit[7:4]);

        //Setting 6 / 4
        UUT.bit = 9'd6;
        inX = bit;
        Div = 4'd4;#5;

        $display("  ");
        $display(" DIVIDEND    DIVISOR    DONE");
        $display("_____________________________");
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5;
        $display(" %b    %b       %b", bit, Div, D);#5; #30;
        $display(" %b    %b       %b", bit, Div, D);
        $display(" ");
        $display("6 / 4 = %d Remainder %d", bit[3:0], bit[7:4]);
        $finish;
    end
endmodule