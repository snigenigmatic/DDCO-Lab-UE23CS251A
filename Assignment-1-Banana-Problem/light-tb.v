module testbench;

reg A, B, C;
wire light;

light_controller uut (
    .A(A),
    .B(B),
    .C(C),
    .light(light)
);

initial begin
    // Display headers
    $display("A B C | LIGHT");
    $display("---------");

    // Test all combinations of inputs
    A = 0; B = 0; C = 0; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 0; B = 0; C = 1; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 0; B = 1; C = 0; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 0; B = 1; C = 1; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 1; B = 0; C = 0; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 1; B = 0; C = 1; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 1; B = 1; C = 0; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 1; B = 1; C = 1; #10;
    $display("%b %b %b | %b", A, B, C, light);

    A = 0; B = 0; C = 0; #10;
    $display("%b %b %b | %b", A, B, C, light);    
    
    $finish;
end

initial begin
    $dumpfile("light-tb.vcd");
    $dumpvars(0, testbench);
end

endmodule
