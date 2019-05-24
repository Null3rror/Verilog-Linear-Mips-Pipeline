`timescale 1ns / 1ns
module CU(opCode, Reg_Dst, Branch, Mem_Read, Mem_Write, Mem_To_Reg, Jump, ALU_Src, ALU_Op, Reg_Write);
    input [5:0] opCode;
    output Reg_Dst, Branch, Mem_Read, Mem_Write, Mem_To_Reg, Jump, ALU_Src, Reg_Write;
    output [2:0] ALU_Op;

    assign Reg_Write = (opCode == 6'b0 || opCode == 6'b100011) ? 1:0;
    assign Mem_Read = (opCode == 6'b100011)? 1:0;
    assign Mem_Write = (opCode == 6'b101011)? 1:0;
    assign Jump = (opCode == 6'b000010)? 1:0;
    assign Branch = (opCode == 6'b000100 || opCode == 6'b000101)? 1:0;
    assign MemToReg = (opCode == 6'b100011)? 0:1;
    assign ALUSrc = (opCode == 6'b100011 || opCode == 6'b101011)? 1:0;
  //  assign PCSrc = (opCode == 6'b000010 || opCode == 6'b000100 || opCode == 6'b000101 || (opCode == 6'b000000 && func == 6'b100000))? 1:0;

    assign ALU_Op = (opCode == 6'b0)? 2'b10 : //Rtype
                    (opCode == 6'b100011 || opCode == 6'b101011) ? 2'b00: // lw sw
                    (opCode == 6'b000101 || opCode == 6'b000100) ? 2'b01: 2'b00; // beq bnq




endmodule // CU
