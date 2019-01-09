package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util
import org.scalatest.{FlatSpec, Matchers}

class ALU_Test(c: ALU) extends PeekPokeTester(c) {
  var src_a = 10
  var src_b = 20
  var aluop = 0

  for(i <- 0 to 3) {
    poke(c.io.Src_A, src_a)
    poke(c.io.Src_B, src_b)
    poke(c.io.ALUOp, aluop)
    peek(c.io.Sum)
    peek(c.io.Conflag)
    step(1)
    aluop = aluop + 1
  }
}

class ALU_Spce extends FlatSpec with Matchers {
  iotesters.Driver.execute((Array("--backend-name", "verilator")), () => new ALU) {
    c => new ALU_Test(c)
  }

  iotesters.Driver.execute((Array("--is-verbose")), () => new ALU) {
    c => new ALU_Test(c)
  }
}