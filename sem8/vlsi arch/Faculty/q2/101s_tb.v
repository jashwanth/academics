module tb;

wire [1:0] RY,SY;
reg [9:0] A;
fac R1 (A,RY);
stu  S1 (A,SY);

integer i;

initial
	begin
		for (i = 0; i<=1023;i=i+1)
		begin
			A = i;
			#1;
			if (RY!==SY) 
					begin 
					$display ("Fail %b Gold=%d RoldGold=%d",A,RY,SY);
					$finish;
					end
		end
	end

endmodule
