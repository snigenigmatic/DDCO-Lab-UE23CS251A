module main_circuit (
    input i0, i1, i2, i3,
    output S1, Cout
);

    wire S0, C0, Y;

    full_adder FA (
        i0,i1,i2,S0,C0
    );

    and_gate AND (
        S0,i3,Y
    );

    half_adder HA (
        Y,C0,S1,Cout
    );

endmodule