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
  val ex_branch_addr  = Input(UInt(WLEN.W))
  val ex_alu_sum      = Input(UInt(WLEN.W))
  val ex_alu_conflag  = Input(UInt(CONFLAG_SIGLEN.W))
  val ex_rs2_out      = Input(UInt(WLEN.W))
  val ex_rd           = Input(UInt(REG_LEN.W))

  /* Control signals */
  // MEM stage
  val ex_Branch       = Input(UInt(BRANCH_SIG_LEN.W))
  val ex_Mem_Read     = Input(UInt(MEM_READ_SIG_LEN.W))
  val ex_Mem_Write    = Input(UInt(MEM_WRITE_SIG_LEN.W))
  val ex_Data_Size    = Input(UInt(DATA_SIZE_SIG_LEN.W))
  val ex_Load_Type    = Input(UInt(LOAD_TYPE_SIG_LEN.W))

  // WB stage
  val ex_Reg_Write    = Input(UInt(REGWRITE_SIG_LEN.W))
  val ex_Mem_to_Reg   = Input(UInt(REG_SRC_SIG_LEN.W))

  /* Output */
  // Control signals output
  val mem_Branch      = Output(UInt(BRANCH_SIG_LEN.W))
  val mem_Mem_Read    = Output(UInt(MEM_READ_SIG_LEN.W))
  val mem_Mem_Write   = Output(UInt(MEM_WRITE_SIG_LEN.W))
  val mem_Data_Size   = Output(UInt(DATA_SIZE_SIG_LEN.W))
  val mem_Load_Type   = Output(UInt(LOAD_TYPE_SIG_LEN.W))
  val mem_Reg_Write   = Output(UInt(REGWRITE_SIG_LEN.W))
  val mem_Mem_to_Reg  = Output(UInt(REG_SRC_SIG_LEN.W))

  val mem_branch_addr = Output(UInt(WLEN.W))
  val mem_alu_conflag = Output(UInt(CONFLAG_SIGLEN.W))
  val mem_alu_sum     = Output(UInt(WLEN.W))
  val mem_rs2_out     = Output(UInt(WLEN.W))
  val mem_rd          = Output(UInt(REG_LEN.W))
}

class EX_MEM_Register extends Module with Config {
  val io = IO(new EX_MEM_Registerio)

  // Reg for storing the signal and data
  val branch_addr   = RegInit(0.U(WLEN.W))
  val alu_sum       = RegInit(0.U(WLEN.W))
  val alu_conflag   = RegInit(0.U(CONFLAG_SIGLEN.W))
  val rs2_out       = RegInit(0.U(WLEN.W))
  val rd            = RegInit(0.U(REG_LEN.W))

  val branch        = RegInit(0.U(BRANCH_SIG_LEN.W))
  val mem_read      = RegInit(0.U(MEM_READ_SIG_LEN.W))
  val mem_write     = RegInit(0.U(MEM_WRITE_SIG_LEN.W))
  val data_size     = RegInit(0.U(DATA_SIZE_SIG_LEN.W))
  val load_type     = RegInit(0.U(LOAD_TYPE_SIG_LEN.W))
  val reg_write     = RegInit(0.U(REGWRITE_SIG_LEN.W))
  val mem_to_reg    = RegInit(0.U(REG_SRC_SIG_LEN.W))

  // apply regs
  branch_addr   := io.ex_branch_addr
  alu_sum       := io.ex_alu_sum
  alu_conflag   := io.ex_alu_conflag
  rs2_out       := io.ex_rs2_out
  rd            := io.ex_rd
  branch        := io.ex_Branch
  mem_read      := io.ex_Mem_Read
  mem_write     := io.ex_Mem_Write
  data_size     := io.ex_Data_Size
  load_type     := io.ex_Load_Type
  reg_write     := io.ex_Reg_Write
  mem_to_reg    := io.ex_Mem_to_Reg

  // output
  io.mem_branch_addr  := branch_addr
  io.mem_alu_sum      := alu_sum
  io.mem_alu_conflag  := alu_conflag
  io.mem_rs2_out      := rs2_out
  io.mem_rd           := rd
  io.mem_Branch       := branch
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
