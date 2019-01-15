/*
* Filename : EX_MEM_Register.scala
* Date     : 05-01-2019
* Author   : SunnyChen
*
* Pipeline register between EX and MEM stage
* */

package riscv_mini_five_stage

import chisel3._

class EX_MEM_Registerio extends Bundle with Config {
  val ex_alu_sum      = Input(UInt(WLEN.W))
  val ex_rs2_out      = Input(UInt(WLEN.W))
  val ex_rd           = Input(UInt(REG_LEN.W))
  val ex_pc_4         = Input(UInt(WLEN.W))
  val ex_imm          = Input(UInt(WLEN.W))
  val ex_aui_pc       = Input(UInt(WLEN.W))
  val ex_rs2          = Input(UInt(REG_LEN.W))

  /* Control signals */
  // MEM stage
  val ex_Mem_Read     = Input(UInt(MEM_READ_SIG_LEN.W))
  val ex_Mem_Write    = Input(UInt(MEM_WRITE_SIG_LEN.W))
  val ex_Data_Size    = Input(UInt(DATA_SIZE_SIG_LEN.W))
  val ex_Load_Type    = Input(UInt(LOAD_TYPE_SIG_LEN.W))

  // WB stage
  val ex_Reg_Write    = Input(UInt(REGWRITE_SIG_LEN.W))
  val ex_Mem_to_Reg   = Input(UInt(REG_SRC_SIG_LEN.W))

  /* Output */
  // Control signals output
  val mem_Mem_Read    = Output(UInt(MEM_READ_SIG_LEN.W))
  val mem_Mem_Write   = Output(UInt(MEM_WRITE_SIG_LEN.W))
  val mem_Data_Size   = Output(UInt(DATA_SIZE_SIG_LEN.W))
  val mem_Load_Type   = Output(UInt(LOAD_TYPE_SIG_LEN.W))
  val mem_Reg_Write   = Output(UInt(REGWRITE_SIG_LEN.W))
  val mem_Mem_to_Reg  = Output(UInt(REG_SRC_SIG_LEN.W))

  val mem_alu_sum     = Output(UInt(WLEN.W))
  val mem_rs2_out     = Output(UInt(WLEN.W))
  val mem_rd          = Output(UInt(REG_LEN.W))
  val mem_pc_4        = Output(UInt(WLEN.W))
  val mem_imm         = Output(UInt(WLEN.W))
  val mem_aui_pc      = Output(UInt(WLEN.W))
  val mem_rs2         = Output(UInt(REG_LEN.W))
}

class EX_MEM_Register extends Module with Config {
  val io = IO(new EX_MEM_Registerio)

  // Reg for storing the signal and data
  val alu_sum       = RegInit(0.U(WLEN.W))
  val rs2_out       = RegInit(0.U(WLEN.W))
  val rd            = RegInit(0.U(REG_LEN.W))
  val pc_4          = RegInit(0.U(WLEN.W))
  val imm           = RegInit(0.U(WLEN.W))
  val aui_pc        = RegInit(0.U(WLEN.W))
  val rs2           = RegInit(0.U(REG_LEN.W))

  val mem_read      = RegInit(0.U(MEM_READ_SIG_LEN.W))
  val mem_write     = RegInit(0.U(MEM_WRITE_SIG_LEN.W))
  val data_size     = RegInit(0.U(DATA_SIZE_SIG_LEN.W))
  val load_type     = RegInit(0.U(LOAD_TYPE_SIG_LEN.W))
  val reg_write     = RegInit(0.U(REGWRITE_SIG_LEN.W))
  val mem_to_reg    = RegInit(0.U(REG_SRC_SIG_LEN.W))

  // apply regs
  alu_sum       := io.ex_alu_sum
  rs2_out       := io.ex_rs2_out
  rd            := io.ex_rd
  pc_4          := io.ex_pc_4
  imm           := io.ex_imm
  aui_pc        := io.ex_aui_pc
  rs2           := io.ex_rs2
  mem_read      := io.ex_Mem_Read
  mem_write     := io.ex_Mem_Write
  data_size     := io.ex_Data_Size
  load_type     := io.ex_Load_Type
  reg_write     := io.ex_Reg_Write
  mem_to_reg    := io.ex_Mem_to_Reg

  // output
  io.mem_alu_sum      := alu_sum
  io.mem_rs2_out      := rs2_out
  io.mem_rd           := rd
  io.mem_pc_4         := pc_4
  io.mem_imm          := imm
  io.mem_aui_pc       := aui_pc
  io.mem_rs2          := rs2
  io.mem_Mem_Read     := mem_read
  io.mem_Mem_Write    := mem_write
  io.mem_Data_Size    := data_size
  io.mem_Load_Type    := load_type
  io.mem_Reg_Write    := reg_write
  io.mem_Mem_to_Reg   := mem_to_reg
}

object EX_MEM_Register extends App {
  chisel3.Driver.execute(args, () => new EX_MEM_Register)
}
