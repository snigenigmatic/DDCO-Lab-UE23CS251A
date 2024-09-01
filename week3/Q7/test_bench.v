module test_bench;

    reg i0, i1, i2, i3; 
    wire S1, Cout;
    
    main_circuit MC (
        i0,i1,i2,i3,S1,Cout
    );

    initial begin
        // Test cases
        $monitor("i0 = %b, i1 = %b, i2 = %b, i3 = %b, S1 = %b, Cout = %b", i0, i1, i2, i3, S1, Cout);

        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        #10;
        i0 = 0; i1 = 1; i2 = 0; i3 = 0;
        #10;
        i0 = 1; i1 = 1; i2 = 0; i3 = 1;
        #10;
        i0 = 1; i1 = 0; i2 = 1; i3 = 0;
        #10;
        i0 = 1; i1 = 1; i2 = 1; i3 = 1;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("main_circuit_test.vcd");
        $dumpvars(0, test_bench);
    end

endmodule