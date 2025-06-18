`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 04:44:20 PM
// Design Name: 
// Module Name: SignChanger
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


module SignChanger(
    input [7:0] a,
    input sign,
    output [7:0] d,
    output ovfl
    );
    wire [7:0] invert, twos;
    wire discard;
    
    assign invert = ~a;
    
    Add8 adder( .A(invert), .B(8'd1), .Cin(1'd0), .Cout(discard), .S(twos) ) ;
    mux2to18bit mux ( .i0(a), .i1(twos), .sel(sign), .y(d) ) ;
    
    assign ovfl = a[7] & ~|a[6:0] & sign;
endmodule 
