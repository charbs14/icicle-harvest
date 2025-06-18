`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 03:57:20 PM
// Design Name: 
// Module Name: mux2to1-8bit
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


module mux2to18bit(
    input [7:0] i0,
    input [7:0] i1,
    input sel,
    output [7:0] y
    );

    assign y = ({8{sel}} & i1[7:0]) | (~{8{sel}} & i0[7:0]) ;
endmodule
