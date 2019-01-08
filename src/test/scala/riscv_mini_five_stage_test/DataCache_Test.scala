package riscv_mini_five_stage

import chisel3._
import chisel3.iotesters._
import chisel3.util._
import org.scalatest.{FlatSpec, Matchers}

class DataCache_Test(c: DataCache) extends PeekPokeTester(c) {
  var addr = 0
  var read_addr = 0
  var mem_read = 0
  var mem_write = 1
  var write_data = 100

  for(i <- 0 to 10) {
    if(i <= 3) {
      poke(c.io.addr, addr)
      poke(c.io.Mem_Read, mem_read)
      poke(c.io.Mem_Write, mem_write)
      poke(c.io.write_data, write_data)
      peek(c.io.data_out)
      step(1)
      addr = addr + 4
      write_data = write_data * 2
    } else {
      mem_read = 1
      mem_write = 0
      poke(c.io.addr, read_addr)
      poke(c.io.Mem_Read, mem_read)
      poke(c.io.Mem_Write, mem_write)
      poke(c.io.write_data, write_data)
      peek(c.io.data_out)
      step(1)
      read_addr = read_addr + 4
    }
  }
}

class DataCache_Spec extends FlatSpec with Matchers {
  iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new DataCache) {
    c => new DataCache_Test(c)
  }

  iotesters.Driver.execute(Array("--is-verbose"), () => new DataCache) {
    c => new DataCache_Test(c)
  }
}
