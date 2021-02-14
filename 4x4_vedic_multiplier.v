module vedic_4x4(a,b,c);
input [3:0]a;
input [3:0]b;
output wire [7:0]c;

wire [3:0]q0;	
wire [3:0]q1;	
wire [3:0]q2;
wire [3:0]q3;	
wire [3:0]temp1;
wire [5:0]temp2;
wire [5:0]temp3;
wire [5:0]temp4;
wire [3:0]q4;
wire [5:0]q5;
wire [5:0]q6;

// using 4 2x2 multipliers
vedic_2x2 v1(a[1:0],b[1:0],q0[3:0]);
vedic_2x2 v2(a[3:2],b[1:0],q1[3:0]);
vedic_2x2 v3(a[1:0],b[3:2],q2[3:0]);
vedic_2x2 v4(a[3:2],b[3:2],q3[3:0]);

// stage 1 adders 
assign temp1 ={2'b0,q0[3:2]};
bit_4_adder v5(q1[3:0],temp1,q4);
assign temp2 ={2'b0,q2[3:0]};
assign temp3 ={q3[3:0],2'b0};
bit_6_adder v6(temp2,temp3,q5);
assign temp4={2'b0,q4[3:0]};

// stage 2 adder 
bit_6_adder v7(temp4,q5,q6);
// fnal output assignment 
assign c[1:0]=q0[1:0];
assign c[7:2]=q6[5:0];
endmodule

//vedic 8x8 multiplier//
module vedic_8x8(a,b,c);
   
input [7:0]a;
input [7:0]b;
output [15:0]c;

wire [15:0]q0;	
wire [15:0]q1;	
wire [15:0]q2;
wire [15:0]q3;	
wire [15:0]c;
wire [7:0]temp1;
wire [11:0]temp2;
wire [11:0]temp3;
wire [11:0]temp4;
wire [7:0]q4;
wire [11:0]q5;
wire [11:0]q6;
// using 4 4x4 multipliers
vedic_4x4 v1(a[3:0],b[3:0],q0[15:0]);
vedic_4x4 v2(a[7:4],b[3:0],q1[15:0]);
vedic_4x4 v3(a[3:0],b[7:4],q2[15:0]);
vedic_4x4 v4(a[7:4],b[7:4],q3[15:0]);

// stage 1 adders 
assign temp1 ={4'b0,q0[7:4]};
bit_8_adder v5(q1[7:0],temp1,q4);
assign temp2 ={4'b0,q2[7:0]};
assign temp3 ={q3[7:0],4'b0};
bit_12_adder v6(temp2,temp3,q5);
assign temp4={4'b0,q4[7:0]};
// stage 2 adder
bit_12_adder v7(temp4,q5,q6);
// fnal output assignment 
assign c[3:0]=q0[3:0];
assign c[15:4]=q6[11:0];

endmodule
