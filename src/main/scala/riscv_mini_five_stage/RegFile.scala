/*
* Filename : RegFile.scala
* Date     : 03-01-2019
* Author   : SunnyChen
*
* Register file, include 32 general purpose registers
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class RegFileio extends Bundle with Config {
  val rs1      = Input(UInt(REG_LEN.W))
  val rs2      = Input(UInt(REG_LEN.W))
  val rd       = Input(UInt(REG_LEN.W))
  val wdata    = Input(UInt(WLEN.W))
  val regwrite = Input(UInt(REGWRITE_SIG_LEN.W))
  val rs1_out  = Output(UInt(WLEN.W))
  val rs2_out  = Output(UInt(WLEN.W))
}

class RegFile extends Module with Config {
  val io = IO(new RegFileio)

  val regfile = Mem(REGFILE_LEN, UInt(WLEN.W))

  /*
  * Regfile init data :
  * x1 = 0x0A = 10
    x2 = 0x0B = 11
    x3 = 0x0C = 12
    x4 = 0x0F = 15
    x5 = 0x0F = 15
  * */
  loadMemoryFromFile(regfile, "initmem/regfile.txt")

  io.rs1_out := regfile.read(io.rs1)
  io.rs2_out := regfile.read(io.rs2)

  regfile.write(io.rd, Mux(io.regwrite.toBool(), Mux(io.rd === 0.U, 0.U, io.wdata), regfile(io.rd)))
}

object RegFile extends App {
  chisel3.Driver.execute(args, () => new RegFile)
}