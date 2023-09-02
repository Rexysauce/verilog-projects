`include "full_adder.v"
`timescale 10ns/1ps

module full_adder_test{
    reg A, B, Cin;
    wire S, Cout;

    
    top UUT(A, B, Cin, S, Cout);

    initial begin
        $dumpfile("full_adder_waveform.vcd");
        $dumpvars(0,full_adder_test);
        $display("Testing");

        {A, B, Cin} = 3'b000; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        {A, B, Cin} = 3'b001; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        {A, B, Cin} = 3'b010; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        {A, B, Cin} = 3'b011; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        {A, B, Cin} = 3'b100; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        {A, B, Cin} = 3'b101; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        {A, B, Cin} = 3'b110; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        {A, B, Cin} = 3'b111; #10; $display("%b + %b + %b = %b%b%b", A, B, Cin, S, Cout);
        $display("testing complete");

    end
}