/*
* Filename : DataCache.scala
* Date     : 07-01-2019
* Author   : SunnyChen
*
* Data cache for the processor
* 07-01-2019 - test cache, 128B, 32 Words, implemented use Mem.
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util._

class DataCacheio extends Bundle with Config {
  val addr        = Input(UInt(WLEN.W))
  val write_data  = Input(UInt(WLEN.W))
  val Mem_Read    = Input(UInt(MEM_READ_SIG_LEN.W))
  val Mem_Write   = Input(UInt(MEM_WRITE_SIG_LEN.W))
  val data_out    = Output(UInt(WLEN.W))
}

class DataCache extends Module with Config {
  val io = IO(new DataCacheio)

  // DATA_CAHCE_LEM Byte and DATA_CAHCE_LEM / 4 Words
  val cache = Mem(DATA_CAHCE_LEN, UInt(WLEN.W))

  val fix_addr = io.addr / 4.U
  cache(fix_addr) := Mux(io.Mem_Write.toBool(), io.write_data, cache(fix_addr))
  io.data_out := Mux(io.Mem_Read.toBool(), cache(fix_addr), 0.U)
}

object DataCache extends App {
  chisel3.Driver.execute(args, () => new DataCache)
}
