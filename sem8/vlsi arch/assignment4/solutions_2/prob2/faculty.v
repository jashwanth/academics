module faculty (input clk,rst,
            output reg [4:0] cnt
			);
			
reg [4:0] pcnt;

always @(posedge clk)
begin
if (rst)	cnt <= 5'd25;
else       cnt <= cnt==0 ? 0 : pcnt;
end
always	@(posedge clk)
begin
if (rst) pcnt<=5'd8;
else     pcnt<=(pcnt>cnt) ? pcnt-cnt : cnt-pcnt;
end

endmodule
