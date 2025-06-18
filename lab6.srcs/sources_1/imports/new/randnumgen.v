`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 06:02:36 PM
// Design Name: 
// Module Name: randnumgen
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


module randnumgen(
    input clk,
    output [7:0] rnd
    );
    
    wire [7:0] D;
    wire notQ;
    
    FDRE #(.INIT(1'b0)) FF_0 (.C(clk), .R(1'b0), .CE(1'b1), .D(~D[0]), .Q(notQ));
    FDRE #(.INIT(1'b0)) FF[6:0] (.C({7{clk}}), .R(7'b0), .CE({7{1'b1}}), .D(D[7:1]), .Q(rnd[7:1]));
    
    assign rnd[0] = ~notQ;
    assign D[0] = rnd[0] ^ rnd[5] ^ rnd[6] ^ rnd[7];
    assign D[1] = rnd[0];
    assign D[2] = rnd[1];
    assign D[3] = rnd[2];
    assign D[4] = rnd[3];
    assign D[5] = rnd[4];
    assign D[6] = rnd[5];
    assign D[7] = rnd[6];
    
endmodule
