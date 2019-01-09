/*
* Filename : ID_EX_Register.scala
* Date     : 03-01-2019
* Author   : SunnyChen
*
* Pipeline register between ID stage and EX stage
* */

package riscv_mini_five_stage

import chisel3._

class ID_EX_Registerio extends Bundle with Config {
  val id_pc      = Input(UInt(WLEN.W))
  val id_rs1_out = Input(UInt(WLEN.W))
  val id_rs2_out = Input(UInt(WLEN.W))
  val id_imm     = Input(UInt(WLEN.W))
  val id_inst    = Input(UInt(WLEN.W))
  val id_rs1     = Input(UInt(REG_LEN.W))
  val id_rs2     = Input(UInt(REG_LEN.W))

  /* control signals */
  // EX stage
  val ALU_Src    = Input(UInt(ALU_SRC_SIG_LEN.W))
  val ALUOp      = Input(UInt(ALUOP_SIG_LEN.W))

  // MEM stage
  val Branch     = Input(UInt(BRANCH_SIG_LEN.W))
  val Mem_Read   = Input(UInt(MEM_READ_SIG_LEN.W))
  val Mem_Write  = Input(UInt(MEM_WRITE_SIG_LEN.W))
  

  // WB stage
  val Reg_Write  = Input(UInt(REGWRITE_SIG_LEN.W))
  val Mem_to_Reg = Input(UInt(REG_SRC_SIG_LEN.W))

  /* Output */
  // Control signals output
  val ex_ALU_Src    = Output(UInt(ALU_SRC_SIG_LEN.W))
  val ex_ALUOp      = Output(UInt(ALUOP_SIG_LEN.W))
  val ex_Branch     = Output(UInt(BRANCH_SIG_LEN.W))
  val ex_Mem_Read   = Output(UInt(MEM_READ_SIG_LEN.W))
  val ex_Mem_Write  = Output(UInt(MEM_WRITE_SIG_LEN.W))
  val ex_Reg_Write  = Output(UInt(REGWRITE_SIG_LEN.W))
  val ex_Mem_to_Reg = Output(UInt(REG_SRC_SIG_LEN.W))

  val ex_pc         = Output(UInt(WLEN.W))
  val ex_rs1_out    = Output(UInt(WLEN.W))
  val ex_rs2_out    = Output(UInt(WLEN.W))
  val ex_rd         = Output(UInt(REG_LEN.W))   /* < pass to the MEM/WB pipeline register*/
  val ex_imm        = Output(UInt(WLEN.W))
  val ex_rs1        = Output(UInt(REG_LEN.W))
  val ex_rs2        = Output(UInt(REG_LEN.W))
  val ex_inst       = Output(UInt(WLEN.W))
}

class ID_EX_Register extends Module with Config {
  val io = IO(new ID_EX_Registerio)

  // Reg for storing the signal and data
  val pc          = RegInit(0.U(WLEN.W))
  val rs1_out     = RegInit(0.U(WLEN.W))
  val rs2_out     = RegInit(0.U(WLEN.W))
  val imm         = RegInit(0.U(WLEN.W))
  val inst        = RegInit(0.U(WLEN.W))
  val rs1         = RegInit(0.U(WLEN.W))
  val rs2         = RegInit(0.U(WLEN.W))
  val alu_src     = RegInit(0.U(ALU_SRC_SIG_LEN.W))
  val aluop       = RegInit(0.U(ALUOP_SIG_LEN.W))
  val branch      = RegInit(0.U(BRANCH_SIG_LEN.W))
  val mem_read    = RegInit(0.U(MEM_READ_SIG_LEN.W))
  val mem_write   = RegInit(0.U(MEM_WRITE_SIG_LEN.W))
  val reg_write   = RegInit(0.U(REGWRITE_SIG_LEN.W))
  val mem_to_reg  = RegInit(0.U(REG_SRC_SIG_LEN.W))

  // apply regs
  pc                := io.id_pc
  rs1_out           := io.id_rs1_out
  rs2_out           := io.id_rs2_out
  imm               := io.id_imm
  inst              := io.id_inst
  rs1               := io.id_rs1
  rs2               := io.id_rs2
  alu_src           := io.ALU_Src
  aluop             := io.ALUOp
  branch            := io.Branch
  mem_read          := io.Mem_Read
  mem_write         := io.Mem_Write
  reg_write         := io.Reg_Write
  mem_to_reg        := io.Mem_to_Reg

  // output
  io.ex_ALU_Src     := alu_src
  io.ex_ALUOp       := aluop
  io.ex_Branch      := branch
  io.ex_Mem_Read    := mem_read
  io.ex_Mem_Write   := mem_write
  io.ex_Reg_Write   := reg_write
  io.ex_Mem_to_Reg  := mem_to_reg
  io.ex_pc          := pc
  io.ex_rs1_out     := rs1_out
  io.ex_rs2_out     := rs2_out
  io.ex_rs1         := rs1
  io.ex_rs2         := rs2
  io.ex_imm         := imm
  io.ex_inst        := inst
  io.ex_rd          := inst(11, 7)
}

object ID_EX_Register extends App {
  chisel3.Driver.execute(args, () => new ID_EX_Register)
}