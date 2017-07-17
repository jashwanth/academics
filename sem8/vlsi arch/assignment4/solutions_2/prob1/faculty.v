module faculty (
		input wire clk,rst,
		output reg [1:0] cnt
		);

reg mod2;
reg [1:0] dcnt;
		
always @(posedge clk)
begin
	if (rst) mod2 <= 0;
	else     mod2 <= ~mod2;
end

always @(posedge clk)
begin 
	if (rst) dcnt <= 0;
	else     dcnt <= mod2 ? dcnt + 1 : dcnt;
end

always @(*)
begin
	cnt = mod2 ? 3-dcnt : dcnt;
end

endmodule
