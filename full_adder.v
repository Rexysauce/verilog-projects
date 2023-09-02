`include "half_adder.v"

module top(A,B,Cin,S,Cout){
    input A, B, Cin;
    output S, Cout;
    
    //Two Half Adders
    half_adder U0 (.A(A),.B(B), .S(S), .C(C));
    half_adder U1 (.C(A),.D(B), .S0(S) .C0(C));

    //how do I wire the output of one adder to another

    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) + (A & Cin) + (B & Cin)

}
endmodule