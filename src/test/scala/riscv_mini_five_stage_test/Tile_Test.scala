package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util
import org.scalatest.{FlatSpec, Matchers}

class Tile_Test(c: Tile) extends PeekPokeTester(c) {
  for(i <- 0 to 200) {
    // Input
    poke(c.io.pc_write, 1)
    poke(c.io.if_flush, 0)
    poke(c.io.if_id_write, 1)

    peek(c.io.if_pc_out)
    peek(c.io.if_next_pc)
    peek(c.io.id_rs1)
    peek(c.io.id_rs2)
    peek(c.io.id_rs1_out)
    peek(c.io.id_rs2_out)
    peek(c.io.ex_rs1_out)
    peek(c.io.ex_rs2_out)
    peek(c.io.ex_alu_sum)
    peek(c.io.ex_alu_conflag)
    peek(c.io.ex_rd)
    peek(c.io.mem_rd)
    peek(c.io.mem_alu_sum)
    peek(c.io.mem_writedata)
    peek(c.io.mem_dataout)
    peek(c.io.wb_rd)
    peek(c.io.wb_registerwrite)
    step(1)
  }
}

class Tile_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new Tile) {
    c => new Tile_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new Tile){
    c => new Tile_Test(c)
  }
}