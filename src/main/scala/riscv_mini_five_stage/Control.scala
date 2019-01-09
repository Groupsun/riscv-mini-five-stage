/*
* Filename : Control.scala
* Date     : 03-01-2019
* Author   : SunnyChen
*
* Generate the control signal for the processor
* 03-01-2019 - temporary for the basic 7 instructions(BEQ, LW, SW, R-format)
* 08-01-2019 - add ALU operations
* 09-01-2019 - add register set instructions and memory instructions
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

  // Data_Size
  val Data_Size_W = 0.U(2.W)
  val Data_Size_H = 1.U(2.W)
  val Data_Size_B = 2.U(2.W)

  // Mem_Load_Type - Only consider when loading half-word or byte data
  val Load_XXX      = 0.U(1.W)
  val Load_Signed   = 0.U(1.W)
  val Load_Unsigned = 1.U(1.W)

  // Mem_to_Reg
  val RegWrite_XXX = 0.U(1.W)
  val RegWrite_ALU = 0.U(1.W)
  val RegWrite_Mem = 1.U(1.W)

//                      Reg_Write      Imm_sel     ALU_Src       ALUOp         Branch           Mem_Read          Mem_Write        Data_Size     Load_Type         Mem_to_Reg
//                         |              |           |            |              |                |                 |                 |             |                 |
  val default = List(Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX)

  val map =    Array(
    ADD      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SUB      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SUB   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    AND      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_AND   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    OR       -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_OR    ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    XOR      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_XOR   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),

    ADDI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    ANDI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_AND   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    ORI      -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_OR    ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    XORI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_XOR   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),

    SLL      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SRL      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SRA      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRA   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),

    SLLI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SRLI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRL   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SRAI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRA   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),

    SLT      -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLT   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SLTU     -> List(Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLTU  ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SLTI     -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLT   ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),
    SLTIU    -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLTU  ,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU),

    LW       -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_True ,   Mem_Write_False,   Data_Size_W,   Load_Signed  ,   RegWrite_Mem),
    LH       -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_True ,   Mem_Write_False,   Data_Size_H,   Load_Signed  ,   RegWrite_Mem),
    LB       -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_True ,   Mem_Write_False,   Data_Size_B,   Load_Signed  ,   RegWrite_Mem),
    LHU      -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_True ,   Mem_Write_False,   Data_Size_H,   Load_Unsigned,   RegWrite_Mem),
    LBU      -> List(Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_True ,   Mem_Write_False,   Data_Size_B,   Load_Unsigned,   RegWrite_Mem),
    SW       -> List(Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_True ,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX),
    SH       -> List(Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_True ,   Data_Size_H,   Load_XXX     ,   RegWrite_XXX),
    SB       -> List(Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Mem_Read_False,   Mem_Write_True ,   Data_Size_B,   Load_XXX     ,   RegWrite_XXX),

    BEQ      -> List(Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_SUB   ,   Branch_True ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX),
    NOP      -> List(Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX)
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
  val Data_Size   = Output(UInt(DATA_SIZE_SIG_LEN.W))
  val Load_Type   = Output(UInt(LOAD_TYPE_SIG_LEN.W))
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
  io.Data_Size  := ctrlsignals(7)
  io.Load_Type  := ctrlsignals(8)

  // Control signals for WB stage
  io.Reg_Write  := ctrlsignals(0)
  io.Mem_to_Reg := ctrlsignals(9)

}

object Control_gen extends App {
  chisel3.Driver.execute(args, () => new Control)
}
