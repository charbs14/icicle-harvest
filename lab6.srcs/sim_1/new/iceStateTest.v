`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2024 04:21:44 PM
// Design Name: 
// Module Name: iceStateTest
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


module iceStateTest();
    reg clkin, TZ, T2, T4, underwater, slug, activate;
    wire startTimer, timerStartZ, frzn, fall, fade, spawn, init;
    
    iceState state (.clk(clkin), .TZ(TZ), .T2(T2), .T4(T4), .underwater(underwater), .slug(slug), .activate(activate));
    
    
parameter PERIOD = 10;
   parameter real DUTY_CYCLE = 0.5;
   parameter OFFSET = 2;

       initial
       begin
              clkin = 1'b0;
          #OFFSET
              clkin = 1'b1;
      forever
         begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
         end
       end
       
       initial
       begin
       TZ = 0;
       T2 = 0;
       T4 = 0;
       underwater = 0;
       slug = 0;
       activate = 0;
       #1000;
       activate = 1;
       #1000; 
       TZ = 1;
       #1000; 
       TZ = 0;
       #1000;
       T4 = 1;
       #1000;
       end
endmodule


