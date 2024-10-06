// 2 16-bit register file with read and write functionality

module reg_file (
    input wire clk,
    input wire reset,
    input wire wr,
    input wire [2:0] rd_addr_a, rd_addr_b, wr_addr,
    input wire [15:0] d_in,
    output reg [15:0] d_out_a, d_out_b
);

    reg [15:0] reg_array [7:0];

    always @(posedge clk) begin
        if (reset) begin
            reg_array[0] <= 16'h0000;
            reg_array[1] <= 16'h0000;
            reg_array[2] <= 16'h0000;
            reg_array[3] <= 16'h0000;
            reg_array[4] <= 16'h0000;
            reg_array[5] <= 16'h0000;
            reg_array[6] <= 16'h0000;
            reg_array[7] <= 16'h0000;
        end else if (wr) begin
            reg_array[wr_addr] <= d_in;
        end
    end

    always @(*) begin
        d_out_a = reg_array[rd_addr_a];
        d_out_b = reg_array[rd_addr_b];
    end
endmodule