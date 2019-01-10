/*
* Filename : IF_ID_Register.scala
* Date     : 02-01-2019
* Author   : SunnyChen
*
* Pipeline register between IF stage and ID stage
* */

package riscv_mini_five_stage

import chisel3._

class IF_ID_Registerio extends Bundle with Config {
  val if_pc       = Input(UInt(WLEN.W))
  val if_inst     = Input(UInt(WLEN.W))
  val if_id_write = Input(UInt(IF_ID_WRITE_SIG_LEN.W))
  val if_flush    = Input(UInt(IF_FLUSH_SIG_LEN.W))
  val if_pc_4     = Input(UInt(WLEN.W))
  val id_rs1      = Output(UInt(REG_LEN.W))
  val id_rs2      = Output(UInt(REG_LEN.W))
  val id_pc       = Output(UInt(WLEN.W))
  val id_pc_4     = Output(UInt(WLEN.W))
  val id_inst     = Output(UInt(WLEN.W))
}

class IF_ID_Register extends Module with Config {
  val io = IO(new IF_ID_Registerio)

  val pc_reg    = RegInit(0.U(WLEN.W))
  val inst_reg  = RegInit(0.U(WLEN.W))
  val pc_4_reg  = RegInit(0.U(WLEN.W))

  pc_reg := Mux(io.if_flush.toBool(), 0.U(WLEN.W),
    Mux(io.if_id_write.toBool(), io.if_pc, pc_reg))

  inst_reg := Mux(io.if_flush.toBool(), 0.U(WLEN.W),
    Mux(io.if_id_write.toBool(), io.if_inst, inst_reg))

  pc_4_reg := Mux(io.if_flush.toBool(), 0.U(WLEN.W),
    Mux(io.if_id_write.toBool(), io.if_pc_4, pc_4_reg))

  io.id_pc    := pc_reg
  io.id_pc_4  := pc_4_reg
  io.id_inst  := inst_reg
  io.id_rs1   := inst_reg(19,15)
  io.id_rs2   := inst_reg(24,20)
}

object IF_ID_Register extends App {
  chisel3.Driver.execute(args, () => new IF_ID_Register)
}
