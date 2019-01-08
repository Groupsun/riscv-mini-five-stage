package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util
import org.scalatest.{FlatSpec, Matchers}

class IF_ID_Register_Test(c: IF_ID_Register) extends PeekPokeTester(c) {
  // Some test code
}

class IF_ID_Register_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new IF_ID_Register) {
    c => new IF_ID_Register_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new IF_ID_Register) {
    c => new IF_ID_Register_Test(c)
  }
}