module and_gate (
    input S0,   // Sum output from Full Adder
    input i3,   // Another input
    output Y    // Output of AND gate
);

    assign Y = S0 & i3;  // AND operation

endmodule