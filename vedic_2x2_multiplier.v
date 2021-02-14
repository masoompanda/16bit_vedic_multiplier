module vedic_2x2(a,b,c);
input [1:0]a;
input [1:0]b;
output wire [3:0]c;
wire [3:0]temp;

//stage 1
// four multiplication operation of bits accourding to vedic logic 
assign c[0]=a[0]&b[0]; 
assign temp[0]=a[1]&b[0];
assign temp[1]=a[0]&b[1];
assign temp[2]=a[1]&b[1];

//stage two 
// using two half adders 
half_adder z1(temp[0],temp[1],c[1],temp[3]);
half_adder z2(temp[2],temp[3],c[2],c[3]);
endmodule
