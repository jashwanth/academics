module tb;

reg clk,rst;
reg [10:0] year;
wire [4:0] datef,dates;
wire [3:0] monthf,months;

faculty U1 (clk,rst,year,datef,monthf);
student U2 (clk,rst,year,dates,months);

always #5 clk = ~clk;

initial
begin
clk =0;
rst = 1;
year=2014;
@(negedge clk);
rst = 0;
repeat (370) @(posedge clk);
$finish;
end


always @(negedge clk)
if (datef!=={5{1'bx}} || monthf !== {4{1'bx}})
if ({dates,months} !== {datef,monthf} ) $display ("Exp=%d:%d Got=%d:%d FAIL", monthf,datef,months,dates);
else                $display ("Exp=%d:%d Got=%d:%d",monthf,datef,months,dates);

/***
reg [3:0]pmonthf;
always @(negedge clk) pmonthf<=monthf;

always @(negedge clk)
begin
if (pmonthf!==monthf) $display("");
begin
	if (pmonthf!==monthf)$write("%-2d:%-2d,",monthf,datef);
	else $write ("%-2d,",datef);
end
end
***/

endmodule
