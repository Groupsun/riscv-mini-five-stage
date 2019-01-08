package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util._
import org.scalatest.{FlatSpec, Matchers}
import Control._

class ImmGen_Test(c: ImmGen) extends PeekPokeTester(c) {
  var inst = Integer.parseInt("00000110000000001010000110000011", 2)
  var imm_sel = IMM_I
  poke(c.io.inst_in, inst)
  poke(c.io.imm_sel, imm_sel)
  peek(c.io.imm)
}

class ImmGen_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new ImmGen) {
    c => new ImmGen_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new ImmGen) {
    c => new ImmGen_Test(c)
  }
}
