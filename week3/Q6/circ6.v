module full_adder (
    input A, B, Cin,
    output Sum, Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module two_full_adders (
    input [2:0] i1,
    input i2,
    output Sum1, Cout1
);
wire Sum0, Cout0;

full_adder FA0 (
	.A(i1[0]),
	.B(i1[1]),
	.Cin(i1[2]),
	.Sum(Sum0),
	.Cout(Cout0)
);

full_adder FA1 (
	.A(Sum0),
	.B(i2),
	.Cin(Cout0),
	.Sum(Sum1),
	.Cout(Cout1)
);
endmodule
