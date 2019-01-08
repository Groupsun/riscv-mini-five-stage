package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters._
import chisel3.util
import org.scalatest.{FlatSpec, Matchers}

class RegFile_Test(c: RegFile) extends PeekPokeTester(c) {
  var rs1 = 1
  var rs2 = 2
  var rd = 0
  var wdata = 10
  for(i <- 1 to 10) {
    if(i == 6) {
      rs1 = rd
      rs2 = rd
    }

    poke(c.io.rs1, rs1)
    poke(c.io.rs2, rs2)
    poke(c.io.rd, rd)
    poke(c.io.wdata, wdata)
    poke(c.io.regwrite, 1)
    step(1)
    rd = rd + 1
    wdata = wdata + 1
  }
}

class RegFile_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new RegFile) {
    c => new RegFile_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new RegFile) {
    c => new RegFile_Test(c)
  }
}