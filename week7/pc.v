// Full Adder module
module fa (input wire i0, i1, cin, output wire sum, cout);
    wire t0, t1, t2;
    xor3 _i0 (i0, i1, cin, sum);
    and2 _i1 (i0, i1, t0);
    and2 _i2 (i1, cin, t1);
    and2 _i3 (cin, i0, t2);
    or3 _i4 (t0, t1, t2, cout);
endmodule

// Add/Subtract module
module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);
    wire t;
    xor2 _i1 (i1, addsub, t);
    fa _i0 (i0, t, cin, sumdiff, cout);
endmodule

// Program Counter slice for bits 1-15
module pc_slice (
    input wire clk, 
    reset, 
    cin, 
    load, 
    inc, 
    sub, 
    offset,
    output wire cout, 
    pc
);
    wire in, t;
    wire inc_;
    
    // Generate input for dfrl
    xor2 _i0 (offset, sub, t);  // XOR offset with sub control
    addsub addsub_0 (1'b0, pc, t, cin, in, cout);  // Add/subtract operation
    dfrl dfrl_0 (clk, reset, load, in, pc);  // D flip-flop with reset and load
endmodule

// Special Program Counter slice for bit 0
module pc_slice0 (
    input wire clk, 
    reset, 
    cin, 
    load, 
    inc, 
    sub, 
    offset,
    output wire cout, 
    pc
);
    wire in;
    wire t;
    
    // Generate input for dfrl
    xor2 _i0 (offset, sub, t);  // XOR offset with sub control
    addsub addsub_0 (1'b0, pc, t, inc, in, cout);  // Add/subtract operation with inc as carry-in
    dfrl dfrl_0 (clk, reset, load, in, pc);  // D flip-flop with reset and load
endmodule

// Main Program Counter module
module pc (
    input wire clk,
    input wire reset,
    input wire inc,
    input wire add,
    input wire sub,
    input wire [15:0] offset,
    output wire [15:0] pc
);
    wire load;
    wire [15:0] c;  // Carry chain
    
    // Generate load signal - active when any operation is requested
    or3 or3_0 (add, sub, inc, load);
    
    // Instantiate bit 0 (least significant bit)
    pc_slice0 pc_slice_0 (
        .clk(clk),
        .reset(reset),
        .cin(1'b0),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[0]),
        .cout(c[0]),
        .pc(pc[0])
    );
    
    // Generate the remaining 15 bits
    pc_slice pc_slice_1 (
        .clk(clk),
        .reset(reset),
        .cin(c[0]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[1]),
        .cout(c[1]),
        .pc(pc[1])
    );
    
    pc_slice pc_slice_2 (
        .clk(clk),
        .reset(reset),
        .cin(c[1]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[2]),
        .cout(c[2]),
        .pc(pc[2])
    );
    
    pc_slice pc_slice_3 (
        .clk(clk),
        .reset(reset),
        .cin(c[2]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[3]),
        .cout(c[3]),
        .pc(pc[3])
    );
    
    pc_slice pc_slice_4 (
        .clk(clk),
        .reset(reset),
        .cin(c[3]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[4]),
        .cout(c[4]),
        .pc(pc[4])
    );
    
    pc_slice pc_slice_5 (
        .clk(clk),
        .reset(reset),
        .cin(c[4]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[5]),
        .cout(c[5]),
        .pc(pc[5])
    );
    
    pc_slice pc_slice_6 (
        .clk(clk),
        .reset(reset),
        .cin(c[5]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[6]),
        .cout(c[6]),
        .pc(pc[6])
    );
    
    pc_slice pc_slice_7 (
        .clk(clk),
        .reset(reset),
        .cin(c[6]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[7]),
        .cout(c[7]),
        .pc(pc[7])
    );
    
    pc_slice pc_slice_8 (
        .clk(clk),
        .reset(reset),
        .cin(c[7]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[8]),
        .cout(c[8]),
        .pc(pc[8])
    );
    
    pc_slice pc_slice_9 (
        .clk(clk),
        .reset(reset),
        .cin(c[8]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[9]),
        .cout(c[9]),
        .pc(pc[9])
    );
    
    pc_slice pc_slice_10 (
        .clk(clk),
        .reset(reset),
        .cin(c[9]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[10]),
        .cout(c[10]),
        .pc(pc[10])
    );
    
    pc_slice pc_slice_11 (
        .clk(clk),
        .reset(reset),
        .cin(c[10]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[11]),
        .cout(c[11]),
        .pc(pc[11])
    );
    
    pc_slice pc_slice_12 (
        .clk(clk),
        .reset(reset),
        .cin(c[11]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[12]),
        .cout(c[12]),
        .pc(pc[12])
    );
    
    pc_slice pc_slice_13 (
        .clk(clk),
        .reset(reset),
        .cin(c[12]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[13]),
        .cout(c[13]),
        .pc(pc[13])
    );
    
    pc_slice pc_slice_14 (
        .clk(clk),
        .reset(reset),
        .cin(c[13]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[14]),
        .cout(c[14]),
        .pc(pc[14])
    );
    
    pc_slice pc_slice_15 (
        .clk(clk),
        .reset(reset),
        .cin(c[14]),
        .load(load),
        .inc(inc),
        .sub(sub),
        .offset(offset[15]),
        .cout(c[15]),
        .pc(pc[15])
    );

endmodule