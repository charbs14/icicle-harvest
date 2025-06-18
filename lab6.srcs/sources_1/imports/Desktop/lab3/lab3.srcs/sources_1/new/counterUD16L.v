`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 12:53:44 PM
// Design Name: 
// Module Name: counterUD16L
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


module counterUD16L(
    input clk,
    input UD,
    input CE,
    input LD,
    input [15:0] Din,
    output [15:0] Q,
    output UTC,
    output DTC
    );
    
    wire [3:0] UTCa, DTCa, en;
    
    assign en[0] = CE ;
    assign en[1] = (DTCa[0] & ~UD | UTCa[0] & UD) & CE;
    assign en[2] = (DTCa[1] & DTCa[0] & ~UD | UTCa[1] & UTCa[0] & UD) & CE;
    assign en[3] = (DTCa[2] & DTCa[1] & DTCa[0] & ~UD | UTCa[2] & UTCa[1] & UTCa[0] & UD) & CE;

    countUD4L zero (.clk(clk), .UD(UD), .CE(en[0]), .LD(LD), .Din(Din[3:0]), .Q(Q[3:0]), .UTC(UTCa[0]), .DTC(DTCa[0]));
    countUD4L one (.clk(clk), .UD(UD), .CE(en[1]), .LD(LD), .Din(Din[7:4]), .Q(Q[7:4]), .UTC(UTCa[1]), .DTC(DTCa[1]));
    countUD4L two (.clk(clk), .UD(UD), .CE(en[2]), .LD(LD), .Din(Din[11:8]), .Q(Q[11:8]), .UTC(UTCa[2]), .DTC(DTCa[2]));
    countUD4L three (.clk(clk), .UD(UD), .CE(en[3]), .LD(LD), .Din(Din[15:12]), .Q(Q[15:12]), .UTC(UTCa[3]), .DTC(DTCa[3]));
    
    assign UTC = &UTCa;
    assign DTC = &DTCa;
    
endmodule
