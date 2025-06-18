`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2024 07:38:23 PM
// Design Name: 
// Module Name: chooseColor
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


module chooseColor(
    input [9:0] iceHit,
    input [9:0] iceColor, 
    output currColor
    );
    assign currColor = iceHit[0] & iceColor[0] | iceHit[1] & iceColor[1] |  iceHit[2] & iceColor[2] |  iceHit[3] & iceColor[3] |  iceHit[4] & iceColor[4] |  iceHit[5] & iceColor[5] |  iceHit[6] & iceColor[6] |  iceHit[7] & iceColor[7] |  iceHit[8] & iceColor[8] |  iceHit[9] & iceColor[9]; 
    
endmodule
