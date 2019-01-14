/*
* Filename : ALU.scala
* Date     : 05-01-2019
* Author   : SunnyChen
*
* Arithmetic and logic unit of processor
* 05-01-2019 - implemented 4 basic oprations (ADD, SUB, AND, OR)
* 08-01-2019 - add operations, now supported mostly ALU functions
* 09-01-2019 - add register set instructions
* 10-01-2019 - add conditional branch conditions
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util.MuxLookup
import ALU._

object ALU {
  // ALUOp
  // May expend in future time
  val ALU_ADD     = 0.U(5.W)
  val ALU_SUB     = 1.U(5.W)
  val ALU_AND     = 2.U(5.W)
  val ALU_OR      = 3.U(5.W)
  val ALU_XOR     = 4.U(5.W)
  val ALU_SLL     = 5.U(5.W)
  val ALU_SRL     = 6.U(5.W)
  val ALU_SRA     = 7.U(5.W)
  val ALU_SLT     = 8.U(5.W)
  val ALU_SLTU    = 9.U(5.W)
  val ALU_BEQ     = 10.U(5.W)
  val ALU_BNE     = 11.U(5.W)
  val ALU_BLT     = 12.U(5.W)
  val ALU_BGE     = 13.U(5.W)
  val ALU_BLTU    = 14.U(5.W)
  val ALU_BGEU    = 15.U(5.W)
  val ALU_OP_XXX  = 16.U(5.W)
}

class ALUio extends Bundle with Config {
  val Src_A     = Input(UInt(WLEN.W))
  val Src_B     = Input(UInt(WLEN.W))
  val ALUOp     = Input(UInt(ALUOP_SIG_LEN.W))
  val Sum       = Output(UInt(WLEN.W))
  val Conflag   = Output(UInt(CONFLAG_SIGLEN.W))
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

  io.Conflag := MuxLookup(io.ALUOp, 0.U, Seq(
    ALU_BEQ   -> (io.Src_A.asSInt() === io.Src_B.asSInt()),
    ALU_BNE   -> (io.Src_A.asSInt() =/= io.Src_B.asSInt()),
    ALU_BLT   -> (io.Src_A.asSInt() <   io.Src_B.asSInt()),
    ALU_BGE   -> (io.Src_A.asSInt() >=  io.Src_B.asSInt()),
    ALU_BLTU  -> (io.Src_A <  io.Src_B),
    ALU_BGEU  -> (io.Src_A >= io.Src_B)
  ))
}

object ALU_generate extends App {
  chisel3.Driver.execute(args, () => new ALU)
}
