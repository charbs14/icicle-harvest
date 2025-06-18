`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2024 02:36:15 PM
// Design Name: 
// Module Name: iceState
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


module iceState(
    input clk,
    input TZ,
    input T2, 
    input T4,
    input underwater,
    input slug,
    input activate,
    output startTimer,
    output timerStartZ,
    output frzn,
    output fall,
    output fade,
    output spawn,
    output init
    );
    wire [4:0] D, Q;
    
    FDRE #(.INIT(1'b1)) FF_spawn (.C(clk), .CE(1'b1), .R(1'b0), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) FF_other [4:1] (.C({4{clk}}), .CE({4{1'b1}}), .R(4'b0), .D(D[4:1]), .Q(Q[4:1]));
    
    assign D[0] = Q[0] & ~activate;
    assign D[1] = Q[1] & ~TZ | Q[3] & underwater | Q[4] & T2 | Q[0] & activate;
    assign D[2] = Q[1] & TZ | Q[2] & ~T4;
    assign D[3] = Q[2] & T4 | Q[3] & ~underwater & ~slug;
    assign D[4] = Q[3] & slug | Q[4] & ~T2;
    
    assign startTimer = Q[1] & TZ | Q[3] & slug; 
    assign frzn = Q[4];
    assign fall = Q[3];
    assign fade = Q[2];
    assign spawn = Q[1];
    assign init = Q[0];
    assign timerStartZ  = Q[3] & underwater | Q[0] & activate | Q[4] & T2;
    
endmodule
