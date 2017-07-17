module faculty (
input clk,rst,
input wire [10:0] year,
output reg [4:0] date,
output reg [3:0] month);


wire leapyear;
wire [4:0] daysinleapyear;
wire [3:0] monthplus1;

assign monthplus1 = month==12 ? 1 : (month + 1);

always @(posedge clk)
begin
	if (rst) date<=5'd1;
	else
	case(month)
	1,3,5,7,8,10,12: date <= date==31 ? 1 : date+1;
	2: date <= date == daysinleapyear ? 1: date+1;
	4,6,9,11: date<= date==30 ? 1 : date+1;
	endcase
end

assign rem100 = year % 100;
assign rem4 = year % 4;

assign leapyear = rem100 ? 0 : (rem4 ? 1 : 0);
assign daysinleapyear = leapyear ? 29 : 28;

always @(posedge clk)
begin
	if (rst) month<=1;
	else
	case(month)
	1,3,5,7,8,10,12: month <= date==31 ? monthplus1 : month;
	2: month <= date==daysinleapyear ? monthplus1 : month;
	4,6,9,11: month<= date==30 ? monthplus1 : month;
	endcase
end

endmodule
