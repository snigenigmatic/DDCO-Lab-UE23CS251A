module light_controller (
    input A,
    input B,
    input C,
    output light
);

wire nA, nB, nC;
wire term1, term2, term3, term4;

assign nA = ~A;
assign nB = ~B;
assign nC = ~C;

assign term1 = nA & nB & nC;  
assign term2 = nA & B & C;    
assign term3 = A & nB & C;    
assign term4 = A & B & nC;   

assign light = term1 | term2 | term3 | term4;  

endmodule
