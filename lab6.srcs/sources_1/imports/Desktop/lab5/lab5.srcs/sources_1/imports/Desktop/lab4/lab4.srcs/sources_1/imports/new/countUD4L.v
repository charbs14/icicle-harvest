`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2024 02:53:19 PM
// Design Name: 
// Module Name: countUD4L
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


module countUD4L(
    input clk,
    input UD,
    input CE,
    input LD,
    input [3:0] Din,
    output [3:0] Q,
    output UTC,
    output DTC
    );
    
    wire [3:0] D, Z;
    wire rCE;
    assign rCE = CE | LD; //to ensure that Din is loaded despite the value of CE
       
    FDRE #(.INIT(1'b0)) IFF_0 (.C(clk), .CE(rCE), .R(1'b0), .D(Z[0]), .Q(Q[0])) ;
    FDRE #(.INIT(1'b0)) IFF_1 (.C(clk), .CE(rCE), .R(1'b0), .D(Z[1]), .Q(Q[1])) ;
    FDRE #(.INIT(1'b0)) IFF_2 (.C(clk), .CE(rCE), .R(1'b0), .D(Z[2]), .Q(Q[2])) ;
    FDRE #(.INIT(1'b0)) IFF_3 (.C(clk), .CE(rCE), .R(1'b0), .D(Z[3]), .Q(Q[3])) ;
    
    assign D[0] = ~(Q[0]) ;
    assign D[1] = (Q[1] ^ ~( Q[0] ^ UD )) ;
    assign D[2] = (Q[2] ^ (~( Q[1] ^ UD ) & ~( Q[0] ^ UD )))  ; 
    assign D[3] = (Q[3] ^ (~( Q[2] ^ UD ) & ~( Q[1] ^ UD ) & ~( Q[0] ^ UD ))) ;
    
    assign Z = (D & ~{4{LD}}) | (Din & {4{LD}}) ; //multiplexer for loading  
   
    assign UTC = Q[0] & Q[1] & Q[2] & Q[3] ;
    assign DTC = ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] ;
    
endmodule
