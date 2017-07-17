module sort (I,Y);
input [7:0] I;
output [7:0] Y;
wire [3:0] count;
output reg [7:0] Y;

assign count = I[7]+I[6]+I[5]+I[4]+I[3]+I[2]+I[1]+I[0];

always @(*)
case (count)
0:  Y = 8'b0000_0000;
1:  Y = 8'b1000_0000;
2:  Y = 8'b1100_0000;
3:  Y = 8'b1110_0000;
4:  Y = 8'b1111_0000;
5:  Y = 8'b1111_1000;
6:  Y = 8'b1111_1100;
7:  Y = 8'b1111_1110;
8:  Y = 8'b1111_1111;
default: Y = 8'bxxxx_xxxx;
endcase

endmodule