module tb;
reg [4:0] today;
reg [2:0] N;
reg day30_31;
wire       error1,error2;
wire [4:0] dbndays1,dbndays2;
wire [4:0] dandays1,dandays2;
integer j;

  
FACULTY U1 (today,day30_31,N,dbndays1,dandays1,error1);
STUDENT U2 (today,day30_31,N,dbndays2,dandays2,error2);

initial
begin
 today=31;day30_31=0; N=3;
 selfcheck;
 today = 0;
 selfcheck;
 today=3;N=3;day30_31=1;
 selfcheck;
 
 for (j=0;j<=20;j=j+1)
  begin
  today={$random}%30;N=$random;day30_31=$random;
  //$display("T=%d N=%d DIM=%-2d: DBN:%d DAN:%d Error=%b",today,N,day30_31 ? 31:30,dbndays,dandays,error);
  selfcheck;
  end
end

task selfcheck;
begin
	#1;
	if (dbndays1!=dbndays2 || dandays1 != dandays2 || error1 != error2) 
		$display ("FAIL today=%d, N=%d,30_31=%d, Expected = %d %d %b, Got= %d %d %b ",
			      today,N,day30_31,
				  dbndays1,dandays1,error1,
				  dbndays2,dandays2,error2);
end
endtask
endmodule






