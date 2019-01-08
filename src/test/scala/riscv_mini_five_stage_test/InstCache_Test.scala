package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util
import org.scalatest.{FlatSpec, Matchers}

class InstCache_Test(c: InstCache) extends PeekPokeTester(c) {
  var addr = 0
  for(i <- 0 to 3) {
    poke(c.io.addr, addr)
    peek(c.io.inst)
    step(1)
    addr = addr + 4
  }
}

class InstCache_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new InstCache) {
    c => new InstCache_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new InstCache) {
    c => new InstCache_Test(c)
  }
}
