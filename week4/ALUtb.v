`timescale 1 ns / 100 ps 
`define TESTVECS 16 

module tb; 
    reg clk, reset; 
    reg [1:0] op; 
    reg [15:0] i0, i1; 
    wire [15:0] o; 
    wire cout; 
    wire oflow;
    reg [33:0] t_vectors[0:(`TESTVECS-1)]; 
    integer i; 

    initial begin 
        $dumpfile("tb_alu.vcd"); 
        $dumpvars(0, tb); 
    end 

    initial begin 
        reset = 1'b1; 
        #12.5 reset = 1'b0; 
    end 
    
    initial clk = 1'b0; 
    always #5 clk = ~clk; 

initial begin 
    t_vectors[0][33:32] = 2'b00; 
    t_vectors[0][31:16] = 16'b0000000000000001; 
    t_vectors[0][15:0] = 16'b0000000000000010; 
    t_vectors[1][33:32] = 2'b00; 
    t_vectors[1][31:16] = 16'b1111000011110000; 
    t_vectors[1][15:0] = 16'b0000111100001111; 
    t_vectors[2][33:32] = 2'b00; 
    t_vectors[2][31:16] = 16'b1001100110011001; 
    t_vectors[2][15:0] = 16'b0110011001100110; 
    t_vectors[3][33:32] = 2'b00; 
    t_vectors[3][31:16] = 16'b1111111100000000; 
    t_vectors[3][15:0] = 16'b0000000011111111; 
    t_vectors[4][33:32] = 2'b01; 
    t_vectors[4][31:16] = 16'b0011001100110011; 
    t_vectors[4][15:0] = 16'b1100110011001100; 
    t_vectors[5][33:32] = 2'b01; 
    t_vectors[5][31:16] = 16'b1111111111111111; 
    t_vectors[5][15:0] = 16'b0000000000000001; 
    t_vectors[6][33:32] = 2'b01; 
    t_vectors[6][31:16] = 16'b1010101010101010; 
    t_vectors[6][15:0] = 16'b0101010101010101; 
    t_vectors[7][33:32] = 2'b01; 
    t_vectors[7][31:16] = 16'b0000111100001111; 
    t_vectors[7][15:0] = 16'b1111000011110000; 
    t_vectors[8][33:32] = 2'b10; 
    t_vectors[8][31:16] = 16'b1000000000000001; 
    t_vectors[8][15:0] = 16'b0000000010000000; 
    t_vectors[9][33:32] = 2'b10; 
    t_vectors[9][31:16] = 16'b0101010101010101; 
    t_vectors[9][15:0] = 16'b1010101010101010; 
    t_vectors[10][33:32] = 2'b10; 
    t_vectors[10][31:16] = 16'b1100110011001100; 
    t_vectors[10][15:0] = 16'b0011001100110011; 
    t_vectors[11][33:32] = 2'b10; 
    t_vectors[11][31:16] = 16'b1111111100000000; 
    t_vectors[11][15:0] = 16'b0000000011111111; 
    t_vectors[12][33:32] = 2'b00;      
    t_vectors[12][31:16] = 16'b0111111111111111; 
    t_vectors[12][15:0] = 16'b0000000000000001;  
    t_vectors[13][33:32] = 2'b01;       
    t_vectors[13][31:16] = 16'b000000000000001;
    t_vectors[13][15:0] = 16'b0000000000000010;  
    t_vectors[14][33:32] = 2'b11; 
    t_vectors[14][31:16] = 16'b1010101001010101; 
    t_vectors[14][15:0] = 16'b0101010110101010; 
    t_vectors[15][33:32] = 2'b11; 
    t_vectors[15][31:16] = 16'b1111111111111111; 
    t_vectors[15][15:0] = 16'b0000000000000000; 
end


    
    initial {op, i0, i1} = 0; 
    alu alu_0 (op, i0, i1, o, cout); 
    overflow of_(i0,i1,o,oflow);
    
    initial begin 
        #6 
        for (i = 0; i < `TESTVECS; i = i + 1) begin 
            #10{op, i0, i1} = t_vectors[i]; 
            #5;
            $display("op = %b, i0 = %h, i1 = %h, o = %h, cout = %b overflow=%b", op, i0, i1, o, cout,oflow);
        end 
        #100 $finish; 
    end 

endmodule