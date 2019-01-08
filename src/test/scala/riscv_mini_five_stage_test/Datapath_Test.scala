package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters._
import chisel3.util
import org.scalatest.{FlatSpec, Matchers}

class Datapath_Test(c: Datapath) extends PeekPokeTester(c) {
  var rs2_out = 10
  var imm = Integer.parseInt("0000001D",16)
  var pc  = Integer.parseInt("0000010E", 16)
  var alu_src = 0

  poke(c.io.ex_datapathio.ex_rs2_out, rs2_out)
  poke(c.io.ex_datapathio.ex_imm, imm)
  poke(c.io.ex_datapathio.ex_pc, pc)
  poke(c.io.ex_datapathio.ex_ALU_Src, alu_src)
  peek(c.io.ex_datapathio.ex_branch_addr)
  peek(c.io.ex_datapathio.alu_b_src)
  step(1)
}

class Datapath_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new Datapath) {
    c => new Datapath_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new Datapath) {
    c => new Datapath_Test(c)
  }
}