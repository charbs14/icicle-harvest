`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 01:57:55 PM
// Design Name: 
// Module Name: pixelAddress
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


module pixelAddress(
    input clk,
    output [15:0] V,
    output [15:0] H
    );
    wire resetV, resetH;
    
    counterUD16L horizontal (.clk(clk), .UD(1'b1), .CE(1'b1), .LD(resetH), .Din(16'b0), .Q(H));
    counterUD16L verticle (.clk(clk), .UD(1'b1), .CE(resetH), .LD(resetV), .Din(16'b0), .Q(V));  
    
    assign resetH = (H == 16'd799);
    assign resetV = (V == 16'd524) & resetH;
    
         
endmodule

