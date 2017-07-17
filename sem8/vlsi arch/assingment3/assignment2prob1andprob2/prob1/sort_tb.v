module tb;
reg [7:0] I;
wire [7:0] Yf,Ys;
integer j;

sort GOLD (I,Yf);
sort STU (I,Ys);
integer errorcount=0;
initial
begin
	for (j=0;j<=255;j=j+1)
		begin
			
			I = j;
			#1;
			if (Ys != Yf )  begin
						    $display ("FAIL Input=%b ,Expected=%b, Got=%b", I,Yf,Ys);
							errorcount = errorcount+1;
							end
		end
if (errorcount==0 ) $display ("Success");

end

endmodule