/*
* Filename : DataCache.scala
* Date     : 07-01-2019
* Author   : SunnyChen
*
* Data cache for the processor
* 07-01-2019 - test cache, 128B, 32 Words, implemented use Mem
* 09-01-2019 - support variable length load and store
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util._
import Control._
import chisel3.util.experimental.loadMemoryFromFile

trait Load_Signal {
  val Word_Signed     = 0.U(3.W)
  val Word_Unsigned   = 1.U(3.W)
  val HWord_Signed    = 2.U(3.W)
  val HWord_Unsigned  = 3.U(3.W)
  val Byte_Signed     = 4.U(3.W)
  val Byte_Unsigned   = 5.U(3.W)
}

class DataCacheio extends Bundle with Config {
  val addr        = Input(UInt(WLEN.W))
  val write_data  = Input(UInt(WLEN.W))
  val Mem_Read    = Input(UInt(MEM_READ_SIG_LEN.W))
  val Mem_Write   = Input(UInt(MEM_WRITE_SIG_LEN.W))
  val Data_Size   = Input(UInt(DATA_SIZE_SIG_LEN.W))
  val Load_Type   = Input(UInt(LOAD_TYPE_SIG_LEN.W))
  val data_out    = Output(UInt(WLEN.W))
}

class DataCache extends Module with Config with Load_Signal {
  val io = IO(new DataCacheio)

  // DATA_CAHCE_LEM Byte and DATA_CAHCE_LEM / 4 Words
  val cache = Mem(DATA_CAHCE_LEN, UInt(WLEN.W))
  loadMemoryFromFile(cache, "initmem/datacache.txt")

  val fix_addr = io.addr / 4.U

  val write_data = MuxLookup(io.Data_Size, io.write_data, Seq(
    Data_Size_W -> io.write_data,
    Data_Size_H -> Cat(0.U(16.W), io.write_data(15, 0)),
    Data_Size_B -> Cat(0.U(24.W), io.write_data(7, 0))
  ))

  val read_data = MuxLookup(Cat(io.Data_Size, io.Load_Type), cache(fix_addr), Seq(
    Word_Unsigned -> cache(fix_addr),
    HWord_Unsigned -> cache(fix_addr)(15, 0),
    HWord_Signed   -> ((cache(fix_addr)(15, 0).asSInt() << 16.U) >> 16.U).asUInt(),
    Byte_Unsigned  -> cache(fix_addr)(7, 0),
    Byte_Signed    -> ((cache(fix_addr)(7, 0).asSInt() << 24.U) >> 24.U).asUInt()
  ))

  cache(fix_addr) := Mux(io.Mem_Write.toBool(), write_data, cache(fix_addr))
  io.data_out := Mux(io.Mem_Read.toBool(), read_data, 0.U)
}

object DataCache extends App {
  chisel3.Driver.execute(args, () => new DataCache)
}
