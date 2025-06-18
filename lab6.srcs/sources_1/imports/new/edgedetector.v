`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 11:15:50 AM
// Design Name: 
// Module Name: edgedetector
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


module edgedetector(
    input x,
    input clk,
    output y
    );
    
    wire [1:0] Q, D;
    
    FDRE #(.INIT(1'b0)) FF_0 (.C(clk), .CE(1'b1), .R(1'b0), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) FF_1 (.C(clk), .CE(1'b1), .R(1'b0), .D(D[1]), .Q(Q[1]));
    
    assign D[0] = x;
    assign D[1] = Q[0];
    assign y = Q[0] & ~Q[1];
    
endmodule  
