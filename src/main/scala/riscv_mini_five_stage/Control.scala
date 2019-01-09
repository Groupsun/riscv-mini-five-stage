/*
* Filename : Control.scala
* Date     : 03-01-2019
* Author   : SunnyChen
*
* Generate the control signal for the processor
* 03-01-2019 - temporary for the basic 7 instructions(BEQ, LW, SW, R-format)
* 08-01-2019 - add ALU operations
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util._
import Instructions._
import ALU._
import com.sun.org.apache.bcel.internal.generic

object Control{
  // Reg_Write
  val Reg_Write_False = 0.U(1.W)
  val Reg_Write_True  = 1.U(1.W)

  // Imm_sel
  // May expend in future time
  val IMM_X   = 0.U(3.W)
  val IMM_R   = 1.U(3.W)
  val IMM_I   = 2.U(3.W)
  val IMM_S   = 3.U(3.W)
  val IMM_SB  = 4.U(3.W)
  val IMM_U   = 5.U(3.W)
  val IMM_UJ  = 6.U(3.W)

  // ALU_Src
  val ALU_B_XXX = 0.U(1.W)
  val ALU_B_rs2 = 0.U(1.W)
  val ALU_B_imm = 1.U(1.W)

  // Branch
  val Branch_False = 0.U(1.W)
  val Branch_True  = 1.U(1.W)

  // Mem_Read
  val Mem_Read_False = 0.U(1.W)
  val Mem_Read_True  = 1.U(1.W)

  // Mem_Write
  val Mem_Write_False = 0.U(1.W)
  val Mem_Write_True  = 1.U(1.W)

  // Mem_to_Reg
  val RegWrite_XXX = 0.U(1.W)
  val RegWrite_ALU = 0.U(1.W)
  val RegWrite_Mem = 1.U(1.W)

//                      Reg_Write      Imm_sel     ALU_Src       ALUOp         Branch           Mem_Read          Mem_Write        Mem_to_Reg
//                         |              |           |            |              |                |                 |                 |
  val default = List(Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_XXX)

  val map =    Array(
    ADD      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    SUB      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SUB   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    AND      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_AND   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    OR       -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_OR    ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    XOR      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_XOR   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),

    ADDI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    ANDI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_AND   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    ORI      -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_OR    ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    XORI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_XOR   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),

    SLL      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    SRL      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    SRA      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRA   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),

    SLLI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    SRLI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),
    SRAI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRA   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_ALU),

    LW       -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_True ,   Mem_Write_False,   RegWrite_Mem),
    SW       -> List(Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_True ,   RegWrite_XXX),
    BEQ      -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_SUB   ,   Branch_True ,   Mem_Read_False,   Mem_Write_False,   RegWrite_XXX),
    NOP      -> List(Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Mem_Read_False,   Mem_Write_False,   RegWrite_XXX)
  )
}

class ControlSignals extends Bundle with Config {
  val inst        = Input(UInt(WLEN.W))
  val Reg_Write   = Output(UInt(REGWRITE_SIG_LEN.W))
  val Imm_Sel     = Output(UInt(IMM_SEL_SIG_LEN.W))
  val ALU_Src     = Output(UInt(ALU_SRC_SIG_LEN.W))
  val ALUOp       = Output(UInt(ALUOP_SIG_LEN.W))
  val Branch      = Output(UInt(BRANCH_SIG_LEN.W))
  val Mem_Read    = Output(UInt(MEM_READ_SIG_LEN.W))
  val Mem_Write   = Output(UInt(MEM_WRITE_SIG_LEN.W))
  val Mem_to_Reg  = Output(UInt(REG_SRC_SIG_LEN.W))
}

class Control extends Module with Config {
  val io = IO(new ControlSignals)

  val ctrlsignals = ListLookup(io.inst, Control.default, Control.map)

  io.Imm_Sel    := ctrlsignals(1)

  // Control signals for EX stage
  io.ALU_Src    := ctrlsignals(2)
  io.ALUOp      := ctrlsignals(3)

  // Control signals for MEM stage
  io.Branch     := ctrlsignals(4)
  io.Mem_Read   := ctrlsignals(5)
  io.Mem_Write  := ctrlsignals(6)

  // Control signals for WB stage
  io.Reg_Write  := ctrlsignals(0)
  io.Mem_to_Reg := ctrlsignals(7)

}

object Control_gen extends App {
  chisel3.Driver.execute(args, () => new Control)
}
