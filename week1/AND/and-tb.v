module and_test;
    reg a, b;
    wire y;
    andgate and_test (a,b,y); 
    initial begin
      #0 a = 0;
      b = 0;
      #5 a = 0;
      b = 1;
      #5 a = 1;
      b = 0;
      #5 a = 1;
      b = 1;
      #5;
    end
    initial begin
        $monitor($time, " a = %b, y = %b, y = %b", a, b, y);
    end
    initial begin
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_test);
    end
endmodule

//andgate is name of module that's defined in and.v file 
//(ip,ip,output) is the order coz that's way it's defined. NOTE: for predefined ones its(op,ip,input)\
//#5 at the end makes the last case visible in gtkwave