module half_adder (
    input Y,     // Output from AND gate
    input C0,    // Carry-out from Full Adder
    output S1,   // Sum output of Half Adder
    output Cout  // Carry-out output of Half Adder
);

    assign S1 = Y ^ C0;   // Sum calculation using XOR
    assign Cout = Y & C0; // Carry-out calculation using AND

endmodule