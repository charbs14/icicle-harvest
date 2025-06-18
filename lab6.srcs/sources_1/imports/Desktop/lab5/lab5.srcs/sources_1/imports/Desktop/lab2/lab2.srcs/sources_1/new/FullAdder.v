`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 04:17:37 PM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input a,
    input b,
    input Cin,
    output S,
    output Cout
    );
    
    assign S = Cin & (~a & ~b | a & b) | ~Cin & (~a & b | a & ~b);
    assign Cout = a & b | b & Cin | a & Cin;
    
endmodule
