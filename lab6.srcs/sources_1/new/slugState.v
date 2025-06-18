`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2024 12:31:24 PM
// Design Name: 
// Module Name: slugState
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


module slugState(
    input clk,
    input icicle,
    input T2,
    output frzn,
    output timerStart
    );
        
    wire [1:0] D, Q;
    
    FDRE #(.INIT(1'b1)) NOTFRZN (.C(clk), .CE(1'b1), .R(1'b0), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) FRZN(.C(clk), .CE(1'b1), .R(1'b0), .D(D[1]), .Q(Q[1]));
    
    assign D[0] = Q[0] & ~icicle | Q[1] & T2;
    assign D[1] = Q[0] & icicle | Q[1] & ~T2;
    
    assign frzn = Q[1];
    assign timerStart = Q[0] & icicle ;
    
endmodule
