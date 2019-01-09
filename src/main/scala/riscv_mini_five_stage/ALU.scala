/*
* Filename : ALU.scala
* Date     : 05-01-2019
* Author   : SunnyChen
*
* Arithmatic and logic unit of processor
* 05-01-2019 - implemented 4 basic oprations (ADD, SUB, AND, OR)
* 08-01-2019 - add operations, now supported mostly ALU functions
* 09-01-2019 - add register set instructions
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
  val ALU_XOR     = 4.U(4.W)
  val ALU_SLL     = 5.U(4.W)
  val ALU_SRL     = 6.U(4.W)
  val ALU_SRA     = 7.U(4.W)
  val ALU_SLT     = 8.U(4.W)
  val ALU_SLTU    = 9.U(4.W)
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

  val shamt = io.Src_B(5, 0)
  io.Sum := MuxLookup(io.ALUOp, io.Src_B, Seq(
    ALU_ADD   -> (io.Src_A + io.Src_B),
    ALU_SUB   -> (io.Src_A - io.Src_B),
    ALU_AND   -> (io.Src_A & io.Src_B),
    ALU_OR    -> (io.Src_A | io.Src_B),
    ALU_XOR   -> (io.Src_A ^ shamt),
    ALU_SLL   -> (io.Src_A << shamt),
    ALU_SRL   -> (io.Src_A >> shamt),
    ALU_SRA   -> (io.Src_A.asSInt() >> shamt).asUInt(),
    ALU_SLT   -> (io.Src_A.asSInt() < io.Src_B.asSInt()),
    ALU_SLTU  -> (io.Src_A < io.Src_B)
  ))

  io.Zero := Mux((io.Src_A === io.Src_B), 1.U, 0.U)
}

object ALU_generate extends App {
  chisel3.Driver.execute(args, () => new ALU)
}
