package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters._
import chisel3.util._
import org.scalatest.{FlatSpec, Matchers}

class EX_MEM_Register_Test(c: EX_MEM_Register) extends PeekPokeTester(c) {

}

class EX_MEM_Register_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "-verilator"), () => new EX_MEM_Register) {
    c => new EX_MEM_Register_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new EX_MEM_Register) {
    c => new EX_MEM_Register_Test(c)
  }
}
