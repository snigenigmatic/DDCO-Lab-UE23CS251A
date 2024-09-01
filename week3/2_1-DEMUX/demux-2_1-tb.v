module test_bench_demux;
    reg data_in, select;
    wire out0, out1;

    demux_2to1 D1 (data_in, select,out0, out1);

    initial begin
        $monitor("data_in=%b, select=%b, out0=%b, out1=%b", data_in, select, out0, out1);

        data_in = 1'b0; select = 1'b0;
        #10 data_in = 1'b1; select = 1'b0;
        #10 data_in = 1'b0; select = 1'b1;
        #10 data_in = 1'b1; select = 1'b1;
        #10 $finish; 
    end

    initial begin
        $dumpfile("demux-2_1-tb.vcd");
        $dumpvars(0, test_bench_demux);
    end
endmodule