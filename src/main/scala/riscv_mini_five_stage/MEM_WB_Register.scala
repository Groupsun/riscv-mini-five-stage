/*
* Filename : MEM_WB_Register.scala
* Date     : 07-01-2019
* Author   : SunnyChen
*
* Pipeline register between MEM and WB stage
* */

package riscv_mini_five_stage

import chisel3._

class MEM_WB_Registerio extends Bundle with Config {
  val mem_dataout       = Input(UInt(WLEN.W))
  val mem_alu_sum       = Input(UInt(WLEN.W))
  val mem_rd            = Input(UInt(REG_LEN.W))
  val mem_pc_4          = Input(UInt(WLEN.W))
  val mem_imm           = Input(UInt(WLEN.W))
  val mem_aui_pc        = Input(UInt(WLEN.W))
  val mem_csr_data_out  = Input(UInt(WLEN.W))

  /* Control signals */
  // WB stage
  val mem_Mem_to_Reg  = Input(UInt(REG_SRC_SIG_LEN.W))
  val mem_Reg_Write   = Input(UInt(REGWRITE_SIG_LEN.W))

  // Output
  // Control signals output
  val wb_Mem_to_Reg   = Output(UInt(REG_SRC_SIG_LEN.W))
  val wb_Reg_Write    = Output(UInt(REGWRITE_SIG_LEN.W))

  val wb_dataout      = Output(UInt(WLEN.W))
  val wb_alu_sum      = Output(UInt(WLEN.W))
  val wb_rd           = Output(UInt(REG_LEN.W))
  val wb_pc_4         = Output(UInt(WLEN.W))
  val wb_imm          = Output(UInt(WLEN.W))
  val wb_aui_pc       = Output(UInt(WLEN.W))
  val wb_csr_data_out = Output(UInt(WLEN.W))
}

class MEM_WB_Register extends Module with Config {
  val io = IO(new MEM_WB_Registerio)

  // Reg for storing the signal and data
  val dataout       = RegInit(0.U(WLEN.W))
  val alu_sum       = RegInit(0.U(WLEN.W))
  val rd            = RegInit(0.U(REG_LEN.W))
  val pc_4          = RegInit(0.U(WLEN.W))
  val imm           = RegInit(0.U(WLEN.W))
  val aui_pc        = RegInit(0.U(WLEN.W))
  val csr_data_out  = RegInit(0.U(WLEN.W))
  val mem_to_reg    = RegInit(0.U(REG_SRC_SIG_LEN.W))
  val reg_write     = RegInit(0.U(REGWRITE_SIG_LEN.W))

  // apply regs
  dataout       := io.mem_dataout
  alu_sum       := io.mem_alu_sum
  rd            := io.mem_rd
  pc_4          := io.mem_pc_4
  imm           := io.mem_imm
  aui_pc        := io.mem_aui_pc
  csr_data_out  := io.mem_csr_data_out
  mem_to_reg    := io.mem_Mem_to_Reg
  reg_write     := io.mem_Reg_Write

  // output
  io.wb_Mem_to_Reg    := mem_to_reg
  io.wb_Reg_Write     := reg_write
  io.wb_dataout       := dataout
  io.wb_alu_sum       := alu_sum
  io.wb_rd            := rd
  io.wb_pc_4          := pc_4
  io.wb_imm           := imm
  io.wb_aui_pc        := aui_pc
  io.wb_csr_data_out  := csr_data_out
}

object MEM_WB_Register extends App {
  chisel3.Driver.execute(args, () => new MEM_WB_Register)
}
