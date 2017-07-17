module tb;
reg [7:0]a,b,amin,amax;
wire fG,fE,fL,sG,sE,sL;

fac Gold (a,b,amax,amin,fG,fE,fL);
stu SILVER (a,b,amax,amin,sG,sE,sL);


initial
	begin
	amax=100; amin=200;

	a=50;repeat_all;
	a=100; repeat_all;
	a=150; repeat_all;
	a=200; repeat_all;
	a=250; repeat_all;
	end
	    
task repeat_all;
begin
b = 50; #1; check;
b = 100; #1; check;
b = 150; #1; check;
b = 200; #1; check;
b = 250; #1; check;
end
endtask



task check;
	begin
	if ({fG,fE,fL} !== {sG,sE,sL}) begin
					$display ("%d %d:: Gold=%b RoldGold=%b",a,b,{fG,fE,fL},{sG,sE,sL});
					$finish;
					end
	end
endtask	

endmodule
