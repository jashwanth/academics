module fac (input wire [9:0] A,output wire [1:0] Y);

assign Raw9= A[9:7] == 3'b101;
assign Raw8= A[8:6] == 3'b101;
assign Raw7= A[7:5] == 3'b101;
assign Raw6= A[6:4] == 3'b101;
assign Raw5= A[5:3] == 3'b101;
assign Raw4= A[4:2] == 3'b101;
assign Raw3= A[3:1] == 3'b101;
assign Raw2= A[2:0] == 3'b101;

assign New9 = Raw9;
assign New8 = New9         ? 0 : Raw8;
assign New7 = New8 || New9 ? 0 : Raw7;
assign New6 = New7 || New8 ? 0 : Raw6;
assign New5 = New6 || New7 ? 0 : Raw5;
assign New4 = New5 || New6 ? 0 : Raw4;
assign New3 = New4 || New5 ? 0 : Raw3;
assign New2 = New3 || New4 ? 0 : Raw2;

assign Y = New9 + New8 + New7 + New6 + New5 + New4 + New3 + New2;

endmodule
