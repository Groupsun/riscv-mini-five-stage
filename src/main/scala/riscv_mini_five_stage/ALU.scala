/*
* Filename : ALU.scala
* Date     : 05-01-2019
* Author   : SunnyChen
*
* Arithmatic and logic unit of processor
* 05-01-2019 - implemented 4 basic oprations (ADD, SUB, AND, OR)
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util.MuxLookup
import ALU._

object ALU {
  // ALUOp
  // May expend in future time
  val ALU_ADD     = 0.U(4.W)
  val ALU_SUB     = 1.U(4.W)
  val ALU_AND     = 2.U(4.W)
  val ALU_OR      = 3.U(4.W)
  val ALU_OP_XXX  = 15.U(4.W)
}

class ALUio extends Bundle with Config {
  val Src_A = Input(UInt(WLEN.W))
  val Src_B = Input(UInt(WLEN.W))
  val ALUOp = Input(UInt(ALUOP_SIG_LEN.W))
  val Sum   = Output(UInt(WLEN.W))
  val Zero  = Output(UInt(ZERO_SIG_LEN.W))
}

class ALU extends Module with Config {
  val io = IO(new ALUio)

  io.Sum := MuxLookup(io.ALUOp, io.Src_B, Seq(
    ALU_ADD -> (io.Src_A + io.Src_B),
    ALU_SUB -> (io.Src_A - io.Src_B),
    ALU_AND -> (io.Src_A & io.Src_B),
    ALU_OR  -> (io.Src_A | io.Src_B)
  ))

  io.Zero := Mux((io.Src_A === io.Src_B), 1.U, 0.U)
}

object ALU_generate extends App {
  chisel3.Driver.execute(args, () => new ALU)
}
