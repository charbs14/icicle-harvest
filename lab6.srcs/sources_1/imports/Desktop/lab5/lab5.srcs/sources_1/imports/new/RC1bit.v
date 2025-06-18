`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 11:11:37 AM
// Design Name: 
// Module Name: RC1bit
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


module RC1bit(
    input advance,
    input clk,
    output [3:0] Q
    );
    
    wire [3:0] D;
    wire notQ0;
    
    FDRE #(.INIT(1'b0)) FF_0 (.C(clk), .CE(advance), .R(1'b0), .D(~D[0]), .Q(notQ0)) ;
    FDRE #(.INIT(1'b0)) FF_1 (.C(clk), .CE(advance), .R(1'b0), .D(D[1]), .Q(Q[1])) ;
    FDRE #(.INIT(1'b0)) FF_2 (.C(clk), .CE(advance), .R(1'b0), .D(D[2]), .Q(Q[2])) ;
    FDRE #(.INIT(1'b0)) FF_3 (.C(clk), .CE(advance), .R(1'b0), .D(D[3]), .Q(Q[3])) ;
    
    assign Q[0] = ~notQ0;
    assign D[0] = Q[3];
    assign D[1] = Q[0];
    assign D[2] = Q[1];
    assign D[3] = Q[2];

endmodule
