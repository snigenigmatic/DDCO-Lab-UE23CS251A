module reg_file_tb;

  reg clk, reset, wr;
  reg [2:0] rd_addr_a, rd_addr_b, wr_addr;
  reg [15:0] d_in;
  wire [15:0] d_out_a, d_out_b;

  reg_file uut (
    .clk(clk),
    .reset(reset),
    .wr(wr),
    .rd_addr_a(rd_addr_a),
    .rd_addr_b(rd_addr_b),
    .wr_addr(wr_addr),
    .d_in(d_in),
    .d_out_a(d_out_a),
    .d_out_b(d_out_b)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    reset = 0;
    wr = 0;
    rd_addr_a = 3'b000;
    rd_addr_b = 3'b001;
    wr_addr = 3'b000;
    d_in = 16'h0000;

    $dumpfile("reg_file_tb.vcd");
    $dumpvars(0, reg_file_tb);

    reset = 1; 
    #40;
    reset = 0; 

    wr = 1; 
    d_in = 16'h1234; 
    wr_addr = 3'b000; 
    #40;

    d_in = 16'h5678; 
    wr_addr = 3'b001; 
    #40;

    wr = 0; 
    rd_addr_a = 3'b000; 
    rd_addr_b = 3'b001; 
    #40;

    $display("Read from reg 0: %h, Read from reg 1: %h", d_out_a, d_out_b);

    wr = 1; 
    d_in = 16'h9ABC; 
    wr_addr = 3'b010; 
    #40;

    wr = 0; 
    rd_addr_a = 3'b000; 
    rd_addr_b = 3'b010; 
    #40;

    $display("Read from reg 0: %h, Read from reg 2: %h", d_out_a, d_out_b);

    wr = 1; 
    d_in = 16'hDEF0; 
    wr_addr = 3'b000; 
    #40;

    wr = 0; 
    rd_addr_a = 3'b000; 
    #40;

    $display("Read from reg 0 after overwrite: %h", d_out_a);

    $finish;
  end

endmodule