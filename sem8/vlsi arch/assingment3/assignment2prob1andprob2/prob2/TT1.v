module 
//today,day30_31,N,dateBeforeNdays,dateAfterNdays,error
TTV4 (
input wire [4:0] today,
input wire       day30_31,
input wire [2:0] N,
output reg [4:0] dbndays,
output reg [4:0] dandays,
output reg       error
);

wire [5:0] todayplusN;

reg [4:0] days_in_last_month;
reg [4:0] days_in_current_month;

always @(*)
begin
case(day30_31)
 0: days_in_last_month=2;
 1: days_in_last_month=1;
endcase
end
always @(*)
begin
days_in_current_month = day30_31 ? 31 : 30;
end

assign todayplusN = today + N;

always @(*)
begin
if (todayplusN > days_in_current_month)
			dandays = todayplusN - days_in_current_month;
	else
			dandays =  todayplusN;
end

always @(*)
case(1)
  today==N: dbndays = day30_31 ? 30 : 31;
  today>N:  dbndays = today - N;
  today<N:  dbndays = today - N - days_in_last_month;
endcase

always@(*)
	case(1)
	today==0,
	today==31 && day30_31==0 : error=1;
	default: error=0;
	endcase


endmodule