package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util._
import org.scalatest.{FlatSpec, Matchers}
import Control._

class ID_EX_Register_Test(c: ID_EX_Register) extends PeekPokeTester(c) {
  // Some test code
}

class ID_EX_Register_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "-verilator"), () => new ID_EX_Register) {
    c => new ID_EX_Register_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new ID_EX_Register) {
    c => new ID_EX_Register_Test(c)
  }
}
