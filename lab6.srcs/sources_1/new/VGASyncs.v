`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 02:13:44 PM
// Design Name: 
// Module Name: VGASyncs
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


module VGASyncs(
    input [15:0] H,
    input [15:0] V,
    output Hsync,
    output Vsync
    );
    
    assign Hsync = (H < 16'd654) | (H > 16'd749);
    assign Vsync = (V < 16'd489) | (V > 16'd490);
    
endmodule
