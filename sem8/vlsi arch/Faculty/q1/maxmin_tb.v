
module tb;
reg  [7:0] a,b;
wire [7:0] Fmax,Fmin;
wire [7:0] Smax,Smin;

fac U1  (a,b,Fmax,Fmin);
stu U2  (a,b,Smax,Smin);

initial
	begin
	a=30;b=20;#1; if (Fmax!==Smax || Fmin!==Smin) begin
					$display("Error1:%d %d:Expected=%d Produced=%d Expected=%d Produced=%d",a,b,Fmax,Smax,Fmin,Smin);
					$finish;
					end
	a=20;b=30;#1; if (Fmax!==Smax || Fmin!==Smin) begin
					$display("Error2:%d %d:Expected=%d Produced=%d Expected=%d Produced=%d",a,b,Fmax,Smax,Fmin,Smin);
					$finish;
end
	a=25;b=35;#1; if (Fmax!==Smax || Fmin!==Smin) begin
					$display("Error3:%d %d:Expected=%d Produced=%d Expected=%d Produced=%d",a,b,Fmax,Smax,Fmin,Smin);
					$finish;
end

end
endmodule
