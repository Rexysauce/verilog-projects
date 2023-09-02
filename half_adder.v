module top(A,B,C,S);
	input A, B;
	output C, S;

	assign S = A ^ B;
    assign C = A & B;

endmodule
	