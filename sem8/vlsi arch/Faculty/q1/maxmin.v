module fac (a,b,max,min);
input [7:0] a,b;
output [7:0] max,min;
wire   [7:0] max,min;

assign {max,min} = a > b ? {a,b} : {b,a};

endmodule
