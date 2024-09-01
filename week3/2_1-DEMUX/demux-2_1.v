module demux_2to1 (
    input wire data_in,
    input wire select,
    output wire out0,
    output wire out1
);

    assign out0 = (select == 0) ? data_in : 1'b0;
    assign out1 = (select == 1) ? data_in : 1'b0;

endmodule