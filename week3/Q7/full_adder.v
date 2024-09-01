module full_adder (
    input i0,   // First input bit
    input i1,   // Second input bit
    input i2,   // Carry-in bit
    output S0,  // Sum output bit
    output C0   // Carry-out bit
);

    assign S0 = i0 ^ i1 ^ i2;          // Sum calculation using XOR gates
    assign C0 = (i0 & i1) | (i1 & i2) | (i0 & i2); // Carry-out calculation

endmodule