/*
* Filename : Control.scala
* Date     : 03-01-2019
* Author   : SunnyChen
*
* Generate the control signal for the processor
* 03-01-2019 - temporary for the basic 7 instructions(BEQ, LW, SW, R-format)
* 08-01-2019 - add ALU operations
* 09-01-2019 - add register set instructions and memory instructions
* 10-01-2019 - add conditional branch and jump and link instructions
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util._
import Instructions._
import ALU._
import com.sun.org.apache.bcel.internal.generic
import javax.swing.plaf.BorderUIResource.LineBorderUIResource

object Control{
  // Reg_Write
  val Reg_Write_False = 0.U(1.W)
  val Reg_Write_True  = 1.U(1.W)

  // Imm_sel
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

  // Branch_Src
  val Branch_XXX   = 0.U(1.W)
  val Branch_PC    = 0.U(1.W)
  val Branch_Rs1   = 1.U(1.W)

  // Jump_Type
  val Conditional    = 0.U(1.W)
  val NonConditional = 1.U(1.W)

  // Mem_Read
  val Mem_Read_False = 0.U(1.W)
  val Mem_Read_True  = 1.U(1.W)

  // Mem_Write
  val Mem_Write_False = 0.U(1.W)
  val Mem_Write_True  = 1.U(1.W)

  // Data_Size
  val Data_Size_W = 0.U(2.W)
  val Data_Size_H = 1.U(2.W)
  val Data_Size_B = 2.U(2.W)

  // Mem_Load_Type - Only consider when loading half-word or byte data
  val Load_XXX      = 0.U(1.W)
  val Load_Signed   = 0.U(1.W)
  val Load_Unsigned = 1.U(1.W)

  // Mem_to_Reg
  val RegWrite_XXX    = 0.U(2.W)
  val RegWrite_ALU    = 0.U(2.W)
  val RegWrite_Mem    = 1.U(2.W)
  val RegWrite_PC_4  = 2.U(2.W)

//                      Reg_Write      Imm_sel     ALU_Src       ALUOp         Branch         Branch_Src     Mem_Read          Mem_Write         Data_Size     Load_Type         Mem_to_Reg       Jump_Type
//                         |              |           |            |              |              |               |                 |                 |             |                 |               |
  val default = List(Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional)

  val map =    Array(
    ADD      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SUB      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SUB   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    AND      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_AND   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    OR       -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_OR    ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    XOR      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_XOR   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),

    ADDI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    ANDI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_AND   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    ORI      -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_OR    ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    XORI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_XOR   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),

    SLL      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SRL      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SRA      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRA   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),

    SLLI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SRLI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SRAI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRA   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),

    SLT      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLT   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SLTU     -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLTU  ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SLTI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLT   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),
    SLTIU    -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLTU  ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional),

    LW       -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_W,   Load_Signed  ,   RegWrite_Mem,   Conditional),
    LH       -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_H,   Load_Signed  ,   RegWrite_Mem,   Conditional),
    LB       -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_B,   Load_Signed  ,   RegWrite_Mem,   Conditional),
    LHU      -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_H,   Load_Unsigned,   RegWrite_Mem,   Conditional),
    LBU      -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_B,   Load_Unsigned,   RegWrite_Mem,   Conditional),
    SW       -> List(Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_True ,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional),
    SH       -> List(Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_True ,   Data_Size_H,   Load_XXX     ,   RegWrite_XXX,   Conditional),
    SB       -> List(Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_True ,   Data_Size_B,   Load_XXX     ,   RegWrite_XXX,   Conditional),

    BEQ      -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BEQ   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional),
    BNE      -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BNE   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional),
    BLT      -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BLT   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional),
    BGE      -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BGE   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional),
    BLTU     -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BLTU  ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional),
    BGEU     -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BGEU  ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional),

    JAL      -> List(Reg_Write_True ,   IMM_UJ,   ALU_B_rs2,   ALU_ADD   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_PC_4, NonConditional),
    JALR     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_rs2,   ALU_ADD   ,   Branch_True ,   Branch_Rs1,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_PC_4, NonConditional),

    NOP      -> List(Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional)
  )
}

class ControlSignals extends Bundle with Config {
  val inst        = Input(UInt(WLEN.W))
  val Reg_Write   = Output(UInt(REGWRITE_SIG_LEN.W))
  val Imm_Sel     = Output(UInt(IMM_SEL_SIG_LEN.W))
  val ALU_Src     = Output(UInt(ALU_SRC_SIG_LEN.W))
  val ALUOp       = Output(UInt(ALUOP_SIG_LEN.W))
  val Branch      = Output(UInt(BRANCH_SIG_LEN.W))
  val Branch_Src  = Output(UInt(BRANCH_SRC_SIG_LEN.W))
  val Mem_Read    = Output(UInt(MEM_READ_SIG_LEN.W))
  val Mem_Write   = Output(UInt(MEM_WRITE_SIG_LEN.W))
  val Data_Size   = Output(UInt(DATA_SIZE_SIG_LEN.W))
  val Load_Type   = Output(UInt(LOAD_TYPE_SIG_LEN.W))
  val Mem_to_Reg  = Output(UInt(REG_SRC_SIG_LEN.W))
  val Jump_Type   = Output(UInt(JUMP_TYPE_SIG_LEN.W))
}

class Control extends Module with Config {
  val io = IO(new ControlSignals)

  val ctrlsignals = ListLookup(io.inst, Control.default, Control.map)

  io.Imm_Sel    := ctrlsignals(1)

  // Control signals for EX stage
  io.ALU_Src    := ctrlsignals(2)
  io.ALUOp      := ctrlsignals(3)
  io.Branch     := ctrlsignals(4)
  io.Branch_Src := ctrlsignals(5)
  io.Jump_Type  := ctrlsignals(11)

  // Control signals for MEM stage
  io.Mem_Read   := ctrlsignals(6)
  io.Mem_Write  := ctrlsignals(7)
  io.Data_Size  := ctrlsignals(8)
  io.Load_Type  := ctrlsignals(9)

  // Control signals for WB stage
  io.Reg_Write  := ctrlsignals(0)
  io.Mem_to_Reg := ctrlsignals(10)

}

object Control_gen extends App {
  chisel3.Driver.execute(args, () => new Control)
}
