`timescale 1ns / 1ps

//this is the top module//
module vedic_32x32(a,b,c);
input [31:0]a;
input [31:0]b;
output wire [63:0]c;

wire [31:0]q0;	
wire [31:0]q1;	
wire [31:0]q2;
wire [31:0]q3;	
wire [31:0]temp1;
wire [47:0]temp2;
wire [47:0]temp3;
wire [47:0]temp4;
wire [31:0]q4;
wire [47:0]q5;
wire [47:0]q6;

// using 4 16x16 multipliers
vedic_16x16 v1(a[15:0],b[15:0],q0[31:0]);
vedic_16x16 v2(a[31:16],b[15:0],q1[31:0]);
vedic_16x16 v3(a[15:0],b[31:16],q2[31:0]);
vedic_16x16 v4(a[31:16],b[31:16],q3[31:0]);

// stage 1 adders 
assign temp1 ={8'b0,q0[15:8]};
add_32_bit v5(q1[31:0],temp1,q4);
assign temp2 ={16'b0,q2[31:0]};
assign temp3 ={q3[31:0],16'b0};
add_48_bit v6(temp2,temp3,q5);
assign temp4={16'b0,q4[31:0]};

//stage 2 adder
add_48_bit v7(temp4,q5,q6);
// fnal output assignment 
assign c[15:0]=q0[15:0];
assign c[63:16]=q6[47:0];

endmodule

