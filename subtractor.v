//Subtractor with Div Reg, hybrid
module subtractor(inX, Div, outX, C, clk, D, start);

    //Inputs
    input [8:0] inX;
    input [3:0] Div;
    input clk;
    input D;
    input start;

    //Output Registers
    output reg [8:0] outX;
    output reg C;

    //Registers
    reg clr = 1;

    //Logic Circuits
    always @(posedge clk) begin
        if (start) begin    
            if (~D) begin
                if (clr) begin
                    outX = inX;
                    clr = 0;
                    C = 1;
                end 

                outX = outX << 1; //Shifting the bits

                if (outX[8:4] >= Div) begin
                    outX[8:4] = outX[8:4] - Div;
                    outX[0] = C;
                end
            end
            if(D) begin
                C = 0;
                clr = 1;
            end
        end 
        else begin
            clr = 1;
        end
    end
endmodule