/*
* Filename : PC.scala
* Date     : 02-01-2019
* Author   : SunnyChen
*
* Program Counter for my processor
* */

package riscv_mini_five_stage

import chisel3._

class PCio extends Bundle with Config {
  val addr_input  = Input(UInt(WLEN.W))
  val pc_write    = Input(UInt(PC_SIG_LEN.W))
  val pc_out      = Output(UInt(WLEN.W))
}

abstract class PC_template extends Module with Config {
  val io = IO(new PCio)
}

class PC extends PC_template {
  val PC_reg = RegInit(0.U(WLEN.W))

  PC_reg := Mux(io.pc_write.toBool(), io.addr_input, PC_reg)
  io.pc_out := PC_reg
}

object PC extends App {
  chisel3.Driver.execute(args, () => new PC)
}

