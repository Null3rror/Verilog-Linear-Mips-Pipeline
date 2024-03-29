`timescale 1ns / 1ns
module PCMUX(JAddress, BranchAddress, PcPlus4, sel, Out);
     parameter DATA_WIDTH;
     input [DATA_WIDTH-1:0] JAddress, BranchAddress, PcPlus4;
     input [1:0] sel;
     output [DATA_WIDTH-1:0] Out;


     assign Out = (sel == 2'd3) ? JAddress :
                  (sel == 2'd2) ? BranchAddress :
                  (sel == 2'd1) ? PcPlus4 : 32'd0;
 endmodule
