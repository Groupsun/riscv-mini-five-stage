/*
* Filename : ImmGen.scala
* Date     : 03-01-2019
* Author   : SunnyChen
*
* Generate the immediate form the instruction, according to the operation code and functional field
* 03-01-2019 - temporary for the basic 7 instructions(BEQ, LW, SW, R-format)
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util.{Cat, MuxLookup}
import Control._

class ImmGenio extends Bundle with Config {
  val inst_in = Input(UInt(WLEN.W))
  val imm_sel = Input(UInt(IMM_SEL_SIG_LEN.W))
  val imm     = Output(UInt(WLEN.W))
}

class ImmGen extends Module with Config {
  val io = IO(new ImmGenio)

  val Rimm = 0.U(WLEN.W)
  val Iimm = io.inst_in(31, 20)
  val Simm = Cat(io.inst_in(31, 25), io.inst_in(11, 7))
  val Bimm = Cat(io.inst_in(31), io.inst_in(7), io.inst_in(30, 25), io.inst_in(11, 8))

  io.imm := MuxLookup(io.imm_sel, 0.U, Seq(IMM_R -> Iimm, IMM_I -> Iimm, IMM_S -> Simm, IMM_B -> Bimm))
}

object ImmGen extends App {
  chisel3.Driver.execute(args, () => new ImmGen)
}
