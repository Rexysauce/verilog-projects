`include "alu_rtl.v"

module TOP(B, Q, S, E, CLR, CLK);

    //Inputs
    input [7:0] B;
    wire [7:0] D; //temp value

    //Controls
    input CLK;
    input CLR;
    input S;
    input E;

    //Outputs
    output reg [7:0] Q = 0;

    //Wires
    wire [7:0] W;

    //Logic
    alu_rtl U0(.A(Q), .B(B), .S(S), .E(E), .W(D));

    always @(negedge CLK)
        begin
            if(CLR == 1) begin
                Q = 0;
            end
            else begin
                {Q} <= D;
            end
        end
        
endmodule