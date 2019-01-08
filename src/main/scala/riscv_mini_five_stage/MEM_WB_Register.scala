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
  val mem_dataout = Input(UInt(WLEN.W))
  val mem_alu_sum = Input(UInt(WLEN.W))
  val mem_rd      = Input(UInt(REG_LEN.W))

  /* Control signals */
  // WB stage
  val mem_Mem_to_Reg  = Input(UInt(REG_SRC_SIG_LEN.W))
  val mem_Reg_Write   = Input(UInt(REGWRITE_SIG_LEN.W))

  // Output
  // Control signals output
  val wb_Mem_to_Reg = Output(UInt(REG_SRC_SIG_LEN.W))
  val wb_Reg_Write  = Output(UInt(REGWRITE_SIG_LEN.W))

  val wb_dataout    = Output(UInt(WLEN.W))
  val wb_alu_sum    = Output(UInt(WLEN.W))
  val wb_rd         = Output(UInt(REG_LEN.W))
}

class MEM_WB_Register extends Module with Config {
  val io = IO(new MEM_WB_Registerio)

  // Reg for storing the signal and data
  val dataout     = RegInit(0.U(WLEN.W))
  val alu_sum     = RegInit(0.U(WLEN.W))
  val rd          = RegInit(0.U(REG_LEN.W))
  val mem_to_reg  = RegInit(0.U(REG_SRC_SIG_LEN.W))
  val reg_write   = RegInit(0.U(REGWRITE_SIG_LEN.W))

  // apply regs
  dataout     := io.mem_dataout
  alu_sum     := io.mem_alu_sum
  rd          := io.mem_rd
  mem_to_reg  := io.mem_Mem_to_Reg
  reg_write   := io.mem_Reg_Write

  // output
  io.wb_Mem_to_Reg  := mem_to_reg
  io.wb_Reg_Write   := reg_write
  io.wb_dataout     := dataout
  io.wb_alu_sum     := alu_sum
  io.wb_rd          := rd
}

object MEM_WB_Register extends App {
  chisel3.Driver.execute(args, () => new MEM_WB_Register)
}
