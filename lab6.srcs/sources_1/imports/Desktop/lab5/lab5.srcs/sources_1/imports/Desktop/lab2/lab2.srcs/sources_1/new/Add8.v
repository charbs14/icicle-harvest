`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 04:09:45 PM
// Design Name: 
// Module Name: Add8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Add8(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] S,
    output Cout
    );
    
    wire w0, w1,w2,w3,w4,w5,w6;
    FullAdder fa0 ( .a(A[0]), .b(B[0]), .Cin(0), .S(S[0]), .Cout(w0) );
    FullAdder fa1 ( .a(A[1]), .b(B[1]), .Cin(w0), .S(S[1]), .Cout(w1) ); 
    FullAdder fa2 ( .a(A[2]), .b(B[2]), .Cin(w1), .S(S[2]), .Cout(w2) );
    FullAdder fa3 ( .a(A[3]), .b(B[3]), .Cin(w2), .S(S[3]), .Cout(w3) );
    FullAdder fa4 ( .a(A[4]), .b(B[4]), .Cin(w3), .S(S[4]), .Cout(w4) );
    FullAdder fa5 ( .a(A[5]), .b(B[5]), .Cin(w4), .S(S[5]), .Cout(w5) );
    FullAdder fa6 ( .a(A[6]), .b(B[6]), .Cin(w5), .S(S[6]), .Cout(w6) );
    FullAdder fa7 ( .a(A[7]), .b(B[7]), .Cin(w6), .S(S[7]), .Cout(Cout) );
    
endmodule
