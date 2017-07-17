module tb;

reg clk,rst;
wire [4:0] cntf,cnts;
faculty U1 (clk,rst,cntf);
student U2 (clk,rst,cnts);
initial clk = 0;
always #5 clk = ~clk;

initial
begin
rst = 1;
@(negedge clk);
rst = 0;
wait (cntf==0);
repeat (2) @(posedge clk);
$finish;
end


always @(negedge clk)
if (cntf!=={5{1'bx}})
if (cntf !== cnts ) $display ("Exp=%d Got=%d FAIL", cntf,cnts);
else                $display ("Exp=%d Got=%d",cntf,cnts);

endmodule
