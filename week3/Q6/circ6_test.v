module cir6test;
reg [2:0] i1;
reg i2;
wire Sum1, Cout1;

two_full_adders UUT (
.i1(i1),
.i2(i2),
.Sum1(Sum1),
.Cout1(Cout1)
);

initial
begin

{i1, i2} = 4'b0000; #10;
{i1, i2} = 4'b0001; #10;
{i1, i2} = 4'b0010; #10;
{i1, i2} = 4'b0011; #10;
{i1, i2} = 4'b0100; #10;
{i1, i2} = 4'b0101; #10;
{i1, i2} = 4'b0110; #10;
{i1, i2} = 4'b0111; #10;
{i1, i2} = 4'b1000; #10;
{i1, i2} = 4'b1001; #10;
{i1, i2} = 4'b1010; #10;
{i1, i2} = 4'b1011; #10;
{i1, i2} = 4'b1100; #10;
{i1, i2} = 4'b1101; #10;
{i1, i2} = 4'b1110; #10;
{i1, i2} = 4'b1111; #10;
{i1, i2} = 4'b0000; #10;


end

initial
begin
 $monitor($time, " i1=%b, i2=%b, Sum1=%b, Cout1=%b", i1, i2, Sum1, Cout1);end
initial
begin

$dumpfile("circ6.vcd");
$dumpvars(0, cir6test);
end
endmodule
 