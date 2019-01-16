/*
* Filename : Addr_Buffer.scala
* Date     : 16-01-2019
* Author   : SunnyChen
*
* Address buffer for the branch prediction unit
* */

package riscv_mini_five_stage

import chisel3._
import Write_index._

object Write_index {
  val Write_0 = 0.U(2.W)
  val Write_1 = 1.U(2.W)
  val Write_2 = 2.U(2.W)
}

class Addr_Bufferio extends Bundle with Config {
  val addr_input = Input(UInt(WLEN.W))
  val flush      = Input(UInt(1.W))
  val record     = Input(UInt(1.W))

  val front      = Output(UInt(WLEN.W))
}

class Addr_Buffer extends Module with Config {
  val io = IO(new Addr_Bufferio)

  val buffer = Mem(3, UInt(WLEN.W))
  val counter = Mem(3, UInt(2.W))
  val is_used = Mem(3, Bool())

  io.front := Mux(counter(0) > counter(1),
    Mux(counter(0) > counter(2), buffer(0), buffer(2)),
    Mux(counter(1) > counter(2), buffer(1), buffer(2)))

  val write_index = Mux(is_used(0) === 0.U, Write_0, Mux(is_used(1) === 0.U, Write_1, Write_2))

  val temp_used_0 = Mux(io.record.toBool(), Mux(write_index === 0.U, true.B, is_used(0)), is_used(0))
  val temp_used_1 = Mux(io.record.toBool(), Mux(write_index === 1.U, true.B, is_used(1)), is_used(1))
  val temp_used_2 = Mux(io.record.toBool(), Mux(write_index === 2.U, true.B, is_used(2)), is_used(2))

  is_used(0) := Mux(io.flush.toBool(), false.B, Mux(counter(0) === 2.U, false.B, temp_used_0))
  is_used(1) := Mux(io.flush.toBool(), false.B, Mux(counter(1) === 2.U, false.B, temp_used_1))
  is_used(2) := Mux(io.flush.toBool(), false.B, Mux(counter(2) === 2.U, false.B, temp_used_2))

  counter(0) := Mux(io.flush.toBool(), 0.U, Mux(counter(0) === 2.U, 0.U, Mux(is_used(0), counter(0) + 1.U, counter(0))))
  counter(1) := Mux(io.flush.toBool(), 0.U, Mux(counter(1) === 2.U, 0.U, Mux(is_used(1), counter(1) + 1.U, counter(1))))
  counter(2) := Mux(io.flush.toBool(), 0.U, Mux(counter(2) === 2.U, 0.U, Mux(is_used(2), counter(2) + 1.U, counter(2))))

  buffer(0) := Mux(io.flush.toBool(), 0.U, Mux(counter(0) === 2.U, 0.U, Mux(io.record.toBool(),
    Mux(write_index === 0.U, io.addr_input, buffer(0)), buffer(0))))
  buffer(1) := Mux(io.flush.toBool(), 0.U, Mux(counter(1) === 2.U, 0.U, Mux(io.record.toBool(),
    Mux(write_index === 1.U, io.addr_input, buffer(1)), buffer(1))))
  buffer(2) := Mux(io.flush.toBool(), 0.U, Mux(counter(2) === 2.U, 0.U, Mux(io.record.toBool(),
    Mux(write_index === 2.U, io.addr_input, buffer(2)), buffer(2))))
}
