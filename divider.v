`include "subtractor.v"
`include "controller.v"

//Divider
module top(st, clk, D, bit, Div, inX);

    //Inputs
    input clk, st;
    input [3:0] Div; // Divisor
    input [8:0] inX; // Dividend input

    //Output Registers
    output reg[8:0] bit; // Dividend

    //Outputs
    output D;

    //Wires
    wire [8:0] w1, w7;
    wire w2, w3, w4, w6;

    //Logic Circuit
    always @(*) begin
        bit = w1;
    end

    //Logical assignmnet
    assign D = w6;
    assign w7 = inX;

    //Submodules
    subtractor SUB(.inX(inX),.Div(Div), .outX(w1), .C(w2), .clk(clk), .D(w6), .start(st));
    controller C(.C(w2),.St(st),.Sh(w3),.Ld(w4),.V(w6),.CLK(clk));
endmodule