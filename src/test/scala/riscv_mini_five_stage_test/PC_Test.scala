package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util
import org.scalatest.{FlatSpec, Matchers}

class PC_Test(c: PC) extends PeekPokeTester(c) {
  var input = 0
  for(i <- 0 to 10) {
    poke(c.io.addr_input, input)
    if(i == 5)
      poke(c.io.pc_write, 0)
    else poke(c.io.pc_write, 1)
    peek(c.io.pc_out)
    step(1)
    input = input + 1
  }
}

class PC_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new PC) {
    c => new PC_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new PC) {
    c => new PC_Test(c)
  }
}
