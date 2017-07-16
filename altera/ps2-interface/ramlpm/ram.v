module ram(
  address,
  clock,
  data,
  wren,
  LEDG,
  HEX0,
  HEX1,
  HEX2,
  HEX3,
  reset);
input [4:0] address;
input clock;
input [7:0] data;
input wren;
input reset;
output [7:0] LEDG;
wire [7:0] q1;
output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;

ramlpm r(.address(address),.clock(clock),.data(data),.wren(wren),.q(q1));
SEG7_LUT_4  s0(HEX0,HEX1,HEX2,HEX3,q1 );
LEDG_Driver u0(LEDG,clock,reset,q1);
endmodule