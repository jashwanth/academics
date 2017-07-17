module fac (a,b,amax,amin,gt,eq,lt);
input [7:0] a,b,amax,amin;
output gt,eq,lt;


reg gt,eq,lt;

always @(*)
begin
	case(1)
	a < amax ,
	a > amax ,
	b < amax ,
	b < amax : {gt,eq,lt} = 3'b000;
	default: {gt,eq,lt}= {a>b,a==b,a<b};
	endcase
end

endmodule
