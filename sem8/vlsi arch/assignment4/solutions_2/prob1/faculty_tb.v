module tb;

reg clk,rst;
wire [1:0] cntf,cnts;

faculty U1 (clk,rst,cntf);
student U2 (clk,rst,cnts);

initial clk = 0;
always #5 clk = ~clk;

initial
begin
	$dumpvars();
	rst = 1;
	@(negedge clk);
	rst = 0;
	repeat (10)@(posedge clk);
	$finish;
end

always @(negedge clk)
if (cntf!==2'bxx)
if (cntf !== cnts ) $display ("Exp=%d Got=%d FAIL", cntf,cnts);
else                $display ("Exp=%d Got=%d",cntf,cnts);

endmodule
