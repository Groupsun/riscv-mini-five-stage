package riscv_mini_five_stage

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

class Addr_Buffer_Test(c: Addr_Buffer) extends PeekPokeTester(c) {
  var addr = 10
  var record = 1
  for(i <- 1 to 20) {
    if((i > 3 && i < 8) || (i > 10)) {
      record = 0
    }
    if(i == 5){
      poke(c.io.flush, 1)
    }else {
      poke(c.io.flush, 0)
    }
    poke(c.io.addr_input, addr)
    poke(c.io.record, record)
    peek(c.io.front)

    step(1)
    addr = addr + 1

  }
}

class Addr_Buffer_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new Addr_Buffer) {
    c => new Addr_Buffer_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new Addr_Buffer) {
    c => new Addr_Buffer_Test(c)
  }
}
